# 🔧 Fix Error 502 di /user/gallery

## Masalah
Error 502 Bad Gateway di `/user/gallery` setelah upload foto.

## Kemungkinan Penyebab

1. **Database belum di-migrate atau di-seed**
2. **Folder uploads tidak ada atau permission salah**
3. **Query error yang tidak tertangkap**
4. **Aplikasi crash karena error PHP**

## Solusi Step-by-Step

### 1. Cek Database Connection

```bash
railway run -- php artisan tinker --execute="try { DB::connection()->getPdo(); echo 'OK'; } catch(Exception \$e) { echo \$e->getMessage(); }"
```

### 2. Cek Apakah Tabel Ada

```bash
railway run -- php artisan tinker --execute="echo 'galery: ' . (Schema::hasTable('galery') ? 'YES' : 'NO') . PHP_EOL; echo 'posts: ' . (Schema::hasTable('posts') ? 'YES' : 'NO') . PHP_EOL; echo 'foto: ' . (Schema::hasTable('foto') ? 'YES' : 'NO');"
```

### 3. Cek Folder Uploads

```bash
railway run -- ls -la public/uploads/
railway run -- ls -la public/uploads/galeri/ | head -10
```

### 4. Fix Permission Folder

```bash
railway run -- mkdir -p public/uploads/galeri
railway run -- chmod -R 755 public/uploads
```

### 5. Cek Logs Error

```bash
railway run -- tail -50 storage/logs/laravel.log
```

### 6. Run Migration & Seed (Jika Belum)

```bash
railway run -- php artisan migrate --force
railway run -- php artisan db:seed --class=DatabaseDataSeeder --force
```

### 7. Clear Cache

```bash
railway run -- php artisan config:clear
railway run -- php artisan cache:clear
railway run -- php artisan route:clear
railway run -- php artisan view:clear
```

### 8. Test Route Gallery

```bash
railway run -- php artisan route:list | grep gallery
```

## Quick Fix Script

Jalankan script ini untuk fix semua masalah sekaligus:

```bash
./fix-gallery-502.sh
```

## Verifikasi Setelah Fix

1. **Cek apakah route bisa diakses:**
   ```bash
   curl https://your-app.railway.app/user/gallery
   ```

2. **Cek apakah foto muncul:**
   - Buka browser → `/user/gallery`
   - Foto harus muncul jika ada data di database

## Troubleshooting

### Jika masih error 502:

1. **Cek Railway Logs:**
   - Buka Railway Dashboard → Your Service → Logs
   - Cari error message

2. **Cek apakah aplikasi running:**
   ```bash
   railway run -- ps aux | grep php
   ```

3. **Restart service:**
   - Railway Dashboard → Your Service → Settings → Restart

### Jika foto tidak muncul tapi halaman load:

1. **Cek apakah foto ada di folder:**
   ```bash
   railway run -- ls -la public/uploads/galeri/ | wc -l
   ```

2. **Cek apakah data ada di database:**
   ```bash
   railway run -- php artisan tinker --execute="echo 'Galery: ' . \App\Models\galery::count() . PHP_EOL; echo 'Foto: ' . \App\Models\Foto::count();"
   ```

3. **Cek path foto di database:**
   ```bash
   railway run -- php artisan tinker --execute="\App\Models\Foto::take(3)->get(['id', 'file'])->each(function(\$f) { echo \$f->file . PHP_EOL; });"
   ```

## Catatan

- Error 502 berarti aplikasi crash sebelum bisa return response
- Pastikan database sudah di-migrate dan di-seed
- Pastikan folder uploads ada dan permission benar
- Cek logs untuk detail error

