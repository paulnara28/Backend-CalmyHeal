-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 08:58 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_calmyheal`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `pengarang` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `image`, `judul`, `pengarang`, `deskripsi`, `created_at`) VALUES
(1, NULL, 'Problem-Focused Coping Strategies', 'Riani hariani', '<h1>Problem-Focused Coping Strategies</h1>\r\n    <p><strong>“Pokoknya masalah harus selesai”</strong></p>\r\n    <p>Problem-focused coping strategies adalah sebuah strategi coping dalam mengurangi stressor dengan mempelajari hal baru atau sebuah keterampilan baru, yang digunakan untuk mengubah situasi, keadaan, atau pokok permasalahan (Horwitz, 2011). Individu yang menggunakan problem-focused coping strategies cenderung menggunakan strategi yang bersifat kognitif secara langsung, yang digunakan untuk menyelesaikan dan mencari informasi yang dapat digunakan untuk memecahkan masalah (Adriyani, 2014). Strategi kognitif dilakukan untuk mengatasi stres dan menemukan langkah yang baik dalam mengatasi stres dengan cara memodifikasi, mengubah, atau meminimalisir situasi yang sifatnya mengancam. Problem-focused coping strategies biasanya digunakan untuk mengatasi masalah-masalah yang mungkin dapat dikontrol oleh individu (Atmajayanthi, 2017).</p>\r\n</body>', '2024-06-18 00:00:00'),
(2, NULL, 'Emotional-Focused Coping Strategies', 'Hariano surya', '<p>Emotional-Focused Coping Strategies Emotional-focused coping strategies adalah sebuah usaha dari individu dalam mengendalikan respon emosional terhadap kodisi yang bersifat sangat menekan (Folkman, 2013). Strategi coping ini bersifat defensif, karena individu merespon stres secara emosional. dengan berupaya mencari dukungan secara sosial, individu yang menggunakan strategi coping secara emosional lebih menitikberatkan dalam upaya pengurangan emosi negatif ketika menghadapi tekanan. Emotional-focused coping strategies digunakan ketika individu mengalami masalah yang tidak bisa dikontrol (Adriyani 2014). Dukungan yang dimaksud dari strategi coping ini adalah sebuah dukungan yang berasal dari sahabat, keluarga, melakukan aktivitas lain yang sifatnya lebih positif. aktivitas ini bisa merujuk pada olahraga, melakukan hobi positif, berdoa kepada tuhan, dan lain sebagainya dalam menekan stressor (Safaria dan Saputra, 2012).</p>', '2024-06-18 00:00:00'),
(3, NULL, 'Manajemen Waktu Untuk Mengurangi stres', 'Samina mina', '<p>Cinta, dukungan, dan hubungan yang erat dengan keluarga serta orang-orang terdekat memiliki dampak positif pada kesehatan mental remaja. Promosi kesehatan mental bertujuan untuk meningkatkan kesejahteraan psikologis dan mengurangi risiko gangguan mental dengan menciptakan lingkungan yang mendukung. Cara praktis untuk mempromosikan kesehatan mental remaja termasuk memberikan perhatian dan dukungan, berbicara terbuka tentang perasaan, serta menjaga keseimbangan antara kesehatan fisik dan mental.</p>', '2024-06-18 22:33:05');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `image`) VALUES
(1, 'Filosofi Teras', 'Siamngunsong', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `summaries`
--

CREATE TABLE `summaries` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `chapter` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `summaries`
--

INSERT INTO `summaries` (`id`, `book_id`, `chapter`, `content`, `created_at`) VALUES
(1, 1, 1, '<h1>Pengenalan Stoisisme</h1>\r\n<p>Henry Manampiring memperkenalkan pembaca pada Stoisisme, sebuah filosofi kuno yang didirikan oleh Zeno dari Citium di awal abad ke-3 SM. Filosofi ini berkembang di Yunani dan Roma dengan tokoh-tokoh terkenal seperti Epictetus, Seneca, dan Marcus Aurelius. Zeno mengajarkan di sebuah beranda berpilar yang disebut \"Stoa Poikile,\" yang kemudian menjadi asal nama Stoisisme. Epictetus, seorang mantan budak, menjadi filsuf Stoik terkemuka dengan karyanya \"Enchiridion,\" sementara Seneca, seorang penulis dan penasihat Kaisar Nero, dikenal melalui \"Letters to Lucilius.\" Marcus Aurelius, Kaisar Romawi, menulis \"Meditations,\" sebuah koleksi catatan pribadinya tentang kehidupan dan filosofi Stoik.</p>\r\n<h1>Prinsip-prinsip Dasar Stoisisme</h1>\r\n<p>Stoisisme menekankan hidup sesuai dengan alam dan kodrat manusia sebagai makhluk rasional, dengan empat kebajikan utama: kebijaksanaan, keberanian, keadilan, dan pengendalian diri. Filosofi ini praktis dan dapat diterapkan dalam kehidupan sehari-hari. Salah satu prinsip inti Stoisisme adalah dikotomi kendali, yang mengajarkan kita untuk membedakan antara hal-hal yang bisa kita kendalikan, seperti pikiran, tindakan, dan sikap kita, dan hal-hal yang tidak bisa kita kendalikan, seperti peristiwa eksternal dan tindakan orang lain. Dengan fokus pada apa yang bisa kita kendalikan, kita dapat mengurangi stres dan kecemasan serta membangun ketenangan batin melalui penerimaan realitas.</p>\r\n', '2024-06-21 10:42:46'),
(2, 1, 2, '<h1>Amor Fati : Menerima dan Mencintai Takdir</h1>\r\n<p>Selain itu, Stoisisme mengajarkan konsep Amor Fati, yang berarti menerima dan mencintai takdir kita. Dengan menerima segala sesuatu yang terjadi sebagai bagian dari hidup kita, kita dapat membangun ketahanan mental dan mengurangi penderitaan emosional. Bab tentang pengendalian diri menekankan pentingnya kebajikan ini dalam menghindari ekses dan menemukan keseimbangan dalam hidup. Dengan mengendalikan hasrat dan keinginan, kita dapat mencapai hidup yang harmonis dan sehat, serta menghindari perilaku impulsif yang merusak. Praktik harian dalam pengendalian diri, seperti makan dengan bijak, mengelola emosi, dan menjaga pola hidup seimbang, sangat dianjurkan. Refleksi diri membantu kita memahami dan mengendalikan dorongan berlebihan. Dengan pemahaman yang mendalam tentang sejarah, tokoh-tokoh utama, dan konsep-konsep inti Stoisisme dari Bab 1 hingga Bab 5, pembaca diajak untuk mengintegrasikan filosofi ini dalam kehidupan mereka. Hal ini bertujuan untuk mencapai kebahagiaan dan kedamaian batin melalui kebijaksanaan, penerimaan, dan pengendalian diri.</p>', '2024-06-21 10:42:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `notelp` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `notelp`, `created_at`) VALUES
(1, 'Maulina', 'maulina11@gmail.com', '$2a$10$IXm3cVUW2XNTpp8wgQE47OBEgflbvnsnRCdGAqAFtcu8Z1U8HS7rq', '08779898000', '2024-06-18 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `summaries`
--
ALTER TABLE `summaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `summaries`
--
ALTER TABLE `summaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `summaries`
--
ALTER TABLE `summaries`
  ADD CONSTRAINT `summaries_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
