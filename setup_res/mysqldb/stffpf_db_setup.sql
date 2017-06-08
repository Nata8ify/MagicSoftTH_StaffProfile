-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 08, 2017 at 04:23 PM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mgsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `staffId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `division` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protraitPath` text COLLATE utf8_unicode_ci,
  `hostManagerId` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staffType` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`staffId`, `gender`, `name`, `email`, `tel`, `division`, `position`, `protraitPath`, `hostManagerId`, `staffType`) VALUES
('M00000', 'f', 'Nudee Paisoonsin', NULL, NULL, NULL, NULL, NULL, NULL, 'a');

-- --------------------------------------------------------

--
-- Table structure for table `StaffAccess`
--

CREATE TABLE `StaffAccess` (
  `staffId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `StaffAccess`
--

INSERT INTO `StaffAccess` (`staffId`, `password`) VALUES
('M00000', '1f7c381e83c87b875265b52adc64617a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`staffId`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `StaffAccess`
--
ALTER TABLE `StaffAccess`
  ADD UNIQUE KEY `staffId` (`staffId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `StaffAccess`
--
ALTER TABLE `StaffAccess`
  ADD CONSTRAINT `StaffAccess_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `Staff` (`staffId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
