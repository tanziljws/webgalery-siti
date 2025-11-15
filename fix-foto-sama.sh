#!/bin/bash

# Script untuk fix masalah foto semua sama

echo "🔧 Fix Masalah Foto Semua Sama"
echo "=========================="
echo ""

# 1. Cek apakah ada foto di folder
echo "1. Cek foto di folder..."
FOTO_COUNT=$(railway run -- find public/uploads/galeri -type f 2>/dev/null | wc -l | tr -d ' ')
echo "   Foto di folder: $FOTO_COUNT"

if [ "$FOTO_COUNT" -eq "0" ]; then
    echo ""
    echo "❌ Tidak ada foto di folder!"
    echo "   Upload foto dulu dengan: ./upload-foto-railway.sh"
    exit 1
fi

# 2. Cek data di database
echo ""
echo "2. Cek data foto di database..."
DB_FOTO=$(railway run -- php artisan tinker --execute="echo \App\Models\Foto::count();" 2>&1 | tail -1 | tr -d ' ')
echo "   Foto di database: $DB_FOTO"

if [ "$DB_FOTO" -eq "0" ]; then
    echo ""
    echo "❌ Tidak ada data foto di database!"
    echo "   Seed database dulu dengan:"
    echo "   railway run -- php artisan db:seed --class=DatabaseDataSeeder --force"
    exit 1
fi

# 3. Cek apakah file di database sesuai dengan file di folder
echo ""
echo "3. Cek kesesuaian file database vs folder..."
railway run -- php artisan tinker --execute="
\$dbFiles = \App\Models\Foto::pluck('file')->toArray();
\$folderFiles = [];
\$folderPath = 'public/uploads/galeri/';
if (is_dir(\$folderPath)) {
    \$files = glob(\$folderPath . '*');
    \$folderFiles = array_map('basename', \$files);
}

\$dbOnly = array_diff(\$dbFiles, \$folderFiles);
\$folderOnly = array_diff(\$folderFiles, \$dbFiles);
\$matched = array_intersect(\$dbFiles, \$folderFiles);

echo '   ✅ File yang match: ' . count(\$matched) . PHP_EOL;
echo '   ⚠️  File di DB tapi tidak di folder: ' . count(\$dbOnly) . PHP_EOL;
echo '   ⚠️  File di folder tapi tidak di DB: ' . count(\$folderOnly) . PHP_EOL;

if (count(\$dbOnly) > 0) {
    echo '   File di DB yang tidak ada di folder (sample 5):' . PHP_EOL;
    foreach (array_slice(\$dbOnly, 0, 5) as \$f) {
        echo '     - ' . \$f . PHP_EOL;
    }
}
" 2>&1

# 4. Cek galeri yang aktif
echo ""
echo "4. Cek galeri aktif dengan foto..."
railway run -- php artisan tinker --execute="
\$galeri = \App\Models\galery::with(['post', 'fotos'])
    ->where('status', 'aktif')
    ->get()
    ->filter(function(\$g) {
        return \$g->post !== null && \$g->fotos && \$g->fotos->count() > 0;
    });

echo '   ✅ Galeri aktif dengan foto: ' . \$galeri->count() . PHP_EOL;

if (\$galeri->count() > 0) {
    echo '   Detail galeri:' . PHP_EOL;
    foreach (\$galeri->take(5) as \$g) {
        echo '     - Galeri ID: ' . \$g->id . PHP_EOL;
        echo '       Post: ' . (\$g->post->judul ?? 'N/A') . PHP_EOL;
        echo '       Foto count: ' . \$g->fotos->count() . PHP_EOL;
        if (\$g->fotos->count() > 0) {
            echo '       Foto pertama: ' . \$g->fotos->first()->file . PHP_EOL;
            \$filePath = 'public/uploads/galeri/' . \$g->fotos->first()->file;
            echo '       File exists: ' . (file_exists(\$filePath) ? 'YES' : 'NO') . PHP_EOL;
        }
        echo '';
    }
}
" 2>&1

# 5. Clear cache
echo ""
echo "5. Clear cache..."
railway run -- php artisan view:clear 2>&1 | tail -1
railway run -- php artisan config:clear 2>&1 | tail -1
railway run -- php artisan cache:clear 2>&1 | tail -1

echo ""
echo "=========================="
echo "✅ Fix selesai!"
echo ""
echo "💡 Jika foto masih tidak muncul atau sama semua:"
echo "   1. Pastikan foto sudah di-upload: ./upload-foto-railway.sh"
echo "   2. Pastikan data database sudah di-seed"
echo "   3. Cek Railway logs untuk error detail"
echo "   4. Refresh browser dengan hard refresh (Ctrl+Shift+R atau Cmd+Shift+R)"

