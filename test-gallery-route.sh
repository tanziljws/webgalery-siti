#!/bin/bash

# Script untuk test route gallery dan debug

echo "🧪 Test Gallery Route"
echo "=========================="
echo ""

# Test query langsung
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

echo 'Count: ' . \$galeri->count() . PHP_EOL;
echo 'Type: ' . get_class(\$galeri) . PHP_EOL;
echo 'Is collection: ' . (\$galeri instanceof \Illuminate\Support\Collection ? 'YES' : 'NO') . PHP_EOL;
" 2>&1 | tail -5

# Test render view dengan data
echo ""
echo "2. Test render view dengan data..."
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

\$kategoris = \App\Models\Kategori::orderBy('judul', 'asc')->get();

try {
    \$html = view('user.gallery', compact('galeri', 'kategoris'))->render();
    echo '✅ View rendered successfully' . PHP_EOL;
    echo 'HTML length: ' . strlen(\$html) . ' bytes' . PHP_EOL;
    
    // Cek apakah ada gallery-item di HTML
    if (strpos(\$html, 'gallery-item') !== false) {
        echo '✅ Found gallery-item in HTML' . PHP_EOL;
        \$count = substr_count(\$html, 'gallery-item');
        echo 'Gallery items found: ' . \$count . PHP_EOL;
    } else {
        echo '❌ gallery-item NOT found in HTML' . PHP_EOL;
    }
} catch(Exception \$e) {
    echo '❌ Error: ' . \$e->getMessage() . PHP_EOL;
}
" 2>&1 | tail -10

echo ""
echo "=========================="
echo "✅ Test selesai!"

