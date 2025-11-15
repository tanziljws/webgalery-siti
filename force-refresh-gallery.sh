#!/bin/bash

# Script untuk force refresh gallery

echo "🔄 Force Refresh Gallery"
echo "=========================="
echo ""

# 1. Clear semua cache
echo "1. Clear semua cache..."
railway run -- php artisan config:clear 2>&1 | tail -1
railway run -- php artisan cache:clear 2>&1 | tail -1
railway run -- php artisan route:clear 2>&1 | tail -1
railway run -- php artisan view:clear 2>&1 | tail -1
railway run -- php artisan optimize:clear 2>&1 | tail -1

# 2. Rebuild cache
echo ""
echo "2. Rebuild cache..."
railway run -- php artisan config:cache 2>&1 | tail -1
railway run -- php artisan route:cache 2>&1 | tail -1
railway run -- php artisan view:cache 2>&1 | tail -1

# 3. Test query
echo ""
echo "3. Test query gallery..."
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
echo 'Galeri count: ' . \$galeri->count() . PHP_EOL;
" 2>&1 | tail -2

echo ""
echo "=========================="
echo "✅ Refresh selesai!"
echo ""
echo "💡 Next steps:"
echo "   1. Tunggu 1-2 menit untuk deployment update"
echo "   2. Hard refresh browser: Ctrl+Shift+R atau Cmd+Shift+R"
echo "   3. Atau buka incognito/private window"
echo "   4. Cek Railway Dashboard → Deployments untuk pastikan deployment terbaru sudah live"

