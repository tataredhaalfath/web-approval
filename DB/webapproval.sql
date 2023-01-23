-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 23 Jan 2023 pada 07.43
-- Versi Server: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `webapproval`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `aplikasi`
--

CREATE TABLE IF NOT EXISTS `aplikasi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_owner` varchar(100) DEFAULT NULL,
  `alamat` text,
  `tlp` varchar(50) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `nama_aplikasi` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `copy_right` varchar(50) DEFAULT NULL,
  `versi` varchar(20) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `aplikasi`
--

INSERT INTO `aplikasi` (`id`, `nama_owner`, `alamat`, `tlp`, `title`, `nama_aplikasi`, `logo`, `copy_right`, `versi`, `tahun`) VALUES
(1, 'Super Admin', 'Semarang', '083838976552', 'Creator Menu', 'Creator', 'Screenshot_1.png', 'Copy Right &copy;', '1.0.0.0', 2023);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kdbarang` varchar(15) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `harga` decimal(10,0) DEFAULT NULL,
  `satuan` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kat` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_kat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_akses_menu`
--

CREATE TABLE IF NOT EXISTS `tbl_akses_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_level` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `view_level` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=76 ;

--
-- Dumping data untuk tabel `tbl_akses_menu`
--

INSERT INTO `tbl_akses_menu` (`id`, `id_level`, `id_menu`, `view_level`) VALUES
(1, 1, 1, 'Y'),
(2, 1, 2, 'Y'),
(43, 4, 1, 'Y'),
(44, 4, 2, 'N'),
(64, 6, 1, 'N'),
(65, 6, 2, 'N'),
(66, 7, 1, 'N'),
(67, 7, 2, 'N'),
(68, 8, 1, 'N'),
(69, 8, 2, 'N'),
(70, 9, 1, 'N'),
(71, 9, 2, 'N'),
(72, 10, 1, 'N'),
(73, 10, 2, 'N'),
(74, 11, 1, 'N'),
(75, 11, 2, 'N');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_akses_submenu`
--

CREATE TABLE IF NOT EXISTS `tbl_akses_submenu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_level` int(11) NOT NULL,
  `id_submenu` int(11) NOT NULL,
  `view_level` enum('Y','N') DEFAULT 'N',
  `add_level` enum('Y','N') DEFAULT 'N',
  `edit_level` enum('Y','N') DEFAULT 'N',
  `delete_level` enum('Y','N') DEFAULT 'N',
  `print_level` enum('Y','N') DEFAULT 'N',
  `upload_level` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=150 ;

--
-- Dumping data untuk tabel `tbl_akses_submenu`
--

INSERT INTO `tbl_akses_submenu` (`id`, `id_level`, `id_submenu`, `view_level`, `add_level`, `edit_level`, `delete_level`, `print_level`, `upload_level`) VALUES
(2, 1, 2, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(4, 1, 1, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(6, 1, 7, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(7, 1, 8, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(9, 1, 10, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(13, 1, 14, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(26, 1, 15, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(30, 1, 17, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(32, 1, 18, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(34, 1, 19, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(36, 1, 20, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(59, 4, 1, 'N', 'N', 'N', 'N', 'N', 'N'),
(60, 4, 2, 'N', 'N', 'N', 'N', 'N', 'N'),
(61, 4, 7, 'N', 'N', 'N', 'N', 'N', 'N'),
(62, 4, 8, 'N', 'N', 'N', 'N', 'N', 'N'),
(63, 4, 10, 'N', 'N', 'N', 'N', 'N', 'N'),
(64, 4, 15, 'N', 'N', 'N', 'N', 'N', 'N'),
(65, 4, 17, 'N', 'N', 'N', 'N', 'N', 'N'),
(66, 4, 18, 'N', 'N', 'N', 'N', 'N', 'N'),
(67, 4, 19, 'N', 'N', 'N', 'N', 'N', 'N'),
(68, 4, 20, 'N', 'N', 'N', 'N', 'N', 'N'),
(82, 1, 23, 'N', 'N', 'N', 'N', 'N', 'N'),
(83, 4, 23, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(84, 6, 1, 'N', 'N', 'N', 'N', 'N', 'N'),
(85, 6, 2, 'N', 'N', 'N', 'N', 'N', 'N'),
(86, 6, 7, 'N', 'N', 'N', 'N', 'N', 'N'),
(87, 6, 8, 'N', 'N', 'N', 'N', 'N', 'N'),
(88, 6, 10, 'N', 'N', 'N', 'N', 'N', 'N'),
(89, 6, 15, 'N', 'N', 'N', 'N', 'N', 'N'),
(90, 6, 17, 'N', 'N', 'N', 'N', 'N', 'N'),
(91, 6, 18, 'N', 'N', 'N', 'N', 'N', 'N'),
(92, 6, 19, 'N', 'N', 'N', 'N', 'N', 'N'),
(93, 6, 20, 'N', 'N', 'N', 'N', 'N', 'N'),
(94, 6, 23, 'N', 'N', 'N', 'N', 'N', 'N'),
(95, 7, 1, 'N', 'N', 'N', 'N', 'N', 'N'),
(96, 7, 2, 'N', 'N', 'N', 'N', 'N', 'N'),
(97, 7, 7, 'N', 'N', 'N', 'N', 'N', 'N'),
(98, 7, 8, 'N', 'N', 'N', 'N', 'N', 'N'),
(99, 7, 10, 'N', 'N', 'N', 'N', 'N', 'N'),
(100, 7, 15, 'N', 'N', 'N', 'N', 'N', 'N'),
(101, 7, 17, 'N', 'N', 'N', 'N', 'N', 'N'),
(102, 7, 18, 'N', 'N', 'N', 'N', 'N', 'N'),
(103, 7, 19, 'N', 'N', 'N', 'N', 'N', 'N'),
(104, 7, 20, 'N', 'N', 'N', 'N', 'N', 'N'),
(105, 7, 23, 'N', 'N', 'N', 'N', 'N', 'N'),
(106, 8, 1, 'N', 'N', 'N', 'N', 'N', 'N'),
(107, 8, 2, 'N', 'N', 'N', 'N', 'N', 'N'),
(108, 8, 7, 'N', 'N', 'N', 'N', 'N', 'N'),
(109, 8, 8, 'N', 'N', 'N', 'N', 'N', 'N'),
(110, 8, 10, 'N', 'N', 'N', 'N', 'N', 'N'),
(111, 8, 15, 'N', 'N', 'N', 'N', 'N', 'N'),
(112, 8, 17, 'N', 'N', 'N', 'N', 'N', 'N'),
(113, 8, 18, 'N', 'N', 'N', 'N', 'N', 'N'),
(114, 8, 19, 'N', 'N', 'N', 'N', 'N', 'N'),
(115, 8, 20, 'N', 'N', 'N', 'N', 'N', 'N'),
(116, 8, 23, 'N', 'N', 'N', 'N', 'N', 'N'),
(117, 9, 1, 'N', 'N', 'N', 'N', 'N', 'N'),
(118, 9, 2, 'N', 'N', 'N', 'N', 'N', 'N'),
(119, 9, 7, 'N', 'N', 'N', 'N', 'N', 'N'),
(120, 9, 8, 'N', 'N', 'N', 'N', 'N', 'N'),
(121, 9, 10, 'N', 'N', 'N', 'N', 'N', 'N'),
(122, 9, 15, 'N', 'N', 'N', 'N', 'N', 'N'),
(123, 9, 17, 'N', 'N', 'N', 'N', 'N', 'N'),
(124, 9, 18, 'N', 'N', 'N', 'N', 'N', 'N'),
(125, 9, 19, 'N', 'N', 'N', 'N', 'N', 'N'),
(126, 9, 20, 'N', 'N', 'N', 'N', 'N', 'N'),
(127, 9, 23, 'N', 'N', 'N', 'N', 'N', 'N'),
(128, 10, 1, 'N', 'N', 'N', 'N', 'N', 'N'),
(129, 10, 2, 'N', 'N', 'N', 'N', 'N', 'N'),
(130, 10, 7, 'N', 'N', 'N', 'N', 'N', 'N'),
(131, 10, 8, 'N', 'N', 'N', 'N', 'N', 'N'),
(132, 10, 10, 'N', 'N', 'N', 'N', 'N', 'N'),
(133, 10, 15, 'N', 'N', 'N', 'N', 'N', 'N'),
(134, 10, 17, 'N', 'N', 'N', 'N', 'N', 'N'),
(135, 10, 18, 'N', 'N', 'N', 'N', 'N', 'N'),
(136, 10, 19, 'N', 'N', 'N', 'N', 'N', 'N'),
(137, 10, 20, 'N', 'N', 'N', 'N', 'N', 'N'),
(138, 10, 23, 'N', 'N', 'N', 'N', 'N', 'N'),
(139, 11, 1, 'N', 'N', 'N', 'N', 'N', 'N'),
(140, 11, 2, 'N', 'N', 'N', 'N', 'N', 'N'),
(141, 11, 7, 'N', 'N', 'N', 'N', 'N', 'N'),
(142, 11, 8, 'N', 'N', 'N', 'N', 'N', 'N'),
(143, 11, 10, 'N', 'N', 'N', 'N', 'N', 'N'),
(144, 11, 15, 'N', 'N', 'N', 'N', 'N', 'N'),
(145, 11, 17, 'N', 'N', 'N', 'N', 'N', 'N'),
(146, 11, 18, 'N', 'N', 'N', 'N', 'N', 'N'),
(147, 11, 19, 'N', 'N', 'N', 'N', 'N', 'N'),
(148, 11, 20, 'N', 'N', 'N', 'N', 'N', 'N'),
(149, 11, 23, 'N', 'N', 'N', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_menu`
--

CREATE TABLE IF NOT EXISTS `tbl_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(50) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `urutan` bigint(11) DEFAULT NULL,
  `is_active` enum('Y','N') DEFAULT 'Y',
  `parent` enum('Y') DEFAULT 'Y',
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=52 ;

--
-- Dumping data untuk tabel `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `nama_menu`, `link`, `icon`, `urutan`, `is_active`, `parent`) VALUES
(1, 'Dashboard', 'dashboard', 'fas fa-tachometer-alt', 1, 'Y', 'Y'),
(2, 'System', '#', 'fas fa-cogs', 2, 'Y', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_submenu`
--

CREATE TABLE IF NOT EXISTS `tbl_submenu` (
  `id_submenu` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_submenu` varchar(50) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `is_active` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`id_submenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=24 ;

--
-- Dumping data untuk tabel `tbl_submenu`
--

INSERT INTO `tbl_submenu` (`id_submenu`, `nama_submenu`, `link`, `icon`, `id_menu`, `is_active`) VALUES
(1, 'Main Menu', 'menu', 'far fa-circle', 2, 'Y'),
(2, 'Sub Menu - Public Menu', 'submenu', 'far fa-circle', 2, 'Y'),
(7, 'Aplikasi', 'aplikasi', 'far fa-circle', 2, 'Y'),
(8, 'User Account', 'user', 'far fa-circle', 2, 'Y'),
(10, 'User Level', 'userlevel', 'far fa-circle', 2, 'Y'),
(15, 'Barang', 'barang', 'far fa-circle', 32, 'Y'),
(17, 'Kategori', 'kategori', 'far fa-circle', 32, 'Y'),
(18, 'Satuan', 'satuan', 'far fa-circle', 32, 'Y'),
(19, 'Pembelian', 'pembelian', 'far fa-circle', 41, 'Y'),
(20, 'Penjualan', 'penjualan', 'far fa-circle', 41, 'Y'),
(23, 'Sales Menu', 'barang', 'fa-slack', 1, 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id_user` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `is_active` enum('Y','N') DEFAULT 'Y',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=13 ;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `full_name`, `password`, `id_level`, `image`, `is_active`) VALUES
(1, 'Super Admin', 'Supervisor Administrator', '$2y$05$5ewysU6qdCfzUUwiSAmYeOde7o.QJjvdFNRnnLIuUVh/0SwTNSK0m', 1, 'super-admin.png', 'Y'),
(6, 'sales', 'Sales Name', '$2y$05$CoV5Fh8Y.PRpYzocrDWvueRBSWnWYLKX4SVoYucIjq.N8JhxTPmqS', 4, 'user.png', 'Y'),
(7, 'koorsales', 'Koordinator Sales Name', '$2y$05$Lg29RLO72eGF3FQmoNdL9ep4kgGUh6rRkvoA3Lso78WTRcKuDrX/e', 6, 'koorsales1.JPG', 'Y'),
(8, 'manoperasional', 'Manager Operasional Name', '$2y$05$.hfj1aNpvnaSHiqYycz9/eA8eEDUVSf.79z/D3hsZn0eZtdleKaOG', 7, 'manoperasional1.png', 'Y'),
(9, 'mansales', 'Manager Sales Name', '$2y$05$MqyHW5RKaWMs/hq/b/JaH.UQBQt33QUVZfT02/36fBWkn1GbyAr0m', 8, 'mansales1.jpg', 'Y'),
(10, 'spvsales', 'Supervisor Sales Name', '$2y$05$j4J/ZhS4tqRzi7/KTWeOLOhdyfrwc9ZSiM7SXihjN9xFJlcRp6Tgm', 9, 'spvsales.jpg', 'Y'),
(11, 'koorpm', 'Koordinator PM Name', '$2y$05$NIX0o2AW27q1mV5t/fpCB.m.99HysGSTERD/z9PE.NPoLkJQNeaJ6', 10, 'koorpm.jpg', 'Y'),
(12, 'tester', 'tester', '$2y$05$CHLx8BsIlxA/wVsMtMTHter8Xo.7qM6r.DGNdbHW5v7WbXFh/ASW.', 11, 'tester1.png', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_userlevel`
--

CREATE TABLE IF NOT EXISTS `tbl_userlevel` (
  `id_level` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nama_level` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=12 ;

--
-- Dumping data untuk tabel `tbl_userlevel`
--

INSERT INTO `tbl_userlevel` (`id_level`, `nama_level`) VALUES
(1, 'admin'),
(4, 'sales'),
(6, 'koorsales'),
(7, '  manoperasional'),
(8, 'mansales'),
(9, 'spvsales'),
(10, 'koorpm'),
(11, 'Tester');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
