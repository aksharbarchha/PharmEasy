-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 26, 2020 at 08:56 AM
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

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`buyer_id`, `address_id`, `buyer_address`) VALUES
(2, 1, 'None, None, None, None'),
(2, 2, 'None, None, None, None'),
(2, 3, 'sahsbvfkdbvs, dgscev, 13142, 3522'),
(2, 4, 'sahsbvfkdbvs, dgscev, 13142, 3522'),
(5, 5, 'sahsbvfkdbvs, dgscev, 13142, 3522'),
(5, 6, 'Somewhere in the world, Mulund, 432874, 3523');

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
(6, 4, 3, 160, 'generic'),
(13, 2, 0, 210, 'local'),
(17, 6, 2, 81, 'generic'),
(18, 8, 2, 81, 'generic'),
(19, 5, 2, 15, 'generic'),
(20, 1, 2, 207, 'generic'),
(21, 1, 4, 195, 'local'),
(22, 1, 4, 177, 'local'),
(23, 1, 4, 42, 'local'),
(24, 1, 3, 300, 'generic'),
(25, 1, 3, 1, 'generic'),
(26, 1, 3, 21, 'local'),
(32, 201, 13, 13, 'generic'),
(35, 6, 4, 172, 'local'),
(36, 1, 4, 279, 'local'),
(37, 202, 13, 251, 'local'),
(38, 1, 4, 209, 'generic'),
(39, 1, 4, 298, 'generic'),
(40, 1, 4, 11, 'local'),
(43, 203, 13, 209, 'local'),
(49, 200, 13, 278, 'local');

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
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `med_id` int(11) NOT NULL,
  `med_role` text NOT NULL,
  `buyer_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `favourite`
--

INSERT INTO `favourite` (`med_id`, `med_role`, `buyer_user`) VALUES
(128, 'local', 4),
(156, 'generic', 4),
(14, 'local', 4),
(90, 'generic', 4),
(242, 'generic', 4),
(24, 'local', 4),
(23, 'generic', 4),
(3, 'local', 5),
(45, 'generic', 5),
(153, 'generic', 5),
(208, 'generic', 5),
(126, 'local', 5),
(11, 'local', 5);

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
(1, 'user7@gmail.com', '$2b$12$VW5TUHwpqBrMIaZjQ70Q/ep0OSD3iiCojHdCiYr3kOpxJZ2406DHG', 'User', '7', 'address7', 'customer'),
(2, 'user8@gmail.com', '$2b$12$WqzCmbdu7x5zNHKpW5exhuYAp4OqMpzU18x.hL7Mq3tVDg/y4jRLO', 'User', '8', 'address8', 'customer'),
(3, 'user9@gmail.com', '$2b$12$qW.AxYgn2ct3Ej3PWcYybeEv9vRwNOi80EPFAeCCfNfrBoNxFJP3q', 'User', '9', 'address9', 'customer'),
(4, 'user10@gmail.com', '$2b$12$Jkuq/vHEeMHcvpDX9W63Le2dzOk2gWa6Alg0k5roFzAO7W1FwlYga', 'User', '10', 'address10', 'customer'),
(5, 'user11@gmail.com', '$2b$12$iP6lWrxKctDSa/eIIrec6uPu25u2PHjMypF6hAb6P.fVhZr/T80j.', 'User', '11', 'address11', 'customer'),
(6, 'user12@gmail.com', '$2b$12$NISfMd2RFTNdDfW0Mc7HJO79oEvUZPo146ZmXbkV9w2rIlvPpGncW', 'User', '12', 'address12', 'customer'),
(7, 'supplier1@gmail.com', '$2b$12$IE7sMru61YWZWrqSI3AzIuOu4YAV4rGztXwVEunkwKzoqQLfGkHB6', 'Supplier1', '1', 'address1', 'supplier'),
(8, 'supplier2@gmail.com', '$2b$12$g/6IYvRCJSvE56yex1FpzeVWXcB1q.IJ4QcOsVjEz2aSvlk3.qfU6', 'Supplier2', '2', 'address2', 'supplier'),
(9, 'supplier3@gmail.com', '$2b$12$sKXDgbJLYeRA1Z/ZsGsrFeGrrHWucJYooRGJOsCSWtv0gMUPK48kW', 'Supplier3', '3', 'address3', 'supplier'),
(10, 'supplier4@gmail.com', '$2b$12$2w/8Ry8yjZHZlNzXIxC/2utmzWttUjXrql768YmktSAtOhXtNbnzG', 'Supplier4', '4', 'address4', 'supplier'),
(11, 'supplier5@gmail.com', '$2b$12$cXyw9RscA0ITcw1pTBYIJeqBvxOG89Yibv1N3ZBLUsCCsSp4qJqim', 'Supplier5', '5', 'address5', 'supplier'),
(12, 'supplier6@gmail.com', '$2b$12$UjTQ3GIdMbonC5ZDvJCr7OYt3JGTRfOBMqNzSyXHbN5sFbiFm6ieO', 'Supplier6', '6', 'address6', 'supplier'),
(13, 'demo@gmail.com', '$2b$12$qyvdcCaGBlMslZVBkJNd0uerDTAIy.CyZDVOe3I.aTJ8HbAqMLe8S', 'demo', 'test', 'Thane', 'powner');

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
  `med_quantity` int(11) NOT NULL,
  `med_supplier` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`med_id`, `med_name`, `med_brandname`, `med_purpose`, `med_expiry`, `dosage_form`, `med_price`, `med_role`, `med_quantity`, `med_supplier`) VALUES
(1, 'med1', 'brand1', 'p5', '2029-04-09 00:00:00', 'Whenever pain occurs take one medicine', 514, 'local', 102, 'Supplier2'),
(1, 'med1', 'brand2', 'p5', '2026-12-16 00:00:00', 'Whenever pain occurs take one medicine', 171, 'generic', 226, 'Supplier2'),
(2, 'med2', 'brand2', 'p8', '2027-08-22 00:00:00', 'Whenever pain occurs take half medicine', 338, 'local', 179, 'Supplier5'),
(2, 'med2', 'brand3', 'p8', '2026-10-11 00:00:00', 'Whenever pain occurs take half medicine', 113, 'generic', 76, 'Supplier5'),
(3, 'med3', 'brand3', 'p5', '2024-01-07 00:00:00', 'Whenever pain occurs take one medicine', 267, 'local', 185, 'Supplier2'),
(3, 'med3', 'brand4', 'p5', '2029-09-24 00:00:00', 'Whenever pain occurs take one medicine', 89, 'generic', 28, 'Supplier2'),
(4, 'med4', 'brand4', 'p5', '2027-10-13 00:00:00', 'Whenever pain occurs take one medicine', 394, 'local', 257, 'Supplier2'),
(4, 'med4', 'brand5', 'p5', '2021-09-02 00:00:00', 'Whenever pain occurs take one medicine', 131, 'generic', 242, 'Supplier2'),
(5, 'med5', 'brand5', 'p1', '2030-04-24 00:00:00', 'Whenever pain occurs take half medicine', 382, 'local', 237, 'Supplier1'),
(5, 'med5', 'brand6', 'p1', '2029-10-13 00:00:00', 'Whenever pain occurs take half medicine', 127, 'generic', 44, 'Supplier1'),
(6, 'med6', 'brand6', 'p5', '2025-12-08 00:00:00', 'Whenever pain occurs take one medicine', 174, 'local', 157, 'Supplier3'),
(6, 'med6', 'brand7', 'p5', '2020-11-26 00:00:00', 'Whenever pain occurs take one medicine', 58, 'generic', 172, 'Supplier3'),
(7, 'med7', 'brand7', 'p4', '2023-01-13 00:00:00', 'Whenever pain occurs take half medicine', 68, 'local', 144, 'Supplier2'),
(7, 'med7', 'brand8', 'p4', '2022-03-16 00:00:00', 'Whenever pain occurs take half medicine', 23, 'generic', 133, 'Supplier2'),
(8, 'med8', 'brand8', 'p4', '2026-02-26 00:00:00', '3 times a day', 80, 'local', 18, 'Supplier7'),
(8, 'med8', 'brand9', 'p4', '2022-05-14 00:00:00', '3 times a day', 27, 'generic', 169, 'Supplier7'),
(9, 'med9', 'brand9', 'p1', '2023-05-21 00:00:00', '1 capsule every night before going to sleep', 581, 'local', 294, 'Supplier7'),
(9, 'med9', 'brand10', 'p1', '2024-11-18 00:00:00', '1 capsule every night before going to sleep', 194, 'generic', 245, 'Supplier7'),
(10, 'med10', 'brand10', 'p4', '2030-06-22 00:00:00', '3 times a day', 404, 'local', 229, 'Supplier3'),
(10, 'med10', 'brand11', 'p4', '2027-09-20 00:00:00', '3 times a day', 135, 'generic', 175, 'Supplier3'),
(11, 'med11', 'brand11', 'p2', '2020-08-28 00:00:00', '2 times a day', 390, 'local', 119, 'Supplier5'),
(11, 'med11', 'brand12', 'p2', '2025-12-02 00:00:00', '2 times a day', 130, 'generic', 158, 'Supplier5'),
(12, 'med12', 'brand12', 'p4', '2029-05-08 00:00:00', 'Once in a week', 216, 'local', 13, 'Supplier5'),
(12, 'med12', 'brand13', 'p4', '2022-03-11 00:00:00', 'Once in a week', 72, 'generic', 91, 'Supplier5'),
(13, 'med13', 'brand13', 'p1', '2022-02-02 00:00:00', '3 times a day', 99, 'local', 47, 'Supplier3'),
(13, 'med13', 'brand14', 'p1', '2025-04-11 00:00:00', '3 times a day', 33, 'generic', 202, 'Supplier3'),
(14, 'med14', 'brand14', 'p5', '2023-03-11 00:00:00', 'Whenever pain occurs take half medicine', 523, 'local', 265, 'Supplier2'),
(14, 'med14', 'brand15', 'p5', '2025-03-03 00:00:00', 'Whenever pain occurs take half medicine', 174, 'generic', 146, 'Supplier2'),
(15, 'med15', 'brand15', 'p6', '2028-05-19 00:00:00', '1 capsule every night before going to sleep', 205, 'local', 278, 'Supplier2'),
(15, 'med15', 'brand16', 'p6', '2027-12-11 00:00:00', '1 capsule every night before going to sleep', 68, 'generic', 150, 'Supplier2'),
(16, 'med16', 'brand16', 'p2', '2029-04-16 00:00:00', '3 times a day', 521, 'local', 269, 'Supplier1'),
(16, 'med16', 'brand17', 'p2', '2024-12-01 00:00:00', '3 times a day', 174, 'generic', 151, 'Supplier1'),
(17, 'med17', 'brand17', 'p7', '2029-03-14 00:00:00', 'Whenever pain occurs take half medicine', 476, 'local', 113, 'Supplier3'),
(17, 'med17', 'brand18', 'p7', '2029-08-22 00:00:00', 'Whenever pain occurs take half medicine', 159, 'generic', 106, 'Supplier3'),
(18, 'med18', 'brand18', 'p2', '2025-09-20 00:00:00', 'Whenever pain occurs take one medicine', 466, 'local', 205, 'Supplier2'),
(18, 'med18', 'brand19', 'p2', '2027-09-14 00:00:00', 'Whenever pain occurs take one medicine', 155, 'generic', 254, 'Supplier2'),
(19, 'med19', 'brand19', 'p8', '2025-03-18 00:00:00', '2 times a day', 600, 'local', 122, 'Supplier3'),
(19, 'med19', 'brand20', 'p8', '2028-07-22 00:00:00', '2 times a day', 200, 'generic', 142, 'Supplier3'),
(20, 'med20', 'brand20', 'p3', '2020-04-28 00:00:00', '2 times a day', 542, 'local', 128, 'Supplier1'),
(20, 'med20', 'brand21', 'p3', '2026-11-09 00:00:00', '2 times a day', 181, 'generic', 30, 'Supplier1'),
(21, 'med21', 'brand21', 'p6', '2030-09-12 00:00:00', '1 capsule every night before going to sleep', 226, 'local', 289, 'Supplier4'),
(21, 'med21', 'brand22', 'p6', '2020-05-20 00:00:00', '1 capsule every night before going to sleep', 75, 'generic', 62, 'Supplier4'),
(22, 'med22', 'brand22', 'p4', '2022-04-24 00:00:00', '2 times a day', 480, 'local', 250, 'Supplier7'),
(22, 'med22', 'brand23', 'p4', '2030-02-01 00:00:00', '2 times a day', 160, 'generic', 47, 'Supplier7'),
(23, 'med23', 'brand23', 'p7', '2030-12-05 00:00:00', '1 capsule every night before going to sleep', 456, 'local', 89, 'Supplier2'),
(23, 'med23', 'brand24', 'p7', '2025-08-09 00:00:00', '1 capsule every night before going to sleep', 152, 'generic', 158, 'Supplier2'),
(24, 'med24', 'brand24', 'p8', '2030-01-14 00:00:00', 'Once in a week', 536, 'local', 11, 'Supplier3'),
(24, 'med24', 'brand25', 'p8', '2030-05-17 00:00:00', 'Once in a week', 179, 'generic', 162, 'Supplier3'),
(25, 'med25', 'brand25', 'p4', '2023-01-24 00:00:00', '2 times a day', 316, 'local', 54, 'Supplier3'),
(25, 'med25', 'brand26', 'p4', '2029-12-01 00:00:00', '2 times a day', 105, 'generic', 168, 'Supplier3'),
(26, 'med26', 'brand26', 'p5', '2021-06-21 00:00:00', 'Once in a week', 421, 'local', 200, 'Supplier2'),
(26, 'med26', 'brand27', 'p5', '2023-07-15 00:00:00', 'Once in a week', 140, 'generic', 22, 'Supplier2'),
(27, 'med27', 'brand27', 'p5', '2026-09-08 00:00:00', '3 times a day', 230, 'local', 159, 'Supplier5'),
(27, 'med27', 'brand28', 'p5', '2024-12-24 00:00:00', '3 times a day', 77, 'generic', 292, 'Supplier5'),
(28, 'med28', 'brand28', 'p4', '2024-08-26 00:00:00', 'Once in a week', 449, 'local', 217, 'Supplier1'),
(28, 'med28', 'brand29', 'p4', '2026-12-17 00:00:00', 'Once in a week', 150, 'generic', 125, 'Supplier1'),
(29, 'med29', 'brand29', 'p6', '2030-12-24 00:00:00', 'Whenever pain occurs take half medicine', 209, 'local', 174, 'Supplier4'),
(29, 'med29', 'brand30', 'p6', '2029-09-22 00:00:00', 'Whenever pain occurs take half medicine', 70, 'generic', 80, 'Supplier4'),
(30, 'med30', 'brand30', 'p1', '2027-08-28 00:00:00', '2 times a day', 407, 'local', 12, 'Supplier5'),
(30, 'med30', 'brand31', 'p1', '2030-10-14 00:00:00', '2 times a day', 136, 'generic', 265, 'Supplier5'),
(31, 'med31', 'brand31', 'p5', '2027-08-25 00:00:00', '2 times a day', 238, 'local', 13, 'Supplier4'),
(31, 'med31', 'brand32', 'p5', '2030-02-13 00:00:00', '2 times a day', 79, 'generic', 213, 'Supplier4'),
(32, 'med32', 'brand32', 'p7', '2030-04-19 00:00:00', '1 capsule every night before going to sleep', 553, 'local', 216, 'Supplier2'),
(32, 'med32', 'brand33', 'p7', '2024-04-09 00:00:00', '1 capsule every night before going to sleep', 184, 'generic', 57, 'Supplier2'),
(33, 'med33', 'brand33', 'p3', '2020-10-25 00:00:00', 'Whenever pain occurs take one medicine', 186, 'local', 71, 'Supplier3'),
(33, 'med33', 'brand34', 'p3', '2030-09-10 00:00:00', 'Whenever pain occurs take one medicine', 62, 'generic', 170, 'Supplier3'),
(34, 'med34', 'brand34', 'p6', '2022-10-28 00:00:00', '2 times a day', 169, 'local', 227, 'Supplier2'),
(34, 'med34', 'brand35', 'p6', '2028-03-27 00:00:00', '2 times a day', 56, 'generic', 289, 'Supplier2'),
(35, 'med35', 'brand35', 'p2', '2022-07-09 00:00:00', 'Once in a week', 519, 'local', 242, 'Supplier1'),
(35, 'med35', 'brand36', 'p2', '2027-12-19 00:00:00', 'Once in a week', 173, 'generic', 185, 'Supplier1'),
(36, 'med36', 'brand36', 'p5', '2026-09-14 00:00:00', '1 capsule every night before going to sleep', 196, 'local', 60, 'Supplier1'),
(36, 'med36', 'brand37', 'p5', '2020-03-15 00:00:00', '1 capsule every night before going to sleep', 65, 'generic', 89, 'Supplier1'),
(37, 'med37', 'brand37', 'p6', '2026-04-09 00:00:00', '2 times a day', 489, 'local', 296, 'Supplier3'),
(37, 'med37', 'brand38', 'p6', '2025-07-19 00:00:00', '2 times a day', 163, 'generic', 100, 'Supplier3'),
(38, 'med38', 'brand38', 'p1', '2022-07-23 00:00:00', '1 capsule every night before going to sleep', 331, 'local', 144, 'Supplier5'),
(38, 'med38', 'brand39', 'p1', '2021-11-08 00:00:00', '1 capsule every night before going to sleep', 110, 'generic', 41, 'Supplier5'),
(39, 'med39', 'brand39', 'p2', '2029-09-17 00:00:00', 'Whenever pain occurs take half medicine', 222, 'local', 256, 'Supplier5'),
(39, 'med39', 'brand40', 'p2', '2020-10-05 00:00:00', 'Whenever pain occurs take half medicine', 74, 'generic', 140, 'Supplier5'),
(40, 'med40', 'brand40', 'p1', '2023-06-15 00:00:00', 'Whenever pain occurs take half medicine', 139, 'local', 163, 'Supplier4'),
(40, 'med40', 'brand41', 'p1', '2024-03-21 00:00:00', 'Whenever pain occurs take half medicine', 46, 'generic', 199, 'Supplier4'),
(41, 'med41', 'brand41', 'p7', '2023-10-11 00:00:00', '2 times a day', 163, 'local', 275, 'Supplier7'),
(41, 'med41', 'brand42', 'p7', '2030-06-06 00:00:00', '2 times a day', 54, 'generic', 126, 'Supplier7'),
(42, 'med42', 'brand42', 'p8', '2022-05-14 00:00:00', 'Whenever pain occurs take one medicine', 529, 'local', 88, 'Supplier2'),
(42, 'med42', 'brand43', 'p8', '2028-11-10 00:00:00', 'Whenever pain occurs take one medicine', 176, 'generic', 244, 'Supplier2'),
(43, 'med43', 'brand43', 'p5', '2020-06-28 00:00:00', 'Whenever pain occurs take half medicine', 276, 'local', 268, 'Supplier6'),
(43, 'med43', 'brand44', 'p5', '2023-02-23 00:00:00', 'Whenever pain occurs take half medicine', 92, 'generic', 98, 'Supplier6'),
(44, 'med44', 'brand44', 'p2', '2023-01-26 00:00:00', 'Whenever pain occurs take one medicine', 388, 'local', 223, 'Supplier4'),
(44, 'med44', 'brand45', 'p2', '2026-03-12 00:00:00', 'Whenever pain occurs take one medicine', 129, 'generic', 128, 'Supplier4'),
(45, 'med45', 'brand45', 'p4', '2023-12-14 00:00:00', 'Once in a week', 510, 'local', 77, 'Supplier1'),
(45, 'med45', 'brand46', 'p4', '2028-05-12 00:00:00', 'Once in a week', 170, 'generic', 58, 'Supplier1'),
(46, 'med46', 'brand46', 'p7', '2022-01-15 00:00:00', 'Once in a week', 346, 'local', 55, 'Supplier4'),
(46, 'med46', 'brand47', 'p7', '2020-09-06 00:00:00', 'Once in a week', 115, 'generic', 74, 'Supplier4'),
(47, 'med47', 'brand47', 'p7', '2022-06-03 00:00:00', '1 capsule every night before going to sleep', 236, 'local', 189, 'Supplier5'),
(47, 'med47', 'brand48', 'p7', '2025-06-07 00:00:00', '1 capsule every night before going to sleep', 79, 'generic', 122, 'Supplier5'),
(48, 'med48', 'brand48', 'p4', '2025-10-13 00:00:00', 'Once in a week', 304, 'local', 92, 'Supplier6'),
(48, 'med48', 'brand49', 'p4', '2028-09-14 00:00:00', 'Once in a week', 101, 'generic', 104, 'Supplier6'),
(49, 'med49', 'brand49', 'p1', '2029-10-23 00:00:00', '1 capsule every night before going to sleep', 583, 'local', 67, 'Supplier4'),
(49, 'med49', 'brand50', 'p1', '2025-12-24 00:00:00', '1 capsule every night before going to sleep', 194, 'generic', 90, 'Supplier4'),
(50, 'med50', 'brand50', 'p4', '2029-05-02 00:00:00', '1 capsule every night before going to sleep', 258, 'local', 187, 'Supplier5'),
(50, 'med50', 'brand51', 'p4', '2027-11-16 00:00:00', '1 capsule every night before going to sleep', 86, 'generic', 226, 'Supplier5'),
(51, 'med51', 'brand51', 'p5', '2025-04-09 00:00:00', '2 times a day', 244, 'local', 71, 'Supplier3'),
(51, 'med51', 'brand52', 'p5', '2020-04-18 00:00:00', '2 times a day', 81, 'generic', 293, 'Supplier3'),
(52, 'med52', 'brand52', 'p5', '2025-11-23 00:00:00', '2 times a day', 443, 'local', 183, 'Supplier6'),
(52, 'med52', 'brand53', 'p5', '2028-06-09 00:00:00', '2 times a day', 148, 'generic', 174, 'Supplier6'),
(53, 'med53', 'brand53', 'p2', '2020-12-10 00:00:00', 'Whenever pain occurs take half medicine', 103, 'local', 196, 'Supplier3'),
(53, 'med53', 'brand54', 'p2', '2028-12-12 00:00:00', 'Whenever pain occurs take half medicine', 34, 'generic', 244, 'Supplier3'),
(54, 'med54', 'brand54', 'p5', '2028-02-24 00:00:00', '1 capsule every night before going to sleep', 95, 'local', 161, 'Supplier1'),
(54, 'med54', 'brand55', 'p5', '2027-01-22 00:00:00', '1 capsule every night before going to sleep', 32, 'generic', 139, 'Supplier1'),
(55, 'med55', 'brand55', 'p8', '2027-03-05 00:00:00', '3 times a day', 445, 'local', 147, 'Supplier3'),
(55, 'med55', 'brand56', 'p8', '2021-04-05 00:00:00', '3 times a day', 148, 'generic', 108, 'Supplier3'),
(56, 'med56', 'brand56', 'p6', '2021-07-09 00:00:00', 'Whenever pain occurs take one medicine', 429, 'local', 62, 'Supplier4'),
(56, 'med56', 'brand57', 'p6', '2027-02-01 00:00:00', 'Whenever pain occurs take one medicine', 143, 'generic', 154, 'Supplier4'),
(57, 'med57', 'brand57', 'p2', '2022-04-02 00:00:00', '2 times a day', 507, 'local', 159, 'Supplier6'),
(57, 'med57', 'brand58', 'p2', '2021-06-10 00:00:00', '2 times a day', 169, 'generic', 121, 'Supplier6'),
(58, 'med58', 'brand58', 'p6', '2028-10-05 00:00:00', 'Whenever pain occurs take half medicine', 598, 'local', 241, 'Supplier7'),
(58, 'med58', 'brand59', 'p6', '2022-08-22 00:00:00', 'Whenever pain occurs take half medicine', 199, 'generic', 154, 'Supplier7'),
(59, 'med59', 'brand59', 'p5', '2024-08-05 00:00:00', 'Once in a week', 416, 'local', 151, 'Supplier1'),
(59, 'med59', 'brand60', 'p5', '2028-11-28 00:00:00', 'Once in a week', 139, 'generic', 234, 'Supplier1'),
(60, 'med60', 'brand60', 'p1', '2025-11-23 00:00:00', '1 capsule every night before going to sleep', 91, 'local', 170, 'Supplier3'),
(60, 'med60', 'brand61', 'p1', '2027-11-15 00:00:00', '1 capsule every night before going to sleep', 30, 'generic', 171, 'Supplier3'),
(61, 'med61', 'brand61', 'p5', '2021-02-18 00:00:00', 'Whenever pain occurs take half medicine', 563, 'local', 16, 'Supplier3'),
(61, 'med61', 'brand62', 'p5', '2028-09-23 00:00:00', 'Whenever pain occurs take half medicine', 188, 'generic', 13, 'Supplier3'),
(62, 'med62', 'brand62', 'p7', '2024-12-23 00:00:00', '3 times a day', 414, 'local', 237, 'Supplier1'),
(62, 'med62', 'brand63', 'p7', '2027-05-10 00:00:00', '3 times a day', 138, 'generic', 100, 'Supplier1'),
(63, 'med63', 'brand63', 'p5', '2028-07-15 00:00:00', '2 times a day', 176, 'local', 74, 'Supplier1'),
(63, 'med63', 'brand64', 'p5', '2022-10-27 00:00:00', '2 times a day', 59, 'generic', 180, 'Supplier1'),
(64, 'med64', 'brand64', 'p7', '2024-10-07 00:00:00', 'Whenever pain occurs take one medicine', 58, 'local', 43, 'Supplier6'),
(64, 'med64', 'brand65', 'p7', '2020-01-11 00:00:00', 'Whenever pain occurs take one medicine', 19, 'generic', 211, 'Supplier6'),
(65, 'med65', 'brand65', 'p7', '2028-07-17 00:00:00', '1 capsule every night before going to sleep', 450, 'local', 257, 'Supplier6'),
(65, 'med65', 'brand66', 'p7', '2025-02-14 00:00:00', '1 capsule every night before going to sleep', 150, 'generic', 20, 'Supplier6'),
(66, 'med66', 'brand66', 'p4', '2022-08-14 00:00:00', '3 times a day', 93, 'local', 114, 'Supplier1'),
(66, 'med66', 'brand67', 'p4', '2022-09-12 00:00:00', '3 times a day', 31, 'generic', 209, 'Supplier1'),
(67, 'med67', 'brand67', 'p8', '2020-03-23 00:00:00', '3 times a day', 192, 'local', 130, 'Supplier3'),
(67, 'med67', 'brand68', 'p8', '2024-11-17 00:00:00', '3 times a day', 64, 'generic', 81, 'Supplier3'),
(68, 'med68', 'brand68', 'p5', '2026-11-01 00:00:00', 'Whenever pain occurs take one medicine', 380, 'local', 84, 'Supplier4'),
(68, 'med68', 'brand69', 'p5', '2020-02-25 00:00:00', 'Whenever pain occurs take one medicine', 127, 'generic', 245, 'Supplier4'),
(69, 'med69', 'brand69', 'p5', '2027-02-25 00:00:00', '1 capsule every night before going to sleep', 185, 'local', 253, 'Supplier2'),
(69, 'med69', 'brand70', 'p5', '2026-08-10 00:00:00', '1 capsule every night before going to sleep', 62, 'generic', 13, 'Supplier2'),
(70, 'med70', 'brand70', 'p8', '2022-12-13 00:00:00', 'Whenever pain occurs take one medicine', 573, 'local', 127, 'Supplier7'),
(70, 'med70', 'brand71', 'p8', '2026-08-03 00:00:00', 'Whenever pain occurs take one medicine', 191, 'generic', 234, 'Supplier7'),
(71, 'med71', 'brand71', 'p6', '2023-11-11 00:00:00', '2 times a day', 103, 'local', 181, 'Supplier3'),
(71, 'med71', 'brand72', 'p6', '2021-10-05 00:00:00', '2 times a day', 34, 'generic', 300, 'Supplier3'),
(72, 'med72', 'brand72', 'p1', '2030-04-25 00:00:00', '2 times a day', 503, 'local', 77, 'Supplier5'),
(72, 'med72', 'brand73', 'p1', '2025-07-19 00:00:00', '2 times a day', 168, 'generic', 198, 'Supplier5'),
(73, 'med73', 'brand73', 'p2', '2023-07-15 00:00:00', 'Whenever pain occurs take one medicine', 572, 'local', 65, 'Supplier3'),
(73, 'med73', 'brand74', 'p2', '2023-07-02 00:00:00', 'Whenever pain occurs take one medicine', 191, 'generic', 231, 'Supplier3'),
(74, 'med74', 'brand74', 'p3', '2027-11-25 00:00:00', 'Whenever pain occurs take half medicine', 169, 'local', 269, 'Supplier6'),
(74, 'med74', 'brand75', 'p3', '2020-02-17 00:00:00', 'Whenever pain occurs take half medicine', 56, 'generic', 291, 'Supplier6'),
(75, 'med75', 'brand75', 'p2', '2021-07-12 00:00:00', '3 times a day', 411, 'local', 143, 'Supplier2'),
(75, 'med75', 'brand76', 'p2', '2020-07-04 00:00:00', '3 times a day', 137, 'generic', 95, 'Supplier2'),
(76, 'med76', 'brand76', 'p6', '2029-02-10 00:00:00', 'Once in a week', 239, 'local', 16, 'Supplier6'),
(76, 'med76', 'brand77', 'p6', '2020-04-20 00:00:00', 'Once in a week', 80, 'generic', 197, 'Supplier6'),
(77, 'med77', 'brand77', 'p5', '2021-09-07 00:00:00', '2 times a day', 482, 'local', 97, 'Supplier2'),
(77, 'med77', 'brand78', 'p5', '2024-08-14 00:00:00', '2 times a day', 161, 'generic', 263, 'Supplier2'),
(78, 'med78', 'brand78', 'p6', '2029-01-14 00:00:00', '1 capsule every night before going to sleep', 545, 'local', 120, 'Supplier7'),
(78, 'med78', 'brand79', 'p6', '2030-02-28 00:00:00', '1 capsule every night before going to sleep', 182, 'generic', 34, 'Supplier7'),
(79, 'med79', 'brand79', 'p1', '2021-11-21 00:00:00', 'Once in a week', 471, 'local', 41, 'Supplier7'),
(79, 'med79', 'brand80', 'p1', '2025-07-11 00:00:00', 'Once in a week', 157, 'generic', 140, 'Supplier7'),
(80, 'med80', 'brand80', 'p4', '2029-09-16 00:00:00', 'Whenever pain occurs take one medicine', 581, 'local', 102, 'Supplier4'),
(80, 'med80', 'brand81', 'p4', '2022-05-11 00:00:00', 'Whenever pain occurs take one medicine', 194, 'generic', 145, 'Supplier4'),
(81, 'med81', 'brand81', 'p8', '2025-05-25 00:00:00', 'Once in a week', 342, 'local', 187, 'Supplier4'),
(81, 'med81', 'brand82', 'p8', '2028-07-08 00:00:00', 'Once in a week', 114, 'generic', 13, 'Supplier4'),
(82, 'med82', 'brand82', 'p5', '2026-09-20 00:00:00', 'Once in a week', 581, 'local', 121, 'Supplier4'),
(82, 'med82', 'brand83', 'p5', '2028-10-08 00:00:00', 'Once in a week', 194, 'generic', 164, 'Supplier4'),
(83, 'med83', 'brand83', 'p3', '2021-06-24 00:00:00', 'Whenever pain occurs take half medicine', 475, 'local', 50, 'Supplier3'),
(83, 'med83', 'brand84', 'p3', '2023-12-20 00:00:00', 'Whenever pain occurs take half medicine', 158, 'generic', 140, 'Supplier3'),
(84, 'med84', 'brand84', 'p6', '2024-04-25 00:00:00', 'Whenever pain occurs take half medicine', 494, 'local', 131, 'Supplier5'),
(84, 'med84', 'brand85', 'p6', '2025-11-28 00:00:00', 'Whenever pain occurs take half medicine', 165, 'generic', 87, 'Supplier5'),
(85, 'med85', 'brand85', 'p7', '2028-11-20 00:00:00', '3 times a day', 395, 'local', 56, 'Supplier6'),
(85, 'med85', 'brand86', 'p7', '2028-01-12 00:00:00', '3 times a day', 132, 'generic', 48, 'Supplier6'),
(86, 'med86', 'brand86', 'p4', '2024-04-11 00:00:00', '3 times a day', 437, 'local', 196, 'Supplier4'),
(86, 'med86', 'brand87', 'p4', '2023-04-19 00:00:00', '3 times a day', 146, 'generic', 66, 'Supplier4'),
(87, 'med87', 'brand87', 'p3', '2022-02-20 00:00:00', '3 times a day', 221, 'local', 237, 'Supplier4'),
(87, 'med87', 'brand88', 'p3', '2023-06-07 00:00:00', '3 times a day', 74, 'generic', 251, 'Supplier4'),
(88, 'med88', 'brand88', 'p5', '2029-12-07 00:00:00', 'Whenever pain occurs take one medicine', 239, 'local', 175, 'Supplier3'),
(88, 'med88', 'brand89', 'p5', '2029-06-06 00:00:00', 'Whenever pain occurs take one medicine', 80, 'generic', 211, 'Supplier3'),
(89, 'med89', 'brand89', 'p6', '2026-06-10 00:00:00', 'Whenever pain occurs take half medicine', 310, 'local', 126, 'Supplier4'),
(89, 'med89', 'brand90', 'p6', '2030-01-09 00:00:00', 'Whenever pain occurs take half medicine', 103, 'generic', 81, 'Supplier4'),
(90, 'med90', 'brand90', 'p7', '2030-08-21 00:00:00', 'Once in a week', 511, 'local', 34, 'Supplier1'),
(90, 'med90', 'brand91', 'p7', '2029-03-20 00:00:00', 'Once in a week', 170, 'generic', 47, 'Supplier1'),
(91, 'med91', 'brand91', 'p2', '2022-04-05 00:00:00', '1 capsule every night before going to sleep', 500, 'local', 279, 'Supplier6'),
(91, 'med91', 'brand92', 'p2', '2029-08-17 00:00:00', '1 capsule every night before going to sleep', 167, 'generic', 221, 'Supplier6'),
(92, 'med92', 'brand92', 'p6', '2022-10-06 00:00:00', 'Once in a week', 498, 'local', 262, 'Supplier1'),
(92, 'med92', 'brand93', 'p6', '2030-11-23 00:00:00', 'Once in a week', 166, 'generic', 88, 'Supplier1'),
(93, 'med93', 'brand93', 'p3', '2028-05-15 00:00:00', '3 times a day', 234, 'local', 17, 'Supplier7'),
(93, 'med93', 'brand94', 'p3', '2030-10-14 00:00:00', '3 times a day', 78, 'generic', 123, 'Supplier7'),
(94, 'med94', 'brand94', 'p8', '2030-07-01 00:00:00', 'Whenever pain occurs take half medicine', 403, 'local', 24, 'Supplier7'),
(94, 'med94', 'brand95', 'p8', '2024-08-11 00:00:00', 'Whenever pain occurs take half medicine', 134, 'generic', 115, 'Supplier7'),
(95, 'med95', 'brand95', 'p1', '2028-05-18 00:00:00', '1 capsule every night before going to sleep', 581, 'local', 215, 'Supplier5'),
(95, 'med95', 'brand96', 'p1', '2024-03-15 00:00:00', '1 capsule every night before going to sleep', 194, 'generic', 273, 'Supplier5'),
(96, 'med96', 'brand96', 'p7', '2021-03-18 00:00:00', '2 times a day', 519, 'local', 95, 'Supplier7'),
(96, 'med96', 'brand97', 'p7', '2023-04-01 00:00:00', '2 times a day', 173, 'generic', 72, 'Supplier7'),
(97, 'med97', 'brand97', 'p7', '2029-09-08 00:00:00', '1 capsule every night before going to sleep', 593, 'local', 270, 'Supplier4'),
(97, 'med97', 'brand98', 'p7', '2024-01-04 00:00:00', '1 capsule every night before going to sleep', 198, 'generic', 128, 'Supplier4'),
(98, 'med98', 'brand98', 'p1', '2028-07-12 00:00:00', '2 times a day', 270, 'local', 87, 'Supplier5'),
(98, 'med98', 'brand99', 'p1', '2027-11-20 00:00:00', '2 times a day', 90, 'generic', 195, 'Supplier5'),
(99, 'med99', 'brand99', 'p3', '2028-02-24 00:00:00', 'Whenever pain occurs take one medicine', 497, 'local', 254, 'Supplier1'),
(99, 'med99', 'brand100', 'p3', '2029-02-20 00:00:00', 'Whenever pain occurs take one medicine', 166, 'generic', 138, 'Supplier1'),
(100, 'med100', 'brand100', 'p1', '2028-06-01 00:00:00', '1 capsule every night before going to sleep', 394, 'local', 160, 'Supplier5'),
(100, 'med100', 'brand101', 'p1', '2021-11-01 00:00:00', '1 capsule every night before going to sleep', 131, 'generic', 15, 'Supplier5'),
(101, 'med101', 'brand101', 'p5', '2029-12-14 00:00:00', 'Once in a week', 553, 'local', 118, 'Supplier1'),
(101, 'med101', 'brand102', 'p5', '2023-03-15 00:00:00', 'Once in a week', 184, 'generic', 84, 'Supplier1'),
(102, 'med102', 'brand102', 'p1', '2029-01-27 00:00:00', '2 times a day', 531, 'local', 69, 'Supplier4'),
(102, 'med102', 'brand103', 'p1', '2029-06-19 00:00:00', '2 times a day', 177, 'generic', 88, 'Supplier4'),
(103, 'med103', 'brand103', 'p5', '2030-08-13 00:00:00', '1 capsule every night before going to sleep', 365, 'local', 265, 'Supplier3'),
(103, 'med103', 'brand104', 'p5', '2029-11-23 00:00:00', '1 capsule every night before going to sleep', 122, 'generic', 39, 'Supplier3'),
(104, 'med104', 'brand104', 'p6', '2028-05-06 00:00:00', '1 capsule every night before going to sleep', 509, 'local', 49, 'Supplier7'),
(104, 'med104', 'brand105', 'p6', '2026-10-11 00:00:00', '1 capsule every night before going to sleep', 170, 'generic', 170, 'Supplier7'),
(105, 'med105', 'brand105', 'p1', '2020-01-26 00:00:00', '1 capsule every night before going to sleep', 345, 'local', 98, 'Supplier1'),
(105, 'med105', 'brand106', 'p1', '2029-10-18 00:00:00', '1 capsule every night before going to sleep', 115, 'generic', 122, 'Supplier1'),
(106, 'med106', 'brand106', 'p3', '2027-01-08 00:00:00', 'Once in a week', 554, 'local', 138, 'Supplier2'),
(106, 'med106', 'brand107', 'p3', '2029-01-23 00:00:00', 'Once in a week', 185, 'generic', 92, 'Supplier2'),
(107, 'med107', 'brand107', 'p6', '2020-09-24 00:00:00', '3 times a day', 316, 'local', 80, 'Supplier2'),
(107, 'med107', 'brand108', 'p6', '2025-05-27 00:00:00', '3 times a day', 105, 'generic', 193, 'Supplier2'),
(108, 'med108', 'brand108', 'p6', '2025-03-14 00:00:00', '3 times a day', 117, 'local', 208, 'Supplier7'),
(108, 'med108', 'brand109', 'p6', '2026-02-10 00:00:00', '3 times a day', 39, 'generic', 294, 'Supplier7'),
(109, 'med109', 'brand109', 'p7', '2030-06-27 00:00:00', '1 capsule every night before going to sleep', 125, 'local', 220, 'Supplier6'),
(109, 'med109', 'brand110', 'p7', '2020-02-09 00:00:00', '1 capsule every night before going to sleep', 42, 'generic', 101, 'Supplier6'),
(110, 'med110', 'brand110', 'p4', '2028-02-03 00:00:00', '2 times a day', 52, 'local', 266, 'Supplier4'),
(110, 'med110', 'brand111', 'p4', '2021-01-15 00:00:00', '2 times a day', 17, 'generic', 187, 'Supplier4'),
(111, 'med111', 'brand111', 'p6', '2029-06-10 00:00:00', 'Once in a week', 557, 'local', 284, 'Supplier1'),
(111, 'med111', 'brand112', 'p6', '2024-04-28 00:00:00', 'Once in a week', 186, 'generic', 62, 'Supplier1'),
(112, 'med112', 'brand112', 'p3', '2022-11-17 00:00:00', '1 capsule every night before going to sleep', 374, 'local', 237, 'Supplier2'),
(112, 'med112', 'brand113', 'p3', '2028-09-02 00:00:00', '1 capsule every night before going to sleep', 125, 'generic', 196, 'Supplier2'),
(113, 'med113', 'brand113', 'p7', '2023-11-20 00:00:00', '3 times a day', 466, 'local', 54, 'Supplier5'),
(113, 'med113', 'brand114', 'p7', '2023-05-10 00:00:00', '3 times a day', 155, 'generic', 46, 'Supplier5'),
(114, 'med114', 'brand114', 'p8', '2022-06-09 00:00:00', '2 times a day', 491, 'local', 39, 'Supplier1'),
(114, 'med114', 'brand115', 'p8', '2027-03-15 00:00:00', '2 times a day', 164, 'generic', 112, 'Supplier1'),
(115, 'med115', 'brand115', 'p1', '2030-10-28 00:00:00', '1 capsule every night before going to sleep', 309, 'local', 15, 'Supplier1'),
(115, 'med115', 'brand116', 'p1', '2027-04-10 00:00:00', '1 capsule every night before going to sleep', 103, 'generic', 33, 'Supplier1'),
(116, 'med116', 'brand116', 'p6', '2026-10-20 00:00:00', '1 capsule every night before going to sleep', 85, 'local', 41, 'Supplier1'),
(116, 'med116', 'brand117', 'p6', '2029-06-27 00:00:00', '1 capsule every night before going to sleep', 28, 'generic', 182, 'Supplier1'),
(117, 'med117', 'brand117', 'p4', '2028-05-27 00:00:00', '2 times a day', 507, 'local', 203, 'Supplier1'),
(117, 'med117', 'brand118', 'p4', '2026-07-09 00:00:00', '2 times a day', 169, 'generic', 161, 'Supplier1'),
(118, 'med118', 'brand118', 'p7', '2029-07-08 00:00:00', 'Whenever pain occurs take half medicine', 423, 'local', 173, 'Supplier7'),
(118, 'med118', 'brand119', 'p7', '2021-02-01 00:00:00', 'Whenever pain occurs take half medicine', 141, 'generic', 255, 'Supplier7'),
(119, 'med119', 'brand119', 'p5', '2024-03-03 00:00:00', 'Once in a week', 50, 'local', 285, 'Supplier7'),
(119, 'med119', 'brand120', 'p5', '2029-08-16 00:00:00', 'Once in a week', 17, 'generic', 113, 'Supplier7'),
(120, 'med120', 'brand120', 'p1', '2025-09-11 00:00:00', '1 capsule every night before going to sleep', 52, 'local', 215, 'Supplier6'),
(120, 'med120', 'brand121', 'p1', '2030-04-03 00:00:00', '1 capsule every night before going to sleep', 17, 'generic', 117, 'Supplier6'),
(121, 'med121', 'brand121', 'p3', '2028-01-11 00:00:00', 'Whenever pain occurs take one medicine', 565, 'local', 192, 'Supplier4'),
(121, 'med121', 'brand122', 'p3', '2021-10-09 00:00:00', 'Whenever pain occurs take one medicine', 188, 'generic', 51, 'Supplier4'),
(122, 'med122', 'brand122', 'p2', '2024-06-22 00:00:00', 'Whenever pain occurs take one medicine', 478, 'local', 95, 'Supplier7'),
(122, 'med122', 'brand123', 'p2', '2024-12-28 00:00:00', 'Whenever pain occurs take one medicine', 159, 'generic', 233, 'Supplier7'),
(123, 'med123', 'brand123', 'p8', '2020-11-04 00:00:00', 'Once in a week', 289, 'local', 299, 'Supplier2'),
(123, 'med123', 'brand124', 'p8', '2024-04-28 00:00:00', 'Once in a week', 96, 'generic', 140, 'Supplier2'),
(124, 'med124', 'brand124', 'p3', '2025-02-19 00:00:00', '2 times a day', 529, 'local', 209, 'Supplier1'),
(124, 'med124', 'brand125', 'p3', '2027-02-25 00:00:00', '2 times a day', 176, 'generic', 80, 'Supplier1'),
(125, 'med125', 'brand125', 'p5', '2028-07-12 00:00:00', 'Whenever pain occurs take one medicine', 533, 'local', 161, 'Supplier5'),
(125, 'med125', 'brand126', 'p5', '2027-07-21 00:00:00', 'Whenever pain occurs take one medicine', 178, 'generic', 73, 'Supplier5'),
(126, 'med126', 'brand126', 'p4', '2023-03-10 00:00:00', '1 capsule every night before going to sleep', 326, 'local', 115, 'Supplier2'),
(126, 'med126', 'brand127', 'p4', '2025-04-26 00:00:00', '1 capsule every night before going to sleep', 109, 'generic', 79, 'Supplier2'),
(127, 'med127', 'brand127', 'p6', '2020-07-05 00:00:00', 'Whenever pain occurs take half medicine', 359, 'local', 167, 'Supplier7'),
(127, 'med127', 'brand128', 'p6', '2027-01-12 00:00:00', 'Whenever pain occurs take half medicine', 120, 'generic', 234, 'Supplier7'),
(128, 'med128', 'brand128', 'p2', '2026-02-07 00:00:00', '3 times a day', 455, 'local', 195, 'Supplier2'),
(128, 'med128', 'brand129', 'p2', '2020-11-06 00:00:00', '3 times a day', 152, 'generic', 15, 'Supplier2'),
(129, 'med129', 'brand129', 'p5', '2025-10-18 00:00:00', 'Whenever pain occurs take half medicine', 70, 'local', 40, 'Supplier4'),
(129, 'med129', 'brand130', 'p5', '2021-08-09 00:00:00', 'Whenever pain occurs take half medicine', 23, 'generic', 50, 'Supplier4'),
(130, 'med130', 'brand130', 'p7', '2030-03-14 00:00:00', 'Whenever pain occurs take half medicine', 101, 'local', 112, 'Supplier4'),
(130, 'med130', 'brand131', 'p7', '2030-09-19 00:00:00', 'Whenever pain occurs take half medicine', 34, 'generic', 78, 'Supplier4'),
(131, 'med131', 'brand131', 'p2', '2021-08-23 00:00:00', 'Whenever pain occurs take one medicine', 77, 'local', 172, 'Supplier2'),
(131, 'med131', 'brand132', 'p2', '2028-08-05 00:00:00', 'Whenever pain occurs take one medicine', 26, 'generic', 104, 'Supplier2'),
(132, 'med132', 'brand132', 'p2', '2023-10-08 00:00:00', 'Whenever pain occurs take one medicine', 114, 'local', 223, 'Supplier3'),
(132, 'med132', 'brand133', 'p2', '2029-02-23 00:00:00', 'Whenever pain occurs take one medicine', 38, 'generic', 150, 'Supplier3'),
(133, 'med133', 'brand133', 'p1', '2021-10-21 00:00:00', 'Whenever pain occurs take half medicine', 245, 'local', 186, 'Supplier2'),
(133, 'med133', 'brand134', 'p1', '2020-03-25 00:00:00', 'Whenever pain occurs take half medicine', 82, 'generic', 18, 'Supplier2'),
(134, 'med134', 'brand134', 'p4', '2022-03-21 00:00:00', '1 capsule every night before going to sleep', 315, 'local', 282, 'Supplier3'),
(134, 'med134', 'brand135', 'p4', '2023-04-23 00:00:00', '1 capsule every night before going to sleep', 105, 'generic', 239, 'Supplier3'),
(135, 'med135', 'brand135', 'p4', '2020-06-21 00:00:00', '1 capsule every night before going to sleep', 189, 'local', 298, 'Supplier5'),
(135, 'med135', 'brand136', 'p4', '2021-10-28 00:00:00', '1 capsule every night before going to sleep', 63, 'generic', 135, 'Supplier5'),
(136, 'med136', 'brand136', 'p8', '2022-08-05 00:00:00', 'Whenever pain occurs take half medicine', 466, 'local', 46, 'Supplier4'),
(136, 'med136', 'brand137', 'p8', '2027-11-10 00:00:00', 'Whenever pain occurs take half medicine', 155, 'generic', 43, 'Supplier4'),
(137, 'med137', 'brand137', 'p8', '2028-06-01 00:00:00', '1 capsule every night before going to sleep', 372, 'local', 54, 'Supplier5'),
(137, 'med137', 'brand138', 'p8', '2023-11-26 00:00:00', '1 capsule every night before going to sleep', 124, 'generic', 180, 'Supplier5'),
(138, 'med138', 'brand138', 'p7', '2030-10-05 00:00:00', '2 times a day', 493, 'local', 40, 'Supplier7'),
(138, 'med138', 'brand139', 'p7', '2021-07-02 00:00:00', '2 times a day', 164, 'generic', 36, 'Supplier7'),
(139, 'med139', 'brand139', 'p3', '2029-12-02 00:00:00', 'Once in a week', 69, 'local', 158, 'Supplier1'),
(139, 'med139', 'brand140', 'p3', '2020-05-19 00:00:00', 'Once in a week', 23, 'generic', 177, 'Supplier1'),
(140, 'med140', 'brand140', 'p1', '2020-06-22 00:00:00', '3 times a day', 361, 'local', 112, 'Supplier1'),
(140, 'med140', 'brand141', 'p1', '2030-05-01 00:00:00', '3 times a day', 120, 'generic', 284, 'Supplier1'),
(141, 'med141', 'brand141', 'p7', '2023-07-23 00:00:00', '1 capsule every night before going to sleep', 291, 'local', 286, 'Supplier1'),
(141, 'med141', 'brand142', 'p7', '2029-11-21 00:00:00', '1 capsule every night before going to sleep', 97, 'generic', 19, 'Supplier1'),
(142, 'med142', 'brand142', 'p4', '2021-10-24 00:00:00', 'Once in a week', 525, 'local', 183, 'Supplier4'),
(142, 'med142', 'brand143', 'p4', '2027-12-13 00:00:00', 'Once in a week', 175, 'generic', 138, 'Supplier4'),
(143, 'med143', 'brand143', 'p5', '2020-07-04 00:00:00', '1 capsule every night before going to sleep', 463, 'local', 130, 'Supplier4'),
(143, 'med143', 'brand144', 'p5', '2024-12-19 00:00:00', '1 capsule every night before going to sleep', 154, 'generic', 185, 'Supplier4'),
(144, 'med144', 'brand144', 'p7', '2027-01-06 00:00:00', '2 times a day', 329, 'local', 266, 'Supplier2'),
(144, 'med144', 'brand145', 'p7', '2020-09-10 00:00:00', '2 times a day', 110, 'generic', 111, 'Supplier2'),
(145, 'med145', 'brand145', 'p1', '2027-07-04 00:00:00', '3 times a day', 362, 'local', 125, 'Supplier4'),
(145, 'med145', 'brand146', 'p1', '2028-04-17 00:00:00', '3 times a day', 121, 'generic', 261, 'Supplier4'),
(146, 'med146', 'brand146', 'p2', '2020-06-05 00:00:00', 'Once in a week', 526, 'local', 46, 'Supplier6'),
(146, 'med146', 'brand147', 'p2', '2020-04-06 00:00:00', 'Once in a week', 175, 'generic', 108, 'Supplier6'),
(147, 'med147', 'brand147', 'p1', '2026-01-02 00:00:00', 'Once in a week', 226, 'local', 214, 'Supplier6'),
(147, 'med147', 'brand148', 'p1', '2026-02-20 00:00:00', 'Once in a week', 75, 'generic', 182, 'Supplier6'),
(148, 'med148', 'brand148', 'p8', '2025-04-07 00:00:00', '3 times a day', 339, 'local', 226, 'Supplier2'),
(148, 'med148', 'brand149', 'p8', '2027-04-15 00:00:00', '3 times a day', 113, 'generic', 128, 'Supplier2'),
(149, 'med149', 'brand149', 'p1', '2021-02-19 00:00:00', 'Whenever pain occurs take half medicine', 112, 'local', 44, 'Supplier2'),
(149, 'med149', 'brand150', 'p1', '2027-06-12 00:00:00', 'Whenever pain occurs take half medicine', 37, 'generic', 68, 'Supplier2'),
(150, 'med150', 'brand150', 'p2', '2027-05-25 00:00:00', '2 times a day', 296, 'local', 109, 'Supplier5'),
(150, 'med150', 'brand151', 'p2', '2029-10-12 00:00:00', '2 times a day', 99, 'generic', 67, 'Supplier5'),
(151, 'med151', 'brand151', 'p1', '2030-10-06 00:00:00', 'Whenever pain occurs take half medicine', 300, 'local', 217, 'Supplier1'),
(151, 'med151', 'brand152', 'p1', '2020-09-19 00:00:00', 'Whenever pain occurs take half medicine', 100, 'generic', 100, 'Supplier1'),
(152, 'med152', 'brand152', 'p2', '2030-10-27 00:00:00', '3 times a day', 330, 'local', 190, 'Supplier3'),
(152, 'med152', 'brand153', 'p2', '2022-05-18 00:00:00', '3 times a day', 110, 'generic', 140, 'Supplier3'),
(153, 'med153', 'brand153', 'p6', '2021-09-05 00:00:00', 'Whenever pain occurs take one medicine', 350, 'local', 187, 'Supplier7'),
(153, 'med153', 'brand154', 'p6', '2022-11-21 00:00:00', 'Whenever pain occurs take one medicine', 117, 'generic', 179, 'Supplier7'),
(154, 'med154', 'brand154', 'p6', '2029-04-28 00:00:00', '3 times a day', 527, 'local', 255, 'Supplier1'),
(154, 'med154', 'brand155', 'p6', '2029-05-14 00:00:00', '3 times a day', 176, 'generic', 277, 'Supplier1'),
(155, 'med155', 'brand155', 'p4', '2029-01-22 00:00:00', '3 times a day', 476, 'local', 99, 'Supplier1'),
(155, 'med155', 'brand156', 'p4', '2022-12-20 00:00:00', '3 times a day', 159, 'generic', 53, 'Supplier1'),
(156, 'med156', 'brand156', 'p1', '2025-05-15 00:00:00', 'Once in a week', 548, 'local', 105, 'Supplier4'),
(156, 'med156', 'brand157', 'p1', '2025-05-11 00:00:00', 'Once in a week', 183, 'generic', 212, 'Supplier4'),
(157, 'med157', 'brand157', 'p6', '2023-03-09 00:00:00', 'Whenever pain occurs take half medicine', 282, 'local', 142, 'Supplier2'),
(157, 'med157', 'brand158', 'p6', '2027-12-24 00:00:00', 'Whenever pain occurs take half medicine', 94, 'generic', 60, 'Supplier2'),
(158, 'med158', 'brand158', 'p2', '2021-11-02 00:00:00', '3 times a day', 560, 'local', 29, 'Supplier7'),
(158, 'med158', 'brand159', 'p2', '2027-08-18 00:00:00', '3 times a day', 187, 'generic', 235, 'Supplier7'),
(159, 'med159', 'brand159', 'p8', '2021-07-25 00:00:00', 'Whenever pain occurs take one medicine', 260, 'local', 223, 'Supplier7'),
(159, 'med159', 'brand160', 'p8', '2021-07-05 00:00:00', 'Whenever pain occurs take one medicine', 87, 'generic', 218, 'Supplier7'),
(160, 'med160', 'brand160', 'p6', '2022-10-02 00:00:00', '3 times a day', 150, 'local', 250, 'Supplier5'),
(160, 'med160', 'brand161', 'p6', '2025-03-07 00:00:00', '3 times a day', 50, 'generic', 171, 'Supplier5'),
(161, 'med161', 'brand161', 'p8', '2020-06-16 00:00:00', '3 times a day', 149, 'local', 39, 'Supplier2'),
(161, 'med161', 'brand162', 'p8', '2022-12-17 00:00:00', '3 times a day', 50, 'generic', 188, 'Supplier2'),
(162, 'med162', 'brand162', 'p8', '2026-01-28 00:00:00', 'Once in a week', 428, 'local', 212, 'Supplier5'),
(162, 'med162', 'brand163', 'p8', '2020-04-08 00:00:00', 'Once in a week', 143, 'generic', 45, 'Supplier5'),
(163, 'med163', 'brand163', 'p4', '2029-02-09 00:00:00', 'Once in a week', 105, 'local', 60, 'Supplier7'),
(163, 'med163', 'brand164', 'p4', '2023-04-11 00:00:00', 'Once in a week', 35, 'generic', 248, 'Supplier7'),
(164, 'med164', 'brand164', 'p6', '2025-08-14 00:00:00', '3 times a day', 322, 'local', 184, 'Supplier1'),
(164, 'med164', 'brand165', 'p6', '2023-06-11 00:00:00', '3 times a day', 107, 'generic', 57, 'Supplier1'),
(165, 'med165', 'brand165', 'p5', '2026-11-05 00:00:00', 'Once in a week', 354, 'local', 59, 'Supplier5'),
(165, 'med165', 'brand166', 'p5', '2023-04-19 00:00:00', 'Once in a week', 118, 'generic', 185, 'Supplier5'),
(166, 'med166', 'brand166', 'p8', '2030-03-09 00:00:00', '2 times a day', 112, 'local', 256, 'Supplier4'),
(166, 'med166', 'brand167', 'p8', '2025-09-23 00:00:00', '2 times a day', 37, 'generic', 262, 'Supplier4'),
(167, 'med167', 'brand167', 'p4', '2021-12-04 00:00:00', 'Whenever pain occurs take one medicine', 386, 'local', 158, 'Supplier1'),
(167, 'med167', 'brand168', 'p4', '2025-02-19 00:00:00', 'Whenever pain occurs take one medicine', 129, 'generic', 136, 'Supplier1'),
(168, 'med168', 'brand168', 'p5', '2024-06-22 00:00:00', '1 capsule every night before going to sleep', 232, 'local', 237, 'Supplier7'),
(168, 'med168', 'brand169', 'p5', '2026-08-10 00:00:00', '1 capsule every night before going to sleep', 77, 'generic', 66, 'Supplier7'),
(169, 'med169', 'brand169', 'p4', '2025-08-16 00:00:00', 'Once in a week', 435, 'local', 174, 'Supplier5'),
(169, 'med169', 'brand170', 'p4', '2022-02-09 00:00:00', 'Once in a week', 145, 'generic', 172, 'Supplier5'),
(170, 'med170', 'brand170', 'p5', '2027-12-08 00:00:00', 'Whenever pain occurs take half medicine', 148, 'local', 187, 'Supplier7'),
(170, 'med170', 'brand171', 'p5', '2030-03-20 00:00:00', 'Whenever pain occurs take half medicine', 49, 'generic', 114, 'Supplier7'),
(171, 'med171', 'brand171', 'p1', '2024-06-28 00:00:00', '2 times a day', 141, 'local', 64, 'Supplier7'),
(171, 'med171', 'brand172', 'p1', '2022-04-25 00:00:00', '2 times a day', 47, 'generic', 136, 'Supplier7'),
(172, 'med172', 'brand172', 'p6', '2024-01-13 00:00:00', '3 times a day', 368, 'local', 91, 'Supplier2'),
(172, 'med172', 'brand173', 'p6', '2022-09-19 00:00:00', '3 times a day', 123, 'generic', 233, 'Supplier2'),
(173, 'med173', 'brand173', 'p1', '2023-10-27 00:00:00', '1 capsule every night before going to sleep', 461, 'local', 132, 'Supplier1'),
(173, 'med173', 'brand174', 'p1', '2026-09-20 00:00:00', '1 capsule every night before going to sleep', 154, 'generic', 93, 'Supplier1'),
(174, 'med174', 'brand174', 'p4', '2020-10-16 00:00:00', '2 times a day', 362, 'local', 143, 'Supplier5'),
(174, 'med174', 'brand175', 'p4', '2027-08-14 00:00:00', '2 times a day', 121, 'generic', 129, 'Supplier5'),
(175, 'med175', 'brand175', 'p6', '2021-07-23 00:00:00', '2 times a day', 102, 'local', 271, 'Supplier4'),
(175, 'med175', 'brand176', 'p6', '2022-07-24 00:00:00', '2 times a day', 34, 'generic', 199, 'Supplier4'),
(176, 'med176', 'brand176', 'p8', '2022-10-12 00:00:00', '1 capsule every night before going to sleep', 306, 'local', 173, 'Supplier5'),
(176, 'med176', 'brand177', 'p8', '2027-11-02 00:00:00', '1 capsule every night before going to sleep', 102, 'generic', 93, 'Supplier5'),
(177, 'med177', 'brand177', 'p2', '2020-11-23 00:00:00', '1 capsule every night before going to sleep', 514, 'local', 96, 'Supplier5'),
(177, 'med177', 'brand178', 'p2', '2023-08-01 00:00:00', '1 capsule every night before going to sleep', 171, 'generic', 69, 'Supplier5'),
(178, 'med178', 'brand178', 'p6', '2022-01-26 00:00:00', 'Whenever pain occurs take one medicine', 422, 'local', 129, 'Supplier7'),
(178, 'med178', 'brand179', 'p6', '2028-11-19 00:00:00', 'Whenever pain occurs take one medicine', 141, 'generic', 64, 'Supplier7'),
(179, 'med179', 'brand179', 'p7', '2020-02-12 00:00:00', 'Whenever pain occurs take one medicine', 109, 'local', 265, 'Supplier7'),
(179, 'med179', 'brand180', 'p7', '2023-06-05 00:00:00', 'Whenever pain occurs take one medicine', 36, 'generic', 26, 'Supplier7'),
(180, 'med180', 'brand180', 'p5', '2029-03-14 00:00:00', 'Once in a week', 76, 'local', 218, 'Supplier3'),
(180, 'med180', 'brand181', 'p5', '2029-05-06 00:00:00', 'Once in a week', 25, 'generic', 55, 'Supplier3'),
(181, 'med181', 'brand181', 'p1', '2029-10-10 00:00:00', 'Once in a week', 441, 'local', 236, 'Supplier7'),
(181, 'med181', 'brand182', 'p1', '2021-06-04 00:00:00', 'Once in a week', 147, 'generic', 30, 'Supplier7'),
(182, 'med182', 'brand182', 'p8', '2022-02-16 00:00:00', '2 times a day', 476, 'local', 211, 'Supplier1'),
(182, 'med182', 'brand183', 'p8', '2028-12-25 00:00:00', '2 times a day', 159, 'generic', 58, 'Supplier1'),
(183, 'med183', 'brand183', 'p6', '2026-01-23 00:00:00', '3 times a day', 294, 'local', 169, 'Supplier5'),
(183, 'med183', 'brand184', 'p6', '2029-07-06 00:00:00', '3 times a day', 98, 'generic', 158, 'Supplier5'),
(184, 'med184', 'brand184', 'p6', '2023-10-04 00:00:00', 'Whenever pain occurs take half medicine', 492, 'local', 105, 'Supplier6'),
(184, 'med184', 'brand185', 'p6', '2025-11-17 00:00:00', 'Whenever pain occurs take half medicine', 164, 'generic', 97, 'Supplier6'),
(185, 'med185', 'brand185', 'p6', '2024-09-12 00:00:00', 'Whenever pain occurs take half medicine', 524, 'local', 22, 'Supplier7'),
(185, 'med185', 'brand186', 'p6', '2023-06-14 00:00:00', 'Whenever pain occurs take half medicine', 175, 'generic', 32, 'Supplier7'),
(186, 'med186', 'brand186', 'p8', '2023-02-09 00:00:00', 'Once in a week', 54, 'local', 90, 'Supplier5'),
(186, 'med186', 'brand187', 'p8', '2021-01-09 00:00:00', 'Once in a week', 18, 'generic', 258, 'Supplier5'),
(187, 'med187', 'brand187', 'p2', '2023-06-09 00:00:00', '3 times a day', 451, 'local', 212, 'Supplier3'),
(187, 'med187', 'brand188', 'p2', '2023-01-26 00:00:00', '3 times a day', 150, 'generic', 236, 'Supplier3'),
(188, 'med188', 'brand188', 'p1', '2026-06-08 00:00:00', '1 capsule every night before going to sleep', 525, 'local', 195, 'Supplier2'),
(188, 'med188', 'brand189', 'p1', '2021-02-11 00:00:00', '1 capsule every night before going to sleep', 175, 'generic', 133, 'Supplier2'),
(189, 'med189', 'brand189', 'p4', '2029-05-04 00:00:00', '2 times a day', 530, 'local', 183, 'Supplier6'),
(189, 'med189', 'brand190', 'p4', '2029-10-05 00:00:00', '2 times a day', 177, 'generic', 172, 'Supplier6'),
(190, 'med190', 'brand190', 'p6', '2022-08-21 00:00:00', 'Whenever pain occurs take one medicine', 551, 'local', 98, 'Supplier1'),
(190, 'med190', 'brand191', 'p6', '2027-08-15 00:00:00', 'Whenever pain occurs take one medicine', 184, 'generic', 196, 'Supplier1'),
(191, 'med191', 'brand191', 'p6', '2026-01-20 00:00:00', 'Whenever pain occurs take one medicine', 267, 'local', 241, 'Supplier5'),
(191, 'med191', 'brand192', 'p6', '2029-11-20 00:00:00', 'Whenever pain occurs take one medicine', 89, 'generic', 164, 'Supplier5'),
(192, 'med192', 'brand192', 'p8', '2030-05-12 00:00:00', '3 times a day', 303, 'local', 239, 'Supplier3'),
(192, 'med192', 'brand193', 'p8', '2026-12-06 00:00:00', '3 times a day', 101, 'generic', 261, 'Supplier3'),
(193, 'med193', 'brand193', 'p4', '2025-07-21 00:00:00', '3 times a day', 348, 'local', 45, 'Supplier6'),
(193, 'med193', 'brand194', 'p4', '2020-11-08 00:00:00', '3 times a day', 116, 'generic', 173, 'Supplier6'),
(194, 'med194', 'brand194', 'p6', '2027-03-11 00:00:00', 'Whenever pain occurs take one medicine', 493, 'local', 195, 'Supplier1'),
(194, 'med194', 'brand195', 'p6', '2025-06-04 00:00:00', 'Whenever pain occurs take one medicine', 164, 'generic', 289, 'Supplier1'),
(195, 'med195', 'brand195', 'p3', '2023-09-22 00:00:00', 'Once in a week', 239, 'local', 56, 'Supplier3'),
(195, 'med195', 'brand196', 'p3', '2029-10-27 00:00:00', 'Once in a week', 80, 'generic', 50, 'Supplier3'),
(196, 'med196', 'brand196', 'p1', '2020-03-02 00:00:00', 'Whenever pain occurs take half medicine', 148, 'local', 221, 'Supplier7'),
(196, 'med196', 'brand197', 'p1', '2025-07-12 00:00:00', 'Whenever pain occurs take half medicine', 49, 'generic', 125, 'Supplier7'),
(197, 'med197', 'brand197', 'p2', '2022-09-26 00:00:00', '2 times a day', 537, 'local', 127, 'Supplier1'),
(197, 'med197', 'brand198', 'p2', '2024-06-15 00:00:00', '2 times a day', 179, 'generic', 82, 'Supplier1'),
(198, 'med198', 'brand198', 'p3', '2028-08-12 00:00:00', 'Whenever pain occurs take half medicine', 422, 'local', 16, 'Supplier2'),
(198, 'med198', 'brand199', 'p3', '2022-10-03 00:00:00', 'Whenever pain occurs take half medicine', 141, 'generic', 224, 'Supplier2'),
(199, 'med199', 'brand199', 'p7', '2030-12-22 00:00:00', 'Whenever pain occurs take one medicine', 89, 'local', 122, 'Supplier1'),
(199, 'med199', 'brand200', 'p7', '2030-03-21 00:00:00', 'Whenever pain occurs take one medicine', 30, 'generic', 218, 'Supplier1'),
(200, 'med200', 'brand200', 'p1', '2024-07-12 00:00:00', 'Whenever pain occurs take half medicine', 222, 'local', 75, 'Supplier2'),
(200, 'med200', 'brand201', 'p1', '2030-05-04 00:00:00', 'Whenever pain occurs take half medicine', 74, 'generic', 211, 'Supplier2'),
(201, 'med201', 'brand201', 'p6', '2026-11-04 00:00:00', '3 times a day', 458, 'local', 195, 'Supplier7'),
(201, 'med201', 'brand202', 'p6', '2023-07-03 00:00:00', '3 times a day', 153, 'generic', 236, 'Supplier7'),
(202, 'med202', 'brand202', 'p8', '2022-09-18 00:00:00', 'Whenever pain occurs take half medicine', 336, 'local', 270, 'Supplier2'),
(202, 'med202', 'brand203', 'p8', '2021-11-06 00:00:00', 'Whenever pain occurs take half medicine', 112, 'generic', 244, 'Supplier2'),
(203, 'med203', 'brand203', 'p1', '2025-08-20 00:00:00', '2 times a day', 234, 'local', 105, 'Supplier5'),
(203, 'med203', 'brand204', 'p1', '2020-11-11 00:00:00', '2 times a day', 78, 'generic', 134, 'Supplier5'),
(204, 'med204', 'brand204', 'p5', '2024-04-24 00:00:00', 'Once in a week', 524, 'local', 106, 'Supplier4'),
(204, 'med204', 'brand205', 'p5', '2025-04-19 00:00:00', 'Once in a week', 175, 'generic', 125, 'Supplier4'),
(205, 'med205', 'brand205', 'p7', '2027-08-05 00:00:00', '1 capsule every night before going to sleep', 52, 'local', 98, 'Supplier7'),
(205, 'med205', 'brand206', 'p7', '2025-09-23 00:00:00', '1 capsule every night before going to sleep', 17, 'generic', 228, 'Supplier7'),
(206, 'med206', 'brand206', 'p5', '2030-04-26 00:00:00', 'Whenever pain occurs take one medicine', 380, 'local', 213, 'Supplier2'),
(206, 'med206', 'brand207', 'p5', '2022-02-20 00:00:00', 'Whenever pain occurs take one medicine', 127, 'generic', 151, 'Supplier2'),
(207, 'med207', 'brand207', 'p6', '2025-08-06 00:00:00', '2 times a day', 237, 'local', 210, 'Supplier2'),
(207, 'med207', 'brand208', 'p6', '2030-11-02 00:00:00', '2 times a day', 79, 'generic', 144, 'Supplier2'),
(208, 'med208', 'brand208', 'p1', '2023-09-19 00:00:00', 'Whenever pain occurs take one medicine', 141, 'local', 47, 'Supplier2'),
(208, 'med208', 'brand209', 'p1', '2027-10-14 00:00:00', 'Whenever pain occurs take one medicine', 47, 'generic', 131, 'Supplier2'),
(209, 'med209', 'brand209', 'p7', '2020-12-27 00:00:00', '3 times a day', 219, 'local', 272, 'Supplier6'),
(209, 'med209', 'brand210', 'p7', '2020-08-22 00:00:00', '3 times a day', 73, 'generic', 190, 'Supplier6'),
(210, 'med210', 'brand210', 'p8', '2024-09-15 00:00:00', 'Whenever pain occurs take half medicine', 202, 'local', 280, 'Supplier3'),
(210, 'med210', 'brand211', 'p8', '2024-10-20 00:00:00', 'Whenever pain occurs take half medicine', 67, 'generic', 19, 'Supplier3'),
(211, 'med211', 'brand211', 'p7', '2030-08-14 00:00:00', 'Whenever pain occurs take half medicine', 86, 'local', 143, 'Supplier6'),
(211, 'med211', 'brand212', 'p7', '2025-10-07 00:00:00', 'Whenever pain occurs take half medicine', 29, 'generic', 72, 'Supplier6'),
(212, 'med212', 'brand212', 'p8', '2023-08-12 00:00:00', 'Whenever pain occurs take one medicine', 64, 'local', 238, 'Supplier1');
INSERT INTO `medicine` (`med_id`, `med_name`, `med_brandname`, `med_purpose`, `med_expiry`, `dosage_form`, `med_price`, `med_role`, `med_quantity`, `med_supplier`) VALUES
(212, 'med212', 'brand213', 'p8', '2021-02-05 00:00:00', 'Whenever pain occurs take one medicine', 21, 'generic', 177, 'Supplier1'),
(213, 'med213', 'brand213', 'p6', '2028-11-11 00:00:00', 'Whenever pain occurs take half medicine', 256, 'local', 66, 'Supplier3'),
(213, 'med213', 'brand214', 'p6', '2023-08-17 00:00:00', 'Whenever pain occurs take half medicine', 85, 'generic', 139, 'Supplier3'),
(214, 'med214', 'brand214', 'p6', '2025-04-11 00:00:00', 'Once in a week', 571, 'local', 240, 'Supplier7'),
(214, 'med214', 'brand215', 'p6', '2025-10-23 00:00:00', 'Once in a week', 190, 'generic', 157, 'Supplier7'),
(215, 'med215', 'brand215', 'p8', '2027-11-08 00:00:00', '2 times a day', 278, 'local', 298, 'Supplier5'),
(215, 'med215', 'brand216', 'p8', '2021-08-15 00:00:00', '2 times a day', 93, 'generic', 86, 'Supplier5'),
(216, 'med216', 'brand216', 'p4', '2020-06-17 00:00:00', '1 capsule every night before going to sleep', 497, 'local', 288, 'Supplier3'),
(216, 'med216', 'brand217', 'p4', '2028-03-17 00:00:00', '1 capsule every night before going to sleep', 166, 'generic', 195, 'Supplier3'),
(217, 'med217', 'brand217', 'p7', '2022-05-26 00:00:00', 'Once in a week', 79, 'local', 140, 'Supplier1'),
(217, 'med217', 'brand218', 'p7', '2027-05-11 00:00:00', 'Once in a week', 26, 'generic', 184, 'Supplier1'),
(218, 'med218', 'brand218', 'p3', '2027-01-26 00:00:00', '1 capsule every night before going to sleep', 204, 'local', 31, 'Supplier6'),
(218, 'med218', 'brand219', 'p3', '2026-03-27 00:00:00', '1 capsule every night before going to sleep', 68, 'generic', 71, 'Supplier6'),
(219, 'med219', 'brand219', 'p3', '2027-04-23 00:00:00', '2 times a day', 452, 'local', 79, 'Supplier7'),
(219, 'med219', 'brand220', 'p3', '2020-09-26 00:00:00', '2 times a day', 151, 'generic', 140, 'Supplier7'),
(220, 'med220', 'brand220', 'p5', '2027-11-04 00:00:00', 'Whenever pain occurs take one medicine', 273, 'local', 210, 'Supplier3'),
(220, 'med220', 'brand221', 'p5', '2024-12-03 00:00:00', 'Whenever pain occurs take one medicine', 91, 'generic', 126, 'Supplier3'),
(221, 'med221', 'brand221', 'p3', '2029-01-25 00:00:00', '1 capsule every night before going to sleep', 136, 'local', 125, 'Supplier5'),
(221, 'med221', 'brand222', 'p3', '2021-12-24 00:00:00', '1 capsule every night before going to sleep', 45, 'generic', 51, 'Supplier5'),
(222, 'med222', 'brand222', 'p5', '2022-03-07 00:00:00', 'Whenever pain occurs take one medicine', 95, 'local', 298, 'Supplier4'),
(222, 'med222', 'brand223', 'p5', '2021-10-15 00:00:00', 'Whenever pain occurs take one medicine', 32, 'generic', 123, 'Supplier4'),
(223, 'med223', 'brand223', 'p8', '2020-09-04 00:00:00', '2 times a day', 81, 'local', 203, 'Supplier1'),
(223, 'med223', 'brand224', 'p8', '2025-10-12 00:00:00', '2 times a day', 27, 'generic', 206, 'Supplier1'),
(224, 'med224', 'brand224', 'p6', '2026-04-24 00:00:00', '3 times a day', 145, 'local', 193, 'Supplier2'),
(224, 'med224', 'brand225', 'p6', '2021-10-11 00:00:00', '3 times a day', 48, 'generic', 108, 'Supplier2'),
(225, 'med225', 'brand225', 'p4', '2024-07-26 00:00:00', '3 times a day', 593, 'local', 241, 'Supplier7'),
(225, 'med225', 'brand226', 'p4', '2023-05-24 00:00:00', '3 times a day', 198, 'generic', 90, 'Supplier7'),
(226, 'med226', 'brand226', 'p6', '2022-05-25 00:00:00', '1 capsule every night before going to sleep', 600, 'local', 127, 'Supplier4'),
(226, 'med226', 'brand227', 'p6', '2020-12-10 00:00:00', '1 capsule every night before going to sleep', 200, 'generic', 55, 'Supplier4'),
(227, 'med227', 'brand227', 'p1', '2025-05-18 00:00:00', '3 times a day', 111, 'local', 11, 'Supplier2'),
(227, 'med227', 'brand228', 'p1', '2021-02-27 00:00:00', '3 times a day', 37, 'generic', 114, 'Supplier2'),
(228, 'med228', 'brand228', 'p5', '2024-10-04 00:00:00', '3 times a day', 563, 'local', 293, 'Supplier2'),
(228, 'med228', 'brand229', 'p5', '2020-02-05 00:00:00', '3 times a day', 188, 'generic', 151, 'Supplier2'),
(229, 'med229', 'brand229', 'p2', '2021-10-21 00:00:00', '3 times a day', 199, 'local', 126, 'Supplier1'),
(229, 'med229', 'brand230', 'p2', '2030-02-13 00:00:00', '3 times a day', 66, 'generic', 117, 'Supplier1'),
(230, 'med230', 'brand230', 'p1', '2028-07-24 00:00:00', 'Whenever pain occurs take half medicine', 100, 'local', 300, 'Supplier2'),
(230, 'med230', 'brand231', 'p1', '2022-12-21 00:00:00', 'Whenever pain occurs take half medicine', 153, 'generic', 259, 'Supplier2'),
(231, 'med231', 'brand231', 'p1', '2026-04-27 00:00:00', '1 capsule every night before going to sleep', 100, 'local', 300, 'Supplier6'),
(231, 'med231', 'brand232', 'p1', '2026-01-17 00:00:00', '1 capsule every night before going to sleep', 110, 'generic', 58, 'Supplier6'),
(232, 'med232', 'brand232', 'p2', '2028-04-14 00:00:00', '3 times a day', 463, 'local', 16, 'Supplier5'),
(232, 'med232', 'brand233', 'p2', '2024-05-28 00:00:00', '3 times a day', 154, 'generic', 229, 'Supplier5'),
(233, 'med233', 'brand233', 'p8', '2020-01-12 00:00:00', '1 capsule every night before going to sleep', 361, 'local', 175, 'Supplier3'),
(233, 'med233', 'brand234', 'p8', '2025-01-23 00:00:00', '1 capsule every night before going to sleep', 120, 'generic', 155, 'Supplier3'),
(234, 'med234', 'brand234', 'p1', '2020-11-10 00:00:00', 'Whenever pain occurs take half medicine', 481, 'local', 39, 'Supplier3'),
(234, 'med234', 'brand235', 'p1', '2028-07-25 00:00:00', 'Whenever pain occurs take half medicine', 160, 'generic', 45, 'Supplier3'),
(235, 'med235', 'brand235', 'p4', '2022-09-26 00:00:00', '1 capsule every night before going to sleep', 231, 'local', 73, 'Supplier3'),
(235, 'med235', 'brand236', 'p4', '2027-12-18 00:00:00', '1 capsule every night before going to sleep', 77, 'generic', 170, 'Supplier3'),
(236, 'med236', 'brand236', 'p2', '2028-11-25 00:00:00', 'Whenever pain occurs take one medicine', 99, 'local', 79, 'Supplier1'),
(236, 'med236', 'brand237', 'p2', '2028-12-07 00:00:00', 'Whenever pain occurs take one medicine', 33, 'generic', 85, 'Supplier1'),
(237, 'med237', 'brand237', 'p7', '2030-08-09 00:00:00', 'Whenever pain occurs take half medicine', 181, 'local', 152, 'Supplier4'),
(237, 'med237', 'brand238', 'p7', '2020-12-23 00:00:00', 'Whenever pain occurs take half medicine', 60, 'generic', 267, 'Supplier4'),
(238, 'med238', 'brand238', 'p3', '2027-10-10 00:00:00', '2 times a day', 315, 'local', 276, 'Supplier6'),
(238, 'med238', 'brand239', 'p3', '2021-08-24 00:00:00', '2 times a day', 105, 'generic', 128, 'Supplier6'),
(239, 'med239', 'brand239', 'p7', '2028-04-09 00:00:00', 'Whenever pain occurs take half medicine', 313, 'local', 101, 'Supplier4'),
(239, 'med239', 'brand240', 'p7', '2025-07-10 00:00:00', 'Whenever pain occurs take half medicine', 104, 'generic', 177, 'Supplier4'),
(240, 'med240', 'brand240', 'p2', '2025-01-26 00:00:00', '2 times a day', 576, 'local', 68, 'Supplier5'),
(240, 'med240', 'brand241', 'p2', '2025-12-13 00:00:00', '2 times a day', 192, 'generic', 12, 'Supplier5'),
(241, 'med241', 'brand241', 'p2', '2021-03-20 00:00:00', 'Whenever pain occurs take one medicine', 594, 'local', 10, 'Supplier4'),
(241, 'med241', 'brand242', 'p2', '2027-01-21 00:00:00', 'Whenever pain occurs take one medicine', 198, 'generic', 254, 'Supplier4'),
(242, 'med242', 'brand242', 'p1', '2028-11-27 00:00:00', 'Whenever pain occurs take one medicine', 370, 'local', 109, 'Supplier5'),
(242, 'med242', 'brand243', 'p1', '2025-02-12 00:00:00', 'Whenever pain occurs take one medicine', 123, 'generic', 222, 'Supplier5'),
(243, 'med243', 'brand243', 'p7', '2024-08-09 00:00:00', '2 times a day', 572, 'local', 235, 'Supplier4'),
(243, 'med243', 'brand244', 'p7', '2020-07-12 00:00:00', '2 times a day', 191, 'generic', 129, 'Supplier4'),
(244, 'med244', 'brand244', 'p8', '2027-05-24 00:00:00', 'Whenever pain occurs take one medicine', 97, 'local', 32, 'Supplier6'),
(244, 'med244', 'brand245', 'p8', '2029-09-16 00:00:00', 'Whenever pain occurs take one medicine', 32, 'generic', 154, 'Supplier6'),
(245, 'med245', 'brand245', 'p4', '2020-11-15 00:00:00', '2 times a day', 341, 'local', 167, 'Supplier4'),
(245, 'med245', 'brand246', 'p4', '2028-03-20 00:00:00', '2 times a day', 114, 'generic', 228, 'Supplier4'),
(246, 'med246', 'brand246', 'p5', '2025-03-11 00:00:00', '3 times a day', 216, 'local', 20, 'Supplier6'),
(246, 'med246', 'brand247', 'p5', '2030-05-11 00:00:00', '3 times a day', 72, 'generic', 255, 'Supplier6'),
(247, 'med247', 'brand247', 'p7', '2026-08-24 00:00:00', 'Whenever pain occurs take half medicine', 581, 'local', 292, 'Supplier7'),
(247, 'med247', 'brand248', 'p7', '2024-12-17 00:00:00', 'Whenever pain occurs take half medicine', 194, 'generic', 231, 'Supplier7'),
(248, 'med248', 'brand248', 'p7', '2027-03-06 00:00:00', '2 times a day', 183, 'local', 270, 'Supplier2'),
(248, 'med248', 'brand249', 'p7', '2023-05-28 00:00:00', '2 times a day', 61, 'generic', 276, 'Supplier2'),
(249, 'med249', 'brand249', 'p5', '2027-10-23 00:00:00', '3 times a day', 278, 'local', 98, 'Supplier6'),
(249, 'med249', 'brand250', 'p5', '2024-12-04 00:00:00', '3 times a day', 93, 'generic', 21, 'Supplier6'),
(250, 'med250', 'brand250', 'p5', '2023-02-16 00:00:00', '2 times a day', 157, 'local', 276, 'Supplier7'),
(250, 'med250', 'brand251', 'p5', '2025-09-12 00:00:00', '2 times a day', 52, 'generic', 76, 'Supplier7'),
(251, 'med251', 'brand251', 'p6', '2020-07-11 00:00:00', '1 capsule every night before going to sleep', 416, 'local', 224, 'Supplier7'),
(251, 'med251', 'brand252', 'p6', '2021-01-10 00:00:00', '1 capsule every night before going to sleep', 139, 'generic', 28, 'Supplier7'),
(252, 'med252', 'brand252', 'p1', '2029-06-06 00:00:00', 'Whenever pain occurs take half medicine', 447, 'local', 243, 'Supplier1'),
(252, 'med252', 'brand253', 'p1', '2030-06-27 00:00:00', 'Whenever pain occurs take half medicine', 149, 'generic', 295, 'Supplier1'),
(253, 'med253', 'brand253', 'p3', '2023-06-25 00:00:00', '3 times a day', 469, 'local', 289, 'Supplier4'),
(253, 'med253', 'brand254', 'p3', '2030-05-07 00:00:00', '3 times a day', 156, 'generic', 89, 'Supplier4'),
(254, 'med254', 'brand254', 'p5', '2021-09-25 00:00:00', 'Whenever pain occurs take half medicine', 77, 'local', 261, 'Supplier3'),
(254, 'med254', 'brand255', 'p5', '2024-03-12 00:00:00', 'Whenever pain occurs take half medicine', 26, 'generic', 92, 'Supplier3'),
(255, 'med255', 'brand255', 'p1', '2026-04-05 00:00:00', '1 capsule every night before going to sleep', 590, 'local', 199, 'Supplier1'),
(255, 'med255', 'brand256', 'p1', '2027-09-09 00:00:00', '1 capsule every night before going to sleep', 197, 'generic', 211, 'Supplier1'),
(256, 'med256', 'brand256', 'p5', '2023-04-07 00:00:00', 'Whenever pain occurs take one medicine', 494, 'local', 100, 'Supplier2'),
(256, 'med256', 'brand257', 'p5', '2020-05-16 00:00:00', 'Whenever pain occurs take one medicine', 165, 'generic', 196, 'Supplier2'),
(257, 'med257', 'brand257', 'p1', '2020-06-28 00:00:00', '1 capsule every night before going to sleep', 552, 'local', 167, 'Supplier3'),
(257, 'med257', 'brand258', 'p1', '2025-05-16 00:00:00', '1 capsule every night before going to sleep', 184, 'generic', 127, 'Supplier3'),
(258, 'med258', 'brand258', 'p3', '2027-07-15 00:00:00', 'Once in a week', 556, 'local', 65, 'Supplier3'),
(258, 'med258', 'brand259', 'p3', '2025-04-13 00:00:00', 'Once in a week', 185, 'generic', 218, 'Supplier3'),
(259, 'med259', 'brand259', 'p8', '2030-08-20 00:00:00', 'Whenever pain occurs take one medicine', 82, 'local', 120, 'Supplier4'),
(259, 'med259', 'brand260', 'p8', '2023-07-13 00:00:00', 'Whenever pain occurs take one medicine', 27, 'generic', 33, 'Supplier4'),
(260, 'med260', 'brand260', 'p1', '2022-04-19 00:00:00', 'Whenever pain occurs take half medicine', 339, 'local', 92, 'Supplier5'),
(260, 'med260', 'brand261', 'p1', '2027-04-24 00:00:00', 'Whenever pain occurs take half medicine', 113, 'generic', 231, 'Supplier5'),
(261, 'med261', 'brand261', 'p4', '2029-10-07 00:00:00', 'Whenever pain occurs take one medicine', 172, 'local', 175, 'Supplier7'),
(261, 'med261', 'brand262', 'p4', '2025-10-05 00:00:00', 'Whenever pain occurs take one medicine', 57, 'generic', 123, 'Supplier7'),
(262, 'med262', 'brand262', 'p3', '2025-02-21 00:00:00', '1 capsule every night before going to sleep', 210, 'local', 135, 'Supplier5'),
(262, 'med262', 'brand263', 'p3', '2024-06-06 00:00:00', '1 capsule every night before going to sleep', 108, 'generic', 99, 'Supplier5'),
(263, 'med263', 'brand263', 'p6', '2030-09-22 00:00:00', 'Once in a week', 572, 'local', 10, 'Supplier4'),
(263, 'med263', 'brand264', 'p6', '2026-09-22 00:00:00', 'Once in a week', 191, 'generic', 67, 'Supplier4'),
(264, 'med264', 'brand264', 'p5', '2027-08-26 00:00:00', 'Whenever pain occurs take half medicine', 561, 'local', 148, 'Supplier3'),
(264, 'med264', 'brand265', 'p5', '2027-06-01 00:00:00', 'Whenever pain occurs take half medicine', 187, 'generic', 294, 'Supplier3'),
(265, 'med265', 'brand265', 'p3', '2020-07-24 00:00:00', 'Once in a week', 107, 'local', 235, 'Supplier1'),
(265, 'med265', 'brand266', 'p3', '2023-07-06 00:00:00', 'Once in a week', 36, 'generic', 155, 'Supplier1'),
(266, 'med266', 'brand266', 'p3', '2022-04-24 00:00:00', 'Whenever pain occurs take one medicine', 101, 'local', 92, 'Supplier2'),
(266, 'med266', 'brand267', 'p3', '2029-01-22 00:00:00', 'Whenever pain occurs take one medicine', 34, 'generic', 112, 'Supplier2'),
(267, 'med267', 'brand267', 'p8', '2027-05-22 00:00:00', 'Whenever pain occurs take half medicine', 360, 'local', 195, 'Supplier3'),
(267, 'med267', 'brand268', 'p8', '2028-01-10 00:00:00', 'Whenever pain occurs take half medicine', 120, 'generic', 140, 'Supplier3'),
(268, 'med268', 'brand268', 'p6', '2022-04-14 00:00:00', '3 times a day', 386, 'local', 247, 'Supplier2'),
(268, 'med268', 'brand269', 'p6', '2029-02-03 00:00:00', '3 times a day', 129, 'generic', 296, 'Supplier2'),
(269, 'med269', 'brand269', 'p6', '2028-03-06 00:00:00', '3 times a day', 174, 'local', 59, 'Supplier6'),
(269, 'med269', 'brand270', 'p6', '2022-02-09 00:00:00', '3 times a day', 58, 'generic', 62, 'Supplier6'),
(270, 'med270', 'brand270', 'p2', '2024-01-24 00:00:00', '2 times a day', 88, 'local', 175, 'Supplier5'),
(270, 'med270', 'brand271', 'p2', '2028-01-24 00:00:00', '2 times a day', 29, 'generic', 270, 'Supplier5'),
(271, 'med271', 'brand271', 'p4', '2020-10-04 00:00:00', 'Whenever pain occurs take one medicine', 292, 'local', 285, 'Supplier3'),
(271, 'med271', 'brand272', 'p4', '2030-07-15 00:00:00', 'Whenever pain occurs take one medicine', 97, 'generic', 262, 'Supplier3'),
(272, 'med272', 'brand272', 'p3', '2022-08-13 00:00:00', '2 times a day', 548, 'local', 186, 'Supplier5'),
(272, 'med272', 'brand273', 'p3', '2024-12-13 00:00:00', '2 times a day', 183, 'generic', 160, 'Supplier5'),
(273, 'med273', 'brand273', 'p2', '2030-07-07 00:00:00', '2 times a day', 590, 'local', 94, 'Supplier5'),
(273, 'med273', 'brand274', 'p2', '2022-10-05 00:00:00', '2 times a day', 197, 'generic', 61, 'Supplier5'),
(274, 'med274', 'brand274', 'p3', '2020-11-20 00:00:00', '1 capsule every night before going to sleep', 387, 'local', 23, 'Supplier5'),
(274, 'med274', 'brand275', 'p3', '2028-02-24 00:00:00', '1 capsule every night before going to sleep', 129, 'generic', 256, 'Supplier5'),
(275, 'med275', 'brand275', 'p3', '2022-11-24 00:00:00', 'Whenever pain occurs take half medicine', 205, 'local', 21, 'Supplier1'),
(275, 'med275', 'brand276', 'p3', '2022-12-19 00:00:00', 'Whenever pain occurs take half medicine', 68, 'generic', 23, 'Supplier1'),
(276, 'med276', 'brand276', 'p6', '2021-10-23 00:00:00', '2 times a day', 326, 'local', 63, 'Supplier3'),
(276, 'med276', 'brand277', 'p6', '2030-08-06 00:00:00', '2 times a day', 109, 'generic', 204, 'Supplier3'),
(277, 'med277', 'brand277', 'p7', '2022-03-01 00:00:00', 'Once in a week', 86, 'local', 200, 'Supplier2'),
(277, 'med277', 'brand278', 'p7', '2023-10-15 00:00:00', 'Once in a week', 29, 'generic', 45, 'Supplier2'),
(278, 'med278', 'brand278', 'p6', '2030-01-02 00:00:00', '1 capsule every night before going to sleep', 568, 'local', 295, 'Supplier4'),
(278, 'med278', 'brand279', 'p6', '2030-11-07 00:00:00', '1 capsule every night before going to sleep', 189, 'generic', 85, 'Supplier4'),
(279, 'med279', 'brand279', 'p3', '2027-07-15 00:00:00', '2 times a day', 355, 'local', 256, 'Supplier1'),
(279, 'med279', 'brand280', 'p3', '2025-03-07 00:00:00', '2 times a day', 118, 'generic', 129, 'Supplier1'),
(280, 'med280', 'brand280', 'p1', '2025-12-12 00:00:00', 'Whenever pain occurs take half medicine', 164, 'local', 244, 'Supplier7'),
(280, 'med280', 'brand281', 'p1', '2029-05-24 00:00:00', 'Whenever pain occurs take half medicine', 55, 'generic', 104, 'Supplier7'),
(281, 'med281', 'brand281', 'p7', '2025-07-07 00:00:00', 'Whenever pain occurs take half medicine', 83, 'local', 41, 'Supplier1'),
(281, 'med281', 'brand282', 'p7', '2022-05-27 00:00:00', 'Whenever pain occurs take half medicine', 28, 'generic', 83, 'Supplier1'),
(282, 'med282', 'brand282', 'p3', '2024-04-02 00:00:00', 'Once in a week', 569, 'local', 121, 'Supplier1'),
(282, 'med282', 'brand283', 'p3', '2025-07-19 00:00:00', 'Once in a week', 190, 'generic', 231, 'Supplier1'),
(283, 'med283', 'brand283', 'p4', '2030-10-19 00:00:00', '1 capsule every night before going to sleep', 429, 'local', 152, 'Supplier7'),
(283, 'med283', 'brand284', 'p4', '2021-06-11 00:00:00', '1 capsule every night before going to sleep', 143, 'generic', 214, 'Supplier7'),
(284, 'med284', 'brand284', 'p3', '2027-09-24 00:00:00', '2 times a day', 596, 'local', 41, 'Supplier3'),
(284, 'med284', 'brand285', 'p3', '2028-03-12 00:00:00', '2 times a day', 199, 'generic', 288, 'Supplier3'),
(285, 'med285', 'brand285', 'p3', '2021-08-02 00:00:00', '1 capsule every night before going to sleep', 435, 'local', 19, 'Supplier1'),
(285, 'med285', 'brand286', 'p3', '2030-10-20 00:00:00', '1 capsule every night before going to sleep', 145, 'generic', 60, 'Supplier1'),
(286, 'med286', 'brand286', 'p5', '2021-06-27 00:00:00', 'Whenever pain occurs take one medicine', 52, 'local', 239, 'Supplier2'),
(286, 'med286', 'brand287', 'p5', '2022-09-25 00:00:00', 'Whenever pain occurs take one medicine', 17, 'generic', 134, 'Supplier2'),
(287, 'med287', 'brand287', 'p5', '2027-08-05 00:00:00', '2 times a day', 319, 'local', 266, 'Supplier7'),
(287, 'med287', 'brand288', 'p5', '2022-03-20 00:00:00', '2 times a day', 106, 'generic', 261, 'Supplier7'),
(288, 'med288', 'brand288', 'p5', '2021-06-27 00:00:00', 'Once in a week', 59, 'local', 223, 'Supplier3'),
(288, 'med288', 'brand289', 'p5', '2030-10-09 00:00:00', 'Once in a week', 20, 'generic', 126, 'Supplier3'),
(289, 'med289', 'brand289', 'p3', '2027-01-06 00:00:00', 'Once in a week', 450, 'local', 65, 'Supplier7'),
(289, 'med289', 'brand290', 'p3', '2023-12-16 00:00:00', 'Once in a week', 150, 'generic', 265, 'Supplier7'),
(290, 'med290', 'brand290', 'p4', '2029-12-17 00:00:00', '1 capsule every night before going to sleep', 384, 'local', 144, 'Supplier1'),
(290, 'med290', 'brand291', 'p4', '2027-08-22 00:00:00', '1 capsule every night before going to sleep', 128, 'generic', 116, 'Supplier1'),
(291, 'med291', 'brand291', 'p1', '2029-02-07 00:00:00', 'Once in a week', 301, 'local', 204, 'Supplier1'),
(291, 'med291', 'brand292', 'p1', '2029-12-20 00:00:00', 'Once in a week', 100, 'generic', 169, 'Supplier1'),
(292, 'med292', 'brand292', 'p1', '2021-04-07 00:00:00', 'Whenever pain occurs take half medicine', 384, 'local', 187, 'Supplier3'),
(292, 'med292', 'brand293', 'p1', '2024-07-06 00:00:00', 'Whenever pain occurs take half medicine', 128, 'generic', 58, 'Supplier3'),
(293, 'med293', 'brand293', 'p5', '2022-12-10 00:00:00', 'Whenever pain occurs take one medicine', 87, 'local', 172, 'Supplier1'),
(293, 'med293', 'brand294', 'p5', '2027-08-20 00:00:00', 'Whenever pain occurs take one medicine', 29, 'generic', 11, 'Supplier1'),
(294, 'med294', 'brand294', 'p4', '2020-12-26 00:00:00', '3 times a day', 300, 'local', 150, 'Supplier2'),
(294, 'med294', 'brand295', 'p4', '2021-06-16 00:00:00', '3 times a day', 171, 'generic', 87, 'Supplier2'),
(295, 'med295', 'brand295', 'p7', '2022-12-11 00:00:00', '1 capsule every night before going to sleep', 562, 'local', 172, 'Supplier6'),
(295, 'med295', 'brand296', 'p7', '2024-01-18 00:00:00', '1 capsule every night before going to sleep', 187, 'generic', 236, 'Supplier6'),
(296, 'med296', 'brand296', 'p5', '2023-09-12 00:00:00', '2 times a day', 252, 'local', 109, 'Supplier3'),
(296, 'med296', 'brand297', 'p5', '2024-03-14 00:00:00', '2 times a day', 84, 'generic', 238, 'Supplier3'),
(297, 'med297', 'brand297', 'p7', '2029-06-26 00:00:00', '2 times a day', 267, 'local', 191, 'Supplier1'),
(297, 'med297', 'brand298', 'p7', '2024-11-13 00:00:00', '2 times a day', 89, 'generic', 149, 'Supplier1'),
(298, 'med298', 'brand298', 'p4', '2023-05-05 00:00:00', '1 capsule every night before going to sleep', 81, 'local', 149, 'Supplier5'),
(298, 'med298', 'brand299', 'p4', '2026-06-08 00:00:00', '1 capsule every night before going to sleep', 27, 'generic', 252, 'Supplier5'),
(299, 'med299', 'brand299', 'p7', '2025-05-15 00:00:00', 'Once in a week', 303, 'local', 121, 'Supplier1'),
(299, 'med299', 'brand300', 'p7', '2026-01-26 00:00:00', 'Once in a week', 101, 'generic', 31, 'Supplier1'),
(300, 'med300', 'brand300', 'p4', '2020-07-21 00:00:00', '3 times a day', 362, 'local', 160, 'Supplier4'),
(300, 'med300', 'brand301', 'p4', '2023-04-10 00:00:00', '3 times a day', 121, 'generic', 56, 'Supplier4'),
(350, 'a', 'b', 'c', '2020-04-29 19:52:43', 'd', 30, 'local ', 100, 'Supplier2');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `buyer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_price` int(11) NOT NULL,
  `delivery_status` text NOT NULL,
  `payment_method` text NOT NULL,
  `delivery_address` text NOT NULL,
  `med_id` int(11) NOT NULL,
  `med_role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`buyer_id`, `order_id`, `order_quantity`, `order_date`, `order_price`, `delivery_status`, `payment_method`, `delivery_address`, `med_id`, `med_role`) VALUES
(2, 1, 5, '2020-04-26 18:29:07', 864, 'Pending', '', 'None, None, None, None', 106, 'generic'),
(2, 2, 6, '2020-04-26 18:29:07', 994, 'Pending', '', 'None, None, None, None', 296, 'local'),
(2, 3, 1, '2020-04-27 11:59:01', 397, 'Pending', 'cash_on_delivery', 'sahsbvfkdbvs, dgscev, 13142, 3522', 274, 'local'),
(2, 4, 5, '2020-04-27 14:58:12', 1920, 'Pending', 'credit/debit', 'sahsbvfkdbvs, dgscev, 13142, 3522', 73, 'local'),
(2, 5, 2, '2020-04-27 14:58:12', 283, 'Pending', 'credit/debit', 'sahsbvfkdbvs, dgscev, 13142, 3522', 193, 'generic'),
(5, 6, 5, '2020-04-30 14:17:14', 408, 'Pending', 'cash_on_delivery', 'sahsbvfkdbvs, dgscev, 13142, 3522', 15, 'generic'),
(5, 7, 6, '2020-04-30 14:17:14', 490, 'Pending', 'cash_on_delivery', 'sahsbvfkdbvs, dgscev, 13142, 3522', 15, 'generic'),
(5, 8, 4, '2020-04-30 14:17:14', 2448, 'Pending', 'cash_on_delivery', 'sahsbvfkdbvs, dgscev, 13142, 3522', 45, 'local'),
(5, 9, 12, '2020-05-02 05:36:45', 1627, 'Pending', 'cash_on_delivery', 'Somewhere in the world, Mulund, 432874, 3523', 2, 'generic'),
(5, 10, 1, '2020-05-02 05:36:45', 320, 'Pending', 'cash_on_delivery', 'Somewhere in the world, Mulund, 432874, 3523', 3, 'local'),
(5, 11, 1, '2020-05-02 05:36:45', 468, 'Pending', 'cash_on_delivery', 'Somewhere in the world, Mulund, 432874, 3523', 11, 'local'),
(5, 12, 50, '2020-05-02 05:36:45', 7800, 'Pending', 'cash_on_delivery', 'Somewhere in the world, Mulund, 432874, 3523', 11, 'generic'),
(5, 13, 1, '2020-05-02 05:36:45', 643, 'Pending', 'cash_on_delivery', 'Somewhere in the world, Mulund, 432874, 3523', 24, 'local'),
(5, 14, 1, '2020-05-02 05:36:45', 391, 'Pending', 'cash_on_delivery', 'Somewhere in the world, Mulund, 432874, 3523', 126, 'local'),
(5, 15, 3, '2020-05-02 05:36:45', 522, 'Pending', 'cash_on_delivery', 'Somewhere in the world, Mulund, 432874, 3523', 285, 'generic');

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
  ADD UNIQUE KEY `ddelivery_id` (`ddelivery_id`);

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
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `c4` FOREIGN KEY (`ddelivery_id`) REFERENCES `order` (`delivery_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
