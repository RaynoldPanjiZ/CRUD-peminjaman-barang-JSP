-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jan 2021 pada 11.30
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pinjam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(32) NOT NULL,
  `kondisi` varchar(32) NOT NULL,
  `keterangan` varchar(32) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `jenis` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `kondisi`, `keterangan`, `jumlah`, `jenis`) VALUES
(111, 'Printer', 'Baik', 'Biasa digunakan di ruang admin', 3, 'Elektronik'),
(112, 'Monitor', 'Baik', 'Monitor LCD 2inch', 3, 'Elektronik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `ket_pinjam` text NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `id_user` varchar(32) NOT NULL,
  `nama_peminjam` varchar(32) NOT NULL,
  `kontak1` varchar(32) NOT NULL,
  `kontak2` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `id_barang`, `ket_pinjam`, `tgl_pinjam`, `tgl_kembali`, `status`, `id_user`, `nama_peminjam`, `kontak1`, `kontak2`) VALUES
(1, 111, '-', '2021-01-14', '2021-01-08', 'Kembali', 'u11', 'REyhan', '0900909', '0808080808'),
(2, 111, 'Untuk  kantor', '2021-01-14', NULL, 'Dipinjam', 'u11', 'Abdul', '0898008', 'adbul@gmail.com'),
(3, 111, '-', '2021-01-16', '2021-01-22', 'Kembali', 'u11', 'Reihan', '090909', '889898'),
(4, 112, '-', '2021-01-13', '2021-01-15', 'Kembali', 'u11', 'Agung', '09090', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` varchar(11) NOT NULL,
  `nama_user` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nama_user`, `username`, `password`, `level`) VALUES
('a11', 'Raynold', 'admin', 'admin', 'admin'),
('a12', 'Zul', 'admin2', 'admin2', 'admin'),
('u11', 'Panji', 'ray', 'ray', 'pegawai'),
('u12', 'Bamb', 'user', 'user', 'pegawai'),
('u13', 'Bambang', 'bam', 'bam', 'pegawai');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `peminjaman_ibfk_4` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
