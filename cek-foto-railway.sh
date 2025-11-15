#!/bin/bash

# Script untuk cek status foto di Railway

echo "🔍 Cek Status Foto di Railway"
echo "=========================="
echo ""

# 1. Cek foto di folder
echo "1. Cek foto di folder public/uploads/galeri/..."
FOTO_FOLDER=$(railway run -- find public/uploads/galeri -type f 2>/dev/null | wc -l | tr -d ' ')
echo "   ✅ Foto di folder: $FOTO_FOLDER file"

# 2. Cek data foto di database
echo ""
echo "2. Cek data foto di database..."
railway run -- php artisan tinker --execute="
try {
    \$fotoCount = \App\Models\Foto::count();
    echo '   ✅ Foto di database: ' . \$fotoCount . ' record' . PHP_EOL;
    
    if (\$fotoCount > 0) {
        \$sample = \App\Models\Foto::take(5)->get(['id', 'file', 'galery_id']);
        echo '   Sample foto:' . PHP_EOL;
        foreach (\$sample as \$f) {
            echo '     - ID: ' . \$f->id . ', File: ' . \$f->file . ', Galery ID: ' . \$f->galery_id . PHP_EOL;
        }
    }
} catch(Exception \$e) {
    echo '   ❌ Error: ' . \$e->getMessage() . PHP_EOL;
}
" 2>&1

# 3. Cek galeri dengan foto
echo ""
echo "3. Cek galeri yang punya foto..."
railway run -- php artisan tinker --execute="
try {
    \$galeriWithFoto = \App\Models\galery::with(['post', 'fotos'])
        ->where('status', 'aktif')
        ->get()
        ->filter(function(\$g) {
            return \$g->post !== null && \$g->fotos && \$g->fotos->count() > 0;
        });
    
    echo '   ✅ Galeri aktif dengan foto: ' . \$galeriWithFoto->count() . PHP_EOL;
    
    if (\$galeriWithFoto->count() > 0) {
        echo '   Sample galeri:' . PHP_EOL;
        foreach (\$galeriWithFoto->take(3) as \$g) {
            echo '     - ID: ' . \$g->id . ', Post: ' . (\$g->post->judul ?? 'N/A') . ', Foto: ' . \$g->fotos->count() . ' file' . PHP_EOL;
            if (\$g->fotos->count() > 0) {
                echo '       File pertama: ' . \$g->fotos->first()->file . PHP_EOL;
            }
        }
    }
} catch(Exception \$e) {
    echo '   ❌ Error: ' . \$e->getMessage() . PHP_EOL;
}
" 2>&1

# 4. Cek apakah file foto ada di folder
echo ""
echo "4. Cek apakah file foto di database ada di folder..."
railway run -- php artisan tinker --execute="
try {
    \$fotos = \App\Models\Foto::take(10)->get(['id', 'file']);
    \$missing = [];
    \$found = [];
    
    foreach (\$fotos as \$foto) {
        \$filePath = 'public/uploads/galeri/' . \$foto->file;
        \$exists = file_exists(\$filePath);
        if (\$exists) {
            \$found[] = \$foto->file;
        } else {
            \$missing[] = \$foto->file;
        }
    }
    
    echo '   ✅ File ditemukan: ' . count(\$found) . PHP_EOL;
    echo '   ❌ File tidak ditemukan: ' . count(\$missing) . PHP_EOL;
    
    if (count(\$missing) > 0) {
        echo '   File yang tidak ditemukan:' . PHP_EOL;
        foreach (array_slice(\$missing, 0, 5) as \$m) {
            echo '     - ' . \$m . PHP_EOL;
        }
    }
} catch(Exception \$e) {
    echo '   ❌ Error: ' . \$e->getMessage() . PHP_EOL;
}
" 2>&1

# 5. List file di folder
echo ""
echo "5. List 10 file pertama di folder..."
railway run -- ls -1 public/uploads/galeri/ 2>/dev/null | head -10 | while read file; do
    echo "     - $file"
done

echo ""
echo "=========================="
echo "✅ Cek selesai!"
echo ""
echo "💡 Jika foto tidak muncul:"
echo "   1. Pastikan foto sudah di-upload: ./upload-foto-railway.sh"
echo "   2. Pastikan data ada di database: railway run -- php artisan db:seed --class=DatabaseDataSeeder --force"
echo "   3. Clear cache: railway run -- php artisan view:clear"

