# Galeri Edu - Sistem Manajemen Galeri Sekolah

Sistem manajemen galeri foto untuk sekolah yang dibangun dengan Laravel 12.0. Aplikasi ini memungkinkan admin dan petugas untuk mengelola galeri foto sekolah dengan fitur upload multiple foto, kategori, dan manajemen konten.

## Fitur Utama

### Dashboard Admin
- Statistik real-time dari database
- Quick actions untuk navigasi cepat
- Recent galeri dengan preview foto
- Alert notifikasi untuk galeri pending

### Manajemen Galeri
- Upload multiple foto sekaligus
- Preview foto sebelum upload
- Edit dan hapus galeri
- Toggle status aktif/nonaktif
- Relasi dengan kategori dan petugas

### Manajemen Kategori
- CRUD lengkap untuk kategori
- Modal forms untuk create/edit
- Status management
- Search dan filter

### Manajemen Petugas
- User management untuk petugas
- Role-based access control
- Profile management
- Authentication system

### Download Galeri
- Download foto tanpa login
- Captcha verification (pertanyaan matematika sederhana)
- Rate limiting: 5 downloads per IP per jam
- Download token berlaku 5 menit
- CMS untuk halaman website
- Slug generation otomatis
- Status publishing
- Content management

### Manajemen Admin
- Update profile admin
- Change password dengan validasi
- Session management

## Teknologi yang Digunakan

- **Backend**: Laravel 12.0 (PHP 8.2+)
- **Frontend**: TailwindCSS 4.0, Alpine.js
- **Database**: MySQL/SQLite
- **Build Tool**: Vite 7.0
- **Authentication**: Laravel Auth dengan JWT
- **File Upload**: Local storage dengan validasi

## Struktur Database

### Tabel Utama
- `users` - Data admin dan user
- `petugas` - Data petugas sekolah
- `kategori` - Kategori galeri
- `posts` - Konten galeri (judul, deskripsi, kategori)
- `galery` - Data galeri (status, relasi ke posts)
- `foto` - File foto individual
- `pages` - Halaman website

### Relasi Database
- `galery` belongsTo `posts`
- `posts` belongsTo `kategori` dan `petugas`
- `galery` hasMany `foto`
- `kategori` hasMany `posts`

## Instalasi

### Prerequisites
- PHP 8.2 atau lebih tinggi
- Composer
- Node.js dan npm
- MySQL atau SQLite

### Langkah Instalasi

1. **Clone repository**
```bash
git clone <repository-url>
cd galeri-edu
```

2. **Install dependencies**
```bash
composer install
npm install
```

3. **Setup environment**
```bash
cp .env.example .env
php artisan key:generate
```

4. **Konfigurasi database**
Edit file `.env`:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=galeri_edu
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

5. **Jalankan migrasi**
```bash
php artisan migrate
php artisan db:seed
```

6. **Build assets**
```bash
npm run build
```

7. **Jalankan server**
```bash
php artisan serve
```

Aplikasi akan berjalan di `http://localhost:8000`

## Konfigurasi

### Upload Folder
Pastikan folder `public/uploads/galeri` memiliki permission yang benar:
```bash
chmod -R 755 public/uploads/galeri
```

### File Upload Settings
Konfigurasi di `config/filesystems.php`:
- Max file size: 10MB per foto
- Allowed types: jpeg, png, jpg, gif, webp
- Storage: local (public/uploads/galeri)

### Authentication
- Default admin: `admin@galeri-edu.com` / `admin123`
- Session timeout: 120 menit
- CSRF protection: enabled

## Penggunaan

### Login Admin
1. Buka `http://localhost:8000/login`
2. Masukkan email dan password admin
3. Dashboard akan menampilkan statistik dan quick actions

### Upload Galeri
1. Klik "Tambah Foto" di dashboard atau sidebar
2. Isi form: judul, deskripsi, pilih kategori
3. Upload multiple foto (drag & drop atau browse)
4. Preview foto akan muncul
5. Klik "Upload Foto" untuk submit

### Manajemen Kategori
1. Akses menu "Kategori" di sidebar
2. Klik "Tambah Kategori" untuk membuat baru
3. Edit atau hapus kategori yang ada
4. Gunakan search dan filter untuk navigasi

### Manajemen Petugas
1. Akses menu "Petugas" di sidebar
2. Tambah petugas baru dengan form
3. Edit profil petugas yang ada
4. Hapus petugas jika diperlukan

## API Endpoints

### Galeri API
- `GET /api/galeri` - List semua galeri "BUAT LAMAN USER"
- `POST /api/galeri` - Create galeri baru
- `PUT /api/galeri/{id}` - Update galeri
- `DELETE /api/galeri/{id}` - Hapus galeri
- `PATCH /api/galeri/{id}/toggle-status` - Toggle status

### Kategori API
- `GET /api/kategori` - List kategori "BUAT USER"
- `POST /api/kategori` - Create kategori
- `PUT /api/kategori/{id}` - Update kategori
- `DELETE /api/kategori/{id}` - Hapus kategori

### Petugas API
- `GET /api/petugas` - List petugas
- `POST /api/petugas` - Create petugas
- `PUT /api/petugas/{id}` - Update petugas
- `DELETE /api/petugas/{id}` - Hapus petugas

### Pages API
- `GET /api/pages` - List halaman  "USER"
- `POST /api/pages` - Create halaman
- `PUT /api/pages/{id}` - Update halaman
- `DELETE /api/pages/{id}` - Hapus halaman
- `PATCH /api/pages/{id}/toggle-status` - Toggle status

## Struktur File

```
galeri-edu/
├── app/
│   ├── Http/Controllers/
│   │   ├── DashboardController.php
│   │   ├── GaleriController.php
│   │   ├── KategoriController.php
│   │   ├── PetugasController.php
│   │   ├── PageController.php
│   │   ├── AdminProfileController.php
│   │   └── AuthController.php
│   └── Models/
│       ├── galery.php
│       ├── posts.php
│       ├── foto.php
│       ├── Kategori.php
│       ├── Petugas.php
│       ├── Page.php
│       └── User.php
├── resources/views/
│   ├── layouts/
│   │   ├── dashboard.blade.php
│   │   ├── app.blade.php
│   │   └── guest.blade.php
│   ├── galeri/
│   ├── kategori/
│   ├── petugas/
│   ├── pages/
│   ├── admin/
│   └── auth/
├── routes/
│   ├── web.php
│   └── api.php
├── public/uploads/galeri/
└── database/migrations/
```

## Troubleshooting

### Error "Column not found: created_at"
- Pastikan migrasi database sudah dijalankan
- Cek relasi antara tabel galery dan posts
- Gunakan JOIN query untuk mengakses created_at dari posts

### Error "CSRF token mismatch"
- Pastikan meta tag CSRF ada di layout
- Cek konfigurasi session di .env
- Pastikan middleware CSRF aktif

### Error "File upload failed"
- Cek permission folder uploads/galeri
- Pastikan max file size tidak melebihi limit
- Cek konfigurasi filesystem

### Error "Route not found"
- Jalankan `php artisan route:clear`
- Cek file routes/web.php dan routes/api.php
- Pastikan bootstrap/app.php memuat routes dengan benar

## Kontribusi

1. Fork repository
2. Buat feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit perubahan (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buat Pull Request

## Lisensi

Proyek ini menggunakan lisensi MIT. Lihat file [LICENSE](LICENSE) untuk detail lebih lanjut.

## Kontak

Untuk pertanyaan atau dukungan, silakan hubungi:
- Email: admin@galeri-edu.com
- Website: [galeri-edu.com](https://galeri-edu.com)

## Changelog

### Version 1.0.0
- Dashboard dengan data real dari database
- CRUD lengkap untuk galeri, kategori, petugas, dan halaman
- Upload multiple foto dengan preview
- Authentication system dengan CSRF protection
- Responsive design dengan TailwindCSS
- API endpoints untuk semua fitur
- Admin profile management
- Status toggle untuk galeri dan halaman