# 📸 Cara Upload Foto ke Railway

## Status Foto Saat Ini

✅ **Foto masih ada di local:**
- Lokasi: `public/uploads/galeri/`
- Jumlah: **42 file**
- Ukuran: **35MB**

❌ **Foto TIDAK di-push ke git** (karena terlalu besar, menyebabkan error build)

---

## 🚀 Cara Upload Foto ke Railway

### **Opsi 1: Menggunakan Script Otomatis (Paling Mudah)**

1. **Install Railway CLI:**
   ```bash
   npm i -g @railway/cli
   ```

2. **Login ke Railway:**
   ```bash
   railway login
   ```

3. **Link ke project Railway:**
   ```bash
   railway link
   ```

4. **Jalankan script upload:**
   ```bash
   ./upload-foto-railway.sh
   ```

Script akan otomatis upload semua 42 foto ke Railway.

---

### **Opsi 2: Upload Manual via Railway Dashboard**

1. **Setelah deploy berhasil**, buka Railway Dashboard
2. **Buka service Anda** → **Files** tab
3. **Buat folder:**
   - Klik "New Folder"
   - Buat: `public/uploads/galeri`
4. **Upload foto satu per satu:**
   - Klik "Upload File"
   - Pilih foto dari `public/uploads/galeri/` di komputer Anda
   - Upload semua 42 foto

---

### **Opsi 3: Upload via Railway CLI (Manual)**

1. **Install Railway CLI:**
   ```bash
   npm i -g @railway/cli
   railway login
   railway link
   ```

2. **Buat folder di Railway:**
   ```bash
   railway run -- mkdir -p public/uploads/galeri
   ```

3. **Upload foto satu per satu:**
   ```bash
   # Contoh upload satu file
   railway run -- bash -c "cat > public/uploads/galeri/nama-file.jpg" < public/uploads/galeri/nama-file.jpg
   ```

   Atau gunakan loop:
   ```bash
   for file in public/uploads/galeri/*; do
       filename=$(basename "$file")
       railway run -- bash -c "cat > public/uploads/galeri/$filename" < "$file"
   done
   ```

---

### **Opsi 4: Menggunakan Git LFS (Untuk Production)**

Jika ingin foto ikut di git (tapi tidak membuat repo besar):

1. **Install Git LFS:**
   ```bash
   git lfs install
   ```

2. **Track file foto:**
   ```bash
   git lfs track "public/uploads/**/*.{jpg,png,jpeg}"
   git add .gitattributes
   ```

3. **Add dan commit foto:**
   ```bash
   git add public/uploads/
   git commit -m "Add photos via Git LFS"
   git push origin main
   ```

**Catatan:** Git LFS memerlukan setup di GitHub dan mungkin ada biaya untuk storage besar.

---

### **Opsi 5: Menggunakan Storage Cloud (Best Practice untuk Production)**

Gunakan AWS S3, Cloudinary, atau DigitalOcean Spaces:

1. **Setup storage di Laravel:**
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

2. **Upload foto ke cloud storage** (bisa via Laravel atau manual)

3. **Update aplikasi** untuk membaca dari cloud storage

---

## ✅ Verifikasi Foto Setelah Upload

Setelah upload, verifikasi di Railway Console:

```bash
railway run -- ls -la public/uploads/galeri/
# Harus menampilkan 42 file foto
```

Atau cek di aplikasi web Anda, pastikan foto muncul di galeri.

---

## 📋 Rekomendasi

- **Untuk testing/development:** Gunakan **Opsi 2 (Railway Dashboard)** - paling mudah
- **Untuk production:** Gunakan **Opsi 5 (Storage Cloud)** - lebih scalable dan reliable
- **Untuk quick deploy:** Gunakan **Opsi 1 (Script)** - cepat dan otomatis

---

## ⚠️ Catatan Penting

1. **Foto tidak akan hilang** - masih ada di local komputer Anda
2. **Foto harus di-upload manual** setelah deploy pertama kali
3. **Foto baru** yang di-upload user nanti akan tersimpan di Railway (jika folder sudah dibuat)
4. **Backup foto** secara berkala untuk keamanan

---

## 🆘 Troubleshooting

**Q: Upload gagal?**
- Pastikan Railway CLI sudah login: `railway login`
- Pastikan sudah link ke project: `railway link`
- Coba upload manual via Railway Dashboard

**Q: Foto tidak muncul di aplikasi?**
- Pastikan folder sudah dibuat: `public/uploads/galeri`
- Cek permission folder: `chmod -R 755 public/uploads`
- Cek path di aplikasi Laravel

**Q: Ingin foto ikut di git?**
- Gunakan Git LFS (Opsi 4)
- Atau gunakan storage cloud (Opsi 5)

