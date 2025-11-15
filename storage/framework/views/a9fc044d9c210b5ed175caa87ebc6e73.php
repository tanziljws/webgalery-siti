<?php $__env->startSection('title', 'Manajemen Petugas - Galeri Edu'); ?>

<?php $__env->startSection('content'); ?>
<div class="w-full">
    <!-- Header -->
    <div class="flex justify-between items-center mb-6">
        <div>
            <h1 class="text-3xl font-bold text-gray-800">Manajemen Petugas</h1>
            <p class="text-gray-600 mt-1">Kelola petugas yang dapat mengakses sistem</p>
        </div>
        <a href="<?php echo e(route('petugas.create')); ?>" class="bg-teal-600 hover:bg-teal-700 text-white px-4 py-2 rounded-md text-sm font-medium transition-colors">
            <i class="fas fa-plus mr-2"></i>Tambah Petugas
        </a>
    </div>

    <!-- Alert Messages -->
    <?php if(session('success')): ?>
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-6" role="alert">
            <span class="block sm:inline"><?php echo e(session('success')); ?></span>
        </div>
    <?php endif; ?>

    <!-- Petugas Table -->
    <div class="bg-white shadow-lg rounded-lg overflow-hidden">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Petugas
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Username
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Email
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Dibuat
                        </th>
                        <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Aksi
                        </th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <?php $__empty_1 = true; $__currentLoopData = $petugas; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $petugasItem): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">
                                <div class="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center">
                                    <i class="fas fa-user text-blue-600"></i>
                                </div>
                                <div class="ml-4">
                                    <div class="text-sm font-medium text-gray-900"><?php echo e($petugasItem->username); ?></div>
                                    <div class="text-sm text-gray-500">ID: <?php echo e($petugasItem->id); ?></div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            <?php echo e($petugasItem->username); ?>

                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                            <?php echo e($petugasItem->email); ?>

                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                            <?php echo e($petugasItem->created_at ? $petugasItem->created_at->format('d/m/Y') : 'N/A'); ?>

                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                            <div class="flex items-center justify-end space-x-2">
                                <a href="<?php echo e(route('petugas.edit', $petugasItem)); ?>" 
                                   class="text-indigo-600 hover:text-indigo-900" 
                                   title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                
                                <button onclick="confirmDelete(<?php echo e($petugasItem->id); ?>, '<?php echo e($petugasItem->username); ?>')" 
                                        class="text-red-600 hover:text-red-900" 
                                        title="Hapus">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr>
                        <td colspan="5" class="px-6 py-12 text-center">
                            <div class="text-gray-500">
                                <i class="fas fa-users text-4xl mb-4"></i>
                                <h3 class="text-lg font-medium">Belum ada petugas</h3>
                                <p class="mt-2">Mulai dengan membuat petugas pertama</p>
                                <a href="<?php echo e(route('petugas.create')); ?>" class="mt-4 inline-flex items-center px-4 py-2 bg-teal-600 text-white rounded-md hover:bg-teal-700">
                                    <i class="fas fa-plus mr-2"></i>Tambah Petugas
                                </a>
                            </div>
                        </td>
                    </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Delete Form (Hidden) -->
<form id="deleteForm" method="POST" style="display: none;">
    <?php echo csrf_field(); ?>
    <?php echo method_field('DELETE'); ?>
</form>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
<script>
// Confirm Delete Function
function confirmDelete(petugasId, username) {
    if (confirm(`Apakah Anda yakin ingin menghapus petugas "${username}"?`)) {
        const form = document.getElementById('deleteForm');
        form.action = `/petugas/${petugasId}`;
        form.submit();
    }
}
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.dashboard', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\xampp\htdocs\ujikom\resources\views/petugas/index.blade.php ENDPATH**/ ?>