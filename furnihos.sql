-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Des 2021 pada 18.28
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `furnihos`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(2, 'Lampu Gantung', 'Lampu Gantung, Putih', 'Elektronik', 450000, 25, 'LampuGantung.jpg'),
(3, 'Poster Dinding', 'Bingkai dengan poster, set isi 8, countryside living', 'Dekorasi Rumah', 600000, 50, 'poster.jpg'),
(4, 'Gorden', 'Gorden anti tembus cahaya, 1 pasang, krem, 145x250 cm', 'Tekstil', 1200000, 38, 'gorden.jpg'),
(5, 'Gazebo', 'Gazebo, abu-abu tua/abu-abu krem, 300x300 cm', 'Produk Luar Ruangan', 3500000, 18, 'gazebo.jpg'),
(9, 'Bantal Kursi', 'Bantal kursi, putih/hitam, 40x40 cm', 'Tekstil', 40000, 44, 'bantalDuduk2.jpg'),
(11, 'Sofa comfortable', 'Sofa 2 dudukan, abu-abu', 'Perabotan', 1800000, 23, 'sofa.jpg'),
(15, 'Kursi', 'Kursi berlengan, veneer kayu birch/knisa krem muda', 'Perabotan', 499000, 50, 'kursi.jpg'),
(16, 'Setrika', 'Easygliss dry iron fs4040, 200 watt', 'Elektronik', 449000, 20, 'setrika.jpeg'),
(17, 'Tenda Payung', 'Tenda payung, gantung, krem, 300 cm, elastis, ringan', 'Produk Luar Ruangan', 2110000, 35, 'tenda_payung.jpg'),
(22, 'Laci Trotten', 'Unit laci, putih, 34x56 cm', 'Perabotan', 699000, 30, 'laci.jpg'),
(23, 'Ranjang Bayi', 'SNIGLAR Ranjang bayi, kayu beech, 60x120 cm', 'Perabotan', 1399000, 40, 'ranjang.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(21, 'user1@gmail.com', 'aaa', '2021-12-06 21:56:04', '2021-12-07 21:56:04'),
(22, 'user1@gmail.com', 'sfd', '2021-12-07 09:43:38', '2021-12-08 09:43:38'),
(23, 'user1@gmail.com', 'Rifqi', '2021-12-07 22:49:29', '2021-12-08 22:49:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(19, 12, 15, 'Kursi', 1, 982000, ''),
(20, 13, 3, 'Poster Dinding', 1, 600000, ''),
(21, 14, 16, 'Seterika', 1, 449000, ''),
(22, 16, 16, 'Seterika', 1, 449000, ''),
(23, 16, 11, 'Sofa comfortable', 1, 1800000, ''),
(24, 16, 9, 'Bantal Kursi', 1, 40000, ''),
(25, 17, 4, 'Gorden', 1, 1200000, ''),
(26, 18, 2, 'Lampu Gantung', 1, 450000, ''),
(27, 18, 17, 'Tenda Payung', 2, 2110000, ''),
(28, 19, 2, 'Lampu Gantung', 1, 450000, ''),
(29, 20, 3, 'Poster Dinding', 1, 600000, ''),
(30, 21, 2, 'Lampu Gantung', 1, 450000, ''),
(31, 22, 3, 'Poster Dinding', 1, 600000, ''),
(32, 23, 5, 'Gazebo', 2, 3500000, ''),
(33, 23, 11, 'Sofa comfortable', 1, 1800000, ''),
(34, 23, 17, 'Tenda Payung', 1, 2110000, ''),
(35, 23, 2, 'Lampu Gantung', 1, 450000, '');

--
-- Trigger `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(1, 'Muhammad Kanzul', 'muhammad.mf585@gmail.com', 'default.jpg', '$2y$10$p5PsY4hNi8yacnvpswkQfurpUCzRcNC1oeVyfXy2FRU8FJ8YWOxba', 1, 1, 1637856720),
(10, 'Admin Satu', 'admin1@gmail.com', 'default.jpg', '$2y$10$xr1WttOeMUugO3ULTrf1vehaWo6RWk6rCi0hk2lxcus1mU5onSa1y', 1, 1, 1637867168),
(11, 'User Satu', 'user1@gmail.com', 'default.jpg', '$2y$10$DlqkeHPwdUCcOmZYCrTKd.7Bxy75fTVddJXdXcJhR6kdyo2BwOsvS', 2, 1, 1637926696),
(12, 'asd', 'asd@gmail.com', 'default.jpg', '$2y$10$pbkztYmArbQaH22Q0QucLezjJmCaDhfGgTB4Vo71z.DB6COyVmG1K', 2, 1, 1638109334),
(13, 'User Dua', 'user2@gmail.com', 'default.jpg', '$2y$10$BanIbzEkEq1BBxUGHwkJtepg9I9R.ugo0MH9zthrZK2hqo3e28JEC', 2, 1, 1638891518);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
