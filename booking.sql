-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 08, 2019 at 01:55 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `guest_number` int(11) NOT NULL,
  `booked_from` date NOT NULL,
  `booked_to` date NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_place_id` int(11) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fk_user_id_booking` (`fk_user_id`),
  KEY `fk_place_id_booking` (`fk_place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `map_img` varchar(255) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `latitude`, `longitude`, `address`, `map_img`) VALUES
(1, '44.8160691', '20.4609349', '', 'https://maps.googleapis.com/maps/api/staticmap?center=44.81577932386285,20.46281579662707&zoom=14&size=500x300&maptype=roadmap\r\n    &markers=color:red%7Clabel:Place%7C44.81577932386285,20.46281579662707&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(5, '44.76264931282967', '20.39439282048056', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.76264931282967,20.39439282048056&zoom=14&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.76264931282967,20.39439282048056&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(6, '44.801962282840805', '20.31413071061945', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.801962282840805,20.31413071061945&zoom=14&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.801962282840805,20.31413071061945&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(7, '44.78017832735722', '20.47935952313219', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.78017832735722,20.47935952313219&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.78017832735722,20.47935952313219&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(8, '48.221117408921415', '16.533859811771208', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=48.221117408921415,16.533859811771208&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C48.221117408921415,16.533859811771208&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(9, '44.8228840947506', '20.392323472740827', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8228840947506,20.392323472740827&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8228840947506,20.392323472740827&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(10, '48.909370997631015', '2.390282851621919', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=48.909370997631015,2.390282851621919&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C48.909370997631015,2.390282851621919&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(11, '40.76793068385156', '-73.95616183217396', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=40.76793068385156,-73.95616183217396&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C40.76793068385156,-73.95616183217396&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(12, '44.73971228935274', '20.603506852403143', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.73971228935274,20.603506852403143&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.73971228935274,20.603506852403143&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(13, '51.05826536981171', '13.743785783586304', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=51.05826536981171,13.743785783586304&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C51.05826536981171,13.743785783586304&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(14, '52.51700364809025', '13.374556234402007', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=52.51700364809025,13.374556234402007&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C52.51700364809025,13.374556234402007&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(15, '45.73986064685797', '21.216244958593734', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=45.73986064685797,21.216244958593734&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C45.73986064685797,21.216244958593734&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(16, '47.25605419775115', '21.581540368749984', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=47.25605419775115,21.581540368749984&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C47.25605419775115,21.581540368749984&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(17, '48.72642172496802', '21.254697107031234', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=48.72642172496802,21.254697107031234&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C48.72642172496802,21.254697107031234&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(18, '43.93741260384119', '15.441512136079837', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=43.93741260384119,15.441512136079837&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C43.93741260384119,15.441512136079837&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(19, '52.60883266954727', '13.572310140652007', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=52.60883266954727,13.572310140652007&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C52.60883266954727,13.572310140652007&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(20, '48.860649275706926', '2.3521900177001953', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=48.860649275706926,2.3521900177001953&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C48.860649275706926,2.3521900177001953&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(21, '40.85460519395101', '-73.93668005395989', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=40.85460519395101,-73.93668005395989&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C40.85460519395101,-73.93668005395989&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(22, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(23, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(24, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(25, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(26, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(27, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(28, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(29, '44.8146202', '20.402496', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146202,20.402496&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146202,20.402496&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(30, '44.8146366', '20.4024926', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146366,20.4024926&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146366,20.4024926&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(31, '44.814647099999995', '20.4025072', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814647099999995,20.4025072&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814647099999995,20.4025072&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(32, '44.8146269', '20.4024898', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146269,20.4024898&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146269,20.4024898&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(33, '44.814647099999995', '20.402481899999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814647099999995,20.402481899999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814647099999995,20.402481899999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(34, '44.81465250000001', '20.402506799999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.81465250000001,20.402506799999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.81465250000001,20.402506799999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(35, '44.8146396', '20.4025104', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146396,20.4025104&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146396,20.4025104&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(36, '44.91340438085985', '20.639462732031234', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.91340438085985,20.639462732031234&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.91340438085985,20.639462732031234&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(37, '44.58961744616464', '20.710873864843734', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.58961744616464,20.710873864843734&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.58961744616464,20.710873864843734&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(38, '44.81463060000001', '20.4024798', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.81463060000001,20.4024798&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.81463060000001,20.4024798&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(39, '44.8146269', '20.4024898', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146269,20.4024898&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146269,20.4024898&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(40, '44.8146461', '20.4025006', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146461,20.4025006&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146461,20.4025006&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(41, '44.81463120000001', '20.402521999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.81463120000001,20.402521999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.81463120000001,20.402521999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(42, '44.8146315', '20.402510300000003', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146315,20.402510300000003&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146315,20.402510300000003&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(43, '45.07655715566504', '20.205502771093734', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=45.07655715566504,20.205502771093734&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C45.07655715566504,20.205502771093734&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(44, '44.814609', '20.402490699999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814609,20.402490699999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814609,20.402490699999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(45, '44.814609', '20.402490699999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814609,20.402490699999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814609,20.402490699999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(46, '44.8146213', '20.4025036', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146213,20.4025036&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146213,20.4025036&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(47, '44.8146315', '20.402510300000003', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146315,20.402510300000003&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146315,20.402510300000003&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(48, '44.8146315', '20.402510300000003', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146315,20.402510300000003&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146315,20.402510300000003&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(49, '44.8146315', '20.402510300000003', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146315,20.402510300000003&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146315,20.402510300000003&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(50, '44.8146315', '20.402510300000003', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146315,20.402510300000003&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146315,20.402510300000003&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(51, '44.8146194', '20.402514699999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146194,20.402514699999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146194,20.402514699999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(52, '47.53123261830881', '19.062924646093734', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=47.53123261830881,19.062924646093734&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C47.53123261830881,19.062924646093734&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(53, '44.8146194', '20.402514699999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146194,20.402514699999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146194,20.402514699999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(54, '44.8146315', '20.402510300000003', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146315,20.402510300000003&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146315,20.402510300000003&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(55, '44.814609', '20.402490699999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814609,20.402490699999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814609,20.402490699999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(56, '44.8146276', '20.4025118', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146276,20.4025118&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146276,20.4025118&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(57, '44.814625', '20.4025237', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814625,20.4025237&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814625,20.4025237&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(58, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(59, '44.759504', '20.5513178', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.759504,20.5513178&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.759504,20.5513178&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(60, '44.7557906', '20.551618299999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7557906,20.551618299999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7557906,20.551618299999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(61, '45.07116068891494', '20.889782402917035', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=45.07116068891494,20.889782402917035&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C45.07116068891494,20.889782402917035&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(62, '44.77946311157259', '20.670055840417035', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.77946311157259,20.670055840417035&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.77946311157259,20.670055840417035&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(63, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(64, '44.7600023', '20.5505986', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7600023,20.5505986&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7600023,20.5505986&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(65, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(66, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(67, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(68, '44.7602688', '20.541439999999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7602688,20.541439999999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7602688,20.541439999999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(69, '44.7558034', '20.551512199999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.7558034,20.551512199999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.7558034,20.551512199999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(70, '44.814642899999996', '20.402521399999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814642899999996,20.402521399999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814642899999996,20.402521399999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(71, '44.814611500000005', '20.402499799999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814611500000005,20.402499799999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814611500000005,20.402499799999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(72, '44.814611500000005', '20.402499799999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814611500000005,20.402499799999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814611500000005,20.402499799999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(73, '44.8146029', '20.4024951', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146029,20.4024951&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146029,20.4024951&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(74, '44.8146128', '20.4025244', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146128,20.4025244&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146128,20.4025244&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(75, '44.8146238', '20.402494', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146238,20.402494&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146238,20.402494&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(76, '44.814611500000005', '20.402499799999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814611500000005,20.402499799999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814611500000005,20.402499799999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(77, '44.814611500000005', '20.402499799999998', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814611500000005,20.402499799999998&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814611500000005,20.402499799999998&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(78, '44.814623399999995', '20.4024838', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814623399999995,20.4024838&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814623399999995,20.4024838&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(79, '44.814623399999995', '20.4024838', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.814623399999995,20.4024838&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.814623399999995,20.4024838&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(80, '44.8146141', '20.4024908', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146141,20.4024908&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146141,20.4024908&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w'),
(81, '44.8146141', '20.4024908', NULL, 'https://maps.googleapis.com/maps/api/staticmap?center=44.8146141,20.4024908&zoom=13&size=500x300&maptype=roadmap\n    &markers=color:red%7Clabel:Place%7C44.8146141,20.4024908&key=AIzaSyB0b1NJ0xOXCoaU7BeS_TEzvFLUjDu14-w');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
CREATE TABLE IF NOT EXISTS `place` (
  `place_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `image_url` varchar(300) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `available_from` date NOT NULL,
  `available_to` date NOT NULL,
  `fk_user_id` int(11) NOT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`place_id`),
  KEY `fk_user_id` (`fk_user_id`),
  KEY `fk_location_id` (`fk_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `username`, `password`, `first_name`, `last_name`, `enabled`) VALUES
(31, 'john@smith', 'jsmith', '$2a$10$wzUzILvgQiawVCsCbaXYRO8Oz5JPw0W8WhrbPB1NTyhQJHVfrh5Ym', 'John', 'Smith', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `authority_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  PRIMARY KEY (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`authority_id`, `username`, `authority`) VALUES
(15, 'jsmith', 'ROLE_USER');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_place_id_booking` FOREIGN KEY (`fk_place_id`) REFERENCES `place` (`place_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id_booking` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `fk_location_id` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
