-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2020 at 02:59 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

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
(1, 'akshar@gmail.com', 'akshar', 'Akshar', 'Barchha', 'Kalyan', 'Customer');

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
  `med_role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `ouser_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_price` float NOT NULL,
  `delivery_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

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
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`med_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `ouser_id` (`ouser_id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD UNIQUE KEY `delivery_id` (`delivery_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `c3` FOREIGN KEY (`duser_id`) REFERENCES `login` (`user_id`),
  ADD CONSTRAINT `c4` FOREIGN KEY (`ddelivery_id`) REFERENCES `order` (`delivery_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `c5` FOREIGN KEY (`ouser_id`) REFERENCES `login` (`user_id`);
COMMIT;

INSERT INTO `login` (`user_id`, `user_email`, `user_pass`, `user_first_name`, `user_last_name`, `user_address`, `user_category`) VALUES ('2', 'dhruvin@gmail.com', 'dhruvin', 'Dhruvin', 'Patel', 'Kalyan', 'Pharmacy Owner'), ('3', 'manas@gmail.com', 'manas', 'Manas', 'Gandhi', 'Mulund', 'Customer'), ('4', 'urvi@gmail.com', 'urvi', 'Urvi', 'Bheda', 'Ghatkopar', 'Customer'), ('5', 'sahil@gmail.com', 'sahil', 'Sahil', 'Kotak', 'Kalyan', 'Customer'), ('6', 'bhushan@gmail.com', 'bhushan', 'Bhushan', 'Desale', 'Shahpur', 'Supplier');
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
