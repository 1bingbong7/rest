-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 14, 2021 at 04:26 AM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `airline`
--

-- --------------------------------------------------------

--
-- Table structure for table `airplane`
--

CREATE TABLE `airplane` (
  `arplane_id` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airplane`
--

INSERT INTO `airplane` (`arplane_id`, `brand`, `model`, `company_id`) VALUES
(1, 'Boeing', '737-800', 1),
(2, 'Airbus', 'A380', 1),
(3, 'Dash', '8', 1),
(4, 'Boeing', '737-800', 2),
(5, 'Airbus', 'A380', 2),
(6, 'Dash', '8', 2),
(7, 'Boeing', '737-800', 3),
(8, 'Airbus', 'A380', 3),
(9, 'Dash', '8', 3);

-- --------------------------------------------------------

--
-- Table structure for table `airplane_configuration`
--

CREATE TABLE `airplane_configuration` (
  `config_id` int(11) NOT NULL,
  `first_class` int(11) NOT NULL,
  `business` int(11) NOT NULL,
  `premium_economy` int(11) NOT NULL,
  `economy` int(11) NOT NULL,
  `airplane_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airplane_configuration`
--

INSERT INTO `airplane_configuration` (`config_id`, `first_class`, `business`, `premium_economy`, `economy`, `airplane_id`) VALUES
(1, 0, 13, 0, 162, 1),
(2, 14, 64, 35, 371, 2),
(3, 0, 0, 0, 38, 3),
(4, 0, 8, 14, 160, 4),
(5, 12, 80, 40, 360, 5),
(6, 0, 0, 4, 30, 6),
(7, 4, 8, 6, 150, 7),
(8, 16, 64, 50, 100, 8),
(9, 0, 0, 0, 40, 9);

-- --------------------------------------------------------

--
-- Table structure for table `assign`
--

CREATE TABLE `assign` (
  `assign_id` int(11) NOT NULL,
  `flight_no` int(11) NOT NULL,
  `plane` int(11) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `terminal` varchar(255) NOT NULL,
  `gate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assign`
--

INSERT INTO `assign` (`assign_id`, `flight_no`, `plane`, `destination`, `terminal`, `gate`) VALUES
(1, 1, 1, 'Airport A', 'Terminal A', 'gate A');

-- --------------------------------------------------------

--
-- Table structure for table `check_in`
--

CREATE TABLE `check_in` (
  `check_in_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `seat` varchar(255) NOT NULL,
  `flight_no` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `check_in`
--

INSERT INTO `check_in` (`check_in_id`, `first_name`, `last_name`, `age`, `gender`, `seat`, `flight_no`, `date_time`) VALUES
(1, 'Test A', 'Test A', '20', 'Male', 'Business', 1, '2021-05-13 15:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `carrier_name` varchar(255) NOT NULL,
  `head_quarters` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `carrier_name`, `head_quarters`) VALUES
(1, 'Qantas', 'Australia'),
(2, 'Singapore Airlines', 'Singapore'),
(3, 'Emirates', 'UAE');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `flight_no` int(11) NOT NULL,
  `airline_company` int(11) NOT NULL,
  `date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flight_no`, `airline_company`, `date_time`) VALUES
(1, 1, '2021-05-13 10:48:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airplane`
--
ALTER TABLE `airplane`
  ADD PRIMARY KEY (`arplane_id`);

--
-- Indexes for table `airplane_configuration`
--
ALTER TABLE `airplane_configuration`
  ADD PRIMARY KEY (`config_id`);

--
-- Indexes for table `assign`
--
ALTER TABLE `assign`
  ADD PRIMARY KEY (`assign_id`);

--
-- Indexes for table `check_in`
--
ALTER TABLE `check_in`
  ADD PRIMARY KEY (`check_in_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airplane`
--
ALTER TABLE `airplane`
  MODIFY `arplane_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `airplane_configuration`
--
ALTER TABLE `airplane_configuration`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `assign`
--
ALTER TABLE `assign`
  MODIFY `assign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `check_in`
--
ALTER TABLE `check_in`
  MODIFY `check_in_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `flight_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;