# Cara Jalankan Migration di Railway

## Metode 1: Railway Console (Recommended)

1. **Buka Railway Dashboard**
   - Login ke https://railway.app
   - Pilih project Anda

2. **Buka Console**
   - Klik tab **"Deployments"**
   - Pilih deployment terbaru
   - Klik tombol **"View Logs"** atau **"Console"**
   - Atau klik tab **"Settings"** → **"Service"** → Scroll ke bawah → **"Open Console"**

3. **Jalankan Migration**
   Di console, ketik:
   ```bash
   php artisan migrate --force
   ```

## Metode 2: Railway CLI (Jika Sudah Install)

Jika Anda sudah install Railway CLI di local:

1. **Login ke Railway**
   ```bash
   railway login
   ```

2. **Link ke Project**
   ```bash
   railway link
   ```

3. **Jalankan Command di Railway**
   ```bash
   railway run php artisan migrate --force
   ```

## Metode 3: Tambahkan ke nixpacks.toml (Auto Migration)

Tambahkan migration ke build process agar otomatis jalan saat deploy:

Edit file `nixpacks.toml`:

```toml
[phases.build]
cmds = [
  "chmod +x railway-setup.sh || true",
  "npm run build",
  "php artisan migrate --force",
  "php artisan config:cache",
  "php artisan route:cache",
  "php artisan view:cache"
]
```

**Catatan:** Metode ini akan auto-run migration setiap deploy. Hati-hati jika ada data production.

## Verifikasi

Setelah migration jalan, test lagi:
```bash
# Di Railway Console
php artisan migrate:status
```

Atau akses `/test-homepage` untuk cek apakah tabel sudah ada.

