<?php $__env->startSection('title', $groupLabel . ' - Pengaturan Website'); ?>

<?php $__env->startSection('content'); ?>
<div class="w-full">
    <!-- Header -->
    <div class="flex justify-between items-center mb-6">
        <div>
            <h1 class="text-3xl font-bold text-gray-800"><?php echo e($groupLabel); ?></h1>
            <p class="text-gray-600 mt-1">Edit konten <?php echo e(strtolower($groupLabel)); ?></p>
        </div>
        <a href="<?php echo e(route('site-settings.index')); ?>" class="bg-gray-600 hover:bg-gray-700 text-white px-4 py-2 rounded-md text-sm font-medium transition-colors">
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

    <!-- Settings Form -->
    <div class="bg-white rounded-lg shadow-md p-6">
        <form action="<?php echo e(route('site-settings.update.bulk')); ?>" method="POST" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>
            <?php echo method_field('PUT'); ?>

            <div class="space-y-6">
                <?php $__currentLoopData = $settings; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $setting): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if($setting->key === 'social_twitter'): ?>
                        <?php continue; ?>
                    <?php endif; ?>
                    <div class="border-b border-gray-200 pb-6 last:border-b-0">
                        <label class="block text-sm font-semibold text-gray-700 mb-2">
                            <?php echo e($setting->label); ?>

                            <?php if($setting->description): ?>
                                <span class="block text-xs font-normal text-gray-500 mt-1"><?php echo e($setting->description); ?></span>
                            <?php endif; ?>
                        </label>

                        <?php if($setting->type === 'text'): ?>
                            <input type="text" 
                                   name="settings[<?php echo e($setting->key); ?>]" 
                                   value="<?php echo e(old('settings.' . $setting->key, $setting->value)); ?>"
                                   class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500">
                        
                        <?php elseif($setting->type === 'textarea'): ?>
                            <textarea name="settings[<?php echo e($setting->key); ?>]" 
                                      rows="4"
                                      class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500"><?php echo e(old('settings.' . $setting->key, $setting->value)); ?></textarea>
                        
                        <?php elseif($setting->type === 'editor'): ?>
                            <textarea name="settings[<?php echo e($setting->key); ?>]" 
                                      rows="8"
                                      class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-500 font-mono text-sm"><?php echo e(old('settings.' . $setting->key, $setting->value)); ?></textarea>
                            <p class="text-xs text-gray-500 mt-1">Anda bisa menggunakan HTML di sini</p>
                        
                        <?php elseif($setting->type === 'image'): ?>
                            <div class="space-y-3">
                                <?php if($setting->value): ?>
                                    <div class="mb-3">
                                        <img src="<?php echo e(asset('uploads/settings/' . $setting->value)); ?>" 
                                             alt="<?php echo e($setting->label); ?>" 
                                             class="h-32 w-auto object-cover rounded border border-gray-200">
                                        <p class="text-xs text-gray-500 mt-1">Gambar saat ini</p>
                                    </div>
                                <?php endif; ?>
                                <input type="file" 
                                       name="settings_files[<?php echo e($setting->key); ?>]" 
                                       accept="image/*"
                                       class="block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-teal-50 file:text-teal-700 hover:file:bg-teal-100">
                                <p class="text-xs text-gray-500">Upload gambar baru untuk mengganti yang lama</p>
                            </div>
                        <?php endif; ?>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>

            <div class="mt-8 flex gap-3">
                <button type="submit" class="bg-teal-600 hover:bg-teal-700 text-white px-6 py-3 rounded-md text-sm font-medium transition-colors">
                    <i class="fas fa-save mr-2"></i>Simpan Semua Perubahan
                </button>
                <a href="<?php echo e(route('site-settings.index')); ?>" class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-6 py-3 rounded-md text-sm font-medium transition-colors">
                    <i class="fas fa-times mr-2"></i>Batal
                </a>
            </div>
        </form>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.dashboard', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\xampp\htdocs\ujikom\resources\views/admin/site-settings/group.blade.php ENDPATH**/ ?>