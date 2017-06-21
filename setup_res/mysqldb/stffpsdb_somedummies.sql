-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 21, 2017 at 09:46 AM
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
  `honorific` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nameLocale` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobileTel` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `division` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protraitPath` text COLLATE utf8_unicode_ci,
  `hostManagerId` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staffType` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`staffId`, `honorific`, `name`, `nameLocale`, `email`, `tel`, `mobileTel`, `division`, `position`, `protraitPath`, `hostManagerId`, `staffType`) VALUES
('M00000', 'Mrs', 'Nudee Paisoonsin', 'นุดี ภัยสูญสิ้น', 'M60000@staff.mgs.com', '004-375000', '+66845711000', 'Development Department', 'Programmer', NULL, 'M60001', 'a'),
('M60001', 'Ms', 'Pantita Udomanong', 'ปัณฑิตา อุดมอนงค์', 'M60001@staff.mgs.com', '034-375001', '+66845708901', 'Development Department', 'Head of Development Department', NULL, '', 'm'),
('M60002', 'Mr', 'Pradit Wata', 'ประดิษฐ์ วาทะ', 'M60002@staff.mgs.com', '034-375002', '+66845708902', 'Marketing Department', 'Head of Marketing Department', NULL, '', 'm'),
('M60003', 'Mrs', 'Wiparda Kamsanya', 'วิภาดา คำสัญญา', 'M60003@staff.mgs.com', '034-375003', '+66845708903', 'Development Department', 'System Tester', NULL, 'M60001', 's'),
('M60004', 'Mr', 'Somsak Lilit', 'สมสักดิ์ ลิลิตต์', 'M60004@staff.mgs.com', '034-375004', '+66845708904', 'Organization Management', 'Head of Financial Department', NULL, '', 'm'),
('M60005', 'Mr', 'Siwachat Pawarit', 'ศิวฉัตร ปวริศ', 'M60005@staff.mgs.com', '034-375006', '+66845708906', 'Development Department', 'Programmer', NULL, 'M60001', 's'),
('M60006', 'Ms', 'Davika Waretroon', 'ดาวิกา วเรศรุ่น', 'M60006@staff.mgs.com', '034-375006', '+66845711006', 'Marketing Department', 'Market Analysis', NULL, NULL, 's'),
('M60007', 'Mr', 'Dau Ngoc Tho ', '', 'M60007@staff.mgs.com', '034-375007', '+66845711007', 'Development Department', 'Programmer', NULL, NULL, 's'),
('M60009', 'Mrs', 'Manasawee Pinpatjek', 'มนัสสวี ปิ่นปัจเจก', 'M60009@staff.mgs.com', '034-375009', '+66845711009', 'Marketing Department', 'Product Marketing Manager', NULL, 'M60002', 's'),
('M60010', 'Ms', 'Sawitee Jaraoh', 'สาวิตี จาเราะห์', 'M60010@staff.mgs.com', '034-375010', '+66845711010', 'Marketing Department', 'Product Manager', NULL, 'M60002', 's'),
('M60011', 'Mrs', 'Praweerada Wantakitti', 'ประวิรดา วันทากิตติ', 'M60011@staff.mgs.com', '034-375011', '+66845711011', 'Financial Department', 'Cost Accountant', NULL, 'M60004', 's');

-- --------------------------------------------------------

--
-- Table structure for table `StaffAccess`
--

CREATE TABLE `StaffAccess` (
  `staffId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stffpsRole` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Staff Profile System Role',
  `rmreservRole` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Room Reservation System Role'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `StaffAccess`
--

INSERT INTO `StaffAccess` (`staffId`, `password`, `stffpsRole`, `rmreservRole`) VALUES
('M00000', '1f7c381e83c87b875265b52adc64617a', 'a', NULL),
('M60001', '1f7c381e83c87b875265b52adc64617a', NULL, NULL),
('M60002', 'c6903bfad07dee3d10f6e7ced271492c', NULL, NULL),
('M60003', 'c6903bfad07dee3d10f6e7ced271492c', NULL, NULL),
('M60004', 'c6903bfad07dee3d10f6e7ced271492c', NULL, NULL),
('M60005', 'c6903bfad07dee3d10f6e7ced271492c', NULL, NULL),
('M60006', 'c6903bfad07dee3d10f6e7ced271492c', NULL, NULL),
('M60007', 'c6903bfad07dee3d10f6e7ced271492c', NULL, NULL),
('M60009', 'c6903bfad07dee3d10f6e7ced271492c', NULL, NULL),
('M60010', 'c6903bfad07dee3d10f6e7ced271492c', NULL, NULL),
('M60011', '1f7c381e83c87b875265b52adc64617a', NULL, NULL);

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
