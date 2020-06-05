-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2020 at 07:56 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicine`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `buyer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `buyer_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `item_id` int(11) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `buyer_user` int(11) NOT NULL,
  `med_id` int(11) NOT NULL,
  `med_rol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`item_id`, `item_quantity`, `buyer_user`, `med_id`, `med_rol`) VALUES
(1, 1, 1, 66, 'generic'),
(2, 1, 1, 176, 'generic'),
(4, 6, 2, 296, 'local'),
(5, 5, 2, 106, 'generic'),
(6, 4, 3, 160, 'generic');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `ddelivery_id` int(10) NOT NULL,
  `order_time` datetime NOT NULL,
  `delivery_time` datetime NOT NULL,
  `duser_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(10) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `user_first_name` varchar(30) NOT NULL,
  `user_last_name` varchar(30) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `user_category` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `user_email`, `user_pass`, `user_first_name`, `user_last_name`, `user_address`, `user_category`) VALUES
(1, 'user1@gmail.com', '$2b$12$O0lIeFUgjHos82YMqutFCuS4lB2sJHx.1cBFag8lOBRBe0WOXEEqW', 'User', '1', 'address1', 'customer'),
(2, 'user2@gmail.com', '$2b$12$flXguhmAeUOhCmvKFM5cEOaURvZ9f57DAnOLuXkhjWXWQF3XqhJKm', 'User', '2', 'address2', 'customer'),
(3, 'user3@gmail.com', '$2b$12$.1WExIxHPmvpNfUllm0Dse5vkTcojrm5DT9HXHdWVW0uKS17WaIaK', 'User', '3', 'address3', 'customer'),
(4, 'user4@gmail.com', '$2b$12$vXgD8KDi5tETRBl4d3MWkuZBafJt9lQx4KtF5D4oT9MB1wv695SZm', 'User', '4', 'address4', 'customer'),
(5, 'user5@gmail.com', '$2b$12$LoChzXgXfyLjyGgLrBDc/.T.uiBmrFwNo6czzreQPmbJVAKyJCrbi', 'User', '5', 'address5', 'customer'),
(6, 'user6@gmail.com', '$2b$12$PNxQP2HxC2TiIBMyQPGwouy0vx8myL8WCZlUDt6ChREdkj2svW/qW', 'User', '6', 'address6', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `med_id` int(10) NOT NULL,
  `med_name` varchar(30) NOT NULL,
  `med_brandname` varchar(30) NOT NULL,
  `med_purpose` varchar(100) NOT NULL,
  `med_expiry` datetime NOT NULL,
  `dosage_form` varchar(100) NOT NULL,
  `med_price` int(10) NOT NULL,
  `med_role` varchar(10) NOT NULL,
  `med_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`med_id`, `med_name`, `med_brandname`, `med_purpose`, `med_expiry`, `dosage_form`, `med_price`, `med_role`, `med_quantity`) VALUES
(1, 'med1', 'brand1', 'p8', '2022-02-04 00:00:00', '2 times a day', 543, 'local', 298),
(1, 'med1', 'brand2', 'p8', '2025-08-07 00:00:00', '2 times a day', 181, 'generic', 146),
(2, 'med2', 'brand2', 'p5', '2022-06-03 00:00:00', 'Once in a week', 574, 'local', 171),
(2, 'med2', 'brand3', 'p5', '2029-10-15 00:00:00', 'Once in a week', 191, 'generic', 173),
(3, 'med3', 'brand3', 'p7', '2023-10-16 00:00:00', 'Whenever pain occurs take one medicine', 272, 'local', 209),
(3, 'med3', 'brand4', 'p7', '2020-06-03 00:00:00', 'Whenever pain occurs take one medicine', 91, 'generic', 188),
(4, 'med4', 'brand4', 'p2', '2023-06-08 00:00:00', 'Whenever pain occurs take half medicine', 100, 'local', 91),
(4, 'med4', 'brand5', 'p2', '2022-11-14 00:00:00', 'Whenever pain occurs take half medicine', 33, 'generic', 233),
(5, 'med5', 'brand5', 'p6', '2027-12-16 00:00:00', '2 times a day', 291, 'local', 298),
(5, 'med5', 'brand6', 'p6', '2020-05-22 00:00:00', '2 times a day', 97, 'generic', 234),
(6, 'med6', 'brand6', 'p3', '2029-07-04 00:00:00', '1 capsule every night before going to sleep', 309, 'local', 203),
(6, 'med6', 'brand7', 'p3', '2028-12-15 00:00:00', '1 capsule every night before going to sleep', 103, 'generic', 86),
(7, 'med7', 'brand7', 'p5', '2027-01-28 00:00:00', '2 times a day', 217, 'local', 159),
(7, 'med7', 'brand8', 'p5', '2026-04-06 00:00:00', '2 times a day', 72, 'generic', 158),
(8, 'med8', 'brand8', 'p1', '2025-03-02 00:00:00', 'Whenever pain occurs take one medicine', 145, 'local', 19),
(8, 'med8', 'brand9', 'p1', '2028-07-18 00:00:00', 'Whenever pain occurs take one medicine', 48, 'generic', 162),
(9, 'med9', 'brand9', 'p6', '2030-02-12 00:00:00', 'Whenever pain occurs take one medicine', 356, 'local', 290),
(9, 'med9', 'brand10', 'p6', '2025-09-07 00:00:00', 'Whenever pain occurs take one medicine', 119, 'generic', 205),
(10, 'med10', 'brand10', 'p7', '2022-09-15 00:00:00', 'Whenever pain occurs take one medicine', 566, 'local', 88),
(10, 'med10', 'brand11', 'p7', '2028-02-02 00:00:00', 'Whenever pain occurs take one medicine', 189, 'generic', 94),
(11, 'med11', 'brand11', 'p8', '2029-10-09 00:00:00', '2 times a day', 410, 'local', 147),
(11, 'med11', 'brand12', 'p8', '2026-11-05 00:00:00', '2 times a day', 137, 'generic', 65),
(12, 'med12', 'brand12', 'p8', '2025-03-15 00:00:00', '1 capsule every night before going to sleep', 275, 'local', 251),
(12, 'med12', 'brand13', 'p8', '2023-02-02 00:00:00', '1 capsule every night before going to sleep', 92, 'generic', 36),
(13, 'med13', 'brand13', 'p2', '2024-11-19 00:00:00', '3 times a day', 469, 'local', 159),
(13, 'med13', 'brand14', 'p2', '2023-12-23 00:00:00', '3 times a day', 156, 'generic', 278),
(14, 'med14', 'brand14', 'p8', '2021-05-22 00:00:00', 'Whenever pain occurs take half medicine', 131, 'local', 274),
(14, 'med14', 'brand15', 'p8', '2024-08-09 00:00:00', 'Whenever pain occurs take half medicine', 44, 'generic', 199),
(15, 'med15', 'brand15', 'p4', '2023-11-10 00:00:00', '2 times a day', 363, 'local', 195),
(15, 'med15', 'brand16', 'p4', '2020-07-23 00:00:00', '2 times a day', 121, 'generic', 34),
(16, 'med16', 'brand16', 'p5', '2024-03-21 00:00:00', 'Whenever pain occurs take one medicine', 254, 'local', 24),
(16, 'med16', 'brand17', 'p5', '2025-11-03 00:00:00', 'Whenever pain occurs take one medicine', 85, 'generic', 15),
(17, 'med17', 'brand17', 'p1', '2024-02-26 00:00:00', 'Whenever pain occurs take one medicine', 222, 'local', 292),
(17, 'med17', 'brand18', 'p1', '2030-02-09 00:00:00', 'Whenever pain occurs take one medicine', 74, 'generic', 220),
(18, 'med18', 'brand18', 'p7', '2028-04-22 00:00:00', '1 capsule every night before going to sleep', 386, 'local', 58),
(18, 'med18', 'brand19', 'p7', '2024-07-02 00:00:00', '1 capsule every night before going to sleep', 129, 'generic', 175),
(19, 'med19', 'brand19', 'p3', '2029-08-27 00:00:00', 'Whenever pain occurs take half medicine', 557, 'local', 256),
(19, 'med19', 'brand20', 'p3', '2024-10-08 00:00:00', 'Whenever pain occurs take half medicine', 186, 'generic', 217),
(20, 'med20', 'brand20', 'p2', '2030-04-08 00:00:00', 'Whenever pain occurs take half medicine', 441, 'local', 99),
(20, 'med20', 'brand21', 'p2', '2025-02-28 00:00:00', 'Whenever pain occurs take half medicine', 147, 'generic', 16),
(21, 'med21', 'brand21', 'p7', '2023-09-04 00:00:00', '2 times a day', 310, 'local', 96),
(21, 'med21', 'brand22', 'p7', '2030-04-12 00:00:00', '2 times a day', 103, 'generic', 260),
(22, 'med22', 'brand22', 'p6', '2020-02-06 00:00:00', '1 capsule every night before going to sleep', 379, 'local', 206),
(22, 'med22', 'brand23', 'p6', '2024-03-12 00:00:00', '1 capsule every night before going to sleep', 126, 'generic', 144),
(23, 'med23', 'brand23', 'p5', '2030-07-04 00:00:00', '1 capsule every night before going to sleep', 143, 'local', 184),
(23, 'med23', 'brand24', 'p5', '2023-06-15 00:00:00', '1 capsule every night before going to sleep', 48, 'generic', 168),
(24, 'med24', 'brand24', 'p3', '2020-12-12 00:00:00', '3 times a day', 385, 'local', 68),
(24, 'med24', 'brand25', 'p3', '2028-07-19 00:00:00', '3 times a day', 128, 'generic', 288),
(25, 'med25', 'brand25', 'p1', '2021-02-10 00:00:00', 'Whenever pain occurs take half medicine', 547, 'local', 273),
(25, 'med25', 'brand26', 'p1', '2029-10-22 00:00:00', 'Whenever pain occurs take half medicine', 182, 'generic', 222),
(26, 'med26', 'brand26', 'p5', '2029-01-16 00:00:00', 'Once in a week', 442, 'local', 50),
(26, 'med26', 'brand27', 'p5', '2028-07-01 00:00:00', 'Once in a week', 147, 'generic', 239),
(27, 'med27', 'brand27', 'p7', '2030-05-04 00:00:00', 'Once in a week', 210, 'local', 62),
(27, 'med27', 'brand28', 'p7', '2030-05-20 00:00:00', 'Once in a week', 70, 'generic', 228),
(28, 'med28', 'brand28', 'p6', '2029-12-03 00:00:00', '1 capsule every night before going to sleep', 164, 'local', 189),
(28, 'med28', 'brand29', 'p6', '2023-03-05 00:00:00', '1 capsule every night before going to sleep', 55, 'generic', 37),
(29, 'med29', 'brand29', 'p2', '2024-02-16 00:00:00', 'Whenever pain occurs take half medicine', 245, 'local', 202),
(29, 'med29', 'brand30', 'p2', '2030-03-11 00:00:00', 'Whenever pain occurs take half medicine', 82, 'generic', 221),
(30, 'med30', 'brand30', 'p1', '2024-12-12 00:00:00', '1 capsule every night before going to sleep', 236, 'local', 211),
(30, 'med30', 'brand31', 'p1', '2024-02-06 00:00:00', '1 capsule every night before going to sleep', 79, 'generic', 117),
(31, 'med31', 'brand31', 'p1', '2026-05-12 00:00:00', '1 capsule every night before going to sleep', 328, 'local', 62),
(31, 'med31', 'brand32', 'p1', '2020-06-17 00:00:00', '1 capsule every night before going to sleep', 109, 'generic', 290),
(32, 'med32', 'brand32', 'p8', '2027-02-21 00:00:00', '1 capsule every night before going to sleep', 337, 'local', 255),
(32, 'med32', 'brand33', 'p8', '2030-08-01 00:00:00', '1 capsule every night before going to sleep', 112, 'generic', 135),
(33, 'med33', 'brand33', 'p1', '2029-07-02 00:00:00', '1 capsule every night before going to sleep', 590, 'local', 12),
(33, 'med33', 'brand34', 'p1', '2028-11-20 00:00:00', '1 capsule every night before going to sleep', 197, 'generic', 43),
(34, 'med34', 'brand34', 'p3', '2030-01-02 00:00:00', 'Whenever pain occurs take half medicine', 407, 'local', 290),
(34, 'med34', 'brand35', 'p3', '2030-06-13 00:00:00', 'Whenever pain occurs take half medicine', 136, 'generic', 136),
(35, 'med35', 'brand35', 'p4', '2023-07-18 00:00:00', 'Once in a week', 93, 'local', 123),
(35, 'med35', 'brand36', 'p4', '2025-05-04 00:00:00', 'Once in a week', 31, 'generic', 18),
(36, 'med36', 'brand36', 'p4', '2022-08-07 00:00:00', '3 times a day', 91, 'local', 213),
(36, 'med36', 'brand37', 'p4', '2020-11-02 00:00:00', '3 times a day', 30, 'generic', 223),
(37, 'med37', 'brand37', 'p2', '2026-05-18 00:00:00', '1 capsule every night before going to sleep', 82, 'local', 225),
(37, 'med37', 'brand38', 'p2', '2020-12-07 00:00:00', '1 capsule every night before going to sleep', 27, 'generic', 38),
(38, 'med38', 'brand38', 'p3', '2029-04-19 00:00:00', '3 times a day', 64, 'local', 10),
(38, 'med38', 'brand39', 'p3', '2026-02-16 00:00:00', '3 times a day', 21, 'generic', 292),
(39, 'med39', 'brand39', 'p2', '2025-01-03 00:00:00', '1 capsule every night before going to sleep', 354, 'local', 184),
(39, 'med39', 'brand40', 'p2', '2029-06-06 00:00:00', '1 capsule every night before going to sleep', 118, 'generic', 128),
(40, 'med40', 'brand40', 'p2', '2026-06-05 00:00:00', '3 times a day', 516, 'local', 218),
(40, 'med40', 'brand41', 'p2', '2023-04-27 00:00:00', '3 times a day', 172, 'generic', 92),
(41, 'med41', 'brand41', 'p2', '2024-02-27 00:00:00', '1 capsule every night before going to sleep', 203, 'local', 194),
(41, 'med41', 'brand42', 'p2', '2029-07-08 00:00:00', '1 capsule every night before going to sleep', 68, 'generic', 156),
(42, 'med42', 'brand42', 'p3', '2023-11-04 00:00:00', 'Whenever pain occurs take half medicine', 90, 'local', 24),
(42, 'med42', 'brand43', 'p3', '2021-03-04 00:00:00', 'Whenever pain occurs take half medicine', 30, 'generic', 65),
(43, 'med43', 'brand43', 'p1', '2027-06-25 00:00:00', '1 capsule every night before going to sleep', 462, 'local', 226),
(43, 'med43', 'brand44', 'p1', '2020-01-12 00:00:00', '1 capsule every night before going to sleep', 154, 'generic', 196),
(44, 'med44', 'brand44', 'p3', '2020-04-28 00:00:00', '1 capsule every night before going to sleep', 264, 'local', 116),
(44, 'med44', 'brand45', 'p3', '2026-05-01 00:00:00', '1 capsule every night before going to sleep', 88, 'generic', 53),
(45, 'med45', 'brand45', 'p3', '2025-08-10 00:00:00', 'Whenever pain occurs take one medicine', 502, 'local', 161),
(45, 'med45', 'brand46', 'p3', '2022-01-08 00:00:00', 'Whenever pain occurs take one medicine', 167, 'generic', 220),
(46, 'med46', 'brand46', 'p1', '2026-05-28 00:00:00', 'Whenever pain occurs take one medicine', 511, 'local', 53),
(46, 'med46', 'brand47', 'p1', '2025-09-02 00:00:00', 'Whenever pain occurs take one medicine', 170, 'generic', 284),
(47, 'med47', 'brand47', 'p6', '2029-06-04 00:00:00', 'Whenever pain occurs take half medicine', 596, 'local', 192),
(47, 'med47', 'brand48', 'p6', '2026-11-27 00:00:00', 'Whenever pain occurs take half medicine', 199, 'generic', 130),
(48, 'med48', 'brand48', 'p2', '2022-07-27 00:00:00', '1 capsule every night before going to sleep', 220, 'local', 22),
(48, 'med48', 'brand49', 'p2', '2030-10-16 00:00:00', '1 capsule every night before going to sleep', 73, 'generic', 167),
(49, 'med49', 'brand49', 'p6', '2026-06-23 00:00:00', 'Once in a week', 134, 'local', 76),
(49, 'med49', 'brand50', 'p6', '2020-03-06 00:00:00', 'Once in a week', 45, 'generic', 258),
(50, 'med50', 'brand50', 'p4', '2030-11-18 00:00:00', 'Once in a week', 415, 'local', 171),
(50, 'med50', 'brand51', 'p4', '2024-09-02 00:00:00', 'Once in a week', 138, 'generic', 150),
(51, 'med51', 'brand51', 'p6', '2029-10-08 00:00:00', '1 capsule every night before going to sleep', 259, 'local', 225),
(51, 'med51', 'brand52', 'p6', '2022-02-21 00:00:00', '1 capsule every night before going to sleep', 86, 'generic', 289),
(52, 'med52', 'brand52', 'p8', '2026-06-25 00:00:00', 'Once in a week', 508, 'local', 282),
(52, 'med52', 'brand53', 'p8', '2024-07-01 00:00:00', 'Once in a week', 169, 'generic', 274),
(53, 'med53', 'brand53', 'p8', '2023-03-05 00:00:00', '3 times a day', 247, 'local', 173),
(53, 'med53', 'brand54', 'p8', '2027-06-08 00:00:00', '3 times a day', 82, 'generic', 201),
(54, 'med54', 'brand54', 'p7', '2020-10-09 00:00:00', 'Once in a week', 497, 'local', 241),
(54, 'med54', 'brand55', 'p7', '2027-02-02 00:00:00', 'Once in a week', 166, 'generic', 64),
(55, 'med55', 'brand55', 'p4', '2020-01-12 00:00:00', '1 capsule every night before going to sleep', 167, 'local', 164),
(55, 'med55', 'brand56', 'p4', '2023-02-06 00:00:00', '1 capsule every night before going to sleep', 56, 'generic', 120),
(56, 'med56', 'brand56', 'p6', '2026-05-16 00:00:00', '3 times a day', 503, 'local', 271),
(56, 'med56', 'brand57', 'p6', '2028-11-10 00:00:00', '3 times a day', 168, 'generic', 280),
(57, 'med57', 'brand57', 'p4', '2030-01-17 00:00:00', 'Whenever pain occurs take half medicine', 378, 'local', 87),
(57, 'med57', 'brand58', 'p4', '2028-04-27 00:00:00', 'Whenever pain occurs take half medicine', 126, 'generic', 182),
(58, 'med58', 'brand58', 'p4', '2023-11-06 00:00:00', 'Whenever pain occurs take one medicine', 70, 'local', 155),
(58, 'med58', 'brand59', 'p4', '2022-06-09 00:00:00', 'Whenever pain occurs take one medicine', 23, 'generic', 64),
(59, 'med59', 'brand59', 'p4', '2021-03-26 00:00:00', '2 times a day', 570, 'local', 221),
(59, 'med59', 'brand60', 'p4', '2023-07-07 00:00:00', '2 times a day', 190, 'generic', 69),
(60, 'med60', 'brand60', 'p3', '2028-05-27 00:00:00', '3 times a day', 165, 'local', 287),
(60, 'med60', 'brand61', 'p3', '2020-01-11 00:00:00', '3 times a day', 55, 'generic', 297),
(61, 'med61', 'brand61', 'p4', '2026-06-14 00:00:00', '1 capsule every night before going to sleep', 62, 'local', 129),
(61, 'med61', 'brand62', 'p4', '2023-02-17 00:00:00', '1 capsule every night before going to sleep', 21, 'generic', 117),
(62, 'med62', 'brand62', 'p5', '2030-08-01 00:00:00', '1 capsule every night before going to sleep', 412, 'local', 16),
(62, 'med62', 'brand63', 'p5', '2025-04-10 00:00:00', '1 capsule every night before going to sleep', 137, 'generic', 107),
(63, 'med63', 'brand63', 'p7', '2022-01-10 00:00:00', '3 times a day', 451, 'local', 147),
(63, 'med63', 'brand64', 'p7', '2023-12-16 00:00:00', '3 times a day', 150, 'generic', 88),
(64, 'med64', 'brand64', 'p7', '2029-06-05 00:00:00', '3 times a day', 451, 'local', 200),
(64, 'med64', 'brand65', 'p7', '2021-09-21 00:00:00', '3 times a day', 150, 'generic', 45),
(65, 'med65', 'brand65', 'p4', '2029-05-04 00:00:00', '2 times a day', 86, 'local', 300),
(65, 'med65', 'brand66', 'p4', '2026-06-16 00:00:00', '2 times a day', 29, 'generic', 72),
(66, 'med66', 'brand66', 'p6', '2024-01-06 00:00:00', 'Whenever pain occurs take one medicine', 111, 'local', 291),
(66, 'med66', 'brand67', 'p6', '2021-12-06 00:00:00', 'Whenever pain occurs take one medicine', 37, 'generic', 258),
(67, 'med67', 'brand67', 'p4', '2026-05-09 00:00:00', 'Whenever pain occurs take half medicine', 186, 'local', 77),
(67, 'med67', 'brand68', 'p4', '2028-06-09 00:00:00', 'Whenever pain occurs take half medicine', 62, 'generic', 22),
(68, 'med68', 'brand68', 'p4', '2024-02-21 00:00:00', 'Whenever pain occurs take one medicine', 598, 'local', 133),
(68, 'med68', 'brand69', 'p4', '2028-07-05 00:00:00', 'Whenever pain occurs take one medicine', 199, 'generic', 14),
(69, 'med69', 'brand69', 'p7', '2027-12-06 00:00:00', '1 capsule every night before going to sleep', 316, 'local', 292),
(69, 'med69', 'brand70', 'p7', '2024-05-14 00:00:00', '1 capsule every night before going to sleep', 105, 'generic', 269),
(70, 'med70', 'brand70', 'p3', '2026-05-05 00:00:00', '1 capsule every night before going to sleep', 537, 'local', 50),
(70, 'med70', 'brand71', 'p3', '2022-08-28 00:00:00', '1 capsule every night before going to sleep', 179, 'generic', 142),
(71, 'med71', 'brand71', 'p6', '2024-05-01 00:00:00', '2 times a day', 426, 'local', 44),
(71, 'med71', 'brand72', 'p6', '2025-01-03 00:00:00', '2 times a day', 142, 'generic', 98),
(72, 'med72', 'brand72', 'p6', '2028-03-11 00:00:00', '1 capsule every night before going to sleep', 274, 'local', 197),
(72, 'med72', 'brand73', 'p6', '2023-08-27 00:00:00', '1 capsule every night before going to sleep', 91, 'generic', 161),
(73, 'med73', 'brand73', 'p7', '2020-10-05 00:00:00', 'Once in a week', 320, 'local', 45),
(73, 'med73', 'brand74', 'p7', '2024-12-27 00:00:00', 'Once in a week', 107, 'generic', 231),
(74, 'med74', 'brand74', 'p3', '2028-07-20 00:00:00', 'Whenever pain occurs take one medicine', 133, 'local', 180),
(74, 'med74', 'brand75', 'p3', '2023-01-27 00:00:00', 'Whenever pain occurs take one medicine', 44, 'generic', 159),
(75, 'med75', 'brand75', 'p8', '2027-03-06 00:00:00', '1 capsule every night before going to sleep', 421, 'local', 194),
(75, 'med75', 'brand76', 'p8', '2030-05-15 00:00:00', '1 capsule every night before going to sleep', 140, 'generic', 148),
(76, 'med76', 'brand76', 'p8', '2028-02-05 00:00:00', '1 capsule every night before going to sleep', 377, 'local', 158),
(76, 'med76', 'brand77', 'p8', '2027-03-20 00:00:00', '1 capsule every night before going to sleep', 126, 'generic', 25),
(77, 'med77', 'brand77', 'p6', '2020-05-08 00:00:00', 'Whenever pain occurs take one medicine', 125, 'local', 215),
(77, 'med77', 'brand78', 'p6', '2027-09-09 00:00:00', 'Whenever pain occurs take one medicine', 42, 'generic', 144),
(78, 'med78', 'brand78', 'p2', '2021-05-21 00:00:00', '2 times a day', 379, 'local', 106),
(78, 'med78', 'brand79', 'p2', '2020-03-07 00:00:00', '2 times a day', 126, 'generic', 294),
(79, 'med79', 'brand79', 'p3', '2024-02-26 00:00:00', 'Whenever pain occurs take half medicine', 183, 'local', 94),
(79, 'med79', 'brand80', 'p3', '2023-11-13 00:00:00', 'Whenever pain occurs take half medicine', 61, 'generic', 63),
(80, 'med80', 'brand80', 'p1', '2021-10-16 00:00:00', '3 times a day', 428, 'local', 62),
(80, 'med80', 'brand81', 'p1', '2023-11-02 00:00:00', '3 times a day', 143, 'generic', 282),
(81, 'med81', 'brand81', 'p4', '2027-02-05 00:00:00', 'Once in a week', 129, 'local', 62),
(81, 'med81', 'brand82', 'p4', '2024-09-01 00:00:00', 'Once in a week', 43, 'generic', 235),
(82, 'med82', 'brand82', 'p8', '2029-04-07 00:00:00', '2 times a day', 410, 'local', 210),
(82, 'med82', 'brand83', 'p8', '2025-11-10 00:00:00', '2 times a day', 137, 'generic', 83),
(83, 'med83', 'brand83', 'p6', '2021-06-25 00:00:00', 'Whenever pain occurs take one medicine', 66, 'local', 73),
(83, 'med83', 'brand84', 'p6', '2020-12-28 00:00:00', 'Whenever pain occurs take one medicine', 22, 'generic', 270),
(84, 'med84', 'brand84', 'p1', '2024-01-05 00:00:00', '1 capsule every night before going to sleep', 438, 'local', 266),
(84, 'med84', 'brand85', 'p1', '2025-07-07 00:00:00', '1 capsule every night before going to sleep', 146, 'generic', 34),
(85, 'med85', 'brand85', 'p1', '2021-06-10 00:00:00', 'Once in a week', 164, 'local', 10),
(85, 'med85', 'brand86', 'p1', '2020-08-26 00:00:00', 'Once in a week', 55, 'generic', 30),
(86, 'med86', 'brand86', 'p1', '2025-05-25 00:00:00', '3 times a day', 537, 'local', 228),
(86, 'med86', 'brand87', 'p1', '2030-09-04 00:00:00', '3 times a day', 179, 'generic', 196),
(87, 'med87', 'brand87', 'p5', '2021-02-15 00:00:00', '2 times a day', 328, 'local', 192),
(87, 'med87', 'brand88', 'p5', '2030-05-20 00:00:00', '2 times a day', 109, 'generic', 263),
(88, 'med88', 'brand88', 'p3', '2026-09-07 00:00:00', '1 capsule every night before going to sleep', 105, 'local', 119),
(88, 'med88', 'brand89', 'p3', '2020-10-21 00:00:00', '1 capsule every night before going to sleep', 35, 'generic', 43),
(89, 'med89', 'brand89', 'p2', '2030-08-11 00:00:00', 'Whenever pain occurs take half medicine', 568, 'local', 77),
(89, 'med89', 'brand90', 'p2', '2026-01-07 00:00:00', 'Whenever pain occurs take half medicine', 189, 'generic', 80),
(90, 'med90', 'brand90', 'p1', '2021-06-19 00:00:00', '1 capsule every night before going to sleep', 207, 'local', 142),
(90, 'med90', 'brand91', 'p1', '2027-10-15 00:00:00', '1 capsule every night before going to sleep', 69, 'generic', 177),
(91, 'med91', 'brand91', 'p6', '2029-12-20 00:00:00', '1 capsule every night before going to sleep', 596, 'local', 286),
(91, 'med91', 'brand92', 'p6', '2022-10-12 00:00:00', '1 capsule every night before going to sleep', 199, 'generic', 244),
(92, 'med92', 'brand92', 'p4', '2030-11-01 00:00:00', 'Whenever pain occurs take half medicine', 305, 'local', 280),
(92, 'med92', 'brand93', 'p4', '2026-12-21 00:00:00', 'Whenever pain occurs take half medicine', 102, 'generic', 88),
(93, 'med93', 'brand93', 'p4', '2029-06-19 00:00:00', 'Whenever pain occurs take half medicine', 379, 'local', 65),
(93, 'med93', 'brand94', 'p4', '2021-04-28 00:00:00', 'Whenever pain occurs take half medicine', 126, 'generic', 95),
(94, 'med94', 'brand94', 'p2', '2028-01-17 00:00:00', 'Whenever pain occurs take one medicine', 381, 'local', 23),
(94, 'med94', 'brand95', 'p2', '2021-01-15 00:00:00', 'Whenever pain occurs take one medicine', 127, 'generic', 27),
(95, 'med95', 'brand95', 'p3', '2023-02-14 00:00:00', 'Whenever pain occurs take one medicine', 209, 'local', 62),
(95, 'med95', 'brand96', 'p3', '2021-09-15 00:00:00', 'Whenever pain occurs take one medicine', 70, 'generic', 197),
(96, 'med96', 'brand96', 'p5', '2023-08-05 00:00:00', 'Whenever pain occurs take one medicine', 224, 'local', 75),
(96, 'med96', 'brand97', 'p5', '2024-09-27 00:00:00', 'Whenever pain occurs take one medicine', 75, 'generic', 87),
(97, 'med97', 'brand97', 'p5', '2027-07-05 00:00:00', '2 times a day', 395, 'local', 171),
(97, 'med97', 'brand98', 'p5', '2027-08-13 00:00:00', '2 times a day', 132, 'generic', 21),
(98, 'med98', 'brand98', 'p5', '2029-02-23 00:00:00', 'Whenever pain occurs take one medicine', 407, 'local', 276),
(98, 'med98', 'brand99', 'p5', '2026-01-09 00:00:00', 'Whenever pain occurs take one medicine', 136, 'generic', 157),
(99, 'med99', 'brand99', 'p7', '2021-02-03 00:00:00', 'Whenever pain occurs take one medicine', 294, 'local', 258),
(99, 'med99', 'brand100', 'p7', '2028-03-16 00:00:00', 'Whenever pain occurs take one medicine', 98, 'generic', 154),
(100, 'med100', 'brand100', 'p2', '2020-03-20 00:00:00', '2 times a day', 406, 'local', 148),
(100, 'med100', 'brand101', 'p2', '2026-09-28 00:00:00', '2 times a day', 135, 'generic', 18),
(101, 'med101', 'brand101', 'p5', '2028-03-04 00:00:00', 'Whenever pain occurs take one medicine', 290, 'local', 277),
(101, 'med101', 'brand102', 'p5', '2027-03-15 00:00:00', 'Whenever pain occurs take one medicine', 97, 'generic', 10),
(102, 'med102', 'brand102', 'p4', '2020-01-22 00:00:00', 'Whenever pain occurs take half medicine', 529, 'local', 209),
(102, 'med102', 'brand103', 'p4', '2021-08-27 00:00:00', 'Whenever pain occurs take half medicine', 176, 'generic', 54),
(103, 'med103', 'brand103', 'p8', '2020-10-22 00:00:00', '1 capsule every night before going to sleep', 142, 'local', 92),
(103, 'med103', 'brand104', 'p8', '2023-01-06 00:00:00', '1 capsule every night before going to sleep', 47, 'generic', 108),
(104, 'med104', 'brand104', 'p1', '2028-01-18 00:00:00', '2 times a day', 166, 'local', 16),
(104, 'med104', 'brand105', 'p1', '2020-12-11 00:00:00', '2 times a day', 55, 'generic', 200),
(105, 'med105', 'brand105', 'p1', '2020-05-07 00:00:00', 'Once in a week', 556, 'local', 133),
(105, 'med105', 'brand106', 'p1', '2023-07-13 00:00:00', 'Once in a week', 185, 'generic', 65),
(106, 'med106', 'brand106', 'p5', '2028-05-25 00:00:00', 'Once in a week', 433, 'local', 290),
(106, 'med106', 'brand107', 'p5', '2021-03-04 00:00:00', 'Once in a week', 144, 'generic', 24),
(107, 'med107', 'brand107', 'p3', '2024-12-16 00:00:00', '1 capsule every night before going to sleep', 89, 'local', 109),
(107, 'med107', 'brand108', 'p3', '2024-12-01 00:00:00', '1 capsule every night before going to sleep', 30, 'generic', 207),
(108, 'med108', 'brand108', 'p3', '2028-09-13 00:00:00', '3 times a day', 111, 'local', 167),
(108, 'med108', 'brand109', 'p3', '2022-11-14 00:00:00', '3 times a day', 37, 'generic', 201),
(109, 'med109', 'brand109', 'p6', '2028-01-25 00:00:00', '2 times a day', 461, 'local', 262),
(109, 'med109', 'brand110', 'p6', '2029-08-16 00:00:00', '2 times a day', 154, 'generic', 211),
(110, 'med110', 'brand110', 'p7', '2022-11-06 00:00:00', 'Once in a week', 312, 'local', 196),
(110, 'med110', 'brand111', 'p7', '2026-10-28 00:00:00', 'Once in a week', 104, 'generic', 245),
(111, 'med111', 'brand111', 'p7', '2025-05-23 00:00:00', 'Whenever pain occurs take half medicine', 440, 'local', 214),
(111, 'med111', 'brand112', 'p7', '2027-01-03 00:00:00', 'Whenever pain occurs take half medicine', 147, 'generic', 197),
(112, 'med112', 'brand112', 'p8', '2022-01-01 00:00:00', '2 times a day', 310, 'local', 176),
(112, 'med112', 'brand113', 'p8', '2023-03-28 00:00:00', '2 times a day', 103, 'generic', 127),
(113, 'med113', 'brand113', 'p4', '2022-12-12 00:00:00', 'Whenever pain occurs take half medicine', 471, 'local', 219),
(113, 'med113', 'brand114', 'p4', '2025-08-03 00:00:00', 'Whenever pain occurs take half medicine', 157, 'generic', 126),
(114, 'med114', 'brand114', 'p1', '2025-02-04 00:00:00', '1 capsule every night before going to sleep', 549, 'local', 298),
(114, 'med114', 'brand115', 'p1', '2025-11-09 00:00:00', '1 capsule every night before going to sleep', 183, 'generic', 252),
(115, 'med115', 'brand115', 'p1', '2029-04-26 00:00:00', '2 times a day', 558, 'local', 15),
(115, 'med115', 'brand116', 'p1', '2022-06-25 00:00:00', '2 times a day', 186, 'generic', 210),
(116, 'med116', 'brand116', 'p7', '2027-09-02 00:00:00', '1 capsule every night before going to sleep', 460, 'local', 126),
(116, 'med116', 'brand117', 'p7', '2022-09-03 00:00:00', '1 capsule every night before going to sleep', 153, 'generic', 46),
(117, 'med117', 'brand117', 'p3', '2023-01-23 00:00:00', 'Once in a week', 432, 'local', 273),
(117, 'med117', 'brand118', 'p3', '2029-01-04 00:00:00', 'Once in a week', 144, 'generic', 33),
(118, 'med118', 'brand118', 'p4', '2029-07-10 00:00:00', 'Whenever pain occurs take one medicine', 533, 'local', 93),
(118, 'med118', 'brand119', 'p4', '2028-12-16 00:00:00', 'Whenever pain occurs take one medicine', 178, 'generic', 142),
(119, 'med119', 'brand119', 'p4', '2028-11-28 00:00:00', '2 times a day', 537, 'local', 278),
(119, 'med119', 'brand120', 'p4', '2020-06-02 00:00:00', '2 times a day', 179, 'generic', 127),
(120, 'med120', 'brand120', 'p7', '2029-11-24 00:00:00', '2 times a day', 204, 'local', 116),
(120, 'med120', 'brand121', 'p7', '2021-05-19 00:00:00', '2 times a day', 68, 'generic', 146),
(121, 'med121', 'brand121', 'p8', '2025-02-20 00:00:00', 'Whenever pain occurs take one medicine', 145, 'local', 165),
(121, 'med121', 'brand122', 'p8', '2022-02-16 00:00:00', 'Whenever pain occurs take one medicine', 48, 'generic', 79),
(122, 'med122', 'brand122', 'p1', '2028-03-24 00:00:00', '3 times a day', 319, 'local', 296),
(122, 'med122', 'brand123', 'p1', '2025-05-28 00:00:00', '3 times a day', 106, 'generic', 295),
(123, 'med123', 'brand123', 'p5', '2024-09-15 00:00:00', 'Whenever pain occurs take one medicine', 403, 'local', 124),
(123, 'med123', 'brand124', 'p5', '2024-05-24 00:00:00', 'Whenever pain occurs take one medicine', 134, 'generic', 263),
(124, 'med124', 'brand124', 'p7', '2030-02-13 00:00:00', '2 times a day', 371, 'local', 169),
(124, 'med124', 'brand125', 'p7', '2022-04-04 00:00:00', '2 times a day', 124, 'generic', 83),
(125, 'med125', 'brand125', 'p7', '2022-07-11 00:00:00', 'Whenever pain occurs take one medicine', 268, 'local', 117),
(125, 'med125', 'brand126', 'p7', '2026-12-19 00:00:00', 'Whenever pain occurs take one medicine', 89, 'generic', 260),
(126, 'med126', 'brand126', 'p4', '2028-11-06 00:00:00', 'Whenever pain occurs take one medicine', 124, 'local', 196),
(126, 'med126', 'brand127', 'p4', '2020-01-23 00:00:00', 'Whenever pain occurs take one medicine', 41, 'generic', 213),
(127, 'med127', 'brand127', 'p4', '2025-03-10 00:00:00', '1 capsule every night before going to sleep', 183, 'local', 296),
(127, 'med127', 'brand128', 'p4', '2021-05-06 00:00:00', '1 capsule every night before going to sleep', 61, 'generic', 74),
(128, 'med128', 'brand128', 'p8', '2024-10-25 00:00:00', 'Whenever pain occurs take half medicine', 348, 'local', 249),
(128, 'med128', 'brand129', 'p8', '2029-04-02 00:00:00', 'Whenever pain occurs take half medicine', 116, 'generic', 112),
(129, 'med129', 'brand129', 'p5', '2026-02-17 00:00:00', 'Once in a week', 296, 'local', 67),
(129, 'med129', 'brand130', 'p5', '2026-02-02 00:00:00', 'Once in a week', 99, 'generic', 114),
(130, 'med130', 'brand130', 'p6', '2024-01-23 00:00:00', '1 capsule every night before going to sleep', 280, 'local', 272),
(130, 'med130', 'brand131', 'p6', '2021-02-08 00:00:00', '1 capsule every night before going to sleep', 93, 'generic', 186),
(131, 'med131', 'brand131', 'p3', '2024-08-02 00:00:00', '2 times a day', 237, 'local', 77),
(131, 'med131', 'brand132', 'p3', '2029-04-08 00:00:00', '2 times a day', 79, 'generic', 259),
(132, 'med132', 'brand132', 'p5', '2026-12-12 00:00:00', 'Once in a week', 133, 'local', 115),
(132, 'med132', 'brand133', 'p5', '2021-10-09 00:00:00', 'Once in a week', 44, 'generic', 265),
(133, 'med133', 'brand133', 'p4', '2022-04-05 00:00:00', '2 times a day', 299, 'local', 22),
(133, 'med133', 'brand134', 'p4', '2025-07-21 00:00:00', '2 times a day', 100, 'generic', 88),
(134, 'med134', 'brand134', 'p2', '2028-01-25 00:00:00', 'Once in a week', 88, 'local', 253),
(134, 'med134', 'brand135', 'p2', '2026-12-24 00:00:00', 'Once in a week', 29, 'generic', 296),
(135, 'med135', 'brand135', 'p6', '2028-12-08 00:00:00', '1 capsule every night before going to sleep', 437, 'local', 76),
(135, 'med135', 'brand136', 'p6', '2021-05-09 00:00:00', '1 capsule every night before going to sleep', 146, 'generic', 145),
(136, 'med136', 'brand136', 'p6', '2023-01-21 00:00:00', '1 capsule every night before going to sleep', 420, 'local', 20),
(136, 'med136', 'brand137', 'p6', '2020-06-14 00:00:00', '1 capsule every night before going to sleep', 140, 'generic', 199),
(137, 'med137', 'brand137', 'p6', '2027-08-02 00:00:00', '3 times a day', 182, 'local', 163),
(137, 'med137', 'brand138', 'p6', '2024-09-19 00:00:00', '3 times a day', 61, 'generic', 92),
(138, 'med138', 'brand138', 'p2', '2022-10-21 00:00:00', '3 times a day', 438, 'local', 176),
(138, 'med138', 'brand139', 'p2', '2021-09-02 00:00:00', '3 times a day', 146, 'generic', 239),
(139, 'med139', 'brand139', 'p6', '2027-07-20 00:00:00', '3 times a day', 392, 'local', 269),
(139, 'med139', 'brand140', 'p6', '2029-11-16 00:00:00', '3 times a day', 131, 'generic', 171),
(140, 'med140', 'brand140', 'p6', '2027-05-01 00:00:00', 'Whenever pain occurs take one medicine', 409, 'local', 154),
(140, 'med140', 'brand141', 'p6', '2025-09-27 00:00:00', 'Whenever pain occurs take one medicine', 136, 'generic', 86),
(141, 'med141', 'brand141', 'p8', '2026-05-23 00:00:00', 'Once in a week', 484, 'local', 202),
(141, 'med141', 'brand142', 'p8', '2028-08-18 00:00:00', 'Once in a week', 161, 'generic', 240),
(142, 'med142', 'brand142', 'p1', '2030-02-25 00:00:00', '1 capsule every night before going to sleep', 501, 'local', 252),
(142, 'med142', 'brand143', 'p1', '2025-07-21 00:00:00', '1 capsule every night before going to sleep', 167, 'generic', 170),
(143, 'med143', 'brand143', 'p5', '2029-02-23 00:00:00', '2 times a day', 155, 'local', 20),
(143, 'med143', 'brand144', 'p5', '2020-11-03 00:00:00', '2 times a day', 52, 'generic', 212),
(144, 'med144', 'brand144', 'p5', '2027-09-27 00:00:00', 'Once in a week', 80, 'local', 263),
(144, 'med144', 'brand145', 'p5', '2030-11-21 00:00:00', 'Once in a week', 27, 'generic', 17),
(145, 'med145', 'brand145', 'p6', '2029-03-26 00:00:00', '2 times a day', 523, 'local', 282),
(145, 'med145', 'brand146', 'p6', '2028-04-13 00:00:00', '2 times a day', 174, 'generic', 184),
(146, 'med146', 'brand146', 'p3', '2026-06-20 00:00:00', '3 times a day', 160, 'local', 104),
(146, 'med146', 'brand147', 'p3', '2028-06-09 00:00:00', '3 times a day', 53, 'generic', 254),
(147, 'med147', 'brand147', 'p8', '2021-10-19 00:00:00', 'Once in a week', 123, 'local', 213),
(147, 'med147', 'brand148', 'p8', '2023-06-13 00:00:00', 'Once in a week', 41, 'generic', 120),
(148, 'med148', 'brand148', 'p2', '2028-07-26 00:00:00', 'Whenever pain occurs take half medicine', 528, 'local', 46),
(148, 'med148', 'brand149', 'p2', '2021-12-24 00:00:00', 'Whenever pain occurs take half medicine', 176, 'generic', 275),
(149, 'med149', 'brand149', 'p5', '2023-02-09 00:00:00', 'Whenever pain occurs take one medicine', 85, 'local', 13),
(149, 'med149', 'brand150', 'p5', '2025-02-08 00:00:00', 'Whenever pain occurs take one medicine', 28, 'generic', 46),
(150, 'med150', 'brand150', 'p6', '2020-10-19 00:00:00', '1 capsule every night before going to sleep', 392, 'local', 44),
(150, 'med150', 'brand151', 'p6', '2020-06-02 00:00:00', '1 capsule every night before going to sleep', 131, 'generic', 284),
(151, 'med151', 'brand151', 'p4', '2025-03-08 00:00:00', '2 times a day', 431, 'local', 300),
(151, 'med151', 'brand152', 'p4', '2022-08-16 00:00:00', '2 times a day', 144, 'generic', 101),
(152, 'med152', 'brand152', 'p4', '2026-08-04 00:00:00', 'Whenever pain occurs take one medicine', 292, 'local', 97),
(152, 'med152', 'brand153', 'p4', '2026-05-16 00:00:00', 'Whenever pain occurs take one medicine', 97, 'generic', 144),
(153, 'med153', 'brand153', 'p3', '2030-10-15 00:00:00', 'Once in a week', 187, 'local', 201),
(153, 'med153', 'brand154', 'p3', '2029-05-04 00:00:00', 'Once in a week', 62, 'generic', 198),
(154, 'med154', 'brand154', 'p4', '2029-11-23 00:00:00', 'Once in a week', 499, 'local', 200),
(154, 'med154', 'brand155', 'p4', '2030-07-25 00:00:00', 'Once in a week', 166, 'generic', 207),
(155, 'med155', 'brand155', 'p1', '2029-10-17 00:00:00', 'Once in a week', 454, 'local', 295),
(155, 'med155', 'brand156', 'p1', '2024-04-02 00:00:00', 'Once in a week', 151, 'generic', 111),
(156, 'med156', 'brand156', 'p5', '2028-03-09 00:00:00', 'Whenever pain occurs take half medicine', 171, 'local', 272),
(156, 'med156', 'brand157', 'p5', '2029-06-24 00:00:00', 'Whenever pain occurs take half medicine', 57, 'generic', 173),
(157, 'med157', 'brand157', 'p5', '2022-04-23 00:00:00', '3 times a day', 581, 'local', 180),
(157, 'med157', 'brand158', 'p5', '2030-12-20 00:00:00', '3 times a day', 194, 'generic', 285),
(158, 'med158', 'brand158', 'p5', '2030-11-15 00:00:00', '2 times a day', 267, 'local', 294),
(158, 'med158', 'brand159', 'p5', '2030-05-16 00:00:00', '2 times a day', 89, 'generic', 213),
(159, 'med159', 'brand159', 'p1', '2021-07-28 00:00:00', 'Whenever pain occurs take half medicine', 367, 'local', 144),
(159, 'med159', 'brand160', 'p1', '2027-07-06 00:00:00', 'Whenever pain occurs take half medicine', 122, 'generic', 153),
(160, 'med160', 'brand160', 'p2', '2022-02-03 00:00:00', '2 times a day', 491, 'local', 57),
(160, 'med160', 'brand161', 'p2', '2025-11-01 00:00:00', '2 times a day', 164, 'generic', 147),
(161, 'med161', 'brand161', 'p8', '2028-09-09 00:00:00', '3 times a day', 76, 'local', 25),
(161, 'med161', 'brand162', 'p8', '2026-11-22 00:00:00', '3 times a day', 25, 'generic', 157),
(162, 'med162', 'brand162', 'p5', '2021-10-27 00:00:00', 'Once in a week', 228, 'local', 238),
(162, 'med162', 'brand163', 'p5', '2027-02-27 00:00:00', 'Once in a week', 76, 'generic', 153),
(163, 'med163', 'brand163', 'p3', '2030-06-06 00:00:00', 'Once in a week', 421, 'local', 202),
(163, 'med163', 'brand164', 'p3', '2029-04-16 00:00:00', 'Once in a week', 140, 'generic', 239),
(164, 'med164', 'brand164', 'p8', '2023-12-09 00:00:00', 'Once in a week', 481, 'local', 96),
(164, 'med164', 'brand165', 'p8', '2024-03-03 00:00:00', 'Once in a week', 160, 'generic', 12),
(165, 'med165', 'brand165', 'p2', '2030-11-18 00:00:00', '2 times a day', 522, 'local', 39),
(165, 'med165', 'brand166', 'p2', '2024-11-21 00:00:00', '2 times a day', 174, 'generic', 279),
(166, 'med166', 'brand166', 'p5', '2020-03-15 00:00:00', '1 capsule every night before going to sleep', 108, 'local', 168),
(166, 'med166', 'brand167', 'p5', '2026-03-04 00:00:00', '1 capsule every night before going to sleep', 36, 'generic', 211),
(167, 'med167', 'brand167', 'p4', '2025-08-21 00:00:00', '1 capsule every night before going to sleep', 565, 'local', 129),
(167, 'med167', 'brand168', 'p4', '2020-04-12 00:00:00', '1 capsule every night before going to sleep', 188, 'generic', 207),
(168, 'med168', 'brand168', 'p2', '2022-12-06 00:00:00', '3 times a day', 283, 'local', 279),
(168, 'med168', 'brand169', 'p2', '2020-01-07 00:00:00', '3 times a day', 94, 'generic', 193),
(169, 'med169', 'brand169', 'p2', '2023-02-09 00:00:00', 'Whenever pain occurs take one medicine', 351, 'local', 266),
(169, 'med169', 'brand170', 'p2', '2023-04-20 00:00:00', 'Whenever pain occurs take one medicine', 117, 'generic', 177),
(170, 'med170', 'brand170', 'p8', '2029-05-24 00:00:00', '2 times a day', 234, 'local', 206),
(170, 'med170', 'brand171', 'p8', '2025-06-10 00:00:00', '2 times a day', 78, 'generic', 140),
(171, 'med171', 'brand171', 'p3', '2023-11-01 00:00:00', '1 capsule every night before going to sleep', 157, 'local', 27),
(171, 'med171', 'brand172', 'p3', '2023-08-19 00:00:00', '1 capsule every night before going to sleep', 52, 'generic', 119),
(172, 'med172', 'brand172', 'p8', '2028-11-24 00:00:00', '3 times a day', 422, 'local', 45),
(172, 'med172', 'brand173', 'p8', '2027-03-27 00:00:00', '3 times a day', 141, 'generic', 192),
(173, 'med173', 'brand173', 'p7', '2020-11-19 00:00:00', '3 times a day', 399, 'local', 169),
(173, 'med173', 'brand174', 'p7', '2020-05-20 00:00:00', '3 times a day', 133, 'generic', 24),
(174, 'med174', 'brand174', 'p2', '2024-09-12 00:00:00', 'Whenever pain occurs take half medicine', 563, 'local', 188),
(174, 'med174', 'brand175', 'p2', '2020-10-15 00:00:00', 'Whenever pain occurs take half medicine', 188, 'generic', 89),
(175, 'med175', 'brand175', 'p2', '2029-12-28 00:00:00', 'Whenever pain occurs take half medicine', 135, 'local', 77),
(175, 'med175', 'brand176', 'p2', '2029-03-13 00:00:00', 'Whenever pain occurs take half medicine', 45, 'generic', 20),
(176, 'med176', 'brand176', 'p8', '2020-06-18 00:00:00', '1 capsule every night before going to sleep', 190, 'local', 13),
(176, 'med176', 'brand177', 'p8', '2023-03-07 00:00:00', '1 capsule every night before going to sleep', 63, 'generic', 295),
(177, 'med177', 'brand177', 'p6', '2026-11-08 00:00:00', '1 capsule every night before going to sleep', 329, 'local', 244),
(177, 'med177', 'brand178', 'p6', '2020-05-22 00:00:00', '1 capsule every night before going to sleep', 110, 'generic', 161),
(178, 'med178', 'brand178', 'p8', '2027-04-26 00:00:00', 'Whenever pain occurs take one medicine', 201, 'local', 160),
(178, 'med178', 'brand179', 'p8', '2028-07-08 00:00:00', 'Whenever pain occurs take one medicine', 67, 'generic', 219),
(179, 'med179', 'brand179', 'p4', '2028-09-15 00:00:00', '3 times a day', 325, 'local', 148),
(179, 'med179', 'brand180', 'p4', '2024-01-13 00:00:00', '3 times a day', 108, 'generic', 57),
(180, 'med180', 'brand180', 'p7', '2021-05-19 00:00:00', '3 times a day', 263, 'local', 124),
(180, 'med180', 'brand181', 'p7', '2026-12-11 00:00:00', '3 times a day', 88, 'generic', 98),
(181, 'med181', 'brand181', 'p2', '2029-05-04 00:00:00', 'Whenever pain occurs take half medicine', 180, 'local', 127),
(181, 'med181', 'brand182', 'p2', '2030-03-19 00:00:00', 'Whenever pain occurs take half medicine', 60, 'generic', 191),
(182, 'med182', 'brand182', 'p8', '2020-04-20 00:00:00', '1 capsule every night before going to sleep', 209, 'local', 158),
(182, 'med182', 'brand183', 'p8', '2027-06-20 00:00:00', '1 capsule every night before going to sleep', 70, 'generic', 94),
(183, 'med183', 'brand183', 'p7', '2025-12-17 00:00:00', '3 times a day', 322, 'local', 59),
(183, 'med183', 'brand184', 'p7', '2024-08-21 00:00:00', '3 times a day', 107, 'generic', 216),
(184, 'med184', 'brand184', 'p1', '2026-05-03 00:00:00', 'Whenever pain occurs take one medicine', 321, 'local', 222),
(184, 'med184', 'brand185', 'p1', '2020-10-02 00:00:00', 'Whenever pain occurs take one medicine', 107, 'generic', 259),
(185, 'med185', 'brand185', 'p4', '2022-06-08 00:00:00', 'Whenever pain occurs take one medicine', 173, 'local', 146),
(185, 'med185', 'brand186', 'p4', '2026-06-16 00:00:00', 'Whenever pain occurs take one medicine', 58, 'generic', 93),
(186, 'med186', 'brand186', 'p3', '2021-05-26 00:00:00', '3 times a day', 383, 'local', 102),
(186, 'med186', 'brand187', 'p3', '2026-07-13 00:00:00', '3 times a day', 128, 'generic', 211),
(187, 'med187', 'brand187', 'p1', '2027-06-01 00:00:00', '1 capsule every night before going to sleep', 393, 'local', 118),
(187, 'med187', 'brand188', 'p1', '2030-06-01 00:00:00', '1 capsule every night before going to sleep', 131, 'generic', 232),
(188, 'med188', 'brand188', 'p3', '2021-08-08 00:00:00', 'Whenever pain occurs take one medicine', 90, 'local', 76),
(188, 'med188', 'brand189', 'p3', '2025-07-25 00:00:00', 'Whenever pain occurs take one medicine', 30, 'generic', 53),
(189, 'med189', 'brand189', 'p5', '2030-05-01 00:00:00', '2 times a day', 571, 'local', 245),
(189, 'med189', 'brand190', 'p5', '2024-03-18 00:00:00', '2 times a day', 190, 'generic', 157),
(190, 'med190', 'brand190', 'p2', '2021-12-26 00:00:00', 'Whenever pain occurs take one medicine', 234, 'local', 221),
(190, 'med190', 'brand191', 'p2', '2028-05-08 00:00:00', 'Whenever pain occurs take one medicine', 78, 'generic', 139),
(191, 'med191', 'brand191', 'p2', '2030-03-21 00:00:00', 'Whenever pain occurs take half medicine', 328, 'local', 160),
(191, 'med191', 'brand192', 'p2', '2027-04-03 00:00:00', 'Whenever pain occurs take half medicine', 109, 'generic', 94),
(192, 'med192', 'brand192', 'p3', '2029-05-10 00:00:00', 'Whenever pain occurs take half medicine', 261, 'local', 193),
(192, 'med192', 'brand193', 'p3', '2022-12-02 00:00:00', 'Whenever pain occurs take half medicine', 87, 'generic', 164),
(193, 'med193', 'brand193', 'p1', '2024-09-05 00:00:00', 'Whenever pain occurs take half medicine', 354, 'local', 289),
(193, 'med193', 'brand194', 'p1', '2026-12-15 00:00:00', 'Whenever pain occurs take half medicine', 118, 'generic', 183),
(194, 'med194', 'brand194', 'p1', '2025-08-05 00:00:00', '1 capsule every night before going to sleep', 341, 'local', 104),
(194, 'med194', 'brand195', 'p1', '2021-06-02 00:00:00', '1 capsule every night before going to sleep', 114, 'generic', 38),
(195, 'med195', 'brand195', 'p8', '2023-12-24 00:00:00', '3 times a day', 243, 'local', 270),
(195, 'med195', 'brand196', 'p8', '2025-08-19 00:00:00', '3 times a day', 81, 'generic', 171),
(196, 'med196', 'brand196', 'p2', '2024-07-25 00:00:00', 'Whenever pain occurs take half medicine', 112, 'local', 171),
(196, 'med196', 'brand197', 'p2', '2026-07-27 00:00:00', 'Whenever pain occurs take half medicine', 37, 'generic', 239),
(197, 'med197', 'brand197', 'p6', '2024-04-19 00:00:00', '2 times a day', 100, 'local', 203),
(197, 'med197', 'brand198', 'p6', '2026-10-09 00:00:00', '2 times a day', 33, 'generic', 216),
(198, 'med198', 'brand198', 'p8', '2027-12-14 00:00:00', 'Whenever pain occurs take half medicine', 373, 'local', 193),
(198, 'med198', 'brand199', 'p8', '2025-03-09 00:00:00', 'Whenever pain occurs take half medicine', 124, 'generic', 278),
(199, 'med199', 'brand199', 'p5', '2026-08-26 00:00:00', 'Whenever pain occurs take one medicine', 441, 'local', 199),
(199, 'med199', 'brand200', 'p5', '2021-01-05 00:00:00', 'Whenever pain occurs take one medicine', 147, 'generic', 263),
(200, 'med200', 'brand200', 'p5', '2026-12-04 00:00:00', 'Once in a week', 325, 'local', 61),
(200, 'med200', 'brand201', 'p5', '2027-03-04 00:00:00', 'Once in a week', 108, 'generic', 199),
(201, 'med201', 'brand201', 'p2', '2026-10-19 00:00:00', 'Whenever pain occurs take one medicine', 448, 'local', 44),
(201, 'med201', 'brand202', 'p2', '2025-06-13 00:00:00', 'Whenever pain occurs take one medicine', 149, 'generic', 223),
(202, 'med202', 'brand202', 'p2', '2021-04-09 00:00:00', 'Whenever pain occurs take half medicine', 518, 'local', 280),
(202, 'med202', 'brand203', 'p2', '2025-08-22 00:00:00', 'Whenever pain occurs take half medicine', 173, 'generic', 90),
(203, 'med203', 'brand203', 'p7', '2028-03-11 00:00:00', 'Once in a week', 540, 'local', 162),
(203, 'med203', 'brand204', 'p7', '2024-02-15 00:00:00', 'Once in a week', 180, 'generic', 240),
(204, 'med204', 'brand204', 'p6', '2024-07-05 00:00:00', '1 capsule every night before going to sleep', 374, 'local', 256),
(204, 'med204', 'brand205', 'p6', '2028-10-21 00:00:00', '1 capsule every night before going to sleep', 125, 'generic', 84),
(205, 'med205', 'brand205', 'p2', '2023-01-12 00:00:00', 'Whenever pain occurs take one medicine', 335, 'local', 127),
(205, 'med205', 'brand206', 'p2', '2023-10-13 00:00:00', 'Whenever pain occurs take one medicine', 112, 'generic', 249),
(206, 'med206', 'brand206', 'p2', '2027-02-17 00:00:00', 'Once in a week', 595, 'local', 230),
(206, 'med206', 'brand207', 'p2', '2020-11-08 00:00:00', 'Once in a week', 198, 'generic', 239),
(207, 'med207', 'brand207', 'p8', '2028-07-15 00:00:00', '1 capsule every night before going to sleep', 592, 'local', 199),
(207, 'med207', 'brand208', 'p8', '2023-05-28 00:00:00', '1 capsule every night before going to sleep', 197, 'generic', 294),
(208, 'med208', 'brand208', 'p5', '2027-09-02 00:00:00', '2 times a day', 201, 'local', 214),
(208, 'med208', 'brand209', 'p5', '2021-10-03 00:00:00', '2 times a day', 67, 'generic', 288),
(209, 'med209', 'brand209', 'p8', '2025-11-17 00:00:00', 'Once in a week', 451, 'local', 92),
(209, 'med209', 'brand210', 'p8', '2023-11-04 00:00:00', 'Once in a week', 150, 'generic', 206),
(210, 'med210', 'brand210', 'p8', '2022-03-26 00:00:00', 'Whenever pain occurs take one medicine', 312, 'local', 59),
(210, 'med210', 'brand211', 'p8', '2025-05-19 00:00:00', 'Whenever pain occurs take one medicine', 104, 'generic', 179),
(211, 'med211', 'brand211', 'p2', '2025-05-19 00:00:00', '1 capsule every night before going to sleep', 545, 'local', 33),
(211, 'med211', 'brand212', 'p2', '2020-12-16 00:00:00', '1 capsule every night before going to sleep', 182, 'generic', 32),
(212, 'med212', 'brand212', 'p5', '2022-03-20 00:00:00', '2 times a day', 599, 'local', 124),
(212, 'med212', 'brand213', 'p5', '2025-11-28 00:00:00', '2 times a day', 200, 'generic', 298),
(213, 'med213', 'brand213', 'p8', '2023-07-23 00:00:00', 'Whenever pain occurs take one medicine', 165, 'local', 102),
(213, 'med213', 'brand214', 'p8', '2021-09-06 00:00:00', 'Whenever pain occurs take one medicine', 55, 'generic', 299),
(214, 'med214', 'brand214', 'p6', '2021-05-07 00:00:00', 'Once in a week', 321, 'local', 218),
(214, 'med214', 'brand215', 'p6', '2024-08-23 00:00:00', 'Once in a week', 107, 'generic', 78),
(215, 'med215', 'brand215', 'p1', '2024-04-03 00:00:00', '2 times a day', 328, 'local', 252),
(215, 'med215', 'brand216', 'p1', '2024-05-09 00:00:00', '2 times a day', 109, 'generic', 57),
(216, 'med216', 'brand216', 'p4', '2024-03-26 00:00:00', 'Whenever pain occurs take one medicine', 50, 'local', 39),
(216, 'med216', 'brand217', 'p4', '2022-08-28 00:00:00', 'Whenever pain occurs take one medicine', 17, 'generic', 147),
(217, 'med217', 'brand217', 'p2', '2030-11-04 00:00:00', '2 times a day', 363, 'local', 203),
(217, 'med217', 'brand218', 'p2', '2020-08-14 00:00:00', '2 times a day', 121, 'generic', 31),
(218, 'med218', 'brand218', 'p4', '2021-01-11 00:00:00', '3 times a day', 277, 'local', 288),
(218, 'med218', 'brand219', 'p4', '2030-11-28 00:00:00', '3 times a day', 92, 'generic', 152),
(219, 'med219', 'brand219', 'p6', '2024-10-26 00:00:00', '1 capsule every night before going to sleep', 321, 'local', 213),
(219, 'med219', 'brand220', 'p6', '2024-01-02 00:00:00', '1 capsule every night before going to sleep', 107, 'generic', 192),
(220, 'med220', 'brand220', 'p6', '2025-11-23 00:00:00', '1 capsule every night before going to sleep', 485, 'local', 145),
(220, 'med220', 'brand221', 'p6', '2024-06-24 00:00:00', '1 capsule every night before going to sleep', 162, 'generic', 172),
(221, 'med221', 'brand221', 'p6', '2023-08-07 00:00:00', '3 times a day', 85, 'local', 228),
(221, 'med221', 'brand222', 'p6', '2030-01-27 00:00:00', '3 times a day', 28, 'generic', 291),
(222, 'med222', 'brand222', 'p6', '2023-09-10 00:00:00', 'Whenever pain occurs take one medicine', 174, 'local', 79),
(222, 'med222', 'brand223', 'p6', '2027-12-26 00:00:00', 'Whenever pain occurs take one medicine', 58, 'generic', 69),
(223, 'med223', 'brand223', 'p1', '2023-01-01 00:00:00', '1 capsule every night before going to sleep', 502, 'local', 157),
(223, 'med223', 'brand224', 'p1', '2029-09-22 00:00:00', '1 capsule every night before going to sleep', 167, 'generic', 135),
(224, 'med224', 'brand224', 'p5', '2030-08-01 00:00:00', 'Once in a week', 518, 'local', 278),
(224, 'med224', 'brand225', 'p5', '2027-04-07 00:00:00', 'Once in a week', 173, 'generic', 247),
(225, 'med225', 'brand225', 'p5', '2024-11-12 00:00:00', '2 times a day', 490, 'local', 106),
(225, 'med225', 'brand226', 'p5', '2030-06-09 00:00:00', '2 times a day', 163, 'generic', 10),
(226, 'med226', 'brand226', 'p5', '2025-10-28 00:00:00', '2 times a day', 88, 'local', 226),
(226, 'med226', 'brand227', 'p5', '2021-09-17 00:00:00', '2 times a day', 29, 'generic', 265),
(227, 'med227', 'brand227', 'p7', '2022-05-24 00:00:00', '2 times a day', 211, 'local', 174),
(227, 'med227', 'brand228', 'p7', '2029-11-20 00:00:00', '2 times a day', 70, 'generic', 146),
(228, 'med228', 'brand228', 'p6', '2026-03-19 00:00:00', '3 times a day', 93, 'local', 77),
(228, 'med228', 'brand229', 'p6', '2021-01-11 00:00:00', '3 times a day', 31, 'generic', 169),
(229, 'med229', 'brand229', 'p7', '2022-03-14 00:00:00', '2 times a day', 463, 'local', 123),
(229, 'med229', 'brand230', 'p7', '2026-05-11 00:00:00', '2 times a day', 154, 'generic', 123),
(230, 'med230', 'brand230', 'p4', '2027-12-11 00:00:00', '1 capsule every night before going to sleep', 557, 'local', 241),
(230, 'med230', 'brand231', 'p4', '2027-05-27 00:00:00', '1 capsule every night before going to sleep', 186, 'generic', 111),
(231, 'med231', 'brand231', 'p3', '2029-07-22 00:00:00', '3 times a day', 377, 'local', 228),
(231, 'med231', 'brand232', 'p3', '2024-01-14 00:00:00', '3 times a day', 126, 'generic', 278),
(232, 'med232', 'brand232', 'p2', '2021-01-13 00:00:00', '2 times a day', 334, 'local', 166),
(232, 'med232', 'brand233', 'p2', '2030-02-05 00:00:00', '2 times a day', 111, 'generic', 186),
(233, 'med233', 'brand233', 'p5', '2020-03-02 00:00:00', '2 times a day', 212, 'local', 137),
(233, 'med233', 'brand234', 'p5', '2022-03-11 00:00:00', '2 times a day', 71, 'generic', 211),
(234, 'med234', 'brand234', 'p2', '2024-03-03 00:00:00', 'Whenever pain occurs take half medicine', 577, 'local', 86),
(234, 'med234', 'brand235', 'p2', '2027-10-12 00:00:00', 'Whenever pain occurs take half medicine', 192, 'generic', 124),
(235, 'med235', 'brand235', 'p6', '2020-12-07 00:00:00', 'Whenever pain occurs take one medicine', 495, 'local', 66);
INSERT INTO `medicine` (`med_id`, `med_name`, `med_brandname`, `med_purpose`, `med_expiry`, `dosage_form`, `med_price`, `med_role`, `med_quantity`) VALUES
(235, 'med235', 'brand236', 'p6', '2027-09-20 00:00:00', 'Whenever pain occurs take one medicine', 165, 'generic', 251),
(236, 'med236', 'brand236', 'p7', '2030-07-17 00:00:00', 'Whenever pain occurs take half medicine', 476, 'local', 187),
(236, 'med236', 'brand237', 'p7', '2020-08-05 00:00:00', 'Whenever pain occurs take half medicine', 159, 'generic', 189),
(237, 'med237', 'brand237', 'p8', '2021-04-03 00:00:00', '3 times a day', 308, 'local', 106),
(237, 'med237', 'brand238', 'p8', '2022-07-17 00:00:00', '3 times a day', 103, 'generic', 139),
(238, 'med238', 'brand238', 'p7', '2024-06-01 00:00:00', '3 times a day', 530, 'local', 194),
(238, 'med238', 'brand239', 'p7', '2025-08-15 00:00:00', '3 times a day', 177, 'generic', 131),
(239, 'med239', 'brand239', 'p5', '2022-11-21 00:00:00', '2 times a day', 286, 'local', 142),
(239, 'med239', 'brand240', 'p5', '2028-03-17 00:00:00', '2 times a day', 95, 'generic', 277),
(240, 'med240', 'brand240', 'p7', '2021-05-12 00:00:00', 'Whenever pain occurs take one medicine', 376, 'local', 105),
(240, 'med240', 'brand241', 'p7', '2026-10-12 00:00:00', 'Whenever pain occurs take one medicine', 125, 'generic', 26),
(241, 'med241', 'brand241', 'p3', '2021-03-20 00:00:00', 'Whenever pain occurs take one medicine', 468, 'local', 25),
(241, 'med241', 'brand242', 'p3', '2024-03-20 00:00:00', 'Whenever pain occurs take one medicine', 156, 'generic', 270),
(242, 'med242', 'brand242', 'p1', '2027-11-19 00:00:00', 'Whenever pain occurs take one medicine', 92, 'local', 151),
(242, 'med242', 'brand243', 'p1', '2026-04-25 00:00:00', 'Whenever pain occurs take one medicine', 31, 'generic', 23),
(243, 'med243', 'brand243', 'p6', '2025-02-26 00:00:00', 'Whenever pain occurs take one medicine', 196, 'local', 57),
(243, 'med243', 'brand244', 'p6', '2029-09-19 00:00:00', 'Whenever pain occurs take one medicine', 65, 'generic', 24),
(244, 'med244', 'brand244', 'p5', '2024-12-18 00:00:00', '3 times a day', 458, 'local', 194),
(244, 'med244', 'brand245', 'p5', '2030-01-11 00:00:00', '3 times a day', 153, 'generic', 230),
(245, 'med245', 'brand245', 'p3', '2023-02-10 00:00:00', 'Whenever pain occurs take half medicine', 264, 'local', 278),
(245, 'med245', 'brand246', 'p3', '2023-04-12 00:00:00', 'Whenever pain occurs take half medicine', 88, 'generic', 82),
(246, 'med246', 'brand246', 'p2', '2030-11-03 00:00:00', 'Once in a week', 407, 'local', 105),
(246, 'med246', 'brand247', 'p2', '2021-12-03 00:00:00', 'Once in a week', 136, 'generic', 167),
(247, 'med247', 'brand247', 'p8', '2030-02-28 00:00:00', '2 times a day', 251, 'local', 223),
(247, 'med247', 'brand248', 'p8', '2020-12-07 00:00:00', '2 times a day', 84, 'generic', 281),
(248, 'med248', 'brand248', 'p6', '2027-08-02 00:00:00', '1 capsule every night before going to sleep', 264, 'local', 269),
(248, 'med248', 'brand249', 'p6', '2030-10-12 00:00:00', '1 capsule every night before going to sleep', 88, 'generic', 189),
(249, 'med249', 'brand249', 'p7', '2030-11-27 00:00:00', 'Whenever pain occurs take half medicine', 443, 'local', 86),
(249, 'med249', 'brand250', 'p7', '2027-12-13 00:00:00', 'Whenever pain occurs take half medicine', 148, 'generic', 226),
(250, 'med250', 'brand250', 'p6', '2026-07-03 00:00:00', '1 capsule every night before going to sleep', 445, 'local', 13),
(250, 'med250', 'brand251', 'p6', '2029-08-11 00:00:00', '1 capsule every night before going to sleep', 148, 'generic', 102),
(251, 'med251', 'brand251', 'p1', '2026-09-11 00:00:00', '1 capsule every night before going to sleep', 448, 'local', 226),
(251, 'med251', 'brand252', 'p1', '2030-02-13 00:00:00', '1 capsule every night before going to sleep', 149, 'generic', 220),
(252, 'med252', 'brand252', 'p2', '2024-04-04 00:00:00', 'Whenever pain occurs take half medicine', 573, 'local', 251),
(252, 'med252', 'brand253', 'p2', '2020-01-19 00:00:00', 'Whenever pain occurs take half medicine', 191, 'generic', 43),
(253, 'med253', 'brand253', 'p1', '2026-11-13 00:00:00', '1 capsule every night before going to sleep', 226, 'local', 286),
(253, 'med253', 'brand254', 'p1', '2029-06-12 00:00:00', '1 capsule every night before going to sleep', 75, 'generic', 25),
(254, 'med254', 'brand254', 'p3', '2027-05-23 00:00:00', '1 capsule every night before going to sleep', 272, 'local', 291),
(254, 'med254', 'brand255', 'p3', '2025-12-28 00:00:00', '1 capsule every night before going to sleep', 91, 'generic', 281),
(255, 'med255', 'brand255', 'p8', '2027-09-03 00:00:00', 'Whenever pain occurs take half medicine', 152, 'local', 133),
(255, 'med255', 'brand256', 'p8', '2025-08-09 00:00:00', 'Whenever pain occurs take half medicine', 51, 'generic', 157),
(256, 'med256', 'brand256', 'p5', '2021-08-11 00:00:00', 'Whenever pain occurs take one medicine', 363, 'local', 73),
(256, 'med256', 'brand257', 'p5', '2022-10-07 00:00:00', 'Whenever pain occurs take one medicine', 121, 'generic', 263),
(257, 'med257', 'brand257', 'p8', '2028-05-26 00:00:00', 'Once in a week', 228, 'local', 233),
(257, 'med257', 'brand258', 'p8', '2029-08-15 00:00:00', 'Once in a week', 76, 'generic', 81),
(258, 'med258', 'brand258', 'p6', '2021-09-07 00:00:00', 'Whenever pain occurs take half medicine', 301, 'local', 269),
(258, 'med258', 'brand259', 'p6', '2028-04-26 00:00:00', 'Whenever pain occurs take half medicine', 100, 'generic', 285),
(259, 'med259', 'brand259', 'p2', '2020-06-05 00:00:00', '2 times a day', 484, 'local', 109),
(259, 'med259', 'brand260', 'p2', '2023-07-11 00:00:00', '2 times a day', 161, 'generic', 297),
(260, 'med260', 'brand260', 'p1', '2025-02-13 00:00:00', '2 times a day', 196, 'local', 100),
(260, 'med260', 'brand261', 'p1', '2024-04-21 00:00:00', '2 times a day', 65, 'generic', 201),
(261, 'med261', 'brand261', 'p1', '2023-10-22 00:00:00', '1 capsule every night before going to sleep', 67, 'local', 284),
(261, 'med261', 'brand262', 'p1', '2021-05-08 00:00:00', '1 capsule every night before going to sleep', 22, 'generic', 61),
(262, 'med262', 'brand262', 'p3', '2023-07-05 00:00:00', 'Once in a week', 174, 'local', 252),
(262, 'med262', 'brand263', 'p3', '2022-01-04 00:00:00', 'Once in a week', 58, 'generic', 79),
(263, 'med263', 'brand263', 'p7', '2022-06-05 00:00:00', 'Whenever pain occurs take one medicine', 191, 'local', 227),
(263, 'med263', 'brand264', 'p7', '2029-09-10 00:00:00', 'Whenever pain occurs take one medicine', 64, 'generic', 209),
(264, 'med264', 'brand264', 'p5', '2028-08-04 00:00:00', '3 times a day', 471, 'local', 95),
(264, 'med264', 'brand265', 'p5', '2028-04-13 00:00:00', '3 times a day', 157, 'generic', 57),
(265, 'med265', 'brand265', 'p7', '2025-08-22 00:00:00', '3 times a day', 181, 'local', 146),
(265, 'med265', 'brand266', 'p7', '2025-09-16 00:00:00', '3 times a day', 60, 'generic', 37),
(266, 'med266', 'brand266', 'p4', '2023-02-06 00:00:00', '3 times a day', 396, 'local', 270),
(266, 'med266', 'brand267', 'p4', '2028-08-17 00:00:00', '3 times a day', 132, 'generic', 44),
(267, 'med267', 'brand267', 'p5', '2027-08-06 00:00:00', '2 times a day', 134, 'local', 235),
(267, 'med267', 'brand268', 'p5', '2022-07-17 00:00:00', '2 times a day', 45, 'generic', 72),
(268, 'med268', 'brand268', 'p1', '2026-02-02 00:00:00', '3 times a day', 459, 'local', 273),
(268, 'med268', 'brand269', 'p1', '2026-06-28 00:00:00', '3 times a day', 153, 'generic', 59),
(269, 'med269', 'brand269', 'p8', '2020-04-11 00:00:00', '1 capsule every night before going to sleep', 153, 'local', 114),
(269, 'med269', 'brand270', 'p8', '2023-01-18 00:00:00', '1 capsule every night before going to sleep', 51, 'generic', 218),
(270, 'med270', 'brand270', 'p4', '2028-06-13 00:00:00', '3 times a day', 52, 'local', 122),
(270, 'med270', 'brand271', 'p4', '2023-11-23 00:00:00', '3 times a day', 17, 'generic', 214),
(271, 'med271', 'brand271', 'p4', '2025-09-10 00:00:00', 'Once in a week', 187, 'local', 299),
(271, 'med271', 'brand272', 'p4', '2026-07-20 00:00:00', 'Once in a week', 62, 'generic', 242),
(272, 'med272', 'brand272', 'p1', '2027-03-25 00:00:00', 'Whenever pain occurs take half medicine', 505, 'local', 30),
(272, 'med272', 'brand273', 'p1', '2026-03-13 00:00:00', 'Whenever pain occurs take half medicine', 168, 'generic', 134),
(273, 'med273', 'brand273', 'p5', '2024-02-18 00:00:00', '3 times a day', 315, 'local', 190),
(273, 'med273', 'brand274', 'p5', '2023-05-20 00:00:00', '3 times a day', 105, 'generic', 90),
(274, 'med274', 'brand274', 'p5', '2030-01-12 00:00:00', '3 times a day', 331, 'local', 14),
(274, 'med274', 'brand275', 'p5', '2029-06-15 00:00:00', '3 times a day', 110, 'generic', 260),
(275, 'med275', 'brand275', 'p1', '2026-06-18 00:00:00', '3 times a day', 101, 'local', 43),
(275, 'med275', 'brand276', 'p1', '2029-03-03 00:00:00', '3 times a day', 34, 'generic', 65),
(276, 'med276', 'brand276', 'p4', '2023-10-12 00:00:00', 'Whenever pain occurs take one medicine', 166, 'local', 120),
(276, 'med276', 'brand277', 'p4', '2020-04-14 00:00:00', 'Whenever pain occurs take one medicine', 55, 'generic', 144),
(277, 'med277', 'brand277', 'p1', '2027-05-02 00:00:00', 'Whenever pain occurs take half medicine', 93, 'local', 83),
(277, 'med277', 'brand278', 'p1', '2022-11-22 00:00:00', 'Whenever pain occurs take half medicine', 31, 'generic', 204),
(278, 'med278', 'brand278', 'p6', '2028-03-17 00:00:00', '1 capsule every night before going to sleep', 111, 'local', 98),
(278, 'med278', 'brand279', 'p6', '2026-02-16 00:00:00', '1 capsule every night before going to sleep', 37, 'generic', 264),
(279, 'med279', 'brand279', 'p2', '2024-12-20 00:00:00', 'Whenever pain occurs take one medicine', 315, 'local', 264),
(279, 'med279', 'brand280', 'p2', '2024-12-11 00:00:00', 'Whenever pain occurs take one medicine', 105, 'generic', 114),
(280, 'med280', 'brand280', 'p8', '2024-12-23 00:00:00', 'Whenever pain occurs take half medicine', 425, 'local', 265),
(280, 'med280', 'brand281', 'p8', '2020-12-15 00:00:00', 'Whenever pain occurs take half medicine', 142, 'generic', 63),
(281, 'med281', 'brand281', 'p7', '2023-09-26 00:00:00', '2 times a day', 144, 'local', 32),
(281, 'med281', 'brand282', 'p7', '2023-02-21 00:00:00', '2 times a day', 48, 'generic', 172),
(282, 'med282', 'brand282', 'p6', '2027-09-07 00:00:00', '1 capsule every night before going to sleep', 211, 'local', 245),
(282, 'med282', 'brand283', 'p6', '2027-05-05 00:00:00', '1 capsule every night before going to sleep', 70, 'generic', 159),
(283, 'med283', 'brand283', 'p2', '2022-12-09 00:00:00', 'Whenever pain occurs take one medicine', 210, 'local', 196),
(283, 'med283', 'brand284', 'p2', '2021-01-05 00:00:00', 'Whenever pain occurs take one medicine', 70, 'generic', 226),
(284, 'med284', 'brand284', 'p8', '2030-05-19 00:00:00', '1 capsule every night before going to sleep', 155, 'local', 286),
(284, 'med284', 'brand285', 'p8', '2029-02-22 00:00:00', '1 capsule every night before going to sleep', 52, 'generic', 296),
(285, 'med285', 'brand285', 'p1', '2026-06-16 00:00:00', 'Once in a week', 149, 'local', 229),
(285, 'med285', 'brand286', 'p1', '2024-02-02 00:00:00', 'Once in a week', 50, 'generic', 282),
(286, 'med286', 'brand286', 'p6', '2030-12-25 00:00:00', '1 capsule every night before going to sleep', 546, 'local', 185),
(286, 'med286', 'brand287', 'p6', '2021-12-06 00:00:00', '1 capsule every night before going to sleep', 182, 'generic', 65),
(287, 'med287', 'brand287', 'p2', '2020-11-15 00:00:00', '2 times a day', 68, 'local', 244),
(287, 'med287', 'brand288', 'p2', '2029-07-18 00:00:00', '2 times a day', 23, 'generic', 271),
(288, 'med288', 'brand288', 'p3', '2026-02-24 00:00:00', 'Once in a week', 171, 'local', 300),
(288, 'med288', 'brand289', 'p3', '2022-03-23 00:00:00', 'Once in a week', 57, 'generic', 90),
(289, 'med289', 'brand289', 'p3', '2026-02-07 00:00:00', '3 times a day', 213, 'local', 26),
(289, 'med289', 'brand290', 'p3', '2029-03-20 00:00:00', '3 times a day', 71, 'generic', 252),
(290, 'med290', 'brand290', 'p8', '2025-03-22 00:00:00', 'Once in a week', 174, 'local', 246),
(290, 'med290', 'brand291', 'p8', '2030-08-05 00:00:00', 'Once in a week', 58, 'generic', 110),
(291, 'med291', 'brand291', 'p1', '2030-11-03 00:00:00', '2 times a day', 413, 'local', 281),
(291, 'med291', 'brand292', 'p1', '2026-02-23 00:00:00', '2 times a day', 138, 'generic', 110),
(292, 'med292', 'brand292', 'p4', '2023-06-21 00:00:00', '2 times a day', 498, 'local', 100),
(292, 'med292', 'brand293', 'p4', '2030-06-23 00:00:00', '2 times a day', 166, 'generic', 60),
(293, 'med293', 'brand293', 'p5', '2024-10-13 00:00:00', '3 times a day', 94, 'local', 262),
(293, 'med293', 'brand294', 'p5', '2030-09-26 00:00:00', '3 times a day', 31, 'generic', 241),
(294, 'med294', 'brand294', 'p1', '2024-06-03 00:00:00', '2 times a day', 79, 'local', 226),
(294, 'med294', 'brand295', 'p1', '2026-03-26 00:00:00', '2 times a day', 26, 'generic', 242),
(295, 'med295', 'brand295', 'p1', '2022-11-13 00:00:00', 'Once in a week', 510, 'local', 189),
(295, 'med295', 'brand296', 'p1', '2026-08-12 00:00:00', 'Once in a week', 170, 'generic', 77),
(296, 'med296', 'brand296', 'p6', '2029-09-11 00:00:00', '1 capsule every night before going to sleep', 138, 'local', 55),
(296, 'med296', 'brand297', 'p6', '2029-10-16 00:00:00', '1 capsule every night before going to sleep', 46, 'generic', 80),
(297, 'med297', 'brand297', 'p5', '2021-04-15 00:00:00', '2 times a day', 96, 'local', 162),
(297, 'med297', 'brand298', 'p5', '2026-11-16 00:00:00', '2 times a day', 32, 'generic', 19),
(298, 'med298', 'brand298', 'p2', '2025-06-21 00:00:00', 'Whenever pain occurs take one medicine', 167, 'local', 54),
(298, 'med298', 'brand299', 'p2', '2022-05-09 00:00:00', 'Whenever pain occurs take one medicine', 56, 'generic', 240),
(299, 'med299', 'brand299', 'p3', '2030-11-25 00:00:00', '2 times a day', 265, 'local', 256),
(299, 'med299', 'brand300', 'p3', '2024-06-09 00:00:00', '2 times a day', 88, 'generic', 115),
(300, 'med300', 'brand300', 'p3', '2026-12-01 00:00:00', 'Once in a week', 162, 'local', 76),
(300, 'med300', 'brand301', 'p3', '2030-10-02 00:00:00', 'Once in a week', 54, 'generic', 256);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `buyer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_price` int(11) NOT NULL,
  `delivery_status` text NOT NULL,
  `payment_method` text NOT NULL,
  `delivery_address` text NOT NULL,
  `med_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`ddelivery_id`),
  ADD UNIQUE KEY `ddelivery_id` (`ddelivery_id`),
  ADD UNIQUE KEY `duser_id` (`duser_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `c3` FOREIGN KEY (`duser_id`) REFERENCES `login` (`user_id`),
  ADD CONSTRAINT `c4` FOREIGN KEY (`ddelivery_id`) REFERENCES `order` (`delivery_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
