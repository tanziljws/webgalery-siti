# Jalankan Migration via Railway CLI

## Command yang Benar

❌ **SALAH:**
```bash
railway php artisan migrate --force
```

✅ **BENAR:**
```bash
railway run php artisan migrate --force
```

## Langkah-langkah

1. **Pastikan sudah login ke Railway:**
   ```bash
   railway login
   ```

2. **Pastikan sudah link ke project:**
   ```bash
   railway link
   ```
   
   Atau jika belum link, bisa pilih project:
   ```bash
   railway link [project-id]
   ```

3. **Jalankan migration:**
   ```bash
   railway run php artisan migrate --force
   ```

## Command Lain yang Berguna

- **Cek status migration:**
  ```bash
  railway run php artisan migrate:status
  ```

- **Rollback migration:**
  ```bash
  railway run php artisan migrate:rollback
  ```

- **Seed database:**
  ```bash
  railway run php artisan db:seed
  ```

- **Clear cache:**
  ```bash
  railway run php artisan config:clear
  railway run php artisan cache:clear
  ```

## Troubleshooting

Jika error "not linked to a project":
```bash
railway link
# Pilih project dari list
```

Jika error "not logged in":
```bash
railway login
```

