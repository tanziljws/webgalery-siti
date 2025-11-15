<?php $__env->startSection('title', 'Edit Galeri - Galeri Edu'); ?>

<?php $__env->startSection('content'); ?>
<div class="w-full">
    <!-- Header -->
    <div class="flex justify-between items-center mb-6">
        <div>
            <h1 class="text-3xl font-bold text-gray-800">Edit Galeri</h1>
            <p class="text-gray-600 mt-1">Edit foto dan informasi galeri</p>
        </div>
        <a href="<?php echo e(route('galeri.index')); ?>" class="bg-gray-600 hover:bg-gray-700 text-white px-4 py-2 rounded-md text-sm font-medium transition-colors">
            <i class="fas fa-arrow-left mr-2"></i>Kembali
        </a>
    </div>

    <!-- Alert Messages -->
    <?php if(session('success')): ?>
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-6" role="alert">
            <span class="block sm:inline"><?php echo e(session('success')); ?></span>
        </div>
    <?php endif; ?>

    <?php if($errors->any()): ?>
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6" role="alert">
            <ul class="list-disc list-inside">
                <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <li><?php echo e($error); ?></li>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </ul>
        </div>
    <?php endif; ?>

    <!-- Form -->
    <div class="bg-white rounded-lg shadow p-6">
        <form action="<?php echo e(route('galeri.update', $galeri)); ?>" method="POST" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>
            <?php echo method_field('PUT'); ?>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Left Column -->
                <div class="space-y-6">
                    <!-- Judul -->
                    <div>
                        <label for="judul" class="block text-sm font-medium text-gray-700 mb-2">Judul Galeri</label>
                        <input type="text" 
                               id="judul" 
                               name="judul" 
                               value="<?php echo e(old('judul', $galeri->post->judul ?? '')); ?>"
                               class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                               required>
                    </div>

                    <!-- Kategori -->
                    <div>
                        <label for="kategori_id" class="block text-sm font-medium text-gray-700 mb-2">Kategori</label>
                        <select id="kategori_id" 
                                name="kategori_id" 
                                class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                required>
                            <option value="">Pilih Kategori</option>
                            <?php $__currentLoopData = $kategori; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $kat): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($kat->id); ?>" 
                                        <?php echo e(old('kategori_id', $galeri->post->kategori_id ?? '') == $kat->id ? 'selected' : ''); ?>>
                                    <?php echo e($kat->judul); ?>

                                </option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>

                    <!-- Deskripsi -->
                    <div>
                        <label for="deskripsi" class="block text-sm font-medium text-gray-700 mb-2">Deskripsi</label>
                        <textarea id="deskripsi" 
                                  name="deskripsi" 
                                  rows="4"
                                  class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"><?php echo e(old('deskripsi', $galeri->post->isi ?? '')); ?></textarea>
                    </div>

                    <!-- Status -->
                    <div>
                        <label for="status" class="block text-sm font-medium text-gray-700 mb-2">Status</label>
                        <select id="status" 
                                name="status" 
                                class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                            <option value="aktif" <?php echo e(old('status', $galeri->status) == 'aktif' ? 'selected' : ''); ?>>Aktif</option>
                            <option value="nonaktif" <?php echo e(old('status', $galeri->status) == 'nonaktif' ? 'selected' : ''); ?>>Nonaktif</option>
                        </select>
                    </div>
                </div>

                <!-- Right Column -->
                <div class="space-y-6">
                    <!-- Current Photos -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Foto Saat Ini</label>
                        <div class="grid grid-cols-2 gap-4">
                            <?php $__empty_1 = true; $__currentLoopData = $galeri->fotos; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $foto): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                <div class="relative">
                                    <img src="<?php echo e(asset('uploads/galeri/' . $foto->file)); ?>" 
                                         alt="Foto galeri" 
                                         class="w-full h-32 object-cover rounded-lg">
                                    <div class="absolute top-2 right-2">
                                        <button type="button" 
                                                onclick="deletePhoto(<?php echo e($foto->id); ?>)"
                                                class="bg-red-500 hover:bg-red-600 text-white p-1 rounded-full text-xs">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                <div class="col-span-2 text-center py-8 text-gray-500">
                                    <i class="fas fa-image text-4xl mb-2"></i>
                                    <p>Belum ada foto</p>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>

                    <!-- Upload New Photos -->
                    <div>
                        <label for="fotos" class="block text-sm font-medium text-gray-700 mb-2">Tambah Foto Baru</label>
                        <input type="file" 
                               id="fotos" 
                               name="fotos[]" 
                               multiple 
                               accept="image/*"
                               class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        <p class="text-sm text-gray-500 mt-1">Pilih multiple file untuk upload beberapa foto sekaligus</p>
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="flex justify-end space-x-4 mt-8 pt-6 border-t border-gray-200">
                <a href="<?php echo e(route('galeri.index')); ?>" 
                   class="px-6 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50 transition-colors">
                    Batal
                </a>
                <button type="submit" 
                        class="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-md transition-colors">
                    <i class="fas fa-save mr-2"></i>Simpan Perubahan
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Delete Photo Form (Hidden) -->
<form id="deletePhotoForm" method="POST" style="display: none;">
    <?php echo csrf_field(); ?>
    <?php echo method_field('DELETE'); ?>
</form>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
<script>
function deletePhoto(fotoId) {
    if (confirm('Apakah Anda yakin ingin menghapus foto ini?')) {
        const form = document.getElementById('deletePhotoForm');
        form.action = `/galeri/foto/${fotoId}`;
        form.submit();
    }
}
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.dashboard', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\xampp\htdocs\ujikom\resources\views/galeri/edit.blade.php ENDPATH**/ ?>