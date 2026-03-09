-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Mar 2026 pada 04.27
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudang_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(150) NOT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT 'default_barang.jpg',
  `stok` int(11) DEFAULT 0,
  `harga` decimal(12,2) DEFAULT 0.00,
  `deskripsi` text DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `kategori`, `foto`, `stok`, `harga`, `deskripsi`, `status`) VALUES
(1, 'BRG-001', 'Keyboard Gaming', 'Aksesoris', 'keyboard.jpg', 25, 350000.00, 'Keyboard mechanical RGB', 'aktif'),
(2, 'BRG-002', 'Mouse Gaming', 'Aksesoris', 'mouse.jpg', 40, 250000.00, 'Mouse DPI tinggi untuk gaming', 'aktif'),
(3, 'BRG-003', 'Monitor 24 Inch', 'Elektronik', 'monitor.jpg', 15, 1750000.00, 'Monitor Full HD IPS', 'aktif'),
(4, 'BRG-004', 'Headset Gaming', 'Aksesoris', 'headset.jpg', 30, 450000.00, 'Headset surround sound', 'aktif'),
(5, 'BRG-005', 'SSD 512GB', 'Penyimpanan', 'ssd.jpg', 20, 950000.00, 'SSD NVMe 512GB', 'aktif'),
(6, 'BRG-006', 'RAM DDR4 16GB', 'Memori', 'ram.jpg', 18, 780000.00, 'RAM DDR4 dual channel', 'aktif'),
(7, 'BRG-007', 'Power Supply 650W', 'Elektronik', 'psu.jpg', 12, 1100000.00, 'PSU 80+ Gold Fully Modular', 'aktif'),
(8, 'BRG-008', 'Casing PC ATX', 'Elektronik', 'casing.jpg', 10, 650000.00, 'Casing airflow tempered glass', 'aktif'),
(9, 'BRG-009', 'VGA RTX 4060', 'Komponen', 'vga.jpg', 6, 5500000.00, 'GPU NVIDIA RTX Series', 'aktif'),
(10, 'BRG-010', 'Laptop Lenovo LOQ RTX 5050', 'Elektronik', 'laptop.jpg', 5, 14500000.00, 'Laptop gaming RTX 50 series', 'aktif'),
(11, 'BRG1.015', 'mouse noir m1', 'Elektronik', 'default_barang.jpg', 5, 250000.00, 'mouse dengan sensor 3311', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_perusahaan` varchar(255) NOT NULL,
  `nama_kontak` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telpon` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `propinsi` varchar(100) DEFAULT NULL,
  `kode_pos` varchar(10) DEFAULT NULL,
  `jenis_produk` enum('barang','jasa','bahan baku','bahan jadi') DEFAULT NULL,
  `model_bisnis` enum('produsen','grosir','importir') DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_perusahaan`, `nama_kontak`, `email`, `telpon`, `alamat`, `kota`, `propinsi`, `kode_pos`, `jenis_produk`, `model_bisnis`, `keterangan`) VALUES
(3, 'PT Sumber Teknologi Indonesia', 'Andi Pratama', 'andi@sumbertech.co.id', '081234567801', 'Jl. Sudirman No. 10', 'Jakarta', 'DKI Jakarta', '10220', 'barang', 'importir', 'Supplier aksesoris dan perangkat komputer'),
(4, 'CV Digital Makmur', 'Budi Santoso', 'budi@digitalmakmur.id', '081234567802', 'Jl. Gatot Subroto No. 5', 'Bandung', 'Jawa Barat', '40123', 'barang', 'grosir', 'Supplier monitor dan perangkat elektronik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','petugas') DEFAULT 'petugas',
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nama_lengkap`, `username`, `email`, `password`, `role`, `status`, `last_login`, `created_at`) VALUES
(1, 'Muhammad Akhtar Behnam Putra', 'A12.2024.07267', 'mhs07267@gudang.com', 'logingudang123', '', 'aktif', NULL, '2026-01-08 05:19:43'),
(2, 'NT', 'masihcoba', 'coba@gudang.com', 'coba', '', 'aktif', NULL, '2026-01-08 05:19:43');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
