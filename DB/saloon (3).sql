-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2025 at 02:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saloon`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `uname` varchar(30) DEFAULT NULL,
  `upass` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uname`, `upass`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `appoint`
--

CREATE TABLE `appoint` (
  `id` int(11) NOT NULL,
  `aname` varchar(100) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `adate` date NOT NULL,
  `atime` time NOT NULL,
  `astatus` varchar(50) NOT NULL,
  `aloc` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appoint`
--

INSERT INTO `appoint` (`id`, `aname`, `uname`, `adate`, `atime`, `astatus`, `aloc`, `price`) VALUES
(1, 'Pedicure', 'Prapti W', '2025-03-15', '06:12:00', 'complete', 'Pune', 30.00);

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mob` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `u_msg` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `name`, `mob`, `email`, `u_msg`, `created_at`) VALUES
(1, 'Prapti W', '9876765656', 'prapti@gmail.com', 'Request A Call Back...', '2025-03-09 00:36:01'),
(2, 'Prathmesh', '8767656545', 'prathmesh@gmail.com', 'contact msg \r\n							', '2025-03-09 00:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cmob` varchar(15) NOT NULL,
  `cname` varchar(80) DEFAULT NULL,
  `cadd` varchar(120) DEFAULT NULL,
  `carea` varchar(20) DEFAULT NULL,
  `ccity` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `upass` varchar(100) DEFAULT NULL,
  `secq` varchar(200) NOT NULL,
  `ans` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cmob`, `cname`, `cadd`, `carea`, `ccity`, `email`, `uname`, `upass`, `secq`, `ans`) VALUES
('9876767656', 'Prapti W', 'Modern College', 'shivajinagar', 'pune-05', 'prapti@gmail.vom', 'prapti', '123', 'birthdate', '01-01-2000');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `package_description` text NOT NULL,
  `package_image` longblob DEFAULT NULL,
  `package_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_name`, `package_description`, `package_image`, `package_price`) VALUES
(1, 'Basic Haircut Package', 'Includes a professional haircut and basic styling.', NULL, 30.00),
(2, 'Premium Haircare Package', 'Includes haircut, deep conditioning, and scalp massage.', NULL, 60.00),
(3, 'Full Body Spa Package', 'Relaxing full body massage, facial, and aromatherapy.', NULL, 120.00),
(4, 'Bridal Makeup Package', 'Complete bridal makeup with trial session.', NULL, 150.00),
(5, 'Men\'s Grooming Package', 'Haircut, beard trim, and facial cleansing.', NULL, 50.00),
(6, 'Kids Haircut Package', 'Fun and safe haircut for kids with a toy gift.', NULL, 25.00),
(7, 'Anti-Aging Facial Package', 'Advanced facial treatment to reduce wrinkles and fine lines.', NULL, 80.00),
(8, 'Detox Body Wrap Package', 'Full body detox wrap with herbal treatments.', NULL, 90.00),
(9, 'Pedicure & Manicure Package', 'Professional nail care for hands and feet.', NULL, 40.00),
(10, 'Complete Wellness Package', 'Includes yoga session, massage, and healthy snack.', NULL, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `package_appoint`
--

CREATE TABLE `package_appoint` (
  `id` int(11) NOT NULL,
  `pack_name` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `adate` date NOT NULL,
  `atime` time NOT NULL,
  `aloc` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `astatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_appoint`
--

INSERT INTO `package_appoint` (`id`, `pack_name`, `uname`, `adate`, `atime`, `aloc`, `price`, `astatus`) VALUES
(1, 'Premium Haircare Package', 'Prapti W', '2025-03-20', '06:10:00', 'Pune', 60.00, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `service_description` text DEFAULT NULL,
  `service_image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `service_description`, `service_image`, `price`) VALUES
(1, 'Haircut', 'Professional haircut with styling.', 'images/haircut.jpg', 25.00),
(2, 'Hair Coloring', 'Full hair coloring with premium products.', 'images/hair_coloring.jpg', 70.00),
(3, 'Manicure', 'Nail trimming, shaping, and polishing.', 'images/manicure.jpg', 20.00),
(4, 'Pedicure', 'Foot care including nail trimming and massage.', 'images/pedicure.jpg', 30.00),
(5, 'Facial', 'Deep cleansing facial with moisturizing mask.', 'images/facial.jpg', 50.00),
(6, 'Waxing', 'Body waxing for smooth and hair-free skin.', 'images/waxing.jpg', 40.00),
(7, 'Massage', 'Relaxing full body massage.', 'images/massage.jpg', 60.00),
(8, 'Makeup', 'Professional makeup application.', 'images/makeup.jpg', 45.00),
(9, 'Hair Treatment', 'Deep conditioning treatment for damaged hair.', 'images/hair_treatment.jpg', 55.00),
(10, 'Beard Trim', 'Precision beard trimming and shaping.', 'images/beard_trim.jpg', 15.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD UNIQUE KEY `uname` (`uname`);

--
-- Indexes for table `appoint`
--
ALTER TABLE `appoint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cmob`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_appoint`
--
ALTER TABLE `package_appoint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appoint`
--
ALTER TABLE `appoint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `package_appoint`
--
ALTER TABLE `package_appoint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
