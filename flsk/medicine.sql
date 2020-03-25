
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `ddelivery_id` int(10) NOT NULL UNIQUE,
  `order_time` datetime NOT NULL,
  `delivery_time` datetime NOT NULL,
  `duser_id` int(10) NOT NULL UNIQUE,
  PRIMARY KEY(ddelivery_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(10) NOT NULL UNIQUE,
  `user_email` varchar(30) NOT NULL UNIQUE,
  `user_pass` varchar(100) NOT NULL,
  `user_first_name` varchar(30) NOT NULL,
  `user_last_name` varchar(30) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `user_category` varchar(30) NOT NULL,
  PRIMARY KEY(user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `user_email`, `user_pass`, `user_first_name`, `user_last_name`, `user_address`, `user_category`) VALUES
(1, 'akshar.barchha@somaiya.edu', 'pass', `Akshar`, `Barchha`, `Mumbai`, `customer`);


-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `ouser_id` int(10) NOT NULL UNIQUE,
  `order_id` int(10) NOT NULL UNIQUE,
  `quantity` int NOT NULL,
  `order_date` datetime NOT NULL,
  `order_price` float NOT NULL,
  `delivery_id` int(10) NOT NULL UNIQUE,
  PRIMARY KEY(order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  PRIMARY KEY(med_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------



-- CREATE TABLE `user` (
--   `user_id` int(10) NOT NULL,
--   `user_name` varchar(25) NOT NULL,
--   `user_email` varchar(160) NOT NULL,
--   `user_phone` int(10) NOT NULL,
--   `user_address` varchar(160) NOT NULL,
--   `user_role` varchar(25) NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- -- Indexes for dumped tables
-- --
--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `c3` FOREIGN KEY (`duser_id`) REFERENCES `login` (`user_id`);
  ADD CONSTRAINT `c4` FOREIGN KEY (`ddelivery_id`) REFERENCES `order` (`delivery_id`);

--
--
-- Constraints for table `orders`
--
ALTER TABLE `order`
  ADD CONSTRAINT `c1` FOREIGN KEY (`ouser_id`) REFERENCES `login` (`user_id`);

--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;