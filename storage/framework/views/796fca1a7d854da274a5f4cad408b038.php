<?php $__env->startSection('title', 'Edit Informasi Terbaru'); ?>

<?php $__env->startSection('content'); ?>
<div class="w-full max-w-4xl mx-auto">
    <div class="flex justify-between items-center mb-6">
        <div>
            <h1 class="text-3xl font-bold text-gray-800">Edit Informasi</h1>
            <p class="text-gray-600 mt-1">Perbarui informasi yang sudah ada.</p>
        </div>
        <a href="<?php echo e(route('admin.informasi-items.index')); ?>" class="bg-gray-600 hover:bg-gray-700 text-white px-4 py-2 rounded-md text-sm font-medium">
            <i class="fas fa-arrow-left mr-2"></i>Kembali
        </a>
    </div>

    <?php if($errors->any()): ?>
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6">
            <ul class="list-disc list-inside">
                <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <li><?php echo e($error); ?></li>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </ul>
        </div>
    <?php endif; ?>

    <div class="bg-white rounded-lg shadow-md p-6">
        <form action="<?php echo e(route('admin.informasi-items.update', $informasi->id)); ?>" method="POST">
            <?php echo csrf_field(); ?>
            <?php echo method_field('PUT'); ?>

            <div class="mb-4">
                <label class="block text-sm font-semibold text-gray-700 mb-2">Judul Informasi <span class="text-red-500">*</span></label>
                <input type="text" name="title" value="<?php echo e(old('title', $informasi->title)); ?>" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
            </div>

            <div class="mb-4">
                <label class="block text-sm font-semibold text-gray-700 mb-2">Deskripsi <span class="text-red-500">*</span></label>
                <textarea name="description" rows="4" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required><?php echo e(old('description', $informasi->description)); ?></textarea>
            </div>

            <div class="grid grid-cols-2 gap-4 mb-4">
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Ikon (Font Awesome)</label>
                    <input type="text" name="icon" value="<?php echo e(old('icon', $informasi->icon)); ?>" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="fas fa-trophy, fas fa-graduation-cap">
                    <p class="text-xs text-gray-500 mt-1">Contoh: fas fa-trophy, fas fa-laptop, fas fa-users</p>
                </div>

                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Tanggal <span class="text-red-500">*</span></label>
                    <input type="date" name="date" value="<?php echo e(old('date', optional($informasi->date)->format('Y-m-d'))); ?>" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                </div>
            </div>

            <div class="grid grid-cols-2 gap-4 mb-6">
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Status <span class="text-red-500">*</span></label>
                    <select name="status" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        <option value="aktif" <?php echo e(old('status', $informasi->status) === 'aktif' ? 'selected' : ''); ?>>Aktif</option>
                        <option value="nonaktif" <?php echo e(old('status', $informasi->status) === 'nonaktif' ? 'selected' : ''); ?>>Nonaktif</option>
                    </select>
                </div>

                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Urutan Tampilan</label>
                    <input type="number" name="order" value="<?php echo e(old('order', $informasi->order)); ?>" min="0" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <p class="text-xs text-gray-500 mt-1">Angka lebih kecil tampil lebih dulu.</p>
                </div>
            </div>

            <div class="flex gap-3">
                <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-md text-sm font-medium">
                    <i class="fas fa-save mr-2"></i>Simpan Perubahan
                </button>
                <a href="<?php echo e(route('admin.informasi-items.index')); ?>" class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-6 py-3 rounded-md text-sm font-medium">
                    <i class="fas fa-times mr-2"></i>Batal
                </a>
            </div>
        </form>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.dashboard', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\xampp\htdocs\ujikom\resources\views/admin/informasi-items/edit.blade.php ENDPATH**/ ?>