# Fix: Tabel Agenda Tidak Ada

## Masalah yang Ditemukan

Dari hasil `/test-homepage`:
- ✅ Tabel `galery` ada
- ✅ Tabel `posts` ada  
- ❌ Tabel `agenda` **TIDAK ADA** → menyebabkan error

## Solusi

### 1. Jalankan Migration untuk Membuat Tabel Agenda

Di Railway Console, jalankan:
```bash
php artisan migrate --force
```

Ini akan membuat tabel `agenda` jika migration file sudah ada.

### 2. Perbaikan Code (Sudah Dilakukan)

Sudah ditambahkan error handling yang lebih baik:
- Cek apakah tabel ada sebelum query
- Jika tabel tidak ada, skip query dan gunakan empty collection
- Aplikasi tidak akan crash meskipun tabel belum ada

## Status

- ✅ Code sudah diperbaiki - aplikasi tidak akan crash
- ⚠️ Tabel `agenda` belum dibuat - perlu jalankan migration
- ✅ View bisa di-render dengan baik

## Langkah Selanjutnya

1. **Jalankan Migration:**
   ```bash
   php artisan migrate --force
   ```

2. **Test Lagi:**
   - Akses homepage: `https://ujikom-siti-production.up.railway.app/`
   - Seharusnya sudah tidak error 500

3. **Jika Masih Error:**
   - Cek apakah ada galleries dengan status 'aktif'
   - Jika tidak ada, homepage akan tampil dengan empty state (tidak error)

## Catatan

- Aplikasi sekarang **tidak akan crash** meskipun tabel `agenda` belum ada
- Homepage akan tampil dengan empty galleries dan empty agendas
- Setelah migration jalan, data akan muncul otomatis

