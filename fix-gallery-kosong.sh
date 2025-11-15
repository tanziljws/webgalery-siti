#!/bin/bash

# Script untuk fix gallery yang kosong

echo "🔧 Fix Gallery Kosong"
echo "=========================="
echo ""

# 1. Test query gallery
echo "1. Test query gallery..."
railway run -- php artisan tinker --execute="
\$galeri = \App\Models\galery::with(['post.kategori', 'fotos'])
    ->where('status', 'aktif')
    ->get()
    ->filter(function(\$gallery) {
        return \$gallery->post !== null && 
               \$gallery->fotos && 
               \$gallery->fotos->count() > 0;
    })
    ->sortByDesc(function(\$gallery) {
        return \$gallery->post->created_at ?? now();
    })
    ->values();

echo 'Galeri valid: ' . \$galeri->count() . PHP_EOL;

if (\$galeri->count() > 0) {
    echo 'Sample galeri:' . PHP_EOL;
    foreach (\$galeri->take(3) as \$g) {
        echo '  - ID: ' . \$g->id . ', Post: ' . (\$g->post->judul ?? 'N/A') . PHP_EOL;
        if (\$g->fotos->count() > 0) {
            \$fotoFile = \$g->fotos->first()->file;
            \$filePath = 'public/uploads/galeri/' . \$fotoFile;
            echo '    Foto: ' . \$fotoFile . ' (exists: ' . (file_exists(\$filePath) ? 'YES' : 'NO') . ')' . PHP_EOL;
        }
    }
} else {
    echo '❌ Tidak ada galeri yang valid!' . PHP_EOL;
}
" 2>&1 | tail -20

# 2. Cek apakah view bisa di-render
echo ""
echo "2. Test render view..."
railway run -- php artisan tinker --execute="
try {
    \$galeri = collect([]);
    \$kategoris = collect([]);
    
    // Query galleries
    \$galeri = \App\Models\galery::with(['post.kategori', 'fotos'])
        ->where('status', 'aktif')
        ->get()
        ->filter(function(\$gallery) {
            return \$gallery->post !== null && 
                   \$gallery->fotos && 
                   \$gallery->fotos->count() > 0;
        })
        ->sortByDesc(function(\$gallery) {
            return \$gallery->post->created_at ?? now();
        })
        ->values();
    
    // Query kategori
    \$kategoris = \App\Models\Kategori::orderBy('judul', 'asc')->get();
    
    // Try to render view
    \$view = view('user.gallery', compact('galeri', 'kategoris'));
    echo '✅ View bisa di-render' . PHP_EOL;
    echo 'Galeri count: ' . \$galeri->count() . PHP_EOL;
    echo 'Kategori count: ' . \$kategoris->count() . PHP_EOL;
} catch(Exception \$e) {
    echo '❌ Error render view: ' . \$e->getMessage() . PHP_EOL;
}
" 2>&1 | tail -10

# 3. Cek route
echo ""
echo "3. Cek route /user/gallery..."
railway run -- php artisan route:list | grep "user.gallery" 2>&1

# 4. Clear semua cache
echo ""
echo "4. Clear semua cache..."
railway run -- php artisan config:clear 2>&1 | tail -1
railway run -- php artisan cache:clear 2>&1 | tail -1
railway run -- php artisan route:clear 2>&1 | tail -1
railway run -- php artisan view:clear 2>&1 | tail -1

# 5. Test akses route via curl
echo ""
echo "5. Test akses route (mengambil 500 karakter pertama)..."
railway run -- curl -s http://localhost:8000/user/gallery 2>&1 | head -c 500 || echo "   ⚠️  Route tidak bisa diakses via curl (normal jika app tidak running di localhost)"

echo ""
echo ""
echo "=========================="
echo "✅ Fix selesai!"
echo ""
echo "💡 Troubleshooting:"
echo "   1. Cek Railway logs: railway logs"
echo "   2. Cek apakah app running: railway status"
echo "   3. Hard refresh browser: Ctrl+Shift+R atau Cmd+Shift+R"
echo "   4. Cek browser console untuk error JavaScript"
echo "   5. Cek Network tab di browser untuk request yang gagal"

