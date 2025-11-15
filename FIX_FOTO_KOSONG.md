# 🔧 Fix Foto Kosong (0 bytes)

## Masalah
File foto di `public/uploads/galeri/` ada tapi ukurannya **0 bytes** (kosong), sehingga browser tidak bisa menampilkan gambar.

## Penyebab
File foto yang benar belum ada atau hilang. File yang ada di folder adalah file kosong.

## Solusi

### Opsi 1: Restore dari Backup (Jika Ada)

Jika Anda punya backup file foto asli:

```bash
# Copy file foto dari backup ke folder uploads
cp /path/to/backup/uploads/galeri/* public/uploads/galeri/
```

### Opsi 2: Upload Ulang Foto

1. **Siapkan file foto asli** (dari komputer atau backup)
2. **Copy ke folder uploads:**
   ```bash
   cp /path/to/original/photos/* public/uploads/galeri/
   ```

3. **Pastikan nama file sesuai dengan database:**
   ```bash
   # Cek file yang dibutuhkan
   php artisan tinker --execute="
   \$files = \App\Models\Foto::pluck('file')->toArray();
   foreach (\$files as \$f) {
       echo \$f . PHP_EOL;
   }
   "
   ```

### Opsi 3: Re-upload via Admin Panel

1. Login ke admin panel
2. Edit galeri yang foto-nya kosong
3. Upload ulang foto
4. Save

### Opsi 4: Import dari Database Lain

Jika punya database backup dengan file foto yang benar:

```bash
# Export foto dari database backup
# Lalu import ke database saat ini
```

## Verifikasi

Setelah fix, cek:

```bash
# Cek ukuran file
ls -lh public/uploads/galeri/*.jpeg | head -5

# Harusnya tidak ada yang 0 bytes
# Contoh output yang benar:
# -rwxr-xr-x  1 user  staff   245K Nov 15 17:28 1762991881_0.jpeg
```

## Catatan

- File 0 bytes = file kosong, tidak bisa ditampilkan
- Pastikan file foto asli ada dan ukurannya > 0 bytes
- Nama file harus sesuai dengan yang ada di database

