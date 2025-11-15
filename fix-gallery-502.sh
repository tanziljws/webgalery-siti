#!/bin/bash

# Script untuk fix error 502 di /user/gallery

echo "🔧 Fix Error 502 di /user/gallery"
echo "=========================="
echo ""

# 1. Cek Railway CLI
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI tidak ditemukan!"
    echo "Install dengan: npm i -g @railway/cli"
    exit 1
fi

# 2. Cek apakah sudah login
echo "1. Cek Railway connection..."
railway status > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "⚠️  Belum login ke Railway. Login dulu..."
    railway login
fi

# 3. Fix folder uploads
echo ""
echo "2. Fix folder uploads..."
railway run -- mkdir -p public/uploads/galeri
railway run -- chmod -R 755 public/uploads 2>/dev/null || echo "⚠️  Permission fix skipped"

# 4. Cek database connection
echo ""
echo "3. Cek database connection..."
railway run -- php artisan tinker --execute="try { DB::connection()->getPdo(); echo '✅ Database OK'; } catch(Exception \$e) { echo '❌ Error: ' . \$e->getMessage(); }" 2>&1

# 5. Cek tabel
echo ""
echo "4. Cek tabel database..."
railway run -- php artisan tinker --execute="
echo 'galery: ' . (Schema::hasTable('galery') ? '✅' : '❌') . PHP_EOL;
echo 'posts: ' . (Schema::hasTable('posts') ? '✅' : '❌') . PHP_EOL;
echo 'foto: ' . (Schema::hasTable('foto') ? '✅' : '❌') . PHP_EOL;
" 2>&1

# 6. Clear cache
echo ""
echo "5. Clear cache..."
railway run -- php artisan config:clear 2>&1 | tail -1
railway run -- php artisan cache:clear 2>&1 | tail -1
railway run -- php artisan route:clear 2>&1 | tail -1
railway run -- php artisan view:clear 2>&1 | tail -1

# 7. Cek jumlah foto di folder
echo ""
echo "6. Cek foto di folder..."
FOTO_COUNT=$(railway run -- find public/uploads/galeri -type f 2>/dev/null | wc -l | tr -d ' ')
echo "   Foto di folder: $FOTO_COUNT"

# 8. Cek data di database
echo ""
echo "7. Cek data di database..."
railway run -- php artisan tinker --execute="
try {
    echo 'Galery: ' . \App\Models\galery::count() . PHP_EOL;
    echo 'Foto: ' . \App\Models\Foto::count() . PHP_EOL;
} catch(Exception \$e) {
    echo 'Error: ' . \$e->getMessage() . PHP_EOL;
}
" 2>&1

# 9. Cek logs terakhir
echo ""
echo "8. Cek error logs (5 baris terakhir)..."
railway run -- tail -5 storage/logs/laravel.log 2>&1 | grep -i error || echo "   Tidak ada error terakhir"

echo ""
echo "=========================="
echo "✅ Fix selesai!"
echo ""
echo "💡 Next steps:"
echo "   1. Cek Railway Dashboard → Logs untuk error detail"
echo "   2. Test akses /user/gallery di browser"
echo "   3. Jika masih error, jalankan: railway run -- php artisan migrate --force"
echo "   4. Jika perlu seed data: railway run -- php artisan db:seed --class=DatabaseDataSeeder --force"

