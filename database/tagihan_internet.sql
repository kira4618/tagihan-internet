-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 10 Bulan Mei 2024 pada 22.34
-- Versi server: 10.6.17-MariaDB-cll-lve
-- Versi PHP: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jagodig1_tagihan-hosting`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kas`
--

CREATE TABLE `tb_kas` (
  `id_kas` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `tgl_kas` date NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `penerimaan` int(11) NOT NULL,
  `pengeluaran` int(11) NOT NULL,
  `jenis_kas` varchar(15) NOT NULL,
  `status` int(11) NOT NULL,
  `id_tagihan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_kas`
--

INSERT INTO `tb_kas` (`id_kas`, `id_transaksi`, `tgl_kas`, `keterangan`, `penerimaan`, `pengeluaran`, `jenis_kas`, `status`, `id_tagihan`) VALUES
(74, 0, '2023-10-18', 'Pembayaran Internet AN.&nbspRamadhan,&nbspPaket&nbsp1 GB', 82000, 0, '', 0, 42),
(75, 0, '2023-10-23', 'Pembayaran Internet AN.&nbspRIO,&nbspPaket&nbsp1 GB', 82000, 0, '', 0, 43),
(77, 0, '2023-10-24', 'Pembayaran Internet AN.&nbspPak Zen,&nbspPaket&nbsp2 GB', 109000, 0, '', 0, 46),
(78, 0, '2023-12-16', 'Pembayaran Internet AN.&nbspranggahusada,&nbspPaket&nbsp1 GB', 82000, 0, '', 0, 52),
(79, 0, '2024-02-05', 'Pembayaran Internet AN.&nbspRamadhan,&nbspPaket&nbsp1 GB', 82000, 0, '', 0, 44),
(80, 0, '2024-05-07', 'Pembayaran Internet AN.&nbspNONO,&nbspPaket&nbsp3Mbps', 100000, 0, '', 0, 64),
(82, 0, '2024-05-10', 'Pembayaran Internet AN.&nbspPAJERO AJI,&nbspPaket&nbspBROADBAND 4Mbps', 100000, 0, '', 0, 65),
(87, 0, '2024-05-10', 'Pembayaran Internet AN.&nbspPAJERO AMINAH,&nbspPaket&nbspBROADBAND 4Mbps', 100000, 0, '', 1, 66);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id_paket` int(11) NOT NULL,
  `nama_paket` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_paket`
--

INSERT INTO `tb_paket` (`id_paket`, `nama_paket`, `harga`) VALUES
(1, 'DVR CCTV', 100000),
(2, 'TV ANDROID', 50000),
(3, 'BROADBAND 6Mbps', 150000),
(4, 'BROADBAND 4Mbps', 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `nama_agen` varchar(150) NOT NULL,
  `paket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `no_telp`, `nama_agen`, `paket`) VALUES
(20, 'PAJERO AJI', 'PANGGANG JERO', '082212123578', 'KASIRON', 4),
(21, 'PAJERO AMINAH', 'PANGGANG JERO', '+6285324411544', 'KASIRON', 4),
(22, 'sds', 'dsds', 'dsds', 'aadd', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_profile`
--

CREATE TABLE `tb_profile` (
  `id` int(11) NOT NULL,
  `nama_sekolah` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `website` varchar(100) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `bendahara` varchar(100) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `ktu` varchar(255) NOT NULL,
  `nip_ktu` varchar(30) NOT NULL,
  `catatan` varchar(234) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_profile`
--

INSERT INTO `tb_profile` (`id`, `nama_sekolah`, `alamat`, `telpon`, `website`, `kota`, `bendahara`, `nip`, `foto`, `ktu`, `nip_ktu`, `catatan`) VALUES
(1, 'PT JARINGAN LINTAS ARTHA', 'Desa Tanjakan Krangkeng Indramayu\r\nHP 085 324 411 544', '083190781585', 'jagodigital.web.id', 'JAKARTA', 'HERI', '0', 'LOGO HITAM.png', '0', '0', 'Terima Kasih Pelanggan Setia Jaringan Lintas Artha,\r\nSimpanlah Struk Ini Sebagai Bukti Pembayaran ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tagihan`
--

CREATE TABLE `tb_tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `bulan_tahun` varchar(30) NOT NULL,
  `jml_bayar` int(11) NOT NULL,
  `terbayar` int(11) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `status_bayar` int(11) NOT NULL,
  `no_invoice` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_tagihan`
--

INSERT INTO `tb_tagihan` (`id_tagihan`, `id_pelanggan`, `bulan_tahun`, `jml_bayar`, `terbayar`, `tgl_bayar`, `status_bayar`, `no_invoice`) VALUES
(42, 8, '102023', 82000, 82000, '2023-10-18', 1, '00001.BLR.MST.'),
(43, 9, '102023', 82000, 82000, '2023-10-23', 1, '00002.BLR.MST.'),
(44, 8, '112023', 82000, 82000, '2024-02-05', 1, '00005.BLR.MST.'),
(45, 9, '112023', 82000, 0, '0000-00-00', 0, ''),
(46, 10, '102023', 109000, 109000, '2023-10-24', 1, '00003.BLR.MST.'),
(47, 10, '112023', 109000, 0, '0000-00-00', 0, ''),
(48, 11, '112023', 82000, 0, '0000-00-00', 0, ''),
(49, 8, '122023', 82000, 0, '0000-00-00', 0, ''),
(50, 9, '122023', 82000, 0, '0000-00-00', 0, ''),
(51, 10, '122023', 109000, 0, '0000-00-00', 0, ''),
(52, 11, '122023', 82000, 82000, '2023-12-16', 1, '00004.BLR.MST.'),
(53, 8, '122024', 82000, 0, '0000-00-00', 0, ''),
(54, 9, '122024', 82000, 0, '0000-00-00', 0, ''),
(55, 10, '122024', 109000, 0, '0000-00-00', 0, ''),
(56, 11, '122024', 82000, 0, '0000-00-00', 0, ''),
(57, 12, '122024', 82000, 0, '0000-00-00', 0, ''),
(58, 13, '122024', 82000, 0, '0000-00-00', 0, ''),
(59, 14, '122024', 82000, 0, '0000-00-00', 0, ''),
(60, 15, '122024', 214000, 0, '0000-00-00', 0, ''),
(61, 16, '122024', 82000, 0, '0000-00-00', 0, ''),
(62, 17, '122024', 82000, 0, '0000-00-00', 0, ''),
(63, 18, '122024', 82000, 0, '0000-00-00', 0, ''),
(64, 19, '052024', 100000, 100000, '2024-05-07', 1, '00006.BLR.MST.'),
(65, 20, '052024', 100000, 100000, '2024-05-10', 1, '00008.BLR.MST.'),
(66, 21, '052024', 100000, 100000, '2024-05-10', 1, '00013.BLR.MST.'),
(67, 22, '052024', 100000, 0, '0000-00-00', 0, '00012.BLR.MST.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(30) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_pelanggan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `nama_user`, `password`, `level`, `foto`, `id_pelanggan`) VALUES
(13, 'admin', 'AULIA', '10.146.0.1', 'admin', 'AULIA-01.jpg', 12),
(25, 'wawan', 'wawan', '10.146.0.1', 'kasir', 'WhatsApp Image 2023-11-16 at 23.25.21_5e5bfa37.jpg', 0),
(26, 'kasiron', 'kasiron', '10.146.0.1', 'kasir', 'WhatsApp Image 2023-11-16 at 23.25.21_5e5bfa37.jpg', 0),
(27, 'sds', 'sds', 'user', 'user', 'admin.png', 22);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_kas`
--
ALTER TABLE `tb_kas`
  ADD PRIMARY KEY (`id_kas`);

--
-- Indeks untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `tb_profile`
--
ALTER TABLE `tb_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_kas`
--
ALTER TABLE `tb_kas`
  MODIFY `id_kas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tb_profile`
--
ALTER TABLE `tb_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_tagihan`
--
ALTER TABLE `tb_tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
