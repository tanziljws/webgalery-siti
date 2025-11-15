<!DOCTYPE html>
<html>
<head>
    <title>Laporan Statistik Galeri & Agenda</title>
    <meta charset="utf-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            line-height: 1.4;
            color: #333;
        }
        
        .header {
            text-align: center;
            border-bottom: 3px solid #3b82f6;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        
        .header h1 {
            color: #3b82f6;
            margin: 0;
            font-size: 24px;
        }
        
        .header p {
            margin: 5px 0 0 0;
            color: #666;
        }
        
        .info-section {
            margin-bottom: 20px;
        }
        
        .info-section h2 {
            font-size: 16px;
            color: #333;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }
        
        .filter-info {
            background-color: #f5f7fa;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin-bottom: 25px;
        }
        
        .stat-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            text-align: center;
            background-color: #f8fafc;
        }
        
        .stat-card h3 {
            font-size: 11px;
            color: #666;
            margin: 0 0 8px 0;
            text-transform: uppercase;
        }
        
        .stat-card .value {
            font-size: 20px;
            font-weight: bold;
            color: #3b82f6;
            margin: 0;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }
        
        table thead {
            background-color: #3b82f6;
            color: white;
        }
        
        table th {
            padding: 10px;
            text-align: left;
            font-weight: bold;
            font-size: 11px;
            text-transform: uppercase;
        }
        
        table td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        
        table tbody tr:nth-child(even) {
            background-color: #f8fafc;
        }
        
        .category-stats-table td:last-child {
            width: 40%;
        }
        
        .progress-container {
            background-color: #e5e7eb;
            border-radius: 4px;
            height: 12px;
            margin: 5px 0;
            overflow: hidden;
        }
        
        .progress-bar {
            height: 100%;
            background-color: #3b82f6;
            border-radius: 4px;
        }
        
        .status-active {
            color: #10b981;
            font-weight: bold;
        }
        
        .status-inactive {
            color: #ef4444;
            font-weight: bold;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 10px;
            border-top: 1px solid #ddd;
            font-size: 10px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>LAPORAN STATISTIK GALERI & AGENDA</h1>
        <p>Dicetak pada: <?php echo e(date('d F Y H:i:s')); ?></p>
    </div>
    
    <div class="info-section">
        <h2>Informasi Filter</h2>
        <div class="filter-info">
            <p><strong>Periode:</strong> 
                <?php if($startDate && $endDate): ?>
                    <?php echo e(date('d M Y', strtotime($startDate))); ?> - <?php echo e(date('d M Y', strtotime($endDate))); ?>

                <?php else: ?>
                    Semua periode
                <?php endif; ?>
            </p>
            <p><strong>Kategori:</strong> 
                <?php if($categoryName): ?>
                    <?php echo e($categoryName); ?>

                <?php else: ?>
                    Semua Kategori
                <?php endif; ?>
            </p>
            <p><strong>Status:</strong> 
                <?php if($status): ?>
                    <?php echo e(ucfirst($status)); ?>

                <?php else: ?>
                    Semua Status
                <?php endif; ?>
            </p>
        </div>
    </div>
    
    <div class="info-section">
        <h2>Statistik Utama</h2>
        <div class="stats-grid">
            <div class="stat-card">
                <h3>Total Galeri</h3>
                <p class="value"><?php echo e($statistics['total_galeries']); ?></p>
            </div>
            <div class="stat-card">
                <h3>Total Foto</h3>
                <p class="value"><?php echo e($statistics['total_photos']); ?></p>
            </div>
            <div class="stat-card">
                <h3>Total Agenda</h3>
                <p class="value"><?php echo e($statistics['total_agendas']); ?></p>
            </div>
            <div class="stat-card">
                <h3>Rata-rata Foto/Galeri</h3>
                <p class="value"><?php echo e(number_format($statistics['avg_photos_per_gallery'], 1)); ?></p>
            </div>
        </div>
    </div>
    
    <div class="info-section">
        <h2>Statistik Status</h2>
        <div class="stats-grid">
            <div class="stat-card">
                <h3>Galeri Aktif</h3>
                <p class="value"><?php echo e($statistics['total_aktif_galleries']); ?></p>
            </div>
            <div class="stat-card">
                <h3>Galeri Nonaktif</h3>
                <p class="value"><?php echo e($statistics['total_nonaktif_galleries']); ?></p>
            </div>
            <div class="stat-card">
                <h3>Agenda Aktif</h3>
                <p class="value"><?php echo e($statistics['total_aktif_agendas']); ?></p>
            </div>
            <div class="stat-card">
                <h3>Agenda Nonaktif</h3>
                <p class="value"><?php echo e($statistics['total_nonaktif_agendas']); ?></p>
            </div>
        </div>
    </div>
    
    <?php if(!empty($statistics['categories_count'])): ?>
    <div class="info-section">
        <h2>Statistik per Kategori</h2>
        <table class="category-stats-table">
            <thead>
                <tr>
                    <th>Kategori</th>
                    <th>Jumlah Galeri</th>
                    <th>Persentase</th>
                </tr>
            </thead>
            <tbody>
                <?php $__currentLoopData = $statistics['categories_count']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $categoryName => $count): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr>
                    <td><?php echo e($categoryName); ?></td>
                    <td><?php echo e($count); ?></td>
                    <td>
                        <?php
                            $percentage = $statistics['total_galeries'] > 0 ? ($count / $statistics['total_galeries']) * 100 : 0;
                        ?>
                        <div class="progress-container">
                            <div class="progress-bar" style="width: <?php echo number_format($percentage, 1); ?>%"></div>
                        </div>
                        <span><?php echo number_format($percentage, 1); ?>%</span>
                    </td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
        </table>
    </div>
    <?php endif; ?>
    
    <div class="info-section">
        <h2>Detail Galeri</h2>
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Judul</th>
                    <th>Kategori</th>
                    <th>Jumlah Foto</th>
                    <th>Status</th>
                    <th>Tanggal</th>
                </tr>
            </thead>
            <tbody>
                <?php $__empty_1 = true; $__currentLoopData = $galeries; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $galeri): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <tr>
                    <td><?php echo e($index + 1); ?></td>
                    <td><?php echo e($galeri->post->judul ?? 'Tanpa Judul'); ?></td>
                    <td><?php echo e($galeri->post->kategori->judul ?? 'Tanpa Kategori'); ?></td>
                    <td><?php echo e($galeri->fotos->count()); ?></td>
                    <td>
                        <?php if($galeri->status === 'aktif'): ?>
                            <span class="status-active">Aktif</span>
                        <?php else: ?>
                            <span class="status-inactive">Nonaktif</span>
                        <?php endif; ?>
                    </td>
                    <td>
                        <?php echo e($galeri->post->created_at ? $galeri->post->created_at->format('d M Y') : '-'); ?>

                    </td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                <tr>
                    <td colspan="6" style="text-align: center;">Tidak ada data galeri</td>
                </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
    
    <div class="footer">
        <p>Laporan ini dihasilkan secara otomatis oleh sistem. Data akurat per tanggal <?php echo e(date('d F Y H:i:s')); ?></p>
    </div>
</body>
</html><?php /**PATH C:\xampp\htdocs\ujikom\resources\views/admin/reports/galeri-pdf.blade.php ENDPATH**/ ?>