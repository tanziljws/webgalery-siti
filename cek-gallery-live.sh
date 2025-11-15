#!/bin/bash

# Script untuk cek gallery di production

echo "🔍 Cek Gallery di Production"
echo "=========================="
echo ""

# 1. Cek logs terakhir
echo "1. Cek logs terakhir (gallery query)..."
railway run -- tail -20 storage/logs/laravel.log | grep -i "gallery\|galeri" | tail -5 || echo "   Tidak ada log gallery"

# 2. Test query langsung
echo ""
echo "2. Test query gallery langsung..."
railway run -- php artisan tinker --execute="
\$galeri = \App\Models\galery::with(['post.kategori', 'fotos'])
    ->where('status', 'aktif')
    ->get()
    ->filter(function(\$gallery) {
        return \$gallery->post !== null && 
               \$gallery->fotos && 
               \$gallery->fotos->count() > 0;
    })
    ->values();
echo 'COUNT: ' . \$galeri->count() . PHP_EOL;
" 2>&1 | tail -3

# 3. Test render view
echo ""
echo "3. Test render view..."
railway run -- php artisan tinker --execute="
\$galeri = \App\Models\galery::with(['post.kategori', 'fotos'])
    ->where('status', 'aktif')
    ->get()
    ->filter(function(\$gallery) {
        return \$gallery->post !== null && 
               \$gallery->fotos && 
               \$gallery->fotos->count() > 0;
    })
    ->values();
\$kategoris = \App\Models\Kategori::orderBy('judul', 'asc')->get();
\$html = view('user.gallery', compact('galeri', 'kategoris'))->render();
echo 'HTML length: ' . strlen(\$html) . PHP_EOL;
echo 'Gallery items in HTML: ' . substr_count(\$html, 'gallery-item') . PHP_EOL;
" 2>&1 | tail -3

# 4. Clear semua cache
echo ""
echo "4. Clear semua cache..."
railway run -- php artisan config:clear 2>&1 | tail -1
railway run -- php artisan cache:clear 2>&1 | tail -1
railway run -- php artisan route:clear 2>&1 | tail -1
railway run -- php artisan view:clear 2>&1 | tail -1

echo ""
echo "=========================="
echo "✅ Cek selesai!"
echo ""
echo "💡 Setelah ini:"
echo "   1. Tunggu 1-2 menit untuk deployment update"
echo "   2. Hard refresh browser: Ctrl+Shift+R atau Cmd+Shift+R"
echo "   3. Cek browser console untuk error"

