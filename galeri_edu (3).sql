-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2025 at 04:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galeri_edu`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_label` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `event_date` date DEFAULT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agenda`
--

INSERT INTO `agenda` (`id`, `title`, `description`, `date_label`, `time`, `event_date`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'UKK (Uji Kompetensi Keahlian)', 'Ujian Kompetensi Keahlian (UKK) merupakan kegiatan evaluasi akhir bagi siswa kelas XII untuk mengukur pencapaian kompetensi sesuai bidang keahliannya. Melalui UKK, diharapkan siswa mampu menunjukkan kemampuan profesional dan siap menghadapi dunia kerja.', 'Rabu-Jumat', '07.00-Selesai', '2025-11-19', 'aktif', 0, '2025-11-12 19:47:04', '2025-11-12 19:47:04'),
(2, 'UKK (Uji Kompetensi Keahlian) dari Perusahaan', 'Pelaksanaan Ujian Kompetensi Keahlian (UKK) oleh pihak perusahaan menjadi bentuk nyata kerja sama antara sekolah dan dunia industri. Kegiatan ini bertujuan untuk menilai kesiapan siswa dalam menerapkan keahlian sesuai standar kerja profesional di lapangan.', 'Senin-Rabu', '07.00-Selesai', '2025-11-24', 'aktif', 0, '2025-11-12 19:49:22', '2025-11-12 19:49:22'),
(3, 'Tes Pemeriksaan Kesehatan', 'Kegiatan pemeriksaan kesehatan bagi siswa dilaksanakan sebagai upaya menjaga dan memantau kondisi kesehatan peserta didik. Melalui kegiatan ini, sekolah berkomitmen untuk menciptakan lingkungan belajar yang sehat dan nyaman.', 'Kamis-Jumat', '08.00-16.00', '2025-11-12', 'aktif', 0, '2025-11-12 19:51:39', '2025-11-12 19:51:39'),
(4, 'Perekaman E-KTP', 'Kegiatan perekaman e-KTP di sekolah dilaksanakan bekerja sama dengan Dinas Kependudukan dan Pencatatan Sipil (Disdukcapil). Program ini mempermudah siswa yang telah memenuhi syarat usia untuk melakukan perekaman data kependudukan tanpa harus datang ke kantor dinas.', 'Senin', '08.00-15.00', '2025-11-10', 'aktif', 0, '2025-11-12 19:53:51', '2025-11-12 19:53:51'),
(5, 'Sosialisasi PTN, PTS, SNPMB', 'Kegiatan sosialisasi PTN, PTS, dan SNPMB dilaksanakan untuk memberikan informasi dan arahan kepada siswa kelas XII mengenai jalur dan prosedur masuk perguruan tinggi. Melalui kegiatan ini, diharapkan siswa lebih siap dalam menentukan pilihan dan melanjutkan pendidikan ke jenjang yang lebih tinggi.', 'Jumat', '07.30-11.00', '2025-11-07', 'aktif', 0, '2025-11-12 19:56:36', '2025-11-12 19:56:36'),
(6, 'Sosialisasi Ujikom dan PKL', 'Kegiatan sosialisasi Ujikom dan PKL dilaksanakan untuk memberikan pemahaman kepada siswa mengenai pelaksanaan Ujian Kompetensi dan Praktik Kerja Lapangan. Melalui kegiatan ini, siswa dibekali informasi penting terkait persiapan, pelaksanaan, dan penilaian agar dapat mengikuti kegiatan dengan baik dan maksimal.', 'Jumat', '07.30-11.00', '2025-11-07', 'aktif', 0, '2025-11-12 19:58:06', '2025-11-12 19:58:06'),
(7, 'Verifikasi Data Persiapan E-Ijazah', 'Kegiatan verifikasi data persiapan E-Ijazah dilaksanakan untuk memastikan keakuratan identitas dan data akademik siswa sebelum proses penerbitan ijazah elektronik. Langkah ini bertujuan agar seluruh data yang tercantum pada E-Ijazah sesuai dan valid berdasarkan arsip sekolah.', 'Selasa', '10.00-13.00', '2025-11-04', 'aktif', 0, '2025-11-12 20:00:15', '2025-11-12 20:00:15'),
(8, 'Kegiatan Pemeiksaan Kesehatan yang Dilakukan oleh Puskesmas Lawang Gintung.', 'Kegiatan pemeriksaan kesehatan oleh Puskesmas Lawang Gintung bertujuan untuk memantau kondisi kesehatan siswa secara berkala. Pemeriksaan meliputi pengukuran tinggi badan, berat badan, kebersihan gigi, indera, serta deteksi dini potensi masalah kesehatan. Melalui kegiatan ini, sekolah berharap dapat meningkatkan kesadaran siswa mengenai pentingnya menjaga kesehatan sejak dini.', 'Jumat', '10.00-12.00', '2025-11-14', 'aktif', 1, '2025-11-14 06:14:41', '2025-11-14 06:14:41'),
(9, 'Training of Trainer (ToT) Kesehatan Remaja Berbasis Sekolah', 'Kegiatan Training of Trainer (ToT) Kesehatan Remaja Berbasis Sekolah bertujuan membekali para peserta dengan pengetahuan dan keterampilan mengenai kesehatan remaja. Melalui pelatihan ini, sekolah berharap dapat menciptakan kader-kader muda yang mampu menjadi agen edukasi kesehatan di lingkungan sekolah.', 'Rabu', '07.30-10.00', '2025-11-12', 'aktif', 0, '2025-11-14 06:26:07', '2025-11-14 06:26:07'),
(10, 'Kegiatan Pencegahan HIV/AIDS', 'Agenda Pencegahan HIV/AIDS berfokus pada pemberian edukasi mengenai cara penularan, pencegahan, dan fakta ilmiah tentang HIV/AIDS. Kegiatan ini membantu siswa memahami pentingnya perilaku hidup sehat, menjaga diri, serta menghindari tindakan berisiko. Penyuluhan dilakukan secara interaktif agar siswa dapat bertanya dan berdiskusi dengan nyaman.', 'Senin', '08.00-11.00', '2025-11-10', 'aktif', 2, '2025-11-14 06:31:17', '2025-11-14 06:31:17'),
(11, 'Simulasi TKA (Tes Kemampuan Akademik)', 'Kegiatan Simulasi TKA (Tes Kemampuan Akademik) dilaksanakan untuk melatih siswa dalam memahami bentuk soal, tingkat kesulitan, serta strategi pengerjaan TKA. Melalui simulasi ini, siswa diharapkan lebih siap menghadapi ujian sebenarnya dengan percaya diri dan kemampuan yang optimal.', 'Senin', '07.30-10.00', '2025-10-27', 'aktif', 3, '2025-11-14 06:41:12', '2025-11-14 06:41:12'),
(12, 'Workshop Rutin SMKN 4 Bogor', 'Kegiatan Workshop Rutin SMKN 4 Bogor dilaksanakan sebagai upaya meningkatkan kompetensi dan keterampilan peserta didik sesuai dengan bidang keahlian masing-masing. Melalui workshop ini, siswa mendapatkan pengalaman praktik yang mendukung kesiapan mereka dalam dunia kerja maupun pendidikan lanjutan.', 'Senin', '07.30-09.00', '2025-11-10', 'aktif', 4, '2025-11-14 06:44:26', '2025-11-14 06:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-captcha_0fbe6ed0d91f1c9b2f4d9c954047961d', 'a:2:{s:6:\"answer\";i:13;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:32:26.670830\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012246),
('laravel-cache-captcha_10e87b0ed3307a18dc37e9206430579d', 'a:2:{s:6:\"answer\";i:13;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:52.754855\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012032),
('laravel-cache-captcha_10f16d5fa1246750e18036799d49f41b', 'a:2:{s:6:\"answer\";i:17;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:46.234760\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012026),
('laravel-cache-captcha_20032a3daa024d9445689044dfe2dec7', 'a:2:{s:6:\"answer\";i:12;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:47.581833\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012027),
('laravel-cache-captcha_28ce35b5e43d9a597168f0a8e07c029f', 'a:2:{s:6:\"answer\";i:11;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:51.581445\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012031),
('laravel-cache-captcha_2c85acfc57b3c82e9f2132bc365c51b2', 'a:2:{s:6:\"answer\";i:10;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:51.898387\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012031),
('laravel-cache-captcha_30b67abb592123962bf3ec99ee6110f9', 'a:2:{s:6:\"answer\";i:10;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:43:13.885828\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012893),
('laravel-cache-captcha_33b5317df8bfe9f9303f5968e1482d5d', 'a:2:{s:6:\"answer\";i:8;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:45.751284\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012025),
('laravel-cache-captcha_375d2945cd2f5dd806cb447b44428fe2', 'a:2:{s:6:\"answer\";i:16;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:53.969111\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012033),
('laravel-cache-captcha_377d897ff9142ab9a5fe9458d90ad40d', 'a:2:{s:6:\"answer\";i:11;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:53.569181\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012033),
('laravel-cache-captcha_3d1f1b32b56f8326dac8912ff066c26a', 'a:2:{s:6:\"answer\";i:12;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:48.815047\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012028),
('laravel-cache-captcha_416cbb853f2d373df5c8d0e09daa4b72', 'a:2:{s:6:\"answer\";i:11;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:40.752002\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012020),
('laravel-cache-captcha_42830cdacb6591f6775027f51bd76412', 'a:2:{s:6:\"answer\";i:11;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:58.416835\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012038),
('laravel-cache-captcha_4dffc04567ad410126c8bd86c55d6d97', 'a:2:{s:6:\"answer\";i:13;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-14 10:27:34.646623\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763116354),
('laravel-cache-captcha_4f37633d19814e5d94c64388eab482bb', 'a:2:{s:6:\"answer\";i:14;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:46.724813\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012026),
('laravel-cache-captcha_50c420e245ec3d31297c832b2814ea64', 'a:2:{s:6:\"answer\";i:11;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:31:01.852654\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012161),
('laravel-cache-captcha_51aaf16e7f91d8257650c3ea44468768', 'a:2:{s:6:\"answer\";i:13;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:32:31.837342\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012251),
('laravel-cache-captcha_5208d4c1c2e5d7c3f0f63953f915e58a', 'a:2:{s:6:\"answer\";i:11;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:58.782227\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012038),
('laravel-cache-captcha_5e49bb9483e82a8c8728ad3eedd12967', 'a:2:{s:6:\"answer\";i:11;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-15 00:13:38.982595\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763165918),
('laravel-cache-captcha_63713e93952665ac8baaa52237caed7b', 'a:2:{s:6:\"answer\";i:11;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:54.364741\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012034),
('laravel-cache-captcha_64caeb9854fac20b516291aa23d0d49c', 'a:2:{s:6:\"answer\";i:19;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:50.831157\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012030),
('laravel-cache-captcha_75081301358357633e4cb34e13f264e1', 'a:2:{s:6:\"answer\";i:9;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:47.959183\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012027),
('laravel-cache-captcha_7eabce231025016a8efc1fd74efeb545', 'a:2:{s:6:\"answer\";i:12;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:39.864949\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012019),
('laravel-cache-captcha_82bca3071ca9b41c2676d694def7dea5', 'a:2:{s:6:\"answer\";i:10;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:49:53.967093\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763013293),
('laravel-cache-captcha_833427b0c08f7b43a95a353323c0bcb5', 'a:2:{s:6:\"answer\";i:9;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:58.061305\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012038),
('laravel-cache-captcha_8b756fd430af5602c8e22e61eb4bea18', 'a:2:{s:6:\"answer\";i:4;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:41.481682\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012021),
('laravel-cache-captcha_93c9dc8fc247db12dc5c83f89447eba6', 'a:2:{s:6:\"answer\";i:17;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:59.496393\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012039),
('laravel-cache-captcha_94d4e82bfccabcacd2e2f6c47d95a7df', 'a:2:{s:6:\"answer\";i:8;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:31:02.680803\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012162),
('laravel-cache-captcha_965dd26da70b16fc8c8d2e063465f12b', 'a:2:{s:6:\"answer\";i:16;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:48.365927\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012028),
('laravel-cache-captcha_98ccb45b86f49c5c316f2adab9444f7e', 'a:2:{s:6:\"answer\";i:11;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:57.125425\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012037),
('laravel-cache-captcha_99a7322c1de29c94f2b23998fae6bb35', 'a:2:{s:6:\"answer\";i:9;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:39.234530\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012019),
('laravel-cache-captcha_9c129a9259216e6c9263b27ef8ce2210', 'a:2:{s:6:\"answer\";i:15;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:33:15.773972\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012295),
('laravel-cache-captcha_a20288434579e8fff5950d79649d6078', 'a:2:{s:6:\"answer\";i:10;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:54.752905\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012034),
('laravel-cache-captcha_a68ba2b9cc0882721078ff2e289c4e05', 'a:2:{s:6:\"answer\";i:9;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:33:10.622662\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012290),
('laravel-cache-captcha_a74943aa9c18d665e9d12e4f61570cf3', 'a:2:{s:6:\"answer\";i:10;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:57.713895\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012037),
('laravel-cache-captcha_aafbd37afb30fcb39812cd9f349a9252', 'a:2:{s:6:\"answer\";i:12;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:49.229051\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012029),
('laravel-cache-captcha_ad0a98b9e5037a73e5cdbce1546d96cf', 'a:2:{s:6:\"answer\";i:3;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:59.120386\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012039),
('laravel-cache-captcha_b0726d68ae3697ced2855287ff85e72a', 'a:2:{s:6:\"answer\";i:12;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:42.296267\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012022),
('laravel-cache-captcha_b0e4a3183e426b6c3321e03d1796df40', 'a:2:{s:6:\"answer\";i:11;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:43.695114\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012023),
('laravel-cache-captcha_b28abbf2a69f1f027444ca1fe8f73301', 'a:2:{s:6:\"answer\";i:11;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:49.602406\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012029),
('laravel-cache-captcha_c2348039ae5447ad090127033e3c4bec', 'a:2:{s:6:\"answer\";i:9;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-15 00:53:14.030159\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763168294),
('laravel-cache-captcha_c5b4c990630f0696d49cb0abe60d6c01', 'a:2:{s:6:\"answer\";i:10;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:44.198945\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012024),
('laravel-cache-captcha_cf598f58f9416728ddbeb4acbb6e10ef', 'a:2:{s:6:\"answer\";i:10;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:34:49.639175\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012389),
('laravel-cache-captcha_d250501c0a8da1da025483312c8a3c26', 'a:2:{s:6:\"answer\";i:17;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:50.449342\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012030),
('laravel-cache-captcha_d3b6784232b01d9c0adcf202a46ffb6c', 'a:2:{s:6:\"answer\";i:7;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:42.953523\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012022),
('laravel-cache-captcha_d4d9098d4e7f6f8f84b2d242703d95db', 'a:2:{s:6:\"answer\";i:12;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:56.424828\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012036),
('laravel-cache-captcha_d628a45251d2f9c0f0a3f3fadee61fdc', 'a:2:{s:6:\"answer\";i:9;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:51.192686\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012031),
('laravel-cache-captcha_dc367195e37f49442cc9d7c2bf7a13c0', 'a:2:{s:6:\"answer\";i:9;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:44.697927\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012024),
('laravel-cache-captcha_e0f3c0d770ffeb61a6a10baafb7b8ef8', 'a:2:{s:6:\"answer\";i:12;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:29:19.369056\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012059),
('laravel-cache-captcha_e8ccae7691bf72b7f9ffad006f687f31', 'a:2:{s:6:\"answer\";i:6;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-15 00:53:23.184685\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763168303),
('laravel-cache-captcha_ea22ba6b328e0e17202a25859b591ca9', 'a:2:{s:6:\"answer\";i:7;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:53.174258\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012033),
('laravel-cache-captcha_ef69f0e64edf2759574dfc7ac4fa20f8', 'a:2:{s:6:\"answer\";i:10;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:47.117696\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012027),
('laravel-cache-captcha_f59fdc3588bdd2b502ac3d4e23a96cfa', 'a:2:{s:6:\"answer\";i:12;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:49.932777\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012029),
('laravel-cache-captcha_f8f1ee38e3a02b69a7bbf4ebd206f186', 'a:2:{s:6:\"answer\";i:17;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:31:08.615184\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012168),
('laravel-cache-captcha_fb17773e120784483bd456687135f9ae', 'a:2:{s:6:\"answer\";i:13;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:28:45.242543\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763012025),
('laravel-cache-captcha_fca10dd514bbf7274b70ab3e4fc6212e', 'a:2:{s:6:\"answer\";i:10;s:10:\"created_at\";O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2025-11-13 05:21:12.662370\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}}', 1763011572),
('laravel-cache-download_count_127.0.0.1', 'i:1;', 1763150571);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `galery_id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) NOT NULL,
  `likes` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `dislikes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`id`, `galery_id`, `file`, `likes`, `dislikes`, `created_at`, `updated_at`) VALUES
(1, 1, '1762991881_0.jpeg', 0, 1, '2025-11-12 16:58:01', '2025-11-14 18:00:01'),
(2, 2, '1762992310_0.jpeg', 1, 0, '2025-11-12 17:05:10', '2025-11-14 18:00:04'),
(3, 3, '1762992436_0.jpeg', 0, 0, '2025-11-12 17:07:16', '2025-11-14 17:59:23'),
(5, 5, '1762992596_0.jpeg', 0, 0, '2025-11-12 17:09:56', '2025-11-14 17:59:23'),
(6, 6, '1762992685_0.jpeg', 0, 0, '2025-11-12 17:11:25', '2025-11-14 17:59:23'),
(7, 7, '1762992789_0.jpeg', 0, 0, '2025-11-12 17:13:09', '2025-11-14 17:59:23'),
(8, 8, '1762992891_0.jpeg', 0, 0, '2025-11-12 17:14:51', '2025-11-14 17:59:23'),
(9, 9, '1762992942_0.jpeg', 0, 0, '2025-11-12 17:15:42', '2025-11-14 17:59:23'),
(10, 10, '1762993011_0.jpeg', 0, 0, '2025-11-12 17:16:51', '2025-11-14 17:59:23'),
(11, 11, '1762993080_0.jpeg', 0, 0, '2025-11-12 17:18:00', '2025-11-14 17:59:23'),
(12, 12, '1762993209_0.jpeg', 0, 0, '2025-11-12 17:20:09', '2025-11-14 17:59:23'),
(13, 13, '1762993277_0.jpeg', 0, 0, '2025-11-12 17:21:17', '2025-11-14 17:59:23'),
(14, 14, '1762993417_0.jpg', 0, 0, '2025-11-12 17:23:37', '2025-11-14 17:59:23'),
(15, 15, '1762993474_0.jpeg', 0, 0, '2025-11-12 17:24:34', '2025-11-14 17:59:23'),
(16, 16, '1763118598_0.png', 0, 0, '2025-11-14 04:09:58', '2025-11-14 17:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `galery`
--

CREATE TABLE `galery` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galery`
--

INSERT INTO `galery` (`id`, `post_id`, `position`, `status`) VALUES
(1, 1, NULL, 'aktif'),
(2, 2, NULL, 'aktif'),
(3, 3, NULL, 'aktif'),
(5, 5, NULL, 'aktif'),
(6, 6, NULL, 'aktif'),
(7, 7, NULL, 'aktif'),
(8, 8, NULL, 'aktif'),
(9, 9, NULL, 'aktif'),
(10, 10, NULL, 'aktif'),
(11, 11, NULL, 'aktif'),
(12, 12, NULL, 'aktif'),
(13, 13, NULL, 'aktif'),
(14, 14, NULL, 'aktif'),
(15, 15, NULL, 'aktif'),
(16, 16, NULL, 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_like_logs`
--

CREATE TABLE `gallery_like_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `foto_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_like_logs`
--

INSERT INTO `gallery_like_logs` (`id`, `user_id`, `foto_id`, `action`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'dislike', '2025-11-14 18:00:01', '2025-11-14 18:00:01'),
(2, 6, 2, 'like', '2025-11-14 18:00:04', '2025-11-14 18:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `informasi`
--

CREATE TABLE `informasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(255) NOT NULL DEFAULT 'fa-info-circle',
  `date` date NOT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `informasi`
--

INSERT INTO `informasi` (`id`, `title`, `description`, `icon`, `date`, `status`, `order`, `created_at`, `updated_at`) VALUES
(2, 'Pembangunan Masjid Riyadus  Shalihin', 'Infaq pembangunan Masjid Riyadus Shalihin pada 10 November terkumpul dari siswa sebesar:\r\n👥 Siswa: Rp 817.200,-  \r\n👨‍🏫 Guru TP: Rp 300.000,-  \r\n📊 Total infaq s.d. hari itu: Rp 33.514.300,-  \r\n📉 Total pengeluaran: Rp 29.797.000,-  \r\n💼 Saldo akhir: Rp 3.717.300,-', 'fas fa-mosque', '2025-11-10', 'aktif', 1, '2025-11-14 15:57:06', '2025-11-14 15:57:06'),
(3, 'Pembangunan Masjid Riyadus Shalihin', 'Infaq pembangunan Masjid Riyadus Shalihin pada 11 November terkumpul dari siswa sebesar:\r\n👥 Siswa: Rp 796.500,-  \r\n📊 Total infaq s.d. hari itu: Rp 34.310.800,-  \r\n📉 Pengeluaran tetap: Rp 29.797.000,-  \r\n💼 Saldo akhir: Rp 4.513.800,-', 'fas fa-mosque', '2025-11-11', 'aktif', 2, '2025-11-14 15:59:25', '2025-11-14 15:59:25'),
(4, 'Pembangunan Masjid Ruyadus Shalihin', 'Infaq pembangunan Masjid Riyadus Shalihin pada 11 November berasal dari siswa sebesar:\r\n👥 Siswa : Rp 728.500,-  \r\n📊 Total infaq s.d. hari ini: Rp 35.039.300,-  \r\n📉 Pengeluaran tetap: Rp 29.797.000,-  \r\n💼 Saldo akhir: Rp 5.242.300,-', 'fas fa-mosque', '2025-11-12', 'aktif', 3, '2025-11-14 16:01:09', '2025-11-14 16:01:09'),
(5, 'Perekaman E-KTP', 'Kegiatan Perekaman E-KTP dilaksanakan di ruang samsung untuk memfasilitasi siswa dalam proses pembuatan identitas kependudukan sehingga lebih mudah, cepat, dan terdata secara resmi.', 'fas fa-id-card', '2025-11-10', 'aktif', 4, '2025-11-14 16:05:01', '2025-11-14 16:05:01'),
(6, 'TKA (Tes Kemampuan Akademik)', 'Kegiatan TKA (Tes Kemampuan Akademik) dilaksanakan untuk mengukur kemampuan kognitif siswa melalui soal-soal yang menguji penalaran, logika, dan pemahaman dasar. Tes ini dibagi berdasarkan jurusan dan hari, dengan jadwal serta ruangan sebagai berikut:\r\n\r\nHari Senin-Selasa\r\nJurusan: PPLG dan TPFL\r\nRuang: Lab 1 PPLG (untuk PPLG), Lab 1 TJKT (untuk TPFL)\r\nSesi:\r\nPagi: 07.30 – 10.00\r\nSiang: 10.30 – 13.00\r\nSore: 13.30 – 16.00', 'fas fa-brain', '2025-11-03', 'aktif', 5, '2025-11-14 16:17:53', '2025-11-14 16:17:53'),
(7, 'TKA (Tes Kemampuan Akademik)', 'Kegiatan TKA (Tes Kemampuan Akademik) dilaksanakan untuk mengukur kemampuan kognitif siswa melalui soal-soal yang menguji penalaran, logika, dan pemahaman dasar. Tes ini dibagi berdasarkan jurusan dan hari, dengan jadwal serta ruangan sebagai berikut:\r\nHari Rabu-Kamis\r\nJurusan: TJKT dan TO\r\nRuang: Lab 1 PPLG (untuk TJKT), Lab TJKT TO (untuk TO)\r\nSesi:\r\nPagi: 07.30 – 10.00\r\nSiang: 10.30 – 13.00\r\nSore: 13.30 – 16.00', 'fas fa-brain', '2025-11-05', 'aktif', 6, '2025-11-14 16:19:40', '2025-11-14 16:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `judul`, `created_at`, `updated_at`) VALUES
(1, 'Informasi Terkini', '2025-11-12 16:35:50', '2025-11-12 16:35:50'),
(2, 'Galery Sekolah', '2025-11-12 16:35:50', '2025-11-12 16:35:50'),
(3, 'Agenda Sekolah', '2025-11-12 16:35:50', '2025-11-12 16:35:50'),
(4, 'Event Sekolah', '2025-11-12 17:18:38', '2025-11-12 17:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_12_055852_create_kategori_table', 1),
(5, '2025_08_12_055919_create_petugas_table', 1),
(6, '2025_08_12_055928_create_posts_table', 1),
(7, '2025_08_12_055946_create_galery_table', 1),
(8, '2025_08_12_055954_create_foto_table', 1),
(9, '2025_08_12_060536_create_profile_table', 1),
(10, '2025_09_07_193704_create_pages_table', 1),
(11, '2025_11_12_042152_create_site_settings_table', 1),
(12, '2025_11_12_160424_add_remember_token_to_petugas_table', 1),
(13, '2025_11_12_165258_add_profile_image_to_site_settings', 1),
(14, '2025_11_12_171150_add_footer_logo_to_site_settings', 1),
(15, '2025_11_13_000001_create_informasi_table', 1),
(16, '2025_11_13_000002_create_agenda_table', 1),
(17, '2025_11_13_000003_add_likes_to_foto_table', 2),
(18, '2025_11_13_000004_create_user_likes_table', 3),
(19, '2025_11_13_051229_fix_user_likes_table_user_id_type', 4),
(20, '2025_11_14_000000_add_dislikes_to_foto_table', 5),
(21, '2025_11_14_000001_create_user_dislikes_table', 5),
(22, '2025_11_15_000005_create_gallery_like_logs_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `excerpt` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'published',
  `template` varchar(255) NOT NULL DEFAULT 'default',
  `meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta_data`)),
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'adminK4@gmail.com', '$2y$12$qO4.FK8IUlfYXHEONGv5rutfjBb0loqZk6yzs2qisNtX42/m7mTqq', 'xvNauBOGI8UcyCIXLQtmoggR0JW12ItmVaMheHcVZr7cF9bnoJGo40jApMGT', '2025-11-12 16:35:51', '2025-11-14 10:18:20'),
(2, 'staf', 'sitiyuyur@gmail.com', '$2y$12$jMGtO7vpk8x3KdZjOZBPcelrJzjk5GliEeWiqLu4ddThAsQDAP13K', 'ixTqXOCnMuLjnpSFHgyqkysZMPdmNkTrz8fByysjxIjG9WiAn8caspStBjWP', '2025-11-12 16:35:51', '2025-11-14 11:20:08'),
(5, 'staff', 'sipitsipit@gmail.com', '$2y$12$6o4bX/vyR.Ca6oB8rjTo4.0D0kfzQ9ImJHViue.8DKhyhqvk/K//a', 'iEUtw8fX34JoPyge5y7VgqeEzpBTNMd2BiRHxIAOghd0fxKXUtJ7k9zmqu5L', '2025-11-14 11:17:11', '2025-11-14 11:17:11');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `petugas_id` bigint(20) UNSIGNED NOT NULL,
  `isi` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `judul`, `kategori_id`, `petugas_id`, `isi`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Perlombaan Teknik Pengelasan', 3, 2, 'Proses pengelasan dalam ajang lomba teknik pengelasan dan fabrikasi logam — momen di mana keahlian dan presisi diuji dalam setiap sambungan logam.', 'published', '2025-11-12 16:58:01', '2025-11-12 17:18:22'),
(2, 'Perlombaan Teknik Pengelasan', 3, 2, 'Seorang siswi peserta lomba sedang fokus mengerjakan proses pengelasan pada proyek fabrikasi logam. Ketelitian, ketekunan, dan keterampilan menjadi kunci utama dalam menghasilkan sambungan logam yang sempurna.', 'published', '2025-11-12 17:05:10', '2025-11-12 17:18:11'),
(3, 'Serah Terima Jabatan OSIS 2024/2025', 2, 2, 'Dari yang lama untuk yang baru, dari pengalaman menuju harapan.\r\nSerah terima jabatan OSIS 2024/2025 — satu semangat, satu tujuan.', 'published', '2025-11-12 17:07:16', '2025-11-12 17:07:16'),
(5, 'Serah Terima Jabatan OSIS 2024/2025', 2, 2, 'Setiap kepemimpinan meninggalkan jejak, dan setiap generasi melanjutkan langkah.\r\nSelamat bertugas untuk pengurus OSIS 2024/2025. Teruskan semangat dan perjuangan dengan hati yang tulus.', 'published', '2025-11-12 17:09:56', '2025-11-12 17:09:56'),
(6, 'Serah Terima Jabatan OSIS 2024/2025', 2, 2, 'Tongkat estafet kepemimpinan berpindah tangan bukan akhir, tapi awal dari babak baru perjalanan OSIS menuju masa depan yang lebih gemilang.', 'published', '2025-11-12 17:11:25', '2025-11-12 17:11:25'),
(7, 'Serah Terima Jabatan OSIS 2024/2025', 2, 2, 'Foto bersama setelah pelaksanaan serah terima jabatan OSIS masa bakti 2024/2025-2025/2026. Momen kebersamaan yang menandai berakhirnya satu periode kepemimpinan dan dimulainya perjalanan baru penuh semangat dan tanggung jawab.', 'published', '2025-11-12 17:13:09', '2025-11-12 17:13:09'),
(8, 'Pembangunan Gedung Baru', 2, 2, 'Membangun bukan hanya tentang tembok, tapi tentang masa depan.\r\nSebuah langkah menuju sekolah yang lebih baik.', 'published', '2025-11-12 17:14:51', '2025-11-12 17:14:51'),
(9, 'Pembangunan Gedung Baru', 2, 2, 'Di bawah teriknya matahari, mereka menanam harapan di setiap bata yang tersusun.\r\nGedung ini bukan sekadar bangunan, tapi tempat lahirnya mimpi dan masa depan.', 'published', '2025-11-12 17:15:42', '2025-11-12 17:15:42'),
(10, 'Pembangunan Gedung Baru', 2, 2, 'Dengan keringat dan ketekunan, mereka membangun ruang untuk generasi yang akan datang.\r\nSetiap adukan semen, setiap tiang berdiri adalah wujud nyata dari dedikasi dan harapan.', 'published', '2025-11-12 17:16:51', '2025-11-12 17:16:51'),
(11, 'Perlombaan 17 Agustus', 2, 2, 'Tawa, semangat, dan warna merah putih memenuhi halaman sekolah.\r\nBukan sekadar lomba, tapi wujud cinta terhadap tanah air dalam keceriaan yang sederhana.', 'published', '2025-11-12 17:18:00', '2025-11-12 17:18:00'),
(12, 'Perlombaan 17 Agustus', 2, 2, 'Di setiap sorak dan langkah, ada semangat juang yang tak pernah padam.\r\nLomba 17 Agustus mengingatkan kita bahwa merdeka bukan hanya tentang masa lalu, tapi juga semangat untuk terus maju.', 'published', '2025-11-12 17:20:09', '2025-11-12 17:20:09'),
(13, 'Perlombaan 17 Agustus', 2, 2, 'Kegiatan lomba dalam rangka memperingati Hari Kemerdekaan Republik Indonesia ke-80. Melalui semangat kebersamaan dan sportivitas, siswa-siswi berpartisipasi dengan antusias dalam berbagai perlombaan untuk menumbuhkan rasa nasionalisme dan persatuan.', 'published', '2025-11-12 17:21:17', '2025-11-12 17:21:17'),
(14, 'Gladi Bersih Trans4crab', 4, 2, 'Setiap langkah, setiap gerak, dan setiap detail dipersiapkan dengan penuh hati.\r\nGladi bersih TRANS4CRAB tempat di mana kerja keras bertemu dengan harapan.', 'published', '2025-11-12 17:23:37', '2025-11-12 17:23:37'),
(15, 'Penampialn siswa/i saat Trans4crab', 4, 2, 'Penampilan peserta dalam acara TRANS4CRAB berlangsung meriah dan penuh antusiasme. Setiap peserta menunjukkan kreativitas, kepercayaan diri, serta kerja sama tim yang luar biasa dalam menampilkan karya terbaiknya.', 'published', '2025-11-12 17:24:34', '2025-11-12 17:24:34'),
(16, 'Pengibaran Sang Saka Merah Putih', 2, 2, 'Tiga serangkai Paskibra berdiri tegak, memanggul kehormatan di pundak. Dalam balutan seragam putih yang bersih, mereka fokus menjalankan tugas mulia, mengibarkan Sang Saka Merah Putih. Setiap gerakan adalah janji, setiap tarikan tali adalah penghormatan tertinggi kepada bangsa.', 'published', '2025-11-14 04:09:58', '2025-11-14 04:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Un8tR48IG75WBbW0bomaKWsI3jqo87jcal23QtH7', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiazg3a0NPdDJ1UW9VaDJrZFZwM3FhemdWUVdGWElvUWhZektjNzJPciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoyMDoibG9naW5fY2FwdGNoYV9hbnN3ZXIiO2k6MTE7czoyMzoicmVnaXN0ZXJfY2FwdGNoYV9hbnN3ZXIiO2k6MTE7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjY7fQ==', 1763176925);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `value` text DEFAULT NULL,
  `group` varchar(255) NOT NULL DEFAULT 'general',
  `description` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `key`, `label`, `type`, `value`, `group`, `description`, `order`, `created_at`, `updated_at`) VALUES
(1, 'home_hero_title', 'Judul Utama Beranda', 'text', 'Selamat Datang di SMKN 4 BOGOR', 'home', 'Judul utama yang ditampilkan di bagian hero/header halaman beranda', 1, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(2, 'home_hero_subtitle', 'Subjudul Beranda', 'textarea', 'Sekolah Menengah Kejuruan Negeri 4 Bogor siap mencetak generasi yang berkarakter, berkompeten, dan berdaya saing global.', 'home', 'Teks subjudul di bawah judul utama', 2, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(3, 'home_hero_image', 'Gambar Hero Beranda', 'image', '', 'home', 'Gambar latar belakang untuk bagian hero/header', 3, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(4, 'profile_title', 'Judul Halaman Profil', 'text', 'Profil SMKN 4 BOGOR', 'profile', 'Judul halaman profil', 1, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(5, 'profile_content', 'Konten Profil', 'editor', '<p>SMK Negeri 4 Bogor adalah salah satu Sekolah Menengah Kejuruan Negeri yang terletak di Kota Bogor, Jawa Barat. Sekolah ini berdiri sejak tahun 1985 dan telah meluluskan ribuan siswa yang siap bekerja di dunia industri.</p><p>Dengan fasilitas yang lengkap dan tenaga pengajar yang profesional, SMKN 4 Bogor siap mencetak lulusan yang kompeten di bidangnya masing-masing.</p>', 'profile', 'Konten lengkap halaman profil', 2, '2025-11-12 16:35:54', '2025-11-14 07:31:32'),
(6, 'profile_image', 'Gambar Profil', 'image', '', 'profile', 'Gambar untuk halaman profil', 3, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(7, 'vision_title', 'Judul Visi', 'text', 'Visi', 'vision_mission', 'Judul bagian visi', 1, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(8, 'vision_content', 'Isi Visi', 'textarea', 'Menjadi lembaga pendidikan kejuruan yang unggul, berkarakter, dan berdaya saing global pada tahun 2025.', 'vision_mission', 'Teks visi sekolah', 2, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(9, 'mission_title', 'Judul Misi', 'text', 'Misi', 'vision_mission', 'Judul bagian misi', 3, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(10, 'mission_content', 'Isi Misi', 'editor', '<ol><li>Menyelenggarakan pendidikan dan pelatihan yang berkualitas sesuai dengan standar nasional dan internasional</li><li>Mengembangkan kurikulum berbasis kompetensi yang sesuai dengan kebutuhan dunia kerja</li><li>Meningkatkan kualitas tenaga pendidik dan kependidikan secara berkelanjutan</li><li>Menyediakan sarana dan prasarana pendidikan yang memadai dan relevan</li><li>Menjalin kerjasama dengan dunia usaha dan industri dalam rangka peningkatan mutu lulusan</li></ol>', 'vision_mission', 'Teks misi sekolah dalam format list', 4, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(11, 'contact_title', 'Judul Halaman Kontak', 'text', 'Hubungi Kami', 'contact', 'Judul halaman kontak', 1, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(12, 'contact_address', 'Alamat', 'textarea', 'Jl. Raya Tajur, Kp. Buntar RT.02/RW.08, Kel. Muara sari, Kec. Bogor Selatan, RT.03/RW.08, Muarasari, Kec. Bogor Sel., Kota Bogor, Jawa Barat 16137', 'contact', 'Alamat lengkap sekolah', 2, '2025-11-12 16:35:54', '2025-11-14 08:55:55'),
(13, 'contact_phone', 'Telepon', 'text', '(0251) 7547381', 'contact', 'Nomor telepon sekolah', 3, '2025-11-12 16:35:54', '2025-11-14 08:55:55'),
(14, 'contact_email', 'Email', 'text', 'info@smkn4bogor.sch.id', 'contact', 'Alamat email resmi sekolah', 4, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(15, 'contact_website', 'Website', 'text', 'smkn4bogor.sch.id', 'contact', 'Alamat website resmi sekolah', 5, '2025-11-12 16:35:54', '2025-11-14 08:55:55'),
(16, 'contact_map_embed', 'Embed Map', 'textarea', '<iframe src=\"https://maps.app.goo.gl/vGHtoRdcgShgX2ZU9\" width=\"100%\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'contact', 'Kode embed Google Maps atau URL Google Maps. Untuk mendapatkan embed code: 1) Buka Google Maps 2) Cari lokasi 3) Klik \"Share\" 4) Pilih tab \"Embed a map\" 5) Salin kode iframe', 6, '2025-11-12 16:35:54', '2025-11-14 08:55:55'),
(17, 'info_title', 'Judul Halaman Informasi', 'text', 'Informasi Terbaru', 'information', 'Judul halaman informasi', 1, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(18, 'info_description', 'Deskripsi Halaman Informasi', 'textarea', 'Dapatkan informasi terbaru seputar kegiatan, pengumuman, dan berita dari SMKN 4 Bogor.', 'information', 'Deskripsi singkat halaman informasi', 2, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(19, 'agenda_title', 'Judul Halaman Agenda', 'text', 'Agenda Kegiatan', 'agenda', 'Judul halaman agenda', 1, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(20, 'agenda_description', 'Deskripsi Halaman Agenda', 'textarea', 'Jadwal dan agenda kegiatan terbaru SMKN 4 Bogor. Pantau terus jadwal kegiatan sekolah kami.', 'agenda', 'Deskripsi singkat halaman agenda', 2, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(21, 'footer_about', 'Tentang Kami', 'editor', '<p>SMKN 4 Bogor adalah lembaga pendidikan kejuruan yang berkomitmen untuk menghasilkan lulusan yang kompeten dan berkarakter.</p>', 'footer', 'Teks tentang sekolah di footer', 1, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(22, 'footer_copyright', 'Teks Hak Cipta', 'text', '© 2025 SMKN 4 Bogor. All Rights Reserved.', 'footer', 'Teks hak cipta di footer', 2, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(23, 'social_facebook', 'Facebook', 'text', 'https://web.facebook.com/search/top?q=smk%20negeri%204%20bogor%20-%20nebrazka', 'footer', 'Link ke akun Facebook', 3, '2025-11-12 16:35:54', '2025-11-14 11:31:05'),
(24, 'social_twitter', 'Twitter', 'text', 'https://twitter.com/smkn4bogor', 'footer', 'Link ke akun Twitter', 4, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(25, 'social_instagram', 'Instagram', 'text', 'https://instagram.com/smkn4bogor', 'footer', 'Link ke akun Instagram', 5, '2025-11-12 16:35:54', '2025-11-14 07:31:32'),
(26, 'social_youtube', 'YouTube', 'text', 'https://youtube.com/@smknegeri4bogor905?si=fTyUWddpobkumWTr', 'footer', 'Link ke channel YouTube', 6, '2025-11-12 16:35:54', '2025-11-14 11:31:05'),
(27, 'expertise_title', 'Judul Program Keahlian', 'text', 'Program Keahlian', 'information', 'Judul bagian program keahlian', 3, '2025-11-12 20:35:13', '2025-11-12 20:35:13'),
(28, 'expertise_1_name', 'Keahlian 1 - Nama', 'text', 'Rekayasa Perangkat Lunak', 'information', 'Nama program keahlian pertama', 4, '2025-11-12 20:35:13', '2025-11-14 07:31:32'),
(29, 'expertise_1_description', 'Keahlian 1 - Deskripsi', 'textarea', 'Mempelajari pembuatan aplikasi dan gim mulai dari perancangan hingga pengembangan.', 'information', 'Deskripsi program keahlian pertama', 5, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(30, 'expertise_2_name', 'Keahlian 2 - Nama', 'text', 'Teknik Jaringan Komputer dan Telekomunikasi', 'information', 'Nama program keahlian kedua', 6, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(31, 'expertise_2_description', 'Keahlian 2 - Deskripsi', 'textarea', 'Fokus pada instalasi, konfigurasi, dan pemeliharaan jaringan komputer serta sistem telekomunikasi.', 'information', 'Deskripsi program keahlian kedua', 7, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(32, 'expertise_3_name', 'Keahlian 3 - Nama', 'text', 'Teknik Pengelasan dan Fabrikasi Logam', 'information', 'Nama program keahlian ketiga', 8, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(33, 'expertise_3_description', 'Keahlian 3 - Deskripsi', 'textarea', 'Mempelajari teknik pengelasan dan pembuatan konstruksi logam sesuai standar industri.', 'information', 'Deskripsi program keahlian ketiga', 9, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(34, 'expertise_4_name', 'Keahlian 4 - Nama', 'text', 'Teknik Otomotif', 'information', 'Nama program keahlian keempat', 10, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(35, 'expertise_4_description', 'Keahlian 4 - Deskripsi', 'textarea', 'Mendalami perawatan, perbaikan, dan sistem kerja kendaraan bermotor.', 'information', 'Deskripsi program keahlian keempat', 11, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(36, 'facilities_title', 'Judul Fasilitas Sekolah', 'text', 'Fasilitas Sekolah', 'information', 'Judul bagian fasilitas sekolah', 12, '2025-11-12 20:35:13', '2025-11-12 20:35:13'),
(37, 'facility_1_title', 'Fasilitas 1 - Judul', 'text', 'Laboratorium Komputer PPLG', 'information', 'Judul fasilitas pertama', 13, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(38, 'facility_1_icon', 'Fasilitas 1 - Ikon', 'text', 'fas fa-laptop', 'information', 'Ikon Font Awesome untuk fasilitas pertama', 14, '2025-11-12 20:35:13', '2025-11-14 07:31:32'),
(39, 'facility_1_description', 'Fasilitas 1 - Deskripsi', 'textarea', 'Fasilitas praktik untuk kegiatan pemrograman, pengembangan aplikasi, dan pembuatan gim.', 'information', 'Deskripsi fasilitas pertama', 15, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(40, 'facility_2_title', 'Fasilitas 2 - Judul', 'text', 'Laboratorium TJKT', 'information', 'Judul fasilitas kedua', 16, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(41, 'facility_2_icon', 'Fasilitas 2 - Ikon', 'text', 'fas fa-network-wired', 'information', 'Ikon Font Awesome untuk fasilitas kedua', 17, '2025-11-12 20:35:13', '2025-11-14 08:35:18'),
(42, 'facility_2_description', 'Fasilitas 2 - Deskripsi', 'textarea', 'Laboratorium yang digunakan untuk praktik jaringan komputer, konfigurasi perangkat, dan sistem telekomunikasi.', 'information', 'Deskripsi fasilitas kedua', 18, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(43, 'facility_3_title', 'Fasilitas 3 - Judul', 'text', 'Bengkel TPFL', 'information', 'Judul fasilitas ketiga', 19, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(44, 'facility_3_icon', 'Fasilitas 3 - Ikon', 'text', 'fas fa-tools', 'information', 'Ikon Font Awesome untuk fasilitas ketiga', 20, '2025-11-12 20:35:13', '2025-11-14 08:35:18'),
(45, 'facility_3_description', 'Fasilitas 3 - Deskripsi', 'textarea', 'Ruang praktik pengelasan dan fabrikasi logam yang dilengkapi peralatan kerja standar industri.', 'information', 'Deskripsi fasilitas ketiga', 21, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(46, 'facility_4_title', 'Fasilitas 4 - Judul', 'text', 'Bengkel TO', 'information', 'Judul fasilitas keempat', 22, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(47, 'facility_4_icon', 'Fasilitas 4 - Ikon', 'text', 'fas fa-car', 'information', 'Ikon Font Awesome untuk fasilitas keempat', 23, '2025-11-12 20:35:13', '2025-11-14 08:35:18'),
(48, 'facility_4_description', 'Fasilitas 4 - Deskripsi', 'textarea', 'Bengkel otomotif untuk praktik perawatan, perbaikan, dan pemeriksaan sistem kendaraan bermotor.', 'information', 'Deskripsi fasilitas keempat', 24, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(49, 'facility_5_title', 'Fasilitas 5 - Judul', 'text', 'Kantin Sekolah', 'information', 'Judul fasilitas kelima', 25, '2025-11-12 20:35:13', '2025-11-12 20:35:13'),
(50, 'facility_5_icon', 'Fasilitas 5 - Ikon', 'text', 'fas fa-utensils', 'information', 'Ikon Font Awesome untuk fasilitas kelima', 26, '2025-11-12 20:35:13', '2025-11-12 20:35:13'),
(51, 'facility_5_description', 'Fasilitas 5 - Deskripsi', 'textarea', 'Area penyedia makanan dan minuman bagi siswa dengan suasana yang bersih dan nyaman.', 'information', 'Deskripsi fasilitas kelima', 27, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(52, 'facility_6_title', 'Fasilitas 6 - Judul', 'text', 'Unit Kesehatan (UKS)', 'information', 'Judul fasilitas keenam', 28, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(53, 'facility_6_icon', 'Fasilitas 6 - Ikon', 'text', 'fas fa-briefcase-medical', 'information', 'Ikon Font Awesome untuk fasilitas keenam', 29, '2025-11-12 20:35:13', '2025-11-14 08:36:25'),
(54, 'facility_6_description', 'Fasilitas 6 - Deskripsi', 'textarea', 'Ruang layanan kesehatan untuk penanganan pertama dan pemantauan kondisi kesehatan siswa di sekolah.', 'information', 'Deskripsi fasilitas keenam', 30, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(55, 'achievements_title', 'Judul Prestasi Sekolah', 'text', 'Prestasi Sekolah', 'information', 'Judul bagian prestasi sekolah', 31, '2025-11-12 20:35:13', '2025-11-12 20:35:13'),
(56, 'achievement_1_title', 'Prestasi 1 - Judul', 'text', 'Juara 2 TECHNOUPDATE X HIMPACT 2025', 'information', 'Judul prestasi pertama', 32, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(57, 'achievement_1_icon', 'Prestasi 1 - Ikon', 'text', 'fas fa-trophy', 'information', 'Ikon Font Awesome untuk prestasi pertama', 33, '2025-11-12 20:35:13', '2025-11-12 20:35:13'),
(58, 'achievement_1_description', 'Prestasi 1 - Deskripsi', 'textarea', 'Siswa SMKN 4 Bogor berhasil meraih Juara 2 dalam ajang TECHNOUPDATE X HIMPACT 2025, sebuah kompetisi inovasi dan teknologi yang menguji kreativitas, kemampuan analisis, serta keterampilan problem solving para peserta. Prestasi ini menjadi bukti kemampuan siswa dalam bersaing dan berinovasi di bidang teknologi.', 'information', 'Deskripsi prestasi pertama', 34, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(59, 'achievement_1_date', 'Prestasi 1 - Tanggal', 'text', '16 Oktober 2025', 'information', 'Tanggal prestasi pertama', 35, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(60, 'achievement_2_title', 'Prestasi 2 - Judul', 'text', 'Juara 3 Tim Voli Putra se-Bogor Raya', 'information', 'Judul prestasi kedua', 36, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(61, 'achievement_2_icon', 'Prestasi 2 - Ikon', 'text', 'fas fa-trophy', 'information', 'Ikon Font Awesome untuk prestasi kedua', 37, '2025-11-12 20:35:13', '2025-11-14 08:30:17'),
(62, 'achievement_2_description', 'Prestasi 2 - Deskripsi', 'textarea', 'Tim Voli Putra SMKN 4 Bogor berhasil meraih Juara 3 tingkat se-Bogor Raya, menunjukkan kekompakan, kerja keras, dan sportivitas tinggi dalam setiap pertandingan.', 'information', 'Deskripsi prestasi kedua', 38, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(63, 'achievement_2_date', 'Prestasi 2 - Tanggal', 'text', '27 Oktober 2023', 'information', 'Tanggal prestasi kedua', 39, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(64, 'achievement_3_title', 'Prestasi 3 - Judul', 'text', 'Juara 3 Bogor Inovation Award 2025', 'information', 'Judul prestasi ketiga', 40, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(65, 'achievement_3_icon', 'Prestasi 3 - Ikon', 'text', 'fas fa-award', 'information', 'Ikon Font Awesome untuk prestasi ketiga', 41, '2025-11-12 20:35:13', '2025-11-12 20:35:13'),
(66, 'achievement_3_description', 'Prestasi 3 - Deskripsi', 'textarea', 'SMKN 4 Bogor meraih penghargaan pada Bogor Innovation Award 2025 sebagai bentuk apresiasi atas kreativitas dan inovasi yang dihasilkan dalam pengembangan solusi berbasis teknologi dan kebermanfaatan bagi masyarakat.', 'information', 'Deskripsi prestasi ketiga', 42, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(67, 'achievement_3_date', 'Prestasi 3 - Tanggal', 'text', '29 September 2025', 'information', 'Tanggal prestasi ketiga', 43, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(68, 'achievement_4_title', 'Prestasi 4 - Judul', 'text', 'Juara 1 The Ace 2025 UI/UX', 'information', 'Judul prestasi keempat', 44, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(69, 'achievement_4_icon', 'Prestasi 4 - Ikon', 'text', 'fas fa-certificate', 'information', 'Ikon Font Awesome untuk prestasi keempat', 45, '2025-11-12 20:35:13', '2025-11-12 20:35:13'),
(70, 'achievement_4_description', 'Prestasi 4 - Deskripsi', 'textarea', 'Siswa SMKN 4 Bogor berhasil meraih Juara 1 The Ace 2025 kategori UI/UX, melalui rancangan antarmuka yang inovatif, fungsional, dan berfokus pada pengalaman pengguna, membuktikan kompetensi unggul dalam bidang desain digital.', 'information', 'Deskripsi prestasi keempat', 46, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(71, 'achievement_4_date', 'Prestasi 4 - Tanggal', 'text', '29 September 2025', 'information', 'Tanggal prestasi keempat', 47, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(72, 'achievement_5_title', 'Prestasi 5 - Judul', 'text', 'Juara 2 Tim Pencak Silat di Kejuaran Pekan Olahraga Pelajar Daerah (POPDA Jabar)', 'information', 'Judul prestasi kelima', 48, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(73, 'achievement_5_icon', 'Prestasi 5 - Ikon', 'text', 'fas fa-medal', 'information', 'Ikon Font Awesome untuk prestasi kelima', 49, '2025-11-12 20:35:13', '2025-11-14 08:24:10'),
(74, 'achievement_5_description', 'Prestasi 5 - Deskripsi', 'textarea', 'Siswa SMKN 4 Bogor meraih Juara 2 Pencak Silat pada ajang Pekan Olahraga Pelajar Daerah (POPDA) Jawa Barat, menunjukkan kemampuan, ketekunan, dan sportivitas tinggi dalam seni bela diri tradisional.', 'information', 'Deskripsi prestasi kelima', 50, '2025-11-12 20:35:14', '2025-11-14 08:24:10'),
(75, 'achievement_5_date', 'Prestasi 5 - Tanggal', 'text', '28 September 2025', 'information', 'Tanggal prestasi kelima', 51, '2025-11-12 20:35:14', '2025-11-14 08:24:10'),
(76, 'achievement_6_title', 'Prestasi 6 - Judul', 'text', 'Juara 2 Tim Gulat di Kejuaran Pekan Olahraga Pelajar Daerah (POPDA Jabar)', 'information', 'Judul prestasi keenam', 52, '2025-11-12 20:35:14', '2025-11-14 08:24:10'),
(77, 'achievement_6_icon', 'Prestasi 6 - Ikon', 'text', 'fas fa-medal', 'information', 'Ikon Font Awesome untuk prestasi keenam', 53, '2025-11-12 20:35:14', '2025-11-14 08:24:10'),
(78, 'achievement_6_description', 'Prestasi 6 - Deskripsi', 'textarea', 'Tim Gulat SMKN 4 Bogor berhasil meraih Juara 2 pada Pekan Olahraga Pelajar Daerah (POPDA) Jawa Barat, sebagai bukti kekuatan, teknik, dan dedikasi tinggi dalam cabang olahraga gulat.', 'information', 'Deskripsi prestasi keenam', 54, '2025-11-12 20:35:14', '2025-11-14 08:24:10'),
(79, 'achievement_6_date', 'Prestasi 6 - Tanggal', 'text', '28 September 2025', 'information', 'Tanggal prestasi keenam', 55, '2025-11-12 20:35:14', '2025-11-14 08:30:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-11-12 16:35:49', '$2y$12$ZejFN7Nu5vE9chEQA.MWDeGce0mw8O2BTh0DLu1.oa7tDaPjrZcAi', 'tRvz148GR9', '2025-11-12 16:35:50', '2025-11-12 16:35:50'),
(2, 'Administrator', 'admin@galeri-edu.com', NULL, '$2y$12$rW0YDdTZqH9Br4de75FEOONLRiQ/A8fkFGi7jzorIan19eJYRL5AG', 'bU3Keql3GPHjapeArWFXzwgQuV24PBzcJkwmPMCXangqgFMhKuU6rndySqct', '2025-11-12 16:35:52', '2025-11-12 16:35:52'),
(3, 'Siti Nuraeni', 'siti@galeri-edu.com', NULL, '$2y$12$FyGcUmGP3RUHjCyknG7ApeCDFfgYZxDomLCh03gXkLMUBSKfhbMle', NULL, '2025-11-12 16:35:53', '2025-11-12 16:35:53'),
(4, 'Kepala Sekolah', 'kepsek@galeri-edu.com', NULL, '$2y$12$wFN0APH3I1UldBLcRvd4neBZlilU2TcfCTAvG/TzVD2IkZKgrFH3G', NULL, '2025-11-12 16:35:54', '2025-11-12 16:35:54'),
(6, 'siti nuraeni', 'sitinuraenst7@gmail.com', NULL, '$2y$12$MpQECY8/b7keRgdgC/Af.uglzOG6EpLqTIsBMWchszPwpVhgOEmK2', 'tX4FmuwL4QKfe8CwZfZJhHdF44jAiVysMrbxFwFz9ioQiQH2Rtm734nFHLMR', '2025-11-14 09:46:44', '2025-11-14 09:46:44'),
(7, 'YUNISA', 'YUYUNINISA@gmail.com', NULL, '$2y$12$iulJC2JKQfNSMMGVQ2bZKueFCej7JOrCu/GTk4uIPDR4AHeCHDrKq', NULL, '2025-11-14 15:15:22', '2025-11-14 15:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `user_dislikes`
--

CREATE TABLE `user_dislikes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `foto_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_dislikes`
--

INSERT INTO `user_dislikes` (`id`, `user_id`, `foto_id`, `created_at`, `updated_at`) VALUES
(3, '6', 1, '2025-11-14 18:00:01', '2025-11-14 18:00:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_likes`
--

CREATE TABLE `user_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `foto_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_likes`
--

INSERT INTO `user_likes` (`id`, `user_id`, `foto_id`, `created_at`, `updated_at`) VALUES
(12, '6', 2, '2025-11-14 18:00:04', '2025-11-14 18:00:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foto_galery_id_foreign` (`galery_id`);

--
-- Indexes for table `galery`
--
ALTER TABLE `galery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galery_post_id_foreign` (`post_id`);

--
-- Indexes for table `gallery_like_logs`
--
ALTER TABLE `gallery_like_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_like_logs_user_id_foreign` (`user_id`),
  ADD KEY `gallery_like_logs_foto_id_foreign` (`foto_id`);

--
-- Indexes for table `informasi`
--
ALTER TABLE `informasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_slug_index` (`slug`),
  ADD KEY `pages_status_index` (`status`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `petugas_email_unique` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_kategori_id_foreign` (`kategori_id`),
  ADD KEY `posts_petugas_id_foreign` (`petugas_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_settings_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_dislikes`
--
ALTER TABLE `user_dislikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_dislikes_foto_id_foreign` (`foto_id`),
  ADD KEY `user_dislikes_user_id_foto_id_index` (`user_id`,`foto_id`);

--
-- Indexes for table `user_likes`
--
ALTER TABLE `user_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_likes_user_id_foto_id_unique` (`user_id`,`foto_id`),
  ADD KEY `user_likes_foto_id_foreign` (`foto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `galery`
--
ALTER TABLE `galery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `gallery_like_logs`
--
ALTER TABLE `gallery_like_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `informasi`
--
ALTER TABLE `informasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_dislikes`
--
ALTER TABLE `user_dislikes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_likes`
--
ALTER TABLE `user_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_galery_id_foreign` FOREIGN KEY (`galery_id`) REFERENCES `galery` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `galery`
--
ALTER TABLE `galery`
  ADD CONSTRAINT `galery_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `gallery_like_logs`
--
ALTER TABLE `gallery_like_logs`
  ADD CONSTRAINT `gallery_like_logs_foto_id_foreign` FOREIGN KEY (`foto_id`) REFERENCES `foto` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gallery_like_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `posts_petugas_id_foreign` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`);

--
-- Constraints for table `user_dislikes`
--
ALTER TABLE `user_dislikes`
  ADD CONSTRAINT `user_dislikes_foto_id_foreign` FOREIGN KEY (`foto_id`) REFERENCES `foto` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_likes`
--
ALTER TABLE `user_likes`
  ADD CONSTRAINT `user_likes_foto_id_foreign` FOREIGN KEY (`foto_id`) REFERENCES `foto` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
