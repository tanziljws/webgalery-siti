<?php $__env->startSection('title', 'Riwayat Like & Dislike Galeri'); ?>

<?php $__env->startSection('content'); ?>
<div class="w-full">
    <div class="flex justify-between items-center mb-6">
        <div>
            <h1 class="text-3xl font-bold text-gray-800">Riwayat Like & Dislike Galeri</h1>
            <p class="text-gray-600 mt-1">Melihat siapa saja yang memberikan like/dislike pada foto galeri.</p>
        </div>
        <div class="flex items-center space-x-2">
            <form method="POST" action="<?php echo e(route('galeri.like-logs.reset')); ?>" onsubmit="return confirm('Yakin ingin mereset semua data like/dislike? Tindakan ini tidak dapat dibatalkan.');">
                <?php echo csrf_field(); ?>
                <button type="submit" class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded-md text-sm font-medium transition-colors">
                    <i class="fas fa-trash-restore mr-2"></i>Reset Semua Like/Dislike
                </button>
            </form>
            <a href="<?php echo e(route('galeri.index')); ?>" class="bg-gray-600 hover:bg-gray-700 text-white px-4 py-2 rounded-md text-sm font-medium transition-colors">
                <i class="fas fa-arrow-left mr-2"></i>Kembali ke Galeri
            </a>
        </div>
    </div>

    <?php if(session('status')): ?>
        <div class="mb-4 p-3 rounded-md bg-green-100 text-green-800 text-sm border border-green-200">
            <?php echo e(session('status')); ?>

        </div>
    <?php endif; ?>

    <div class="bg-white rounded-lg shadow-md overflow-hidden">
        <div class="px-6 py-4 border-b border-gray-200 bg-gray-50">
            <h2 class="text-xl font-semibold text-gray-800">Daftar Riwayat</h2>
        </div>
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Waktu</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">User</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Foto</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <?php $__empty_1 = true; $__currentLoopData = $logs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $log): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            <?php echo e($log->created_at ? $log->created_at->format('d/m/Y H:i') : '-'); ?>

                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            <?php echo e($log->user->name ?? '-'); ?>

                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            <?php echo e($log->user->email ?? '-'); ?>

                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            <?php
                                $judul = $log->foto && $log->foto->galery && $log->foto->galery->post
                                    ? $log->foto->galery->post->judul
                                    : null;
                            ?>
                            <?php echo e($judul ?? ('Foto ID: ' . $log->foto_id)); ?>

                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            <?php
                                $label = strtoupper($log->action);
                                $color = in_array($log->action, ['like', 'undislike']) ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800';
                            ?>
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full <?php echo e($color); ?>">
                                <?php echo e($label); ?>

                            </span>
                        </td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr>
                        <td colspan="5" class="px-6 py-8 text-center text-gray-500">
                            <i class="fas fa-inbox text-4xl mb-2"></i>
                            <p>Belum ada aktivitas like/dislike yang tercatat.</p>
                        </td>
                    </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
        <div class="px-6 py-4 border-t border-gray-200 bg-gray-50">
            <?php echo e($logs->links()); ?>

        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.dashboard', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\xampp\htdocs\ujikom\resources\views/admin/reports/gallery-like-logs.blade.php ENDPATH**/ ?>