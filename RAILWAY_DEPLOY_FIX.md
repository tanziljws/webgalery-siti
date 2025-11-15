# Fix Railway Deployment Error: "max depth exceeded"

## Masalah

Error yang terjadi:
```
ERROR: failed to build: failed to solve: rpc error: code = Unknown desc = max depth exceeded
```

## Penyebab

Repository terlalu besar (263MB) karena:
- `vendor/` (83MB) - tidak perlu di-push, akan di-install via composer
- `storage/` cache files - akan di-generate otomatis
- `bootstrap/cache/` - akan di-generate otomatis

Docker build context terlalu besar sehingga Railway gagal build.

## Solusi yang Sudah Diterapkan

### 1. ✅ Buat `.dockerignore`
File `.dockerignore` dibuat untuk exclude file besar dari Docker build context:
- `vendor/` - akan di-install via composer
- `node_modules/` - akan di-install via npm
- `storage/framework/*` - akan di-generate
- `bootstrap/cache/*` - akan di-generate
- `public/build/` - akan di-build via vite

### 2. ✅ Hapus File Besar dari Git
File besar sudah dihapus dari git tracking:
- `vendor/` - dihapus (akan di-install via composer di Railway)
- `storage/framework/views/` - dihapus (akan di-generate)
- `storage/framework/cache/` - dihapus (akan di-generate)
- `bootstrap/cache/` - dihapus (akan di-generate)

### 3. ✅ Keep Uploads
`public/uploads/` tetap di git karena berisi foto-foto penting, tapi di-exclude dari Docker build via `.dockerignore`.

## File yang Masih di Git

✅ **Yang perlu di-push:**
- Source code aplikasi
- `composer.json` & `composer.lock`
- `package.json` & `package-lock.json`
- `public/uploads/` (foto-foto)
- Configuration files
- Migrations & Seeders

❌ **Yang TIDAK perlu di-push (sudah dihapus):**
- `vendor/` - akan di-install via `composer install`
- `node_modules/` - akan di-install via `npm install`
- `storage/framework/*` - akan di-generate otomatis
- `bootstrap/cache/*` - akan di-generate otomatis
- `public/build/` - akan di-build via `npm run build`

## Langkah Selanjutnya

1. **Railway akan otomatis rebuild** setelah push baru
2. **Composer install** akan menginstall vendor/
3. **NPM build** akan build assets
4. **Storage & cache** akan di-generate otomatis

## Uploads di Railway

Foto-foto di `public/uploads/` akan:
- ✅ Tetap ada di git repository
- ✅ Akan di-copy ke Railway saat deploy
- ❌ Tapi di-exclude dari Docker build context (via .dockerignore)

Jika foto tidak muncul setelah deploy, pastikan:
1. File sudah ter-push ke git
2. Railway sudah copy file dari git
3. Permission folder `public/uploads/` sudah benar

## Verifikasi

Setelah deploy, cek:
```bash
# Di Railway console
ls -la public/uploads/galeri/
```

Jika foto tidak ada, bisa upload manual atau gunakan storage cloud (S3, Cloudinary, dll).

## Catatan

- Repository size sekarang lebih kecil (tanpa vendor/)
- Docker build akan lebih cepat
- Railway tidak akan error "max depth exceeded" lagi

