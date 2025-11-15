# Setup Database & Seeder untuk Railway

## Kredensial Database Railway

```
Host: yamanote.proxy.rlwy.net
Port: 54511
Database: railway
Username: root
Password: DmAxrbVXaioQUfuttWoIIRCjlkMPzqJD
```

## Langkah-langkah Setup

### 1. Update Environment Variables di Railway

Buka Railway Dashboard → Your Project → Variables, lalu set:

```env
# Database Configuration
DB_CONNECTION=mysql
DB_HOST=yamanote.proxy.rlwy.net
DB_PORT=54511
DB_DATABASE=railway
DB_USERNAME=root
DB_PASSWORD=DmAxrbVXaioQUfuttWoIIRCjlkMPzqJD

# Session & Cache (gunakan file untuk menghindari error)
SESSION_DRIVER=file
CACHE_STORE=file

# App Configuration
APP_NAME="Galeri SMKN 4 Bogor"
APP_ENV=production
APP_DEBUG=false
```

### 2. Jalankan Migration

Setelah environment variables di-set, jalankan migration di Railway Console:

```bash
php artisan migrate --force
```

### 3. Import Data dengan Seeder

Setelah migration selesai, jalankan seeder untuk import semua data:

```bash
php artisan db:seed --class=DatabaseDataSeeder
```

Atau jika ingin import semua seeder (termasuk default):

```bash
php artisan db:seed --force
```

**Catatan**: Untuk import data lengkap, uncomment baris berikut di `database/seeders/DatabaseSeeder.php`:

```php
// Import data dari database lokal (jika ada)
$this->call(DatabaseDataSeeder::class);
```

### 4. Verifikasi Data

Setelah seeding selesai, verifikasi data dengan:

```bash
php artisan tinker
```

Di tinker:
```php
// Cek jumlah data
DB::table('kategori')->count();
DB::table('posts')->count();
DB::table('galery')->count();
DB::table('foto')->count();
DB::table('agenda')->count();
DB::table('informasi')->count();
DB::table('site_settings')->count();
DB::table('users')->count();
DB::table('petugas')->count();
```

## Data yang Akan Di-import

Seeder `DatabaseDataSeeder` akan mengimport data dari tabel berikut:

1. ✅ **kategori** - 4 rows
2. ✅ **petugas** - 3 rows
3. ✅ **users** - 6 rows
4. ✅ **posts** - 15 rows
5. ✅ **galery** - 15 rows
6. ✅ **foto** - 15 rows
7. ✅ **agenda** - 12 rows
8. ✅ **informasi** - 6 rows
9. ✅ **site_settings** - 79 rows
10. ✅ **user_likes** - 1 row
11. ✅ **user_dislikes** - 1 row
12. ✅ **gallery_like_logs** - 2 rows

**Total**: ~159 rows data

## Troubleshooting

### Error: "MySQL server has gone away"

Jika terjadi error ini, pastikan:
1. ✅ Environment variables sudah benar
2. ✅ Database service di Railway sudah running
3. ✅ Port dan host sudah benar
4. ✅ Timeout sudah ditingkatkan di `config/database.php`

### Error: "Access denied"

Pastikan:
1. ✅ Username dan password benar
2. ✅ Tidak ada spasi di awal/akhir password
3. ✅ Database name benar (`railway`)

### Error: "Unknown database"

Pastikan:
1. ✅ Database `railway` sudah dibuat di Railway
2. ✅ Migration sudah dijalankan sebelum seeding

### Data Tidak Muncul Setelah Seeding

1. Cek apakah seeder berjalan tanpa error
2. Cek foreign key constraints - mungkin ada data yang tidak bisa di-insert karena dependency
3. Jalankan seeder dengan verbose mode:
   ```bash
   php artisan db:seed --class=DatabaseDataSeeder -v
   ```

## Update Seeder dari Database Lokal

Jika ada perubahan data di database lokal dan ingin update seeder:

```bash
# Export data terbaru dari database lokal
php artisan db:export-seeder

# File akan tersimpan di: database/seeders/DatabaseDataSeeder.php
```

## Command Lengkap untuk Railway

```bash
# 1. Clear cache
php artisan config:clear
php artisan cache:clear

# 2. Run migration
php artisan migrate --force

# 3. Seed data
php artisan db:seed --class=DatabaseDataSeeder --force

# 4. Clear cache lagi
php artisan config:clear
php artisan cache:clear
```

## Catatan Penting

1. ⚠️ **Password di seeder**: Password user di seeder adalah password yang sudah di-hash dari database lokal. Pastikan password tersebut masih valid.

2. ⚠️ **File uploads**: File gambar yang ada di `public/uploads/` tidak akan ter-import. Pastikan file-file tersebut sudah di-upload ke Railway storage atau CDN.

3. ⚠️ **Foreign keys**: Seeder akan disable foreign key checks saat insert, jadi urutan insert tidak masalah.

4. ✅ **Idempotent**: Seeder menggunakan `truncate()` sebelum insert, jadi bisa dijalankan berulang kali tanpa duplikasi data.

## Verifikasi Final

Setelah semua setup selesai, akses aplikasi dan cek:
- ✅ Homepage bisa diakses
- ✅ Gallery menampilkan foto
- ✅ Agenda menampilkan event
- ✅ Informasi menampilkan data
- ✅ Login berfungsi dengan user yang ada

