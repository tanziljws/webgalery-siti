# Railway Build Fix - Max Depth Exceeded Error

## Masalah

Error `max depth exceeded` saat build Docker di Railway disebabkan oleh:
1. **Vendor directory** (8497 files) ter-track di git
2. **Uploads directory** (42 files, 35MB) ter-track di git
3. **Large image files** (8MB) ter-track di git

## Solusi yang Diterapkan

### 1. Hapus Vendor dari Git
```bash
git rm -rf --cached vendor/
git commit -m "Remove vendor directory from git"
```

**Alasan:** Vendor harus di-install via `composer install` saat build, bukan di-push ke git.

### 2. Hapus Uploads dari Git
```bash
git rm -r --cached public/uploads/
git commit -m "Remove uploads from git"
```

**Alasan:** File upload seharusnya di-upload manual atau via storage cloud setelah deploy.

### 3. Hapus Large Image Files
```bash
git rm --cached public/images/*.JPG
git commit -m "Remove large image files"
```

### 4. Update .gitignore
Tambahkan:
```
/vendor
/public/uploads
/public/images/*.JPG
/public/images/*.jpg
```

### 5. Update .dockerignore
Pastikan vendor dan uploads di-exclude:
```
vendor
public/uploads
```

## Hasil

- ✅ Vendor dihapus: **8497 files**
- ✅ Uploads dihapus: **42 files (35MB)**
- ✅ Large images dihapus: **1 file (8MB)**
- ✅ Total files di git: **~236 files** (dari 8733 files)

## Next Steps

1. **Railway akan otomatis build** setelah push ke GitHub
2. **Vendor akan di-install** via `composer install` saat build
3. **Upload foto** setelah deploy (lihat `UPLOAD_FOTO_RAILWAY.md`)

## Verifikasi

```bash
# Cek file yang ter-track
git ls-files | wc -l

# Cek vendor tidak ter-track
git ls-files vendor/ | wc -l  # Should return 0

# Cek uploads tidak ter-track
git ls-files public/uploads/ | wc -l  # Should return 0
```

## Catatan

- File-file masih ada di local, hanya tidak di-track oleh git
- Vendor akan di-install otomatis saat Railway build
- Uploads harus di-upload manual setelah deploy (lihat dokumentasi)

