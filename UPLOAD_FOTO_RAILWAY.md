# Cara Upload Foto ke Railway

## Masalah

Foto-foto di `public/uploads/` (35MB, 42 file) dihapus dari git karena membuat repository terlalu besar dan menyebabkan error "max depth exceeded" saat build Docker.

## Solusi: Upload Foto Setelah Deploy

### Opsi 1: Upload via Railway Console (Manual)

1. **Setelah deploy berhasil**, buka Railway Console
2. **Buat folder uploads:**
   ```bash
   mkdir -p public/uploads/galeri
   ```

3. **Upload foto via Railway CLI atau SCP:**
   ```bash
   # Install Railway CLI
   npm i -g @railway/cli
   
   # Login
   railway login
   
   # Connect ke project
   railway link
   
   # Upload folder
   railway run --service your-service-name
   ```

### Opsi 2: Upload via Git LFS (Recommended untuk Production)

1. **Install Git LFS:**
   ```bash
   git lfs install
   ```

2. **Track file foto:**
   ```bash
   git lfs track "public/uploads/**/*.{jpg,png,jpeg}"
   ```

3. **Add dan commit:**
   ```bash
   git add .gitattributes
   git add public/uploads/
   git commit -m "Add photos via Git LFS"
   git push origin main
   ```

### Opsi 3: Upload via Storage Cloud (Best Practice)

Gunakan storage cloud seperti:
- **AWS S3**
- **Cloudinary**
- **DigitalOcean Spaces**
- **Railway Volumes** (persistent storage)

**Contoh dengan Laravel Storage:**
```php
// config/filesystems.php
'disks' => [
    's3' => [
        'driver' => 's3',
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION'),
        'bucket' => env('AWS_BUCKET'),
    ],
],
```

### Opsi 4: Upload Manual via Railway File System

1. **Setelah deploy**, akses Railway Console
2. **Upload file via Railway Dashboard:**
   - Buka Railway Dashboard → Your Service → Files
   - Upload foto ke `public/uploads/galeri/`

### Opsi 5: Script Upload Otomatis

Buat script untuk upload foto setelah deploy:

```bash
#!/bin/bash
# upload-fotos.sh

# Upload semua foto dari local ke Railway
railway run --service your-service-name --command "mkdir -p public/uploads/galeri"

# Copy file via SCP atau Railway CLI
for file in public/uploads/galeri/*; do
    railway run --service your-service-name --command "cat > public/uploads/galeri/$(basename $file)" < "$file"
done
```

## Rekomendasi

Untuk production, **gunakan Opsi 3 (Storage Cloud)** karena:
- ✅ Tidak membuat repository besar
- ✅ Foto tersedia secara persistent
- ✅ Bisa diakses dari mana saja
- ✅ Lebih scalable

Untuk development/testing, gunakan **Opsi 4 (Upload Manual)** via Railway Console.

## Verifikasi Foto Setelah Upload

```bash
# Di Railway Console
ls -la public/uploads/galeri/
# Harus menampilkan 42 file foto
```

## Catatan

- Foto-foto masih ada di local (`public/uploads/galeri/`)
- Foto tidak akan hilang, hanya tidak di-push ke git
- Setelah upload ke Railway, foto akan tersedia di aplikasi

