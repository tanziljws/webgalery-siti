# Analisis Error: MySQL server has gone away

## Error yang Terjadi

```
SQLSTATE[HY000] [2006] MySQL server has gone away (Connection: mysql, SQL: select exists (select 1 from information_schema.tables where table_schema = schema() and table_name = 'migrations' and table_type in ('BASE TABLE', 'SYSTEM VERSIONED')) as `exists`)
```

## Penyebab Utama

Error "MySQL server has gone away" terjadi karena beberapa alasan:

### 1. **Connection Timeout Terlalu Pendek** ⚠️
- Di `config/database.php` line 63: `PDO::ATTR_TIMEOUT => 10` (hanya 10 detik)
- Di line 66: `'timeout' => env('DB_TIMEOUT', 10)` (default 10 detik)
- **Masalah**: 10 detik terlalu pendek untuk operasi migration yang kompleks

### 2. **MySQL Server Memutus Koneksi**
MySQL server bisa memutus koneksi jika:
- Koneksi idle terlalu lama (melebihi `wait_timeout` atau `interactive_timeout`)
- Query terlalu besar (melebihi `max_allowed_packet`)
- Server restart atau crash
- Network timeout

### 3. **Konfigurasi Database Saat Ini**
Dari `.env`:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=8888          # MAMP/XAMPP default port
DB_DATABASE=edu_galeri
DB_USERNAME=root
DB_PASSWORD=          # Kosong (mungkin benar untuk local)
```

### 4. **Session & Cache Menggunakan Database**
```env
SESSION_DRIVER=database  # ⚠️ Bisa menyebabkan masalah
CACHE_STORE=database     # ⚠️ Bisa menyebabkan masalah
```
**Masalah**: Jika database belum ready atau ada masalah connection, aplikasi akan error saat boot.

## Solusi

### Solusi 1: Tingkatkan Connection Timeout (PENTING!)

Edit `config/database.php`:

```php
'options' => extension_loaded('pdo_mysql') ? array_filter([
    PDO::MYSQL_ATTR_SSL_CA => env('MYSQL_ATTR_SSL_CA'),
    PDO::MYSQL_ATTR_SSL_VERIFY_SERVER_CERT => false,
    PDO::ATTR_TIMEOUT => env('DB_TIMEOUT', 60),  // Ubah dari 10 ke 60
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET SESSION wait_timeout=600", // Tambahkan ini
]) : [],
'timeout' => env('DB_TIMEOUT', 60),  // Ubah dari 10 ke 60
```

### Solusi 2: Tambahkan Reconnect Logic

Tambahkan di `config/database.php`:

```php
'options' => extension_loaded('pdo_mysql') ? array_filter([
    PDO::MYSQL_ATTR_SSL_CA => env('MYSQL_ATTR_SSL_CA'),
    PDO::MYSQL_ATTR_SSL_VERIFY_SERVER_CERT => false,
    PDO::ATTR_TIMEOUT => env('DB_TIMEOUT', 60),
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET SESSION wait_timeout=600, interactive_timeout=600",
    PDO::MYSQL_ATTR_RECONNECT => true,  // Tambahkan ini untuk auto-reconnect
]) : [],
```

### Solusi 3: Ubah Session & Cache Driver ke File

Edit `.env`:

```env
# Ubah dari database ke file
SESSION_DRIVER=file
CACHE_STORE=file
```

**Alasan**: Dengan `file`, aplikasi bisa boot tanpa perlu database connection dulu.

### Solusi 4: Cek Status MySQL Server

Pastikan MySQL server berjalan:

```bash
# Untuk MAMP (Mac)
# Buka MAMP dan pastikan MySQL service running

# Untuk XAMPP
# Buka XAMPP Control Panel dan pastikan MySQL running

# Test connection
mysql -h 127.0.0.1 -P 8888 -u root -e "SELECT 1"
```

### Solusi 5: Cek MySQL Configuration

Jika bisa akses MySQL, cek konfigurasi:

```sql
SHOW VARIABLES LIKE 'wait_timeout';
SHOW VARIABLES LIKE 'interactive_timeout';
SHOW VARIABLES LIKE 'max_allowed_packet';
```

Jika `wait_timeout` atau `interactive_timeout` terlalu kecil (< 60), tingkatkan:

```sql
SET GLOBAL wait_timeout = 600;
SET GLOBAL interactive_timeout = 600;
```

## Langkah-langkah Perbaikan

### Step 1: Update config/database.php

1. Buka `config/database.php`
2. Cari bagian `'mysql' => [...]`
3. Update `PDO::ATTR_TIMEOUT` dari `10` ke `60`
4. Update `'timeout'` dari `10` ke `60`
5. Tambahkan `PDO::MYSQL_ATTR_RECONNECT => true`
6. Tambahkan `PDO::MYSQL_ATTR_INIT_COMMAND` untuk set timeout

### Step 2: Update .env (Opsional tapi Disarankan)

1. Buka `.env`
2. Ubah `SESSION_DRIVER=database` menjadi `SESSION_DRIVER=file`
3. Ubah `CACHE_STORE=database` menjadi `CACHE_STORE=file`
4. Tambahkan `DB_TIMEOUT=60` (opsional)

### Step 3: Clear Cache

```bash
php artisan config:clear
php artisan cache:clear
```

### Step 4: Test Connection

```bash
php artisan tinker
```

Di tinker:
```php
DB::connection()->getPdo();
// Jika berhasil, akan return PDO object
```

### Step 5: Coba Migration Lagi

```bash
php artisan migrate:fresh --seed
```

## Troubleshooting Tambahan

### Jika Masih Error Setelah Perbaikan

1. **Cek MySQL Server Status**
   - Pastikan MySQL service running
   - Cek port 8888 benar-benar digunakan oleh MySQL

2. **Cek Database Exists**
   ```sql
   SHOW DATABASES LIKE 'edu_galeri';
   ```
   Jika tidak ada, buat:
   ```sql
   CREATE DATABASE edu_galeri;
   ```

3. **Cek User Permissions**
   ```sql
   SHOW GRANTS FOR 'root'@'localhost';
   ```

4. **Cek Logs MySQL**
   - MAMP: `/Applications/MAMP/logs/mysql_error_log.err`
   - XAMPP: `/Applications/XAMPP/xamppfiles/var/mysql/error.log`

5. **Test dengan Connection Manual**
   ```bash
   mysql -h 127.0.0.1 -P 8888 -u root edu_galeri
   ```

## Kesimpulan

Error "MySQL server has gone away" biasanya disebabkan oleh:
1. ✅ **Connection timeout terlalu pendek** (10 detik → perlu 60 detik)
2. ✅ **MySQL server memutus koneksi** (perlu auto-reconnect)
3. ✅ **Session/Cache menggunakan database** (lebih baik pakai file untuk local)

**Solusi utama**: Tingkatkan timeout dan tambahkan reconnect logic di `config/database.php`.

