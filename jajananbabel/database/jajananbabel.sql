-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jun 2022 pada 11.58
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tokoonline`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', 'admin', 'Administrator');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Kategori A'),
(2, 'Kategori B');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(11) NOT NULL,
  `nama_kota` varchar(50) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Demak', 20000),
(2, 'Cirebon', 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(50) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `telepon_pelanggan` varchar(20) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(7, 'shidqiadiatma12@gmail.com', '12345', 'Shidqi Adiatma', '081366321356', 'Jalan Teladan AMD No.36 Kecamatan Toboali, Kabupaten Bangka Selatan, Provinsi Kepulauan Bangka Belitung\r\n33783'),
(8, 'dwiasri@gmail.com', '12345', 'Dwi Asri', '0811223344', 'Jalan Anggrek');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `bank` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(9, 22, 'yujytu', 'ytutyu', 1, '2022-05-27', '20220527145746download20220104115630.png'),
(10, 28, 'Shidqi Adiatma', 'BCA', 105000, '2022-06-05', '20220605092346contoh_bukti_transfer.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL,
  `totalberat` int(11) NOT NULL,
  `provinsi` varchar(150) NOT NULL,
  `distrik` varchar(150) NOT NULL,
  `tipe` varchar(100) NOT NULL,
  `kodepos` varchar(15) NOT NULL,
  `ekspedisi` varchar(50) NOT NULL,
  `paket` varchar(50) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `estimasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `tanggal_pembelian`, `total_pembelian`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`, `totalberat`, `provinsi`, `distrik`, `tipe`, `kodepos`, `ekspedisi`, `paket`, `ongkir`, `estimasi`) VALUES
(30, 7, '2022-06-05', 105000, 'Jalan Melati No.25', 'pending', '', 575, 'DKI Jakarta', 'Jakarta Timur', 'Kota', '13330', 'pos', 'Express Next Day Barang', 30000, '1 HARI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(38, 28, 4, 1, 'Permen Kabung', 15000, 200, 200, 15000),
(39, 28, 9, 1, 'Kericu | Keripik Telor Cumi', 30000, 200, 200, 30000),
(40, 28, 5, 1, 'Kemplang Ikan Tenggiri', 30000, 175, 175, 30000),
(41, 29, 2, 1, 'Teh Tayu', 21000, 50, 50, 21000),
(42, 30, 4, 1, 'Permen Kabung', 15000, 200, 200, 15000),
(43, 30, 9, 1, 'Kericu | Keripik Telor Cumi', 30000, 200, 200, 30000),
(44, 30, 5, 1, 'Kemplang Ikan Tenggiri', 30000, 175, 175, 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(1, 1, 'Kue Rintak', 20000, 300, 'kuerintak.jpg', 'Rintak adalah salah satu cookies tradisional Bangka yang terbuat dari Sagu Rumbia. Rasa nya yang manis dan kombinasi renyah saat digigit dan meleleh di mulut membuat cookies tradisional satu ini paling pas jika dinikmati bersama dengan kopi pahit.\r\n\r\nUntuk membedakan rintak yang berkualitas adalah saat digigit. Rintak berkualitas renyah di luar nya namun tidak keras saat digigit, Di di dalam nya agak sedikit lembut tidak terlalu garing seperti di luar nya.', 191),
(2, 2, 'Teh Tayu', 21000, 50, 'tehtayu.jpg', 'Teh Khas Bangka.\r\n\r\nJika membayangkan kebun teh, kita umumnya terbayang dengan kebun teh yang ada di daerah dataran tinggi yang dingin dan berkabut. Namun ada satu yang unik di Bangka, tepatnya di kecamatan Jebus (Nampong), dusun Tayu . Ada warisan teh dataran rendah yang memiliki rasa yang kuat, khas dan unik. Teh dengan aroma hasil sangrai yang kuat meninggalkan kesan yang tak terlupakan dan berbeda dari teh pada umumnya. Teh Tayu ini dipercaya mengandung banyak khasiat yang baik bagi tubuh, seperti mencegah kolesterol, menstabilkan gula darah dan tekanan darah tinggi.', 197),
(3, 1, 'Bong Li Piang', 25000, 500, 'bonglipiang.jpg', 'Kue pia isi nanas khas dari pulau Bangka. Isi selai nanas yang dibuat secara traditional dan alami dari nanas asli.\r\nKue ini memiliki sedikit aroma bakar, dengan tekstur yang lembut dan selai nanas asli, terasa pas sekali jika digabung dengan secangkir kopi.\r\n\r\nSatu bungkus isi 10 tidak pernah akan cukup.', 198),
(4, 1, 'Permen Kabung', 15000, 200, 'permenkabung.jpg', 'Permen kabung ini adalah salah satu permen tradisional Bangka yang sudah ada sejak zaman orang tua bahkan kakek nenek .\r\n\r\nPermen sederhana yang hanya terbuat dari Gula Kabung (Nama lain dari gula aren). Tanpa pemanis , perasa dan pewarna buatan.\r\n\r\nRasa karamel gula aren.  ', 196),
(5, 1, 'Kemplang Ikan Tenggiri', 30000, 175, 'kempelang.jpg', 'Kerupuk kemplang panggang khas bangka. Digoreng tanpa menggunakan minyak. Sehingga tidak perlu khawatir dengan kolestrol. Dengan cocolan sambal terasi, cocok untuk cemilan langsung atau teman makan nasi.', 197),
(7, 1, 'Sembelingkung | Abon Ikan Tenggiri', 40000, 100, 'abontenggiri.png', '          Abon Ikan tenggiri terbaik. Makanan sehat tradisional abon ikan tenggiri (SEMBELINGKUNG) asli.\r\n\r\nUntuk memastikan produk kami dinikmati oleh pelanggan dalam kondisi terbaik, kini abon ikan ternggiri hadir dengan kemasan vacuum dan ziplock alluminium standing pouch. Membuat penyimpanan menjadi lebih praktis dan tahan lama tanpa perlu repot mencari kontainer kedap udara lagi. Kemasan ini bisa membantu menjaga kualitas abon bertahan lebih lama jika belum habis di konsumsi.\r\n\r\nAlasan abon ikan ini menjadi produk unggulan:\r\n\r\n\r\nKomposisi:\r\n- Daging ikan tenggiri segar pilihan\r\n- Rempah - rempah pilihan\r\n\r\n\r\n- Langsung dikirim dari bangka..\r\n- Dibuat dengan cara tradisional sehingga terjamin keasliannya.\r\n- Mengandung banyak vitamin dan omega3 yang penting bagi perkembangan otak anak.\r\n- Kesegaran terjagaleb\r\n- Tanpa pengawet\r\n- Dengan kemasan penyimpanan yang tepat kualitas abon bisa terjaga lebih dari 6 bulan\r\n\r\nSatu bungkus seperti di gambar bawah ini bisa buat sarapan ditaburkan di roti atau ditaburin di atas nasi.. Praktis untuk bekal anak sekolah atau bekal ke kantor.        ', 199),
(8, 2, 'Kopi Bubuk Cap 1 Roasted', 32000, 350, 'Kopi.jpg', '          Bangka dan Belitung bukan penghasil kopi. Namun memiliki peracik kopi yang mumpuni.\r\n\r\nKopi Cap 1 sejak 1968 menemani pencinta kopi di Bangka.\r\nRasakan kenikmatan khas kopi dari kepulauan Bangka Belitung        ', 198),
(9, 1, 'Kericu | Keripik Telor Cumi', 30000, 200, 'kericu.jpg', 'Keripik telor cumi atau biasa disebut kericu memiliki rasa gurih terbuat dari campuran telur cumi. Untuk yang kualitas super, rasa telur cumi nya sangat berasa. Berbeda dengan yang kualitas biasa. Sangat cocok untuk cemilan. Makan satu tidak pernah cukup.', 197),
(10, 2, 'Rusip', 20000, 350, 'rusip.jpg', 'Rusip adalah makanan khas Bangka terbuat dari ikan bilis mentah yang di fermentasi.\r\n\r\nCocok untuk cocolan lalapan atau campuran bumbu masak.\r\n\r\nAroma dan rasanya yang khas .', 99);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk_foto`
--

INSERT INTO `produk_foto` (`id_produk_foto`, `id_produk`, `nama_produk_foto`) VALUES
(2, 8, 'vinicius-amnx-amano-fdiXdOdYtLE-unsplash.jpg'),
(3, 8, 'sincerely-media-CXYPfveiuis-unsplash.jpg'),
(5, 8, '20200905085618sincerely-media-CXYPfveiuis-unsplash.jpg'),
(6, 6, 'sincerely-media-CXYPfveiuis-unsplash.jpg'),
(7, 7, 'abontenggiri.png'),
(8, 8, 'Kopi.jpg'),
(9, 9, 'kericu.jpg'),
(10, 10, 'rusip.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
