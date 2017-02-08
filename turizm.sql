-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2017 at 10:45 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turizm`
--

-- --------------------------------------------------------

--
-- Table structure for table `isciler`
--

CREATE TABLE `isciler` (
  `id` int(11) NOT NULL,
  `iscilerin_rolu` varchar(50) DEFAULT NULL,
  `ad` varchar(50) DEFAULT NULL,
  `soyad` varchar(50) DEFAULT NULL,
  `musteri_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isciler`
--

INSERT INTO `isciler` (`id`, `iscilerin_rolu`, `ad`, `soyad`, `musteri_id`) VALUES
(1, 'administrator', 'Vaqif', 'Cavadov', 1);

-- --------------------------------------------------------

--
-- Table structure for table `isci_musteri`
--

CREATE TABLE `isci_musteri` (
  `id` int(11) NOT NULL,
  `isci_id` int(11) DEFAULT NULL,
  `musteri_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isci_musteri`
--

INSERT INTO `isci_musteri` (`id`, `isci_id`, `musteri_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `musteriler`
--

CREATE TABLE `musteriler` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) DEFAULT NULL,
  `soyad` varchar(50) DEFAULT NULL,
  `tur_id` int(11) DEFAULT NULL,
  `xerclediyi_mebleg` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `musteriler`
--

INSERT INTO `musteriler` (`id`, `ad`, `soyad`, `tur_id`, `xerclediyi_mebleg`) VALUES
(1, 'Abbas', 'Abbaszade', 1, 20),
(2, 'Celil', 'Dadasov', 2, 40);

-- --------------------------------------------------------

--
-- Table structure for table `turlar`
--

CREATE TABLE `turlar` (
  `id` int(11) NOT NULL,
  `turun_yeri` varchar(50) DEFAULT NULL,
  `teleb_sayi` int(11) DEFAULT NULL,
  `turun_qiymeti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `turlar`
--

INSERT INTO `turlar` (`id`, `turun_yeri`, `teleb_sayi`, `turun_qiymeti`) VALUES
(1, 'qebele', 100, 20),
(2, 'quba', 50, 40);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `isciler`
--
ALTER TABLE `isciler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `musteri_id` (`musteri_id`);

--
-- Indexes for table `isci_musteri`
--
ALTER TABLE `isci_musteri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isci_id` (`isci_id`),
  ADD KEY `musteri_id` (`musteri_id`);

--
-- Indexes for table `musteriler`
--
ALTER TABLE `musteriler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tur_id` (`tur_id`),
  ADD KEY `xerclediyi_mebleg` (`xerclediyi_mebleg`);

--
-- Indexes for table `turlar`
--
ALTER TABLE `turlar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `turun_qiymeti` (`turun_qiymeti`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `isciler`
--
ALTER TABLE `isciler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `isci_musteri`
--
ALTER TABLE `isci_musteri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `musteriler`
--
ALTER TABLE `musteriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `turlar`
--
ALTER TABLE `turlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `isciler`
--
ALTER TABLE `isciler`
  ADD CONSTRAINT `isciler_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteriler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `isci_musteri`
--
ALTER TABLE `isci_musteri`
  ADD CONSTRAINT `isci_musteri_ibfk_1` FOREIGN KEY (`isci_id`) REFERENCES `isciler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `isci_musteri_ibfk_2` FOREIGN KEY (`musteri_id`) REFERENCES `musteriler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `musteriler`
--
ALTER TABLE `musteriler`
  ADD CONSTRAINT `musteriler_ibfk_1` FOREIGN KEY (`tur_id`) REFERENCES `turlar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `musteriler_ibfk_2` FOREIGN KEY (`xerclediyi_mebleg`) REFERENCES `turlar` (`turun_qiymeti`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
