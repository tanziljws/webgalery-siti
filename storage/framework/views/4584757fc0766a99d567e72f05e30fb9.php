<?php $__env->startSection('title', 'Beranda'); ?>

<?php $__env->startSection('content'); ?>
<!-- Alert Notifikasi -->
<?php if($pendingGaleri->count() > 0): ?>
<div class="mb-6 bg-gradient-to-r from-yellow-500 to-yellow-600 rounded-xl p-4 text-white shadow-lg">
    <div class="flex items-center justify-between">
        <div class="flex items-center space-x-3">
            <div class="w-10 h-10 bg-white bg-opacity-20 rounded-full flex items-center justify-center">
                <i class="fas fa-bell text-xl"></i>
            </div>
            <div>
                <p class="font-semibold"><?php echo e($pendingGaleri->count()); ?> galeri menunggu verifikasi</p>
                <p class="text-yellow-100 text-sm">Silakan verifikasi galeri yang telah diupload</p>
            </div>
        </div>
        <a href="<?php echo e(route('galeri.index')); ?>" class="bg-white bg-opacity-20 hover:bg-opacity-30 transition-all duration-200 rounded-lg p-2">
            <i class="fas fa-arrow-right"></i>
        </a>
    </div>
</div>
<?php else: ?>
<div class="mb-6 bg-gradient-to-r from-green-500 to-green-600 rounded-xl p-4 text-white shadow-lg">
    <div class="flex items-center justify-between">
        <div class="flex items-center space-x-3">
            <div class="w-10 h-10 bg-white bg-opacity-20 rounded-full flex items-center justify-center">
                <i class="fas fa-check-circle text-xl"></i>
            </div>
            <div>
                <p class="font-semibold">Semua galeri sudah terverifikasi</p>
                <p class="text-green-100 text-sm">Tidak ada galeri yang menunggu verifikasi</p>
            </div>
        </div>
        <a href="<?php echo e(route('galeri.create')); ?>" class="bg-white bg-opacity-20 hover:bg-opacity-30 transition-all duration-200 rounded-lg p-2">
            <i class="fas fa-plus"></i>
        </a>
    </div>
</div>
<?php endif; ?>

<!-- Statistik Cards -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
    <!-- Total Foto -->
    <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6 hover:shadow-md transition-shadow duration-200">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm font-medium text-gray-600">Total Galeri</p>
                <p class="text-3xl font-bold text-gray-900"><?php echo e($totalGaleri); ?></p>
                <div class="flex items-center mt-2">
                    <span class="text-green-500 text-sm font-medium">+12%</span>
                    <span class="text-gray-490 text-sm ml-1">dari bulan lalu</span>
                </div>
            </div>
            <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
                <i class="fas fa-image text-blue-600 text-xl"></i>
            </div>
        </div>
    </div>

    <!-- Pengunjung -->
    <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6 hover:shadow-md transition-shadow duration-200">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm font-medium text-gray-600">Galeri Aktif</p>
                <p class="text-3xl font-bold text-gray-900"><?php echo e($galeriAktif); ?></p>
                <div class="flex items-center mt-2">
                    <span class="text-green-500 text-sm font-medium">+5%</span>
                    <span class="text-gray-490 text-sm ml-1">dari minggu lalu</span>
                </div>
            </div>
            <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center">
                <i class="fas fa-eye text-purple-600 text-xl"></i>
            </div>
        </div>
    </div>

    <!-- Kategori -->
    <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6 hover:shadow-md transition-shadow duration-200">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm font-medium text-gray-600">Kategori</p>
                <p class="text-3xl font-bold text-gray-900"><?php echo e($totalKategori); ?></p>
                <div class="flex items-center mt-2">
                    <span class="text-green-500 text-sm font-medium">Aktif</span>
                    <span class="text-gray-490 text-sm ml-1">semua kategori</span>
                </div>
            </div>
            <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
                <i class="fas fa-folder text-green-600 text-xl"></i>
            </div>
        </div>
    </div>

    <!-- Laporan -->
    <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-6 hover:shadow-md transition-shadow duration-200">
        <div class="flex items-center justify-between">
            <div>
                <p class="text-sm font-medium text-gray-600">Laporan</p>
                <p class="text-3xl font-bold text-gray-900"><?php echo e($totalPages); ?></p>
                <div class="flex items-center mt-2">
                    <span class="text-green-500 text-sm font-medium">+3%</span>
                    <span class="text-gray-490 text-sm ml-1">dari bulan lalu</span>
                </div>
            </div>
            <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center">
                <i class="fas fa-chart-bar text-orange-600 text-xl"></i>
            </div>
        </div>
    </div>
</div>

<!-- Content Panels -->
<div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
    <!-- Informasi -->
    <div class="lg:col-span-3 bg-white rounded-xl shadow-sm border border-gray-100 p-6">
        <div class="flex items-center space-x-3 mb-6">
            <div class="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center">
                <i class="fas fa-bell text-blue-600 text-xl"></i>
            </div>
            <h3 class="text-lg font-semibold text-gray-900">Informasi</h3>
        </div>
        
        <div class="space-y-4">
            <div class="flex items-start space-x-3 p-3 bg-blue-50 rounded-lg">
                <div class="w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center flex-shrink-0 mt-1">
                    <i class="fas fa-info text-blue-600 text-sm"></i>
                </div>
                <div class="flex-1">
                    <p class="text-sm font-medium text-gray-900">Update sistem galeri terbaru</p>
                    <p class="text-xs text-gray-500 mt-1">2 jam yang lalu</p>
                </div>
                <a href="<?php echo e(route('galeri.index')); ?>" class="text-blue-600 hover:text-blue-700">
                    <i class="fas fa-arrow-right"></i>
                </a>
            </div>
            
            <div class="flex items-start space-x-3 p-3 bg-green-50 rounded-lg">
                <div class="w-8 h-8 bg-green-100 rounded-full flex items-center justify-center flex-shrink-0 mt-1">
                    <i class="fas fa-tag text-green-600 text-sm"></i>
                </div>
                <div class="flex-1">
                    <p class="text-sm font-medium text-gray-900">Kategori baru ditambahkan</p>
                    <p class="text-xs text-gray-500 mt-1">5 jam yang lalu</p>
                </div>
                <a href="<?php echo e(route('kategori.index')); ?>" class="text-green-600 hover:text-green-700">
                    <i class="fas fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Agenda -->
<div class="mt-6 bg-white rounded-xl shadow-sm border border-gray-100 p-6">
    <div class="flex items-center space-x-3 mb-6">
        <div class="w-10 h-10 bg-green-100 rounded-lg flex items-center justify-center">
            <i class="fas fa-calendar-check text-green-600 text-xl"></i>
        </div>
        <h3 class="text-lg font-semibold text-gray-900">Agenda</h3>
    </div>
    
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <?php $__empty_1 = true; $__currentLoopData = $recentAgenda; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $agenda): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
        <div class="p-4 bg-gradient-to-r from-green-50 to-green-100 rounded-lg border border-green-200">
            <div class="flex items-start space-x-3">
                <div class="w-10 h-10 bg-green-500 rounded-full flex items-center justify-center flex-shrink-0">
                    <i class="fas fa-calendar-alt text-white text-lg"></i>
                </div>
                <div class="flex-1">
                    <h4 class="font-semibold text-gray-900"><?php echo e($agenda->title); ?></h4>
                    <p class="text-sm text-gray-600 mt-1">
                        <?php echo e($agenda->event_date ? $agenda->event_date->format('d F Y') : 'Tanggal tidak ditentukan'); ?>

                        <?php if($agenda->time): ?>
                            pukul <?php echo e($agenda->time); ?>

                        <?php endif; ?>
                    </p>
                    <span class="inline-block mt-2 px-3 py-1 bg-green-500 text-white text-xs rounded-full font-medium">
                        <?php echo e($agenda->date_label ?? 'Aktif'); ?>

                    </span>
                </div>
            </div>
        </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
        <div class="col-span-2 text-center py-8 text-gray-500">
            <i class="fas fa-calendar-times text-4xl mb-2"></i>
            <p>Belum ada agenda yang ditambahkan</p>
        </div>
        <?php endif; ?>
    </div>
</div>

<!-- Quick Actions -->
<div class="mt-6 bg-white rounded-xl shadow-sm border border-gray-100 p-6">
    <h3 class="text-lg font-semibold text-gray-900 mb-4">Aksi Cepat</h3>
    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
        <a href="<?php echo e(route('galeri.create')); ?>" class="p-4 bg-blue-50 hover:bg-blue-100 rounded-lg border border-blue-200 transition-colors duration-200 flex flex-col items-center space-y-2">
            <div class="w-12 h-12 bg-blue-500 rounded-lg flex items-center justify-center">
                <i class="fas fa-upload text-white text-xl"></i>
            </div>
            <span class="text-sm font-medium text-gray-700">Upload Foto</span>
        </a>
        
        <a href="<?php echo e(route('kategori.create')); ?>" class="p-4 bg-green-50 hover:bg-green-100 rounded-lg border border-green-200 transition-colors duration-200 flex flex-col items-center space-y-2">
            <div class="w-12 h-12 bg-green-500 rounded-lg flex items-center justify-center">
                <i class="fas fa-folder-plus text-white text-xl"></i>
            </div>
            <span class="text-sm font-medium text-gray-700">Tambah Kategori</span>
        </a>
        
        <a href="<?php echo e(route('petugas.create')); ?>" class="p-4 bg-purple-50 hover:bg-purple-100 rounded-lg border border-purple-200 transition-colors duration-200 flex flex-col items-center space-y-2">
            <div class="w-12 h-12 bg-purple-500 rounded-lg flex items-center justify-center">
                <i class="fas fa-user-plus text-white text-xl"></i>
            </div>
            <span class="text-sm font-medium text-gray-700">Tambah Petugas</span>
        </a>
        
        <a href="<?php echo e(route('galeri.report')); ?>" class="p-4 bg-orange-50 hover:bg-orange-100 rounded-lg border border-orange-200 transition-colors duration-200 flex flex-col items-center space-y-2">
            <div class="w-12 h-12 bg-orange-500 rounded-lg flex items-center justify-center">
                <i class="fas fa-chart-line text-white text-xl"></i>
            </div>
            <span class="text-sm font-medium text-gray-700">Lihat Laporan</span>
        </a>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.dashboard', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\xampp\htdocs\ujikom\resources\views/dashboard.blade.php ENDPATH**/ ?>