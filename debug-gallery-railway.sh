#!/bin/bash

# Script untuk debug gallery di Railway

echo "🔍 Debug Gallery di Railway"
echo "=========================="
echo ""

# 1. Cek apakah folder uploads ada
echo "1. Cek folder uploads..."
railway run -- ls -la public/uploads/galeri/ 2>&1 | head -10

echo ""
echo "2. Cek permission folder..."
railway run -- ls -ld public/uploads/ 2>&1

echo ""
echo "3. Cek jumlah file..."
railway run -- find public/uploads/galeri -type f 2>/dev/null | wc -l

echo ""
echo "4. Cek database connection..."
railway run -- php artisan tinker --execute="echo 'DB: ' . config('database.default'); echo PHP_EOL; try { DB::connection()->getPdo(); echo 'Connection OK'; } catch(Exception \$e) { echo 'Error: ' . \$e->getMessage(); }"

echo ""
echo "5. Cek tabel galery..."
railway run -- php artisan tinker --execute="try { echo 'Galery count: ' . \App\Models\galery::count(); } catch(Exception \$e) { echo 'Error: ' . \$e->getMessage(); }"

echo ""
echo "6. Cek logs terakhir..."
railway run -- tail -20 storage/logs/laravel.log 2>&1 | tail -10

echo ""
echo "✅ Debug selesai!"

