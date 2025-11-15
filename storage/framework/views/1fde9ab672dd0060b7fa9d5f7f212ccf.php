<?php $__env->startSection('title', 'Informasi Terbaru'); ?>

<?php $__env->startSection('content'); ?>
<div class="w-full">
    <div class="flex justify-between items-center mb-6">
        <div>
            <h1 class="text-3xl font-bold text-gray-800">Informasi Terbaru</h1>
            <p class="text-gray-600 mt-1">Kelola informasi yang tampil di halaman user.</p>
        </div>
        <a href="<?php echo e(route('admin.informasi-items.create')); ?>" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md text-sm font-medium">
            <i class="fas fa-plus mr-2"></i>Tambah Informasi
        </a>
    </div>

    <?php if(session('success')): ?>
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-6">
            <?php echo e(session('success')); ?>

        </div>
    <?php endif; ?>

    <div class="bg-white rounded-lg shadow-md overflow-hidden">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Judul</th>
                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Tanggal</th>
                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Urutan</th>
                    <th class="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <?php $__empty_1 = true; $__currentLoopData = $informasiItems; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr>
                        <td class="px-4 py-3 text-sm text-gray-900"><?php echo e($item->title); ?></td>
                        <td class="px-4 py-3 text-sm text-gray-500"><?php echo e(optional($item->date)->format('d M Y')); ?></td>
                        <td class="px-4 py-3 text-sm">
                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full <?php echo e($item->status === 'aktif' ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-800'); ?>">
                                <?php echo e(ucfirst($item->status)); ?>

                            </span>
                        </td>
                        <td class="px-4 py-3 text-sm text-gray-500"><?php echo e($item->order); ?></td>
                        <td class="px-4 py-3 text-sm text-right space-x-2">
                            <a href="<?php echo e(route('admin.informasi-items.edit', $item->id)); ?>" class="inline-flex items-center px-3 py-1 border border-transparent text-xs leading-4 font-medium rounded-md text-white bg-yellow-500 hover:bg-yellow-600">
                                <i class="fas fa-edit mr-1"></i>Edit
                            </a>
                            <form action="<?php echo e(route('admin.informasi-items.destroy', $item->id)); ?>" method="POST" class="inline-block" onsubmit="return confirm('Yakin ingin menghapus informasi ini?');">
                                <?php echo csrf_field(); ?>
                                <?php echo method_field('DELETE'); ?>
                                <button type="submit" class="inline-flex items-center px-3 py-1 border border-transparent text-xs leading-4 font-medium rounded-md text-white bg-red-600 hover:bg-red-700">
                                    <i class="fas fa-trash mr-1"></i>Hapus
                                </button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr>
                        <td colspan="5" class="px-4 py-6 text-center text-sm text-gray-500">
                            Belum ada informasi yang dibuat.
                        </td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>

    <div class="mt-4">
        <?php echo e($informasiItems->links()); ?>

    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.dashboard', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\xampp\htdocs\ujikom\resources\views/admin/informasi-items/index.blade.php ENDPATH**/ ?>