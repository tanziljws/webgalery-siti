<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PetugasController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\GaleriController;
use App\Http\Controllers\KategoriController;
use App\Http\Controllers\AdminProfileController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DownloadController;

// -------------------------------
// PUBLIC ROUTES (Tanpa Login)
// -------------------------------
Route::get('/', function () {
    return view('user.dashboard');
})->name('user.dashboard');

Route::get('/user/gallery', function () {
    $galeri = \App\Models\galery::with(['post.kategori', 'fotos'])->where('status', 'aktif')->get();
    $kategoris = \App\Models\Kategori::orderBy('judul', 'asc')->get();
    return view('user.gallery', compact('galeri', 'kategoris'));
})->name('user.gallery');

Route::get('/user/agenda', function () {
    return view('user.agenda');
})->name('user.agenda');

Route::get('/user/informasi', function () {
    return view('user.informasi');
})->name('user.informasi');

// Public route untuk menampilkan pages
Route::get('/page/{slug}', [PageController::class, 'showBySlug'])->name('page.show');

// Download routes with captcha
Route::post('/download/generate-captcha', [DownloadController::class, 'generateCaptcha'])->name('download.captcha');
Route::post('/download/verify', [DownloadController::class, 'verifyCaptcha'])->name('download.verify');
Route::get('/download/{token}', [DownloadController::class, 'download'])->name('download.file');

// -------------------------------
// AUTH ROUTES (Login/Logout)
// -------------------------------
Route::middleware(['guest'])->group(function () {
    Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
    Route::post('/login', [AuthController::class, 'login']);
});

Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// -------------------------------
// ADMIN & PETUGAS ROUTES (Harus Login)
// -------------------------------
// -------------------------------
// ADMIN & PETUGAS ROUTES (Harus Login)
// -------------------------------
Route::middleware(['auth'])->group(function () {

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    // ✅ Resource CRUD routes
    Route::resource('kategori', KategoriController::class);
    Route::resource('galeri', GaleriController::class);
    Route::resource('petugas', PetugasController::class);
    Route::resource('pages', PageController::class);

    // ✅ Toggle status routes
    Route::patch('galeri/{galeri}/toggle-status', [GaleriController::class, 'toggleStatus'])->name('galeri.toggleStatus');
    Route::patch('pages/{page}/toggle-status', [PageController::class, 'toggleStatus'])->name('pages.toggleStatus');

    // Ganti route admin profile dari view langsung ke controller
    Route::get('/admin/profile', [AdminProfileController::class, 'index'])->name('admin.profile');

    // **Tambahan route update profile admin**
    Route::put('/admin/profile', [AdminProfileController::class, 'update'])->name('admin.profile.update');
    
    // **Route update password admin**
    Route::put('/admin/password', [AdminProfileController::class, 'updatePassword'])->name('admin.password.update');
});
