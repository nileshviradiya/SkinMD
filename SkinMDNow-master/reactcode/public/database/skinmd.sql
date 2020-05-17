-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2019 at 04:24 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skinmd`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers_of_questions`
--

CREATE TABLE `answers_of_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL COMMENT 'This is CASE ID',
  `que_id` int(10) UNSIGNED NOT NULL COMMENT 'store ID of questions table',
  `question_type` enum('Multiple','Dropdown','Text Area') DEFAULT NULL,
  `que_answers` varchar(200) NOT NULL COMMENT 'will store all Question Answer choices and Text Area value',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers_of_questions`
--

INSERT INTO `answers_of_questions` (`id`, `case_id`, `que_id`, `question_type`, `que_answers`, `updated_at`, `created_at`) VALUES
(13, 95, 1, 'Text Area', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2019-07-25 14:18:02', '2019-07-25 14:18:02'),
(14, 95, 14, 'Multiple', '7,8,10', '2019-07-25 14:18:02', '2019-07-25 14:18:02'),
(15, 96, 1, 'Text Area', '22222222222222', '2019-07-25 14:36:03', '2019-07-25 14:36:03'),
(16, 96, 14, 'Multiple', '10', '2019-07-25 14:36:03', '2019-07-25 14:36:03'),
(17, 99, 1, 'Text Area', 'rrrrrrrrrrrrrttttttttttttt', '2019-07-26 05:20:55', '2019-07-26 05:20:55'),
(18, 99, 1, 'Text Area', 'rtttttttttttttt', '2019-07-26 05:20:55', '2019-07-26 05:20:55'),
(19, 99, 14, 'Multiple', '7,8,10', '2019-07-26 05:20:55', '2019-07-26 05:20:55'),
(20, 99, 14, 'Multiple', '7,8,10', '2019-07-26 05:20:55', '2019-07-26 05:20:55'),
(21, 100, 15, 'Dropdown', '15', '2019-07-30 08:29:03', '2019-07-30 08:29:03'),
(22, 102, 1, 'Text Area', 'adasd asd asd ', '2019-07-30 11:19:49', '2019-07-30 11:19:49'),
(23, 102, 14, 'Multiple', '7', '2019-07-30 11:19:49', '2019-07-30 11:19:49'),
(26, 103, 1, 'Text Area', '444444444', '2019-07-30 13:34:47', '2019-07-30 13:34:47'),
(27, 103, 14, 'Multiple', '7', '2019-07-30 13:34:47', '2019-07-30 13:34:47'),
(28, 102, 14, 'Multiple', '8', '2019-07-30 11:19:49', '2019-07-30 11:19:49'),
(29, 104, 1, 'Text Area', 'Whats your name?', '2019-07-30 13:43:19', '2019-07-30 13:43:19'),
(30, 104, 14, 'Multiple', '7,8,10', '2019-07-30 13:43:19', '2019-07-30 13:43:19'),
(31, 105, 1, 'Text Area', 'asd asdWhats your name?as dasdasd', '2019-07-30 14:05:56', '2019-07-30 14:05:56'),
(32, 105, 14, 'Multiple', '7,8,10', '2019-07-30 14:05:56', '2019-07-30 14:05:56'),
(33, 106, 1, 'Text Area', '22', '2019-07-30 14:45:03', '2019-07-30 14:45:03'),
(34, 107, 1, 'Text Area', 'Whats your name?Whats your name?\nWhats your name?\nWhats your name?', '2019-07-31 10:27:11', '2019-07-31 10:27:11'),
(35, 107, 14, 'Multiple', '7,8,10', '2019-07-31 10:27:11', '2019-07-31 10:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `body_areas`
--

CREATE TABLE `body_areas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `body_areas`
--

INSERT INTO `body_areas` (`id`, `name`, `created_datetime`, `updated_datetime`) VALUES
(1, 'Head', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(2, 'Chest & Stomach', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(3, 'LeftArm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(4, 'RightArm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(5, 'LeftHand', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(6, 'RightHand', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(7, 'RightLeg', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(8, 'leftLeg', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(9, 'leftFoot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(10, 'RightFoot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(11, 'Genitals', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(12, 'Scalp', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(13, 'Forehead', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(14, 'R brow', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(15, 'L brow', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(16, 'R eye', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(17, 'L eye', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(18, 'Nose', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(19, 'R cheek', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(20, 'L cheek', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(21, 'R ear', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(22, 'L ear', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(23, 'Chin', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(24, 'Neck', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(25, 'Between nose and lips', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(26, 'Upper lip', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(27, 'Lower lip', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(28, 'R chest', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(29, 'L chest', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(30, 'L nipple', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(31, 'R nipple', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(32, 'Abdomen', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(33, 'Belly button', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(34, 'L palm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(35, 'L palmar thumb', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(36, 'L palmar 2nd finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(37, 'L palmar 3rd finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(38, 'L palmar 4th finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(39, 'L palmar 5th finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(40, 'L volar wrist', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(41, 'R palm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(42, 'R palmar thumb', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(43, 'R palmar 2nd finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(44, 'R palmar 3rd finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(45, 'R palmar 4th finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(46, 'R palmar 5th finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(47, 'L shoulder', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(48, 'L anterior upper arm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(49, 'L antecubital fossa', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(50, 'L anterior forearm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(51, 'R shoulder', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(52, 'R anterior upper arm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(53, 'R antecubital fossa', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(54, 'R anterior forearm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(55, 'L anterior thigh', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(56, 'L knee', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(57, 'L shin', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(58, 'R anterior thigh', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(59, 'R knee', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(60, 'R shin', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(61, 'L dorsal foot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(62, 'L anterior ankle', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(63, 'L dorsal 1st toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(64, 'L dorsal 2nd toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(65, 'L dorsal 3rd toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(66, 'L dorsal 4th toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(67, 'L dorsal 5th toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(68, 'R dorsal foot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(69, 'R anterior ankle', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(70, 'R dorsal 1st toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(71, 'R dorsal 2nd toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(72, 'R dorsal 3rd toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(73, 'R dorsal 4th toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(74, 'R dorsal 5th toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(75, 'L upper thigh', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(76, 'R upper thigh', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(77, 'Anus', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(78, 'Scrotum', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(79, 'Glans (head)', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(80, 'Suprapubic groin', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(81, 'Dorsal penile shaft', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(82, 'Male Back Head', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(83, 'Male Back', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(84, 'Male Buttocks', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(85, 'Male Back LeftArm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(86, 'Male Back RightArm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(87, 'Male Back RightHand', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(88, 'Male Back LeftHand', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(89, 'Male Back Right Leg', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(90, 'Male Back Left Leg', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(91, 'Male Back Right Foot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(92, 'Male Back Left Foot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(93, 'Upper back', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(94, 'Lower back', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(95, 'L buttock', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(96, 'R buttock', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(97, 'L posterior shoulder', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(98, 'L posterior upper arm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(99, 'L elbow', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(100, 'L posterior forearm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(101, 'R posterior shoulder', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(102, 'R posterior upper arm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(103, 'R elbow', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(104, 'R posterior forearm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(105, 'Rdorsal hand', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(106, 'R dorsal thumb', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(107, 'R dorsal 2nd finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(108, 'R dorsal 3rd finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(109, 'R dorsal 4th finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(110, 'R dorsal 5th finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(111, 'R dorsal wrist', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(112, 'L dorsal hand', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(113, 'L dorsal 2nd finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(114, 'L dorsal 3rd finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(115, 'L dorsal 4th finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(116, 'L dorsal 5th finger', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(117, 'L dorsal wrist', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(118, 'R plantar foot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(119, 'R 1st plantar toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(120, 'R 2nd plantar toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(121, 'R 3rd plantar toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(122, 'R 4th plantar toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(123, 'R 5th plantar toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(124, 'L plantar foot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(125, 'L 1st plantar toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(126, 'L 2nd plantar toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(127, 'L 3rd plantar toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(128, 'L 4th plantar toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(129, 'L 5th plantar toe', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(130, 'L posterior thigh', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(131, 'L popliteal fossa', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(132, 'L calf', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(133, 'L posterior ankle', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(134, 'R posterior thigh', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(135, 'R popliteal fossa', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(136, 'R calf', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(137, 'R posterior ankle', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(138, 'R Female Front LeftFoot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(139, 'R Female Front RightFoot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(140, 'Female Front LeftArm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(141, 'Female Front LeftLeg', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(142, 'Female Front LeftHand', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(143, 'Female Front RightHand', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(144, 'Female Genitalia', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(145, 'Female Front RightLeg', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(146, 'Female Chest & Stomach', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(147, 'Female Front RightArm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(148, 'Female Face', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(149, 'L breast', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(150, 'R breast', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(151, 'Labia majora (outer lips)', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(152, 'Labia minora (inner lips)', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(153, 'Female Back Head', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(154, 'Female Back', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(155, 'Female Buttocks', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(156, 'Female Back LeftArm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(157, 'Female Back RightArm', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(158, 'Female Back RightHand', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(159, 'Female Back LeftHand', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(160, 'Female Back Right Leg', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(161, 'Female Back Left Leg', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(162, 'Female Back Right Foot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(163, 'Female Back Left Foot', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(164, 'Posterior Neck', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(165, 'R dorsal hand', '2019-07-16 13:57:36', '2019-07-16 13:57:36'),
(166, 'L dorsal thumb', '2019-07-16 13:57:36', '2019-07-16 13:57:36');

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_number` varchar(30) NOT NULL,
  `care_giver_id` int(10) UNSIGNED NOT NULL COMMENT 'We will store here caregiver user id',
  `patient_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Will store ID from Patient_details table ',
  `provider_id` int(10) UNSIGNED NOT NULL COMMENT 'Doctor''s ID, selected from request form',
  `patient_details_id` int(11) NOT NULL,
  `patient_fname` varchar(100) NOT NULL,
  `patient_mname` varchar(100) DEFAULT NULL,
  `patient_lname` varchar(100) NOT NULL,
  `patient_gender` int(11) NOT NULL,
  `patient_dob` date NOT NULL,
  `patient_caregiver_relation` int(11) NOT NULL,
  `patient_email` varchar(100) NOT NULL,
  `patient_phone` varchar(100) NOT NULL,
  `patient_pharmacy_id` int(10) UNSIGNED DEFAULT NULL,
  `patient_current_medication_id` varchar(200) DEFAULT NULL,
  `patient_drug_allergies_id` varchar(200) DEFAULT NULL,
  `family_medical_history_id` varchar(200) DEFAULT NULL,
  `patient_medical_history_id` varchar(200) DEFAULT NULL,
  `derm_id` int(11) DEFAULT NULL COMMENT 'We will store derm  address id here',
  `photos_ids` varchar(100) DEFAULT NULL,
  `consult_cost` varchar(100) NOT NULL,
  `refferal_code_id` int(10) UNSIGNED DEFAULT NULL,
  `follow_up` text DEFAULT NULL,
  `bill_id` int(10) UNSIGNED DEFAULT NULL,
  `questions_answer` blob DEFAULT NULL,
  `prescriptions_ids` varchar(100) DEFAULT NULL,
  `submitted_by` int(10) UNSIGNED NOT NULL COMMENT 'Patient ID, will store when pationet submit form so login id will store here',
  `submitted_on` date NOT NULL,
  `complaint_id` int(10) UNSIGNED NOT NULL COMMENT 'What do you need help with? ',
  `time_of_issue1` int(10) UNSIGNED DEFAULT NULL COMMENT 'How long have you had this issue?',
  `time_of_issue2` enum('Days','Weeks','Months','Years') DEFAULT NULL COMMENT 'How long have you had this issue?',
  `affected_area_list` varchar(100) DEFAULT NULL,
  `type_of_problem1` varchar(100) DEFAULT NULL COMMENT 'comma seperated type_of_problem ID ',
  `type_of_problem2` enum('Worsening','Stable','Improving','Recurring') DEFAULT NULL,
  `pregnant_status` varchar(200) DEFAULT NULL,
  `biopsied_or_excised` int(11) DEFAULT NULL COMMENT 'Has this condition been biopsied or excised before?',
  `is_case_deleted` int(10) NOT NULL DEFAULT 0,
  `status` enum('Active','Resolved','Cancelled','') NOT NULL COMMENT 'Case Status will be one from this ''Active'', ''Resolved'', ''Cancelled''',
  `case_priority` enum('Normal') NOT NULL,
  `case_close_date` date DEFAULT NULL COMMENT 'Case close date will store here',
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id`, `case_number`, `care_giver_id`, `patient_id`, `provider_id`, `patient_details_id`, `patient_fname`, `patient_mname`, `patient_lname`, `patient_gender`, `patient_dob`, `patient_caregiver_relation`, `patient_email`, `patient_phone`, `patient_pharmacy_id`, `patient_current_medication_id`, `patient_drug_allergies_id`, `family_medical_history_id`, `patient_medical_history_id`, `derm_id`, `photos_ids`, `consult_cost`, `refferal_code_id`, `follow_up`, `bill_id`, `questions_answer`, `prescriptions_ids`, `submitted_by`, `submitted_on`, `complaint_id`, `time_of_issue1`, `time_of_issue2`, `affected_area_list`, `type_of_problem1`, `type_of_problem2`, `pregnant_status`, `biopsied_or_excised`, `is_case_deleted`, `status`, `case_priority`, `case_close_date`, `updated_datetime`, `created_datetime`) VALUES
(95, 'T01XL-4WRP8-7JAGC-AS9AE', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@gmail.com', '9825098250', 59, '2858', '1946', '1990', '1997', 2, ',107,108', '30', NULL, 'Diagnosis & Impression, Patient Instructions & Follow-Up Plan', NULL, NULL, '9', 0, '0000-00-00', 1, 3, 'Months', '12,13,16,18,19,20,22,23,24,25,26,27', '2,3,4,5,6', 'Stable', NULL, 1, 0, 'Resolved', 'Normal', NULL, '2019-08-09 07:08:30', '2019-07-25 14:16:01'),
(96, 'NFA5T-3SUNI-4QBXM-SG0GI', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@gmail.com', '9825098250', 71, '2858', '1946', '1990', '1997', 2, '42,43', '30', NULL, NULL, NULL, NULL, '10', 0, '0000-00-00', 1, 0, '', '12,15,25,26,27', '', '', NULL, 0, 0, 'Resolved', 'Normal', '2019-08-05', '2019-08-05 16:02:33', '2019-07-25 14:35:49'),
(97, 'SCV55-GJXZ5-N2L3J-1T9B8', 67, NULL, 75, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@gmail.com', '9825098250', 71, '2858', '1946', '1990', '1997', 56, NULL, '0', NULL, NULL, NULL, NULL, '11', 0, '0000-00-00', 14, 0, '', NULL, '', '', NULL, 0, 0, 'Cancelled', 'Normal', '2019-08-05', '2019-08-05 16:02:45', '2019-07-25 14:53:01'),
(98, '2QAFB-CCQF1-ULOU4-ED5FA', 67, NULL, 75, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@gmail.com', '9825098250', 71, '2858', '1946', '1990', '1997', 56, '114', '0', NULL, 'asdasd', NULL, NULL, '12', 1, '0000-00-00', 4, 0, '', NULL, '', '', NULL, 0, 1, 'Active', 'Normal', '2019-08-09', '2019-08-09 11:47:41', '2019-07-25 14:53:52'),
(99, 'FDZJ7-3H7YW-6XEIX-A4RYX', 67, NULL, 74, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@gmail.com', '9825098250', 71, '2858', '1946', '1990', '1997', 55, '128,129,130,131,139', '0', NULL, 'New Question Answer Template 234234	  New Question Answer Template 234234	  New Question Answer Template 234234	  New Question Answer Template 234234', NULL, NULL, '14', 1, '0000-00-00', 1, 4, 'Months', '12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27', '1,3,4', 'Improving', NULL, 0, 0, 'Resolved', 'Normal', '2019-08-10', '2019-08-10 13:12:19', '2019-07-26 05:20:28'),
(100, 'TD795-ZJ6VW-9CMI0-W6V2C', 67, NULL, 66, 72, 'New', 'P', 'Patioent', 1, '2001-07-09', 2, 'mother@mailinator.com', '1568779879', 60, '2859,2860,2861', '1947,1948,1949', '1991,1992,1993', '1998,1999,2000', NULL, '51,52,53', '30', NULL, NULL, NULL, NULL, '15', 0, '0000-00-00', 4, 4, 'Months', '12,13,14,15,16,17,18,19,20,21,22,23,24,26', '2,3,5,6', 'Stable', '16', 1, 0, 'Active', 'Normal', '2019-08-01', '2019-08-05 16:01:56', '2019-07-30 08:27:40'),
(101, 'I09MG-A8SKQ-OUIMQ-3NS33', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 1, '1988-06-11', 1, 'brendan1', '9825098250', 71, '2858', '1946', '1990', '1997', 2, '113', '30', NULL, 'sadfsdfsdfsdf', NULL, NULL, '17', 0, '0000-00-00', 1, 0, '', NULL, '', '', '15', 0, 0, 'Active', 'Normal', '2019-08-05', '2019-08-05 16:01:42', '2019-07-30 10:06:35'),
(102, 'ZZ20J-KZLFZ-2UTB3-4CUI3', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 1, '1988-06-11', 1, 'brendan1', '9825098250', 71, '2858', '1946', '1990', '1997', 2, NULL, '30', NULL, NULL, NULL, NULL, '19', 0, '0000-00-00', 1, 0, '', '12,15,16,19,20,23,24,25,26,27', '', '', '16', 0, 0, 'Active', 'Normal', '2019-08-02', '2019-08-05 16:01:56', '2019-07-30 11:19:19'),
(103, '22TYL-XJCBH-48KOP-1F9X3', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1', '9825098250', NULL, '2858', '1946', '1990', '1997', 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 1, 0, '', '12', '', '', NULL, 0, 0, 'Active', 'Normal', '2019-08-01', '2019-08-05 16:01:56', '2019-07-30 13:34:29'),
(104, 'U7KV7-09P7Q-IWZ55-239OG', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 1, '1988-06-11', 1, 'brendan1', '9825098250', NULL, '2858', '1946', '1990', '1997', 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 1, 0, '', '12,13,16,17,19,20,21,22,24,25,26,27', '', '', '15', 0, 0, 'Active', 'Normal', '2019-08-05', '2019-08-05 16:01:42', '2019-07-30 13:43:01'),
(105, 'KJ40X-1NKL1-UJ9NI-3ODMU', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 1, '1988-06-11', 1, 'brendan1', '9825098250', 71, '2858', '1946', '1990', '1997', 2, '', '30', NULL, 'teledermatology (SkinMD Now) \r\nreviewed 1 photo - rare acneiform papules on chin \r\nmild papular; will treat with topicals, also given patient is only 10yo; if needed, can start oral doxycycline at follow-up in office \r\n- Sulfur/sulfacetamide wash; wash face and body, once or twice daily. Leave on for a few minutes before rinsing off. \r\n- clindamycin lotion every morning \r\n- tretinoin at bedtime every 4-5 nights; moisturize with Cerave nightly\r\n- with tretinoin, start off using every 4 nights for first 2-3 weeks and then gradually increase frequency to minimize dryness. Do not use during the day. Do not use at the same time with benzoyl peroxide products because they inactivate tretinoin. Do not use tretinoin cream close to eyes, lips or nostrils because of increased skin sensitivity on those areas.\r\n- meds sent to U-Save\r\n- Follow-up in office in 4-6 weeks or sooner for any concerns.', NULL, NULL, '22', 0, '0000-00-00', 1, 2, 'Days', '12', '1,2,4,5,6', 'Stable', '14', 1, 0, 'Active', 'Normal', '2019-08-05', '2019-08-05 16:01:56', '2019-07-30 14:04:43'),
(106, 'MYLTN-JQJW5-MBRCX-CAST7', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1', '9825098250', NULL, '2858', '1946', '1990', '1997', 2, '', '30', NULL, 'Anil saini', NULL, NULL, NULL, 0, '0000-00-00', 1, 0, '', '12', '', '', NULL, 0, 0, 'Active', 'Normal', '2019-08-05', '2019-08-05 16:01:56', '2019-07-30 14:44:55'),
(107, '1EN0Q-KC2R5-52VJS-M6JVC', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', 71, '2858,2862,2862', '1946,1950,1951', '1990,1994,1994', '1997,2001,2002', 2, '102,103,104,106', '30', NULL, 'Whats your name?Whats your name?\nWhats your name?\nWhats your name?', NULL, NULL, '23,22', 0, '0000-00-00', 1, 1, 'Weeks', '12,13,16,17,18,19,20,21,22,23,24,25,26,27', '1,2,4,6', 'Worsening', NULL, 1, 0, 'Active', 'Normal', '2019-08-05', '2019-08-05 16:01:56', '2019-07-31 10:26:29'),
(108, '4EOR9-JDA0W-8T39G-DMU05', 67, NULL, 75, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', 71, '2858,2862', '1946,1950,1951', '1990,1994', '1997,2001,2002', 56, '109,110,111', '0', NULL, NULL, NULL, NULL, '39', 0, '0000-00-00', 1, 1, 'Days', '12,13,14,15,16,17,18,19,20,21,22,23,25,26,27', '3,5,7', 'Stable', NULL, 1, 0, 'Resolved', 'Normal', '2019-08-05', '2019-08-05 16:02:59', '2019-08-05 08:35:32'),
(109, 'FKFKA-GJFSC-0SYGJ-KQC57', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, '2858,2862', '1946,1950,1951', '1990,1994', '1997,2001,2002', NULL, '115', '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 14, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-09 10:59:50', '2019-08-09 10:59:46'),
(110, 'PMJL2-RWHOY-FSNSW-5RDYM', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 4, 4, 'Days', '13,16,17,25,26,27', '3,4,5', 'Stable', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 10:17:31', '2019-08-10 10:17:31'),
(111, 'NYB3J-RRZVH-2Z9VH-XEIWP', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 4, 4, 'Days', '13,16,17,25,26,27', '3,4,5', 'Stable', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 10:17:49', '2019-08-10 10:17:49'),
(112, 'PAFIU-SBFVT-EOU74-MN0HR', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 4, 4, 'Days', '13,16,17,25,26,27', '3,4,5', 'Stable', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 10:26:57', '2019-08-10 10:26:57'),
(113, 'TZQ3N-Y9H5K-QESKX-WSI8W', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 4, 4, 'Days', '13,16,17,25,26,27', '3,4,5', 'Stable', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 10:28:20', '2019-08-10 10:28:20'),
(114, '97CV3-JECUS-PL289-P995B', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 4, 4, 'Days', '13,16,17,25,26,27', '3,4,5', 'Stable', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 10:28:38', '2019-08-10 10:28:38'),
(115, 'LRIP9-QLRND-3EMKX-EF1WR', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 4, 4, 'Days', '13,16,17,25,26,27', '3,4,5', 'Stable', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 10:29:06', '2019-08-10 10:29:06'),
(116, 'EEODU-ZJ3SJ-F6EVJ-ZABXI', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 14, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 10:31:30', '2019-08-10 10:31:30'),
(117, '679D7-3N6G9-UDXUF-SNHFY', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 10:38:29', '2019-08-10 10:38:29'),
(118, 'RPDGX-ANAGB-HHKGH-V6BBM', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 10:40:13', '2019-08-10 10:40:13'),
(119, 'G2KEZ-B6Z08-V5H2P-H3415', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 10:56:35', '2019-08-10 10:56:35'),
(120, 'Q0SLA-73LCF-V21IX-DUZVD', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 10:58:59', '2019-08-10 10:58:59'),
(121, 'AP3H9-MX86J-I72UW-TPPL4', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 11:01:22', '2019-08-10 11:01:22'),
(122, '0UTCS-M7172-QQRKZ-9FFY2', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 11:02:43', '2019-08-10 11:02:43'),
(123, 'ZJ6WI-33LGH-PE07U-0GDDI', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 11:05:32', '2019-08-10 11:05:32'),
(124, '1PIWR-BD1MZ-D3TA1-DNRS5', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 11:06:02', '2019-08-10 11:06:02'),
(125, 'FUUZW-JDWVQ-TLXR5-HJLAV', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 11:12:44', '2019-08-10 11:12:44'),
(126, '5ZHA4-2POJZ-TE65D-EZN8M', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 11:14:04', '2019-08-10 11:14:04'),
(127, 'J12EX-SIEI1-89WX2-62670', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 11:17:05', '2019-08-10 11:17:05'),
(128, '9PIFC-FRS14-Z1LFA-YO4BW', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 11:17:35', '2019-08-10 11:17:35'),
(129, 'RL6H9-T62BO-RCZ9H-IRXH6', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 11:19:48', '2019-08-10 11:19:48'),
(130, '5XXZU-5R6AP-DJN4I-3FVQ9', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 11:24:05', '2019-08-10 11:24:05'),
(131, 'BAFZX-V6D61-NO4W5-G9UY0', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, '2858,2862', '1946,1950,1951', '1990,1994', '1997,2001,2002', 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 14:29:46', '2019-08-10 14:29:06'),
(132, 'QEOKN-T2QBP-YK99V-K4MU9', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, '2858,2862', '1946,1950,1951', '1990,1994', '1997,2001,2002', 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 14, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 14:34:40', '2019-08-10 14:34:29'),
(133, 'NBABC-GDYOZ-CUOWV-RHAV6', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, '2858,2862', '1946,1950,1951', '1990,1994', '1997,2001,2002', 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 14:40:48', '2019-08-10 14:37:47'),
(134, 'WFW1D-5AYWM-DFW18-GATR7', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, '2858,2862', '1946,1950,1951', '1990,1994', '1997,2001,2002', 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 14:44:18', '2019-08-10 14:44:07'),
(135, 'IAAIK-QIGYX-R56EF-71M47', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, '2858,2862', '1946,1950,1951', '1990,1994', '1997,2001,2002', 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 4, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 14:45:05', '2019-08-10 14:44:55'),
(136, '800R3-U27ZT-WOPUK-V3STE', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, '2858,2862', '1946,1950,1951', '1990,1994', '1997,2001,2002', 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 14:46:49', '2019-08-10 14:46:39'),
(137, 'V7ISN-III1I-7CE1M-WG5MX', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, '2858,2862', '1946,1950,1951', '1990,1994', '1997,2001,2002', 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 8, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 14:47:32', '2019-08-10 14:47:22'),
(138, 'C3IN7-6EDEG-Z8U6D-FY0VQ', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, '2858,2862', '1946,1950,1951', '1990,1994', '1997,2001,2002', 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-10 14:49:32', '2019-08-10 14:49:21'),
(139, 'LJ2RX-EW2DA-0QQX1-IZP73', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', '12,15', '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-17 14:14:12', '2019-08-17 14:14:12'),
(140, 'L5AQA-IWRGO-283F0-ZQQ6S', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-17 19:41:01', '2019-08-17 19:41:01'),
(141, '0JTMV-CSJWD-2JSCN-JHZP0', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, 2, NULL, '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 4, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-17 19:50:56', '2019-08-17 19:50:56'),
(142, 'A6GJO-KNRW3-LP6TX-KCYEZ', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, 2, NULL, '11', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-18 06:34:13', '2019-08-18 06:34:13'),
(143, '4RVLV-F3BQ5-1IDQR-205X4', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, 2, NULL, '11', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-18 06:40:39', '2019-08-18 06:40:39'),
(144, 'NNZWF-YOZ8I-F50WR-TKW9B', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, 2, NULL, '11.86', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-18 06:45:24', '2019-08-18 06:45:24'),
(145, 'EX78C-M9VBG-4RIS8-CN9YE', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, 2, NULL, '11.86', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 15, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-19 14:34:36', '2019-08-19 14:34:36'),
(146, 'B5HP9-BZLHE-BH7WZ-2VG3Y', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, 2, '140,141,142', '11.86', 33, NULL, NULL, NULL, NULL, 1, '0000-00-00', 15, 1, '', NULL, '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-19 15:23:34', '2019-08-19 14:37:26'),
(147, 'C0PUO-HCM5P-MHOMB-PCABR', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, '143,144', '30', NULL, NULL, NULL, NULL, NULL, 67, '0000-00-00', 1, 2, 'Days', '12,13,19,20,22,25,26,27', '', '', NULL, 0, 0, 'Active', 'Normal', NULL, '2019-08-19 15:37:36', '2019-08-19 15:37:36'),
(148, '92QAF-73NHU-JVLH8-KYXGC', 67, NULL, 66, 71, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, '145,146', '30', NULL, NULL, NULL, NULL, NULL, 1, '0000-00-00', 14, 1, '', '12,13,14,17,22,25,26,27', '', '', NULL, 0, 0, 'Resolved', 'Normal', '2019-08-19', '2019-08-19 16:01:37', '2019-08-19 15:40:11');

--
-- Triggers `cases`
--
DELIMITER $$
CREATE TRIGGER `insert_caseinfo_trigger` AFTER INSERT ON `cases` FOR EACH ROW BEGIN
    
    SET @trigger_action = 'Add';
    SET @follow_up = '';
    SET @case_id = NEW.id;
    SET @user_id = NEW.care_giver_id;
    SET @care_giver_id = (SELECT CONCAT(fname,' ', lname) from users where id = NEW.care_giver_id);
    SET @photos_ids = '';
    SET @status = '';
    SET @is_case_deleted = '';
    SET @updated_at  = UTC_TIMESTAMP();


    /****Start****/
    IF(NEW.follow_up != '' && NEW.follow_up IS NOT NULL) THEN
        
        SET @follow_up = CONCAT('Diagnosis & Impression, Patient Instructions & Follow-Up Plan\r\n: ', NEW.follow_up,', ');

    END IF;
    /**END***/

    /****Start****/

    IF(NEW.photos_ids != '' && NEW.photos_ids IS NOT NULL) THEN
        
        SET @photo_name = (SELECT img_name FROM case_photos WHERE id = NEW.photos_ids );

        SET @photos_ids = CONCAT('Case Photos: ', @photo_name,', ');

    END IF;
    /**END***/

    /****Start****/
    IF(NEW.status != '' && NEW.status IS NOT NULL) THEN
        
        IF(NEW.status = 1) THEN 
            
            SET @status = CONCAT('Case Status added as Active, ');

        ELSEIF(NEW.status = 2) THEN
            
            SET @status = CONCAT('Case Status added as Resolved, ');

        ELSE
            
            SET @status = CONCAT('Case Status added as Cancelled , ');

        END IF;

    END IF;
    /**END***/
    

    /****Start****/

    IF(NEW.is_case_deleted != '' && NEW.is_case_deleted IS NOT NULL) THEN
        
        SET @is_case_deleted = NEW.is_case_deleted;
        
    END IF;
    /**END***/
    
    SET @log_message = concat( @care_giver_id, " has added new case ");

    /*Insert into system log table*/

    INSERT INTO case_activity_log

        (`case_id`,`log_message`,`by_user_id`,`type`)

    VALUES

        (@case_id, @log_message, @user_id, @trigger_action);

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_before_caseinfo_trigger` BEFORE UPDATE ON `cases` FOR EACH ROW BEGIN
    
    SET @trigger_action = 'Update';
    SET @follow_up = '';
    SET @case_id = NEW.id;
    SET @user_id = NEW.submitted_by;
    SET @care_giver_id = (SELECT CONCAT(fname,' ', lname) from users where id = NEW.submitted_by);
    SET @photos_ids = '';
    SET @status = '';
    SET @is_case_deleted = '';
    SET @updated_at  = UTC_TIMESTAMP();

    /****Start****/

    IF(NEW.photos_ids != OLD.photos_ids) THEN        

        SET @photo_old = (SELECT img_name as img1 FROM case_photos WHERE id = OLD.photos_ids );
        SET @photo_new = (SELECT img_name as img2 FROM case_photos WHERE id = NEW.photos_ids );

        SET @photos_ids = CONCAT(' Case Photos:  ',"(OLD Values: ", @photo_old, ")  and  (New Values: ", @photo_new,")" );
       
        SET @log_message = concat( @care_giver_id, " has updated ", @photos_ids);

        /*Insert into system log table*/

        INSERT INTO case_activity_log

            (`case_id`,`log_message`,`by_user_id`,`type`)

        VALUES

            (@case_id, @log_message, @user_id, @trigger_action);
        


    END IF;
    /**END***/


    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_caseinfo_trigger` AFTER UPDATE ON `cases` FOR EACH ROW BEGIN
    
    SET @trigger_action = 'Update';
    SET @follow_up = '';
    SET @case_id = NEW.id;
    SET @user_id = NEW.submitted_by;
    SET @care_giver_id = (SELECT CONCAT(fname,' ', lname) from users where id = NEW.submitted_by);
    SET @photos_ids = '';
    SET @status = '';
    SET @is_case_deleted = '';
    SET @updated_at  = UTC_TIMESTAMP();


    /****Start****/
    IF(NEW.follow_up != OLD.follow_up) THEN
        
        SET @follow_up = CONCAT(' Follow-Up Plan : ', NEW.follow_up, " ( Old Value: ", OLD.follow_up, '), ');
        
        SET @log_message = concat(@care_giver_id, " has updated ", @follow_up);

        /*Insert into system log table*/

        INSERT INTO case_activity_log

            (`case_id`,`log_message`,`by_user_id`,`type`)

        VALUES

            (@case_id, @log_message, @user_id, @trigger_action);

    END IF;
    /**END***/
    

    /****Start****/
    IF(NEW.status != OLD.status) THEN
        
        IF(NEW.status = 2) THEN 
            
            SET @status = CONCAT('Case has been Resolved');
            
            /*Insert into system log table*/

            INSERT INTO case_activity_log

                (`case_id`,`log_message`,`by_user_id`,`type`)

            VALUES

                (@case_id, @status, @user_id, @trigger_action);
                
        ELSEIF(NEW.status = 3) THEN
            
            SET @status = CONCAT('Case has been Cancelled ');
                        
            /*Insert into system log table*/
            INSERT INTO case_activity_log

                (`case_id`,`log_message`,`by_user_id`,`type`)

            VALUES

                (@case_id, @status, @user_id, @trigger_action);

        END IF;

    END IF;
    /**END***/
    

    /****Start****/

    IF(NEW.is_case_deleted != OLD.is_case_deleted) THEN
                
            SET @status = "Case has been Deleted";
            SET @trigger_action = 'Delete';

            /*Insert into system log table*/
            INSERT INTO case_activity_log

                (`case_id`,`log_message`,`by_user_id`,`type`)

            VALUES

                (@case_id, @status, @user_id, @trigger_action);
        
    END IF;
    /**END***/
    

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `case_activity_log`
--

CREATE TABLE `case_activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `log_message` text NOT NULL,
  `by_user_id` int(10) UNSIGNED NOT NULL,
  `type` enum('Add','Update','Delete') NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_activity_log`
--

INSERT INTO `case_activity_log` (`id`, `case_id`, `log_message`, `by_user_id`, `type`, `updated_at`, `created_at`) VALUES
(13, 99, 'Admin Now has updated  Case Photos:  (OLD Values: 1565351897.png)  and  (New Values: 1565351897.png)', 1, 'Update', '2019-08-09 14:59:27', '2019-08-09 14:59:27'),
(14, 99, 'Admin Now has updated  Case Photos:  (OLD Values: 1565351897.png)  and  (New Values: 1565362821.png)', 1, 'Update', '2019-08-09 15:00:50', '2019-08-09 15:00:50'),
(15, 99, 'Admin Now has updated  Case Photos:  (OLD Values: 1565362821.png)  and  (New Values: 1565362821.png)', 1, 'Update', '2019-08-09 15:01:22', '2019-08-09 15:01:22'),
(17, 110, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 10:17:31', '2019-08-10 10:17:31'),
(18, 111, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 10:17:49', '2019-08-10 10:17:49'),
(19, 112, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 10:26:57', '2019-08-10 10:26:57'),
(20, 113, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 10:28:20', '2019-08-10 10:28:20'),
(21, 114, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 10:28:38', '2019-08-10 10:28:38'),
(22, 115, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 10:29:06', '2019-08-10 10:29:06'),
(23, 116, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 10:31:30', '2019-08-10 10:31:30'),
(24, 117, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 10:38:29', '2019-08-10 10:38:29'),
(25, 118, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 10:40:13', '2019-08-10 10:40:13'),
(26, 119, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 10:56:35', '2019-08-10 10:56:35'),
(27, 120, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 10:58:59', '2019-08-10 10:58:59'),
(28, 121, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 11:01:22', '2019-08-10 11:01:22'),
(29, 122, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 11:02:43', '2019-08-10 11:02:43'),
(30, 123, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 11:05:32', '2019-08-10 11:05:32'),
(31, 124, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 11:06:02', '2019-08-10 11:06:02'),
(32, 125, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 11:12:44', '2019-08-10 11:12:44'),
(33, 126, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 11:14:04', '2019-08-10 11:14:04'),
(34, 127, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 11:17:05', '2019-08-10 11:17:05'),
(35, 128, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 11:17:35', '2019-08-10 11:17:35'),
(36, 129, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 11:19:48', '2019-08-10 11:19:48'),
(37, 130, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 11:24:05', '2019-08-10 11:24:05'),
(38, 99, 'Case has been Resolved', 1, 'Update', '2019-08-10 13:12:19', '2019-08-10 13:12:19'),
(39, 131, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 14:29:06', '2019-08-10 14:29:06'),
(40, 132, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 14:34:29', '2019-08-10 14:34:29'),
(41, 133, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 14:37:47', '2019-08-10 14:37:47'),
(42, 134, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 14:44:07', '2019-08-10 14:44:07'),
(43, 135, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 14:44:55', '2019-08-10 14:44:55'),
(44, 136, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 14:46:39', '2019-08-10 14:46:39'),
(45, 137, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 14:47:22', '2019-08-10 14:47:22'),
(46, 138, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-10 14:49:21', '2019-08-10 14:49:21'),
(47, 139, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-17 14:14:12', '2019-08-17 14:14:12'),
(48, 140, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-17 19:41:01', '2019-08-17 19:41:01'),
(49, 141, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-17 19:50:56', '2019-08-17 19:50:56'),
(50, 142, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-18 06:34:13', '2019-08-18 06:34:13'),
(51, 143, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-18 06:40:39', '2019-08-18 06:40:39'),
(52, 144, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-18 06:45:24', '2019-08-18 06:45:24'),
(53, 145, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-19 14:34:36', '2019-08-19 14:34:36'),
(54, 146, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-19 14:37:26', '2019-08-19 14:37:26'),
(55, 146, 'Admin Now has updated  Case Photos:  (OLD Values: 1566228091.png)  and  (New Values: 1566228091.png)', 1, 'Update', '2019-08-19 15:23:34', '2019-08-19 15:23:34'),
(56, 147, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-19 15:37:36', '2019-08-19 15:37:36'),
(57, 148, 'Mark Pillemer has added new case ', 67, 'Add', '2019-08-19 15:40:11', '2019-08-19 15:40:11'),
(58, 148, 'Mark Pillemer has updated  Case Photos:  (OLD Values: 1566229112.png)  and  (New Values: 1566229112.png)', 67, 'Update', '2019-08-19 15:42:06', '2019-08-19 15:42:06'),
(59, 148, 'Case has been Resolved', 1, 'Update', '2019-08-19 16:01:37', '2019-08-19 16:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `case_additional_info`
--

CREATE TABLE `case_additional_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `case_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'We will store here CareGiver user_id here',
  `pharmacy_id` int(11) DEFAULT NULL,
  `patient_current_medication_id` int(11) DEFAULT NULL,
  `patient_drug_allergies_id` int(11) DEFAULT NULL,
  `family_medical_history_id` int(11) DEFAULT NULL,
  `patient_medical_history_id` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `case_photos`
--

CREATE TABLE `case_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `img_name` varchar(100) NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `case_photos`
--

INSERT INTO `case_photos` (`id`, `img_name`, `updated_datetime`, `created_datetime`) VALUES
(39, '1564064101.png', '2019-07-25 14:16:01', '2019-07-25 14:16:01'),
(40, '1564064105.PNG', '2019-07-25 14:16:01', '2019-07-25 14:16:01'),
(41, '1564064108.PNG', '2019-07-25 14:16:01', '2019-07-25 14:16:01'),
(42, '1564064641.png', '2019-07-25 14:35:49', '2019-07-25 14:35:49'),
(43, '1564064644.PNG', '2019-07-25 14:35:49', '2019-07-25 14:35:49'),
(44, '1564068422.PNG', '2019-07-25 15:29:21', '2019-07-25 15:29:21'),
(45, '1564068422.PNG', '2019-07-25 15:37:40', '2019-07-25 15:37:40'),
(46, '1564069327.PNG', '2019-07-25 15:42:07', '2019-07-25 15:42:07'),
(47, '1564069345.png', '2019-07-25 15:42:25', '2019-07-25 15:42:25'),
(48, '1564118346.png', '2019-07-26 05:20:28', '2019-07-26 05:20:28'),
(49, '1564118476.png', '2019-07-26 05:21:17', '2019-07-26 05:21:17'),
(50, '1564118499.PNG', '2019-07-26 05:21:39', '2019-07-26 05:21:39'),
(51, '1564475069.svg', '2019-07-30 08:27:40', '2019-07-30 08:27:40'),
(52, '1564475075.png', '2019-07-30 08:27:40', '2019-07-30 08:27:40'),
(53, '1564475077.png', '2019-07-30 08:27:40', '2019-07-30 08:27:40'),
(54, '1564497845.png', '2019-07-30 14:44:55', '2019-07-30 14:44:55'),
(55, '1564497850.JPEG', '2019-07-30 14:44:55', '2019-07-30 14:44:55'),
(56, '1564497852.PNG', '2019-07-30 14:44:55', '2019-07-30 14:44:55'),
(57, '1564497857.JPEG', '2019-07-30 14:44:55', '2019-07-30 14:44:55'),
(58, '1564497860.JPEG', '2019-07-30 14:44:55', '2019-07-30 14:44:55'),
(59, '1564497870.jpg', '2019-07-30 14:44:55', '2019-07-30 14:44:55'),
(60, '1564555911.png', '2019-07-31 06:48:51', '2019-07-31 06:48:51'),
(61, '1564555914.jpg', '2019-07-31 06:48:51', '2019-07-31 06:48:51'),
(62, '1564557994.png', '2019-07-31 07:23:33', '2019-07-31 07:23:33'),
(63, '1564558046.png', '2019-07-31 07:24:24', '2019-07-31 07:24:24'),
(64, '1564563519.PNG', '2019-07-31 08:55:43', '2019-07-31 08:55:43'),
(65, '1564563521.jpg', '2019-07-31 08:55:43', '2019-07-31 08:55:43'),
(66, '1564563555.png', '2019-07-31 08:56:15', '2019-07-31 08:56:15'),
(67, '1564563556.jpg', '2019-07-31 08:56:15', '2019-07-31 08:56:15'),
(68, '1564563617.jpg', '2019-07-31 08:57:15', '2019-07-31 08:57:15'),
(69, '1564563632.jpg', '2019-07-31 08:57:30', '2019-07-31 08:57:30'),
(70, '1564563776.png', '2019-07-31 08:59:58', '2019-07-31 08:59:58'),
(71, '1564564178.png', '2019-07-31 09:06:33', '2019-07-31 09:06:33'),
(72, '1564564630.png', '2019-07-31 09:14:09', '2019-07-31 09:14:09'),
(73, '1564564632.jpg', '2019-07-31 09:14:09', '2019-07-31 09:14:09'),
(74, '1564564663.PNG', '2019-07-31 09:14:44', '2019-07-31 09:14:44'),
(75, '1564564666.jpg', '2019-07-31 09:14:44', '2019-07-31 09:14:44'),
(76, '1564564750.jpg', '2019-07-31 09:16:07', '2019-07-31 09:16:07'),
(77, '1564564976.png', '2019-07-31 09:19:52', '2019-07-31 09:19:52'),
(78, '1564566645.png', '2019-07-31 09:47:46', '2019-07-31 09:47:46'),
(79, '1564567621.png', '2019-07-31 10:03:58', '2019-07-31 10:03:58'),
(80, '1564567698.jpg', '2019-07-31 10:05:15', '2019-07-31 10:05:15'),
(81, '1564567825.jpg', '2019-07-31 10:07:23', '2019-07-31 10:07:23'),
(82, '1564568776.png', '2019-07-31 10:23:12', '2019-07-31 10:23:12'),
(83, '1564568789.jpg', '2019-07-31 10:23:24', '2019-07-31 10:23:24'),
(84, '1564568805.jpg', '2019-07-31 10:23:44', '2019-07-31 10:23:44'),
(85, '1564568745.jpg', '2019-07-31 10:26:29', '2019-07-31 10:26:29'),
(86, '1564568747.png', '2019-07-31 10:26:29', '2019-07-31 10:26:29'),
(87, '1564579274.jpg', '2019-07-31 13:18:08', '2019-07-31 13:18:08'),
(88, '1564579333.jpg', '2019-07-31 13:19:13', '2019-07-31 13:19:13'),
(89, '1564629540.png', '2019-08-01 03:15:54', '2019-08-01 03:15:54'),
(90, '1564630079.png', '2019-08-01 03:25:05', '2019-08-01 03:25:05'),
(91, '1564630079.jpg', '2019-08-01 03:25:05', '2019-08-01 03:25:05'),
(92, '1564630127.png', '2019-08-01 03:28:56', '2019-08-01 03:28:56'),
(93, '1564630919.png', '2019-08-01 03:42:09', '2019-08-01 03:42:09'),
(94, '1564630919.png', '2019-08-01 03:42:52', '2019-08-01 03:42:52'),
(95, '1564630966.png', '2019-08-01 03:42:52', '2019-08-01 03:42:52'),
(96, '1564630968.jpg', '2019-08-01 03:42:52', '2019-08-01 03:42:52'),
(97, '1564631005.png', '2019-08-01 03:43:39', '2019-08-01 03:43:39'),
(98, '1564631009.jpg', '2019-08-01 03:43:39', '2019-08-01 03:43:39'),
(99, '1564631014.png', '2019-08-01 03:43:39', '2019-08-01 03:43:39'),
(100, '1564631098.png', '2019-08-01 03:45:08', '2019-08-01 03:45:08'),
(101, '1564631104.jpg', '2019-08-01 03:45:08', '2019-08-01 03:45:08'),
(102, '1564631310.jpg', '2019-08-01 03:48:39', '2019-08-01 03:48:39'),
(103, '1564631312.jpg', '2019-08-01 03:48:39', '2019-08-01 03:48:39'),
(104, '1564631436.png', '2019-08-01 03:50:39', '2019-08-01 03:50:39'),
(105, '1564985479.png', '2019-08-05 06:11:28', '2019-08-05 06:11:28'),
(106, '1564989414.png', '2019-08-05 07:16:54', '2019-08-05 07:16:54'),
(107, '1564990040.png', '2019-08-05 07:27:20', '2019-08-05 07:27:20'),
(108, '1564990347.png', '2019-08-05 07:32:27', '2019-08-05 07:32:27'),
(109, '1564993990.jpg', '2019-08-05 08:35:32', '2019-08-05 08:35:32'),
(110, '1564993994.PNG', '2019-08-05 08:35:32', '2019-08-05 08:35:32'),
(111, '1564994012.png', '2019-08-05 08:35:32', '2019-08-05 08:35:32'),
(112, '1564997017.png', '2019-08-05 09:23:42', '2019-08-05 09:23:42'),
(113, '1565013800.png', '2019-08-05 14:03:23', '2019-08-05 14:03:23'),
(114, '1565021935.png', '2019-08-05 16:18:58', '2019-08-05 16:18:58'),
(115, '1565348363.png,', '2019-08-09 10:59:46', '2019-08-09 10:59:46'),
(116, '1565351302.png', '2019-08-09 11:48:29', '2019-08-09 11:48:29'),
(117, '1565351305.jpg', '2019-08-09 11:48:29', '2019-08-09 11:48:29'),
(118, '1565351302.png', '2019-08-09 11:51:07', '2019-08-09 11:51:07'),
(119, '1565351305.jpg', '2019-08-09 11:51:07', '2019-08-09 11:51:07'),
(120, '1565351897.png', '2019-08-09 11:58:23', '2019-08-09 11:58:23'),
(121, '1565351897.png', '2019-08-09 12:00:05', '2019-08-09 12:00:05'),
(122, '1565352002.png', '2019-08-09 12:00:05', '2019-08-09 12:00:05'),
(123, '1565351897.png', '2019-08-09 12:00:46', '2019-08-09 12:00:46'),
(124, '1565352002.png', '2019-08-09 12:00:46', '2019-08-09 12:00:46'),
(125, '1565352041.png', '2019-08-09 12:00:46', '2019-08-09 12:00:46'),
(126, '1565362765.png', '2019-08-09 14:59:27', '2019-08-09 14:59:27'),
(127, '1565362821.png', '2019-08-09 15:00:50', '2019-08-09 15:00:50'),
(128, '1565362821.png', '2019-08-09 15:01:22', '2019-08-09 15:01:22'),
(129, '1565362874.PNG', '2019-08-09 15:01:22', '2019-08-09 15:01:22'),
(130, '1565362876.png', '2019-08-09 15:01:22', '2019-08-09 15:01:22'),
(131, '1565362879.jpg', '2019-08-09 15:01:22', '2019-08-09 15:01:22'),
(132, '1565362821.png', '2019-08-09 15:05:34', '2019-08-09 15:05:34'),
(133, '1565362874.PNG', '2019-08-09 15:05:34', '2019-08-09 15:05:34'),
(134, '1565362876.png', '2019-08-09 15:05:34', '2019-08-09 15:05:34'),
(135, '1565362879.jpg', '2019-08-09 15:05:34', '2019-08-09 15:05:34'),
(136, '1565363132.png', '2019-08-09 15:05:34', '2019-08-09 15:05:34'),
(137, '1565363188.png', '2019-08-09 15:06:31', '2019-08-09 15:06:31'),
(138, '1565363224.png', '2019-08-09 15:07:07', '2019-08-09 15:07:07'),
(139, '1565363369.png', '2019-08-09 15:09:31', '2019-08-09 15:09:31'),
(140, '1566228091.png', '2019-08-19 15:21:39', '2019-08-19 15:21:39'),
(141, '1566228197.jpg', '2019-08-19 15:23:34', '2019-08-19 15:23:34'),
(142, '1566228201.png', '2019-08-19 15:23:34', '2019-08-19 15:23:34'),
(143, '1566229016.png', '2019-08-19 15:37:33', '2019-08-19 15:37:33'),
(144, '1566229020.png', '2019-08-19 15:37:33', '2019-08-19 15:37:33'),
(145, '1566229112.png', '2019-08-19 15:40:09', '2019-08-19 15:40:09'),
(146, '1566229326.png', '2019-08-19 15:42:06', '2019-08-19 15:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `chief_complaints`
--

CREATE TABLE `chief_complaints` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `owner` int(10) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `display_order` int(10) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chief_complaints`
--

INSERT INTO `chief_complaints` (`id`, `name`, `owner`, `description`, `display_order`, `status`, `updated_datetime`, `created_datetime`) VALUES
(1, 'Acne', 74, NULL, 1, 0, '2019-07-21 18:49:38', '2019-06-16 17:00:00'),
(2, 'Rash', 1, NULL, 2, 1, '2019-07-22 06:18:01', '2019-06-16 17:00:00'),
(3, 'Mole', 1, '', 2, 1, '2019-07-13 11:01:59', '2019-06-16 17:00:00'),
(4, 'Dry Skin', 1, '', 2, 1, '2019-07-13 11:04:26', '2019-06-16 17:00:00'),
(5, 'Wart', 1, '', 5, 1, '2019-06-17 00:35:49', '2019-06-16 17:00:00'),
(6, 'Psoriasis', 1, '', 6, 1, '2019-06-17 00:35:49', '2019-06-16 17:00:00'),
(7, 'Growth', 1, '', 7, 1, '2019-06-17 00:35:49', '2019-06-16 17:00:00'),
(8, 'Cold Sore', 1, '', 8, 1, '2019-06-17 00:38:21', '2019-06-16 17:00:00'),
(9, 'Eczema', 1, '', 9, 1, '2019-06-17 00:38:25', '2019-06-16 17:00:00'),
(10, 'Blister', 1, '', 10, 1, '2019-06-17 00:38:28', '2019-06-16 17:00:00'),
(11, 'Cosmetic Issue', 1, '', 11, 1, '2019-06-17 00:38:28', '2019-06-16 17:00:00'),
(12, 'Follow-up', 1, '', 12, 1, '2019-06-17 00:38:28', '2019-06-16 17:00:00'),
(13, 'Wound-check', 1, '', 13, 1, '2019-06-17 00:38:28', '2019-06-16 17:00:00'),
(14, 'Surgery-consult', 1, '', NULL, 1, '2019-07-13 11:05:18', '2019-06-16 17:00:00'),
(15, 'Research-study', 1, '', NULL, 1, '2019-07-13 11:05:21', '2019-06-16 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `derm_address`
--

CREATE TABLE `derm_address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'We will store Practitioner user_id here',
  `is_primary_address` int(11) NOT NULL DEFAULT 0,
  `practice_name` varchar(100) DEFAULT NULL COMMENT 'This is for Hospital Name',
  `street1` varchar(100) DEFAULT NULL,
  `street2` varchar(100) DEFAULT NULL,
  `street3` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` int(11) NOT NULL COMMENT 'This is STATE and this is required',
  `status` tinyint(3) UNSIGNED NOT NULL,
  `postal_code` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `derm_address`
--

INSERT INTO `derm_address` (`id`, `user_id`, `is_primary_address`, `practice_name`, `street1`, `street2`, `street3`, `city`, `state`, `status`, `postal_code`, `updated_at`, `created_at`) VALUES
(2, 66, 0, 'Parekh Hospital', 'Ahmedabad', 'Ahmedabad', 'Ahmedabad', 'Gujarat', 1, 0, '38007', '2019-07-06 17:19:15', '2019-07-06 17:19:15'),
(45, 66, 1, 'Deva Clinic', 'Vejalpur', 'SG Highway', 'Ahmedavbad', 'Ahmedavbad', 2, 1, '38007', '2019-07-08 05:39:18', '2019-07-08 05:39:18'),
(52, 67, 0, 'Parekh Hospital 1', 'Ahmedabad', NULL, NULL, NULL, 1, 1, NULL, '2019-07-08 05:44:09', '2019-07-08 05:44:09'),
(53, 2, 0, 'asdasd', 'Ahmedabad', NULL, NULL, NULL, 2, 1, NULL, '2019-07-08 14:54:21', '2019-07-08 14:54:21'),
(54, 2, 0, 'Parekh Hospital 2', 'Ahmedabad', NULL, NULL, NULL, 1, 1, NULL, '2019-07-08 14:54:36', '2019-07-08 14:54:36'),
(55, 74, 0, 'Parekh Hospital 2234234\r\n', 'Ahmedabad', NULL, NULL, NULL, 1, 1, NULL, '2019-07-08 14:54:36', '2019-07-08 14:54:36'),
(56, 75, 0, 'Parekh Hospital 2234234\r\n', 'Ahmedabad', NULL, NULL, NULL, 1, 1, NULL, '2019-07-08 14:54:36', '2019-07-08 14:54:36'),
(57, 76, 0, 'Parekh Hospital 2234234234234\r\n', 'Ahmedabad', NULL, NULL, NULL, 1, 1, NULL, '2019-07-08 14:54:36', '2019-07-08 14:54:36');

-- --------------------------------------------------------

--
-- Table structure for table `describe_problems`
--

CREATE TABLE `describe_problems` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `describe_problems`
--

INSERT INTO `describe_problems` (`id`, `name`, `updated_at`, `created_at`) VALUES
(1, 'Very Itchy', '2019-07-16 14:29:03', '2019-07-16 14:29:03'),
(2, 'Mildly Itchy', '2019-07-16 14:29:03', '2019-07-16 14:29:03'),
(3, 'Not Itchy', '2019-07-16 14:29:03', '2019-07-16 14:29:03'),
(4, 'Bleeding', '2019-07-16 14:29:03', '2019-07-16 14:29:03'),
(5, 'Painful', '2019-07-16 14:29:03', '2019-07-16 14:29:03'),
(6, 'Red', '2019-07-16 14:29:03', '2019-07-16 14:29:03'),
(7, 'Burning', '2019-07-16 14:29:03', '2019-07-16 14:29:03'),
(8, 'No symptoms', '2019-07-16 14:29:03', '2019-07-16 14:29:03');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('Percentage','Amount','','') NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE `email_template` (
  `id` int(11) NOT NULL,
  `email_type` enum('Forgot Email','Register Email','CareGiver: Submit New Case','Resolved Case','Reject Case','Practitioner: Submit New Case') NOT NULL,
  `content` text NOT NULL,
  `parameter` text NOT NULL,
  `status` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`id`, `email_type`, `content`, `parameter`, `status`, `updated_at`, `created_at`) VALUES
(1, 'Register Email', 'Dear {{name}} \n\nThank you for register !!\n\nBelow are your login details\n\nEmail: {{email}}\n\nUsername: {{username}}\n\nPassword: {{password}}\n\n\n \nPlease logon to SkinMDNow.com  and complete this consult as soon as possible.\n\n\n\nThanks,\n\nSkinMDNow', '[{\"keys\":\"First Name, Last Name\",\"values\":\"{{name}}\"},{\"keys\": \"Email\",\"values\":\"{{email}}\"},{\"keys\": \"Username\",\"values\":\"{{username}}\"},{\"keys\": \"Password\",\"values\":\"{{password}}\"}]', 1, '2019-08-09 17:55:35', '2019-08-09 17:55:35'),
(2, 'Forgot Email', '<b>Dear  {{name}} </b>\n\nWe have reset your password\n\n<b>Email: </b>{{email}}\n\n<b>Username: </b>{{username}}\n\n<b>Password:</b> {{password}}\n\n\n \nPlease logon to SkinMDNow.com  and complete this consult as soon as possible.\n\n\n\nThanks,\n\nSkinMDNow', '[{\"keys\":\"First Name, Last Name\",\"values\":\"{{name}}\"},{\"keys\": \"Email\",\"values\":\"{{email}}\"},{\"keys\": \"Username\",\"values\":\"{{username}}\"},{\"keys\": \"Password\",\"values\":\"{{password}}\"}]', 1, '2019-08-09 17:55:35', '2019-08-09 17:55:35'),
(3, 'CareGiver: Submit New Case', 'Your information has been sent to Dr. {{name}}\n\nWhen the doctor has finished reviewing your case, you will receive an email at -  {{email}}\n\nYou can then see the doctor\'s recommendations in the\"Old Request\" section of the app or the website, and pick-up any prescriptions at the pharmacy entered by you.\n\nIf you have any other useful photos, you can upload them through the \"Old Request\" section on the App or on the website - SkinMDnow.com\n\n \nPlease contact us at info@SkinMDnow.com if you have any questions. \n \nThank you, and we look forward to helping you,\nSkin MD Now Team\ninfo@SkinMDnow.com', '[{\"keys\":\"Doctor Name\",\"values\":\"{{name}}\"},{\"keys\": \"CareGiver Email\",\"values\":\"{{email}}\"}]', 1, '2019-08-09 17:55:35', '2019-08-09 17:55:35'),
(4, 'Resolved Case', 'Dr.  {{doctor}} has completed your case # -  {{case_number}} for patient  {{patient}}\n, with DOB - {{patient_dob}}.\n\nPlease go to - SkinMDnow.com or your SkinMDnow app to view this completed case.\n\n \n\nThanks,\n\n\nSkin MD Now Team\n\ninfo@skinmdnow.com', '[{\"keys\":\"Doctor Name\",\"values\": \"{{doctor}}\" }, {\"keys\": \"Case Number\",\"values\":\"{{case_number}}\"},{\"keys\": \"Patient Name\",\"values\":\"{{patient}}\"},{\"keys\": \"Patient DOB\",\"values\":\"{{patient_dob}}\"}]', 1, '2019-08-09 17:55:35', '2019-08-09 17:55:35'),
(5, 'Reject Case', 'Dr.  {{doctor}} has completed your case # -  {{case_number}} for patient  {{patient}}\n, with DOB - {{patient_dob}}.\n\nPlease go to - SkinMDnow.com or your SkinMDnow app to view this completed case.\n\n \n\nThanks,\n\n\nSkin MD Now Team\n\ninfo@skinmdnow.com', '[{\"keys\":\"Doctor Name\",\"values\": \"{{doctor}}\" }, {\"keys\": \"Case Number\",\"values\":\"{{case_number}}\"},{\"keys\": \"Patient Name\",\"values\":\"{{patient}}\"},{\"keys\": \"Patient DOB\",\"values\":\"{{patient_dob}}\"}]', 1, '2019-08-09 17:55:35', '2019-08-09 17:55:35'),
(6, 'Practitioner: Submit New Case', 'Dear Dr. {{doctor_name}}\n\nConsult # - {{case_number}}\nSubmitted - {{created_at}}\n \nPlease logon to SkinMDNow.com  and complete this consult as soon as possible.\n \n \nThanks,\n\nSkin MD Now Team\ninfo@skinmdnow.com', '[{\"keys\":\"Case Number\",\"values\": \"{{case_number}}\" }, {\"keys\": \"Doctor Name\",\"values\":\"{{doctor_name}}\"},{\"keys\": \"Case Created Date\",\"values\":\"{{created_at}}\"}]', 1, '2019-08-09 17:55:35', '2019-08-09 17:55:35');

-- --------------------------------------------------------

--
-- Table structure for table `family_medical_history`
--

CREATE TABLE `family_medical_history` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `family_medical_history`
--

INSERT INTO `family_medical_history` (`id`, `name`, `updated_at`, `created_at`) VALUES
(1990, 'There is no Family Medical History', '2019-07-25 14:17:31', '2019-07-25 14:17:31'),
(1991, 'new Fem drug', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(1992, 'new Fem drug1', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(1993, 'new Fem drug2', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(1994, 'asdasd', '2019-07-31 10:26:59', '2019-07-31 10:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('patient@mailinator.com', '$2y$10$YJToZstF78vypIQftsOnTuzbVqh2/5mSckkRdJxp6ED90YMVZtNHi', '2019-06-17 06:44:38'),
('testuser@mailinator.com', '$2y$10$54NV5/0MVH.jp1sDR.nDhub7/EaIreA5aXeBTYSF4J8u7l1MWVU5W', '2019-06-17 06:59:40'),
('anilmsaini@mailinator.com', '$2y$10$cdmKEM4EUP7qPeqtvblw5uiFz.3yS9fDYlcItyNlPo/7XPbQZsF1K', '2019-06-28 01:09:42'),
('testuaser@mailinator.com', '$2y$10$NHnHcKhpbLUXsVthFYrEKeRi575nMH9ySS33RptRkBjWZWnlUq.8S', '2019-06-28 23:13:12'),
('carter@mailinator.com', '$2y$10$2PjyQKR9hHR8Jjg7Kx2MYOgROy8nDLTiiVvRmyy3PCWSW4NFR1nV.', '2019-06-28 23:35:43'),
('anilsaini@mailinator.com', '$2y$10$V3IVu7YVO4HFqE6z1lpS9uVA5ogUNgmt/KVWx73f5ICxfS72TsOxu', '2019-07-26 04:30:46'),
('brendan@mailinator.com', '$2y$10$fPZzKr/cN66W91F5WMrXoObOL8GUlv2eqXVKFLgdLX.duzlZlkH1O', '2019-07-26 05:27:20'),
('brendan1@mailinator.com', '$2y$10$9ZWozI2OuZBlk5VQQpwmTu7zUgBlg2fh.mNLAek8PIrQLzewDaNmm', '2019-07-26 05:56:52');

-- --------------------------------------------------------

--
-- Table structure for table `patient_caregiver_relation`
--

CREATE TABLE `patient_caregiver_relation` (
  `id` int(11) NOT NULL,
  `relation_name` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_caregiver_relation`
--

INSERT INTO `patient_caregiver_relation` (`id`, `relation_name`, `updated_at`, `created_at`) VALUES
(1, 'Self', '2019-07-04 23:40:47', '2019-07-04 23:40:47'),
(2, 'Mother', '2019-07-04 23:40:47', '2019-07-04 23:40:47'),
(3, 'Father', '2019-07-04 23:40:47', '2019-07-04 23:40:47'),
(4, 'Spouse', '2019-07-04 23:40:47', '2019-07-04 23:40:47'),
(5, 'Healthcare Professional', '2019-07-04 23:40:47', '2019-07-04 23:40:47'),
(6, 'Other', '2019-07-04 23:40:47', '2019-07-04 23:40:47');

-- --------------------------------------------------------

--
-- Table structure for table `patient_current_medication`
--

CREATE TABLE `patient_current_medication` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_current_medication`
--

INSERT INTO `patient_current_medication` (`id`, `name`, `updated_at`, `created_at`) VALUES
(2858, 'There is no Current medical historuuuu', '2019-07-25 14:17:31', '2019-07-25 14:17:31'),
(2859, 'new Cur drug', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(2860, 'new Cur drug1', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(2861, 'new Cur drug2', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(2862, 'asdasd', '2019-07-31 10:26:59', '2019-07-31 10:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `patient_details`
--

CREATE TABLE `patient_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `caregiver_id` int(10) UNSIGNED NOT NULL COMMENT 'This is a caregiver_id',
  `relation_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` int(10) UNSIGNED NOT NULL COMMENT '0- Male, 1- Female',
  `dob` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `patient_pharmacy_id` varchar(200) DEFAULT NULL,
  `patient_current_medication_id` varchar(200) DEFAULT NULL,
  `patient_drug_allergies_id` varchar(200) DEFAULT NULL,
  `family_medical_history_id` varchar(200) DEFAULT NULL,
  `patient_medical_history_id` varchar(200) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_details`
--

INSERT INTO `patient_details` (`id`, `caregiver_id`, `relation_id`, `first_name`, `middle_name`, `last_name`, `gender`, `dob`, `email`, `phone`, `patient_pharmacy_id`, `patient_current_medication_id`, `patient_drug_allergies_id`, `family_medical_history_id`, `patient_medical_history_id`, `updated_at`, `created_at`) VALUES
(71, 67, 1, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 'brendan1@mailinator.com', '9825098250', '59,71,71,71,71,71,71,71,71,71,71,71,71,71,71,71', '2858,2862,2858,2862,2858,2862,2858,2862,2858,2862,2858,2862,2858,2862,2858,2862,2858,2862,2858,2862,2858,2862,2858,2862,2858,2862', '1946,1950,1951,1946,1950,1951,1946,1950,1951,1946,1950,1951,1946,1950,1951,1946,1950,1951,1946,1950,1951,1946,1950,1951,1946,1950,1951,1946,1950,1951,1946,1950,1951,1946,1950,1951,1946,1950,1951', '1990,1994,1990,1994,1990,1994,1990,1994,1990,1994,1990,1994,1990,1994,1990,1994,1990,1994,1990,1994,1990,1994,1990,1994,1990,1994', '1997,2001,2002,1997,2001,2002,1997,2001,2002,1997,2001,2002,1997,2001,2002,1997,2001,2002,1997,2001,2002,1997,2001,2002,1997,2001,2002,1997,2001,2002,1997,2001,2002,1997,2001,2002,1997,2001,2002', '2019-07-25 14:16:01', '2019-07-25 14:16:01'),
(72, 67, 2, 'New', 'P', 'Patioent', 1, '2001-07-09', 'mother@mailinator.com', '1568779879', '60', '2859,2860,2861', '1947,1948,1949', '1991,1992,1993', '1998,1999,2000', '2019-07-30 08:27:40', '2019-07-30 08:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `patient_drug_allergies`
--

CREATE TABLE `patient_drug_allergies` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_drug_allergies`
--

INSERT INTO `patient_drug_allergies` (`id`, `name`, `updated_at`, `created_at`) VALUES
(1946, 'No Drug Allergies', '2019-07-25 14:17:31', '2019-07-25 14:17:31'),
(1947, 'new drug', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(1948, 'new drug1', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(1949, 'new drug2', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(1950, '2222', '2019-07-31 10:26:59', '2019-07-31 10:26:59'),
(1951, 'asdasdsd', '2019-07-31 10:26:59', '2019-07-31 10:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `patient_medical_history`
--

CREATE TABLE `patient_medical_history` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_medical_history`
--

INSERT INTO `patient_medical_history` (`id`, `name`, `updated_at`, `created_at`) VALUES
(1997, 'There is no Medical History', '2019-07-25 14:17:31', '2019-07-25 14:17:31'),
(1998, 'new med drug', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(1999, 'new med drug1', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(2000, 'new med drug2', '2019-07-30 08:28:49', '2019-07-30 08:28:49'),
(2001, '2222234234', '2019-07-31 10:26:59', '2019-07-31 10:26:59'),
(2002, 'asdasd', '2019-07-31 10:26:59', '2019-07-31 10:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `id` int(10) UNSIGNED NOT NULL,
  `pharmacy_name` varchar(30) NOT NULL,
  `pharmacy_fax` varchar(30) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`id`, `pharmacy_name`, `pharmacy_fax`, `description`, `status`, `updated_datetime`, `created_datetime`) VALUES
(1, 'New pharmacy 123', '1234567890', 'New pharmacy New pharmacy\nasdasdasd', 0, '2019-06-21 11:25:34', '2019-06-20 18:30:00'),
(13, 'new pharmacy', '1131322132', 'sdfsfsdf', 1, '2019-09-10 15:21:45', '2019-07-18 11:10:46'),
(14, 'new pharmacy', '1131322132', NULL, 1, '2019-07-18 11:42:21', '2019-07-18 11:42:21'),
(15, 'new pharmacy', '1131322132', NULL, 1, '2019-07-18 11:42:56', '2019-07-18 11:42:56'),
(16, 'new pharmacy', '1131322132', NULL, 1, '2019-07-18 12:00:22', '2019-07-18 12:00:22'),
(17, 'new pharmacy', '1131322132', NULL, 1, '2019-07-18 12:01:11', '2019-07-18 12:01:11'),
(18, 'new pharmacy', '1131322132', NULL, 1, '2019-07-18 12:04:31', '2019-07-18 12:04:31'),
(19, 'new pharmacy', '1131322132', NULL, 1, '2019-07-18 12:04:40', '2019-07-18 12:04:40'),
(20, 'new pharmacy', '1131322132', NULL, 1, '2019-07-18 12:05:22', '2019-07-18 12:05:22'),
(21, 'sdfsdf', '2344444444', NULL, 1, '2019-07-18 12:07:36', '2019-07-18 12:07:36'),
(22, 'werwerrwe', '3452423423', NULL, 1, '2019-07-18 13:24:19', '2019-07-18 13:24:19'),
(23, 'dfgdfg', '2344444444', NULL, 1, '2019-07-18 15:12:51', '2019-07-18 15:12:51'),
(24, 'dfgdfg', '2344444444', NULL, 1, '2019-07-18 15:17:32', '2019-07-18 15:17:32'),
(25, 'dfgdfg', '2344444444', NULL, 1, '2019-07-18 15:18:23', '2019-07-18 15:18:23'),
(26, 'dfgdfg', '2344444444', NULL, 1, '2019-07-18 15:21:14', '2019-07-18 15:21:14'),
(27, 'dfgdfg', '2344444444', NULL, 1, '2019-07-18 15:22:04', '2019-07-18 15:22:04'),
(28, 'dfgdfg', '2344444444', NULL, 1, '2019-07-18 15:22:41', '2019-07-18 15:22:41'),
(29, 'dfgdfg', '2344444444', NULL, 1, '2019-07-18 15:23:21', '2019-07-18 15:23:21'),
(30, 'sdfsd', '2333333333', NULL, 1, '2019-07-19 06:15:29', '2019-07-19 06:15:29'),
(31, 'sdfsd', '2333333333', NULL, 1, '2019-07-19 06:27:09', '2019-07-19 06:27:09'),
(32, 'Pharmacy one', '8888888888', NULL, 1, '2019-07-19 06:45:57', '2019-07-19 06:45:57'),
(33, '32019 New Pharmacy', '8546546656', NULL, 1, '2019-07-19 06:52:21', '2019-07-19 06:52:21'),
(34, '32019 New Pharmacy', '8546546656', NULL, 1, '2019-07-19 06:58:56', '2019-07-19 06:58:56'),
(35, '32019 New Pharmacy', '8546546656', NULL, 1, '2019-07-19 06:59:40', '2019-07-19 06:59:40'),
(36, '32019 New Pharmacy', '8546546656', NULL, 1, '2019-07-19 07:04:20', '2019-07-19 07:04:20'),
(37, '32019 New Pharmacy', '8546546656', NULL, 1, '2019-07-19 07:04:50', '2019-07-19 07:04:50'),
(38, '32019 New Pharmacy', '8546546656', NULL, 1, '2019-07-19 07:05:05', '2019-07-19 07:05:05'),
(39, '32019 New Pharmacy', '8546546656', NULL, 1, '2019-07-19 07:05:24', '2019-07-19 07:05:24'),
(40, '32019 New Pharmacy', '8546546656', NULL, 1, '2019-07-19 07:05:42', '2019-07-19 07:05:42'),
(41, '32019 New Pharmacy', '8546546656', NULL, 1, '2019-07-19 07:06:02', '2019-07-19 07:06:02'),
(42, '32019 New Pharmacy', '8546546656', NULL, 1, '2019-07-19 07:08:44', '2019-07-19 07:08:44'),
(43, 'asdas', '1222222222', NULL, 1, '2019-07-19 09:46:27', '2019-07-19 09:46:27'),
(44, 'sdfsdfsdfsdf', '2344444444', NULL, 1, '2019-07-19 11:22:44', '2019-07-19 11:22:44'),
(45, '234', '2333333333', NULL, 1, '2019-07-19 11:37:04', '2019-07-19 11:37:04'),
(46, '234', '2333333333', NULL, 1, '2019-07-19 11:38:57', '2019-07-19 11:38:57'),
(47, '234234234', '2342342342', NULL, 1, '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(48, '34444444444', '4444444444', NULL, 1, '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(49, '34444444444', '4444444444', NULL, 1, '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(50, '34444444444', '4444444444', NULL, 1, '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(51, '34444444444', '4444444444', NULL, 1, '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(52, '34444444444', '4444444444', NULL, 1, '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(53, '34444444444', '4444444444', NULL, 1, '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(54, 'ewerwe', '2344444444', NULL, 1, '2019-07-19 13:27:10', '2019-07-19 13:27:10'),
(55, 'asdasd', '2341231231', NULL, 1, '2019-07-23 05:21:42', '2019-07-23 05:21:42'),
(56, '1212', '1231231231', NULL, 1, '2019-07-23 12:12:47', '2019-07-23 12:12:47'),
(57, 'New Pharmacy', '4444444444', NULL, 1, '2019-07-25 05:35:04', '2019-07-25 05:35:04'),
(58, 'New Pharmacy', '4444444444', NULL, 1, '2019-07-25 05:48:43', '2019-07-25 05:48:43'),
(59, 'Tech Pharmacy', '9825789755', NULL, 1, '2019-07-25 14:17:31', '2019-07-25 14:17:31'),
(60, 'new pharmacy', '4566666666', NULL, 1, '2019-07-30 08:28:49', '2019-07-30 08:28:49');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) UNSIGNED NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `medication` varchar(100) DEFAULT NULL,
  `frequency` varchar(30) DEFAULT NULL,
  `pharmacy` int(11) UNSIGNED DEFAULT NULL COMMENT 'We will be store here pharmacy ID',
  `quantity` varchar(30) DEFAULT NULL,
  `fax_pharmacy` varchar(30) DEFAULT NULL,
  `refills` varchar(30) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `case_id`, `medication`, `frequency`, `pharmacy`, `quantity`, `fax_pharmacy`, `refills`, `comments`, `status`, `updated_datetime`, `created_datetime`) VALUES
(36, 97, 'dfgdfg dfgdf gdf gdfgdfg', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-08-01 10:24:55', '2019-08-01 10:24:55'),
(38, 108, 'gggggggggggggggggggggggggggggggggggggggg', NULL, 71, NULL, NULL, NULL, NULL, 1, '2019-08-05 15:28:36', '2019-08-05 08:36:08'),
(39, 108, 'dfdfdfgggggggggggggggggggggggggggggggg', NULL, 71, NULL, NULL, NULL, NULL, 1, '2019-08-05 15:31:55', '2019-08-05 08:36:19'),
(41, 101, 'sssssssssssssss', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-08-05 14:06:24', '2019-08-05 14:06:24'),
(42, 101, 'ssssssssssssssssssssssssssssssssss', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-08-05 14:41:09', '2019-08-05 14:41:09'),
(43, 108, 'fgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgdgdfgdgfdfg', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-08-05 15:37:47', '2019-08-05 15:37:47'),
(44, 108, 'dsfffffffffffffffffffffsdfsdf', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-08-05 15:38:54', '2019-08-05 15:38:54'),
(45, 144, 'Apollo Prescription', NULL, 1, NULL, NULL, NULL, NULL, 1, '2019-08-19 14:10:46', '2019-08-19 14:10:46'),
(46, 144, 'Prescription 2', NULL, 13, NULL, NULL, NULL, NULL, 1, '2019-08-19 14:19:59', '2019-08-19 14:19:59'),
(47, 148, 'Testsdf sdf sdf sdf', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-08-19 15:45:03', '2019-08-19 15:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(100) NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL,
  `owner` int(10) UNSIGNED NOT NULL,
  `question_type` enum('Text Area','Multiple','Dropdown','') NOT NULL,
  `notes` text DEFAULT NULL,
  `notes_attachment` varchar(100) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `display_order`, `owner`, `question_type`, `notes`, `notes_attachment`, `status`, `updated_datetime`, `created_datetime`) VALUES
(1, 'Whats your name?', 1, 1, 'Text Area', '', '', 1, '2019-07-30 07:27:50', '2019-06-19 18:30:00'),
(2, 'Where is it 2?', 2, 1, 'Text Area', '', '', 1, '2019-06-20 05:45:04', '2019-06-19 18:30:00'),
(13, 'New Question Answer Template', 12, 66, 'Text Area', NULL, NULL, 1, '2019-07-22 09:19:16', '2019-07-22 09:19:16'),
(14, 'New Question Answer Template 234234', 1, 66, 'Multiple', NULL, NULL, 1, '2019-07-22 09:19:28', '2019-07-22 09:19:28'),
(15, 'Is the patient pregnant, trying to become pregnant, or nursing?', 1, 66, 'Dropdown', NULL, NULL, 1, '2019-07-22 09:19:28', '2019-07-22 09:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `question_answer_templates`
--

CREATE TABLE `question_answer_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(100) NOT NULL,
  `chief_complaints` int(10) UNSIGNED NOT NULL,
  `questions_list` varchar(200) DEFAULT NULL,
  `patient_gender` tinyint(1) UNSIGNED NOT NULL COMMENT '0- Male, 1- Female',
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Admin ID',
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_answer_templates`
--

INSERT INTO `question_answer_templates` (`id`, `question`, `chief_complaints`, `questions_list`, `patient_gender`, `created_by`, `status`, `updated_datetime`, `created_datetime`) VALUES
(3, 'pragnantsdfsdf', 1, '14,1,13,15,2', 1, 1, 0, '2019-06-17 00:46:50', '2019-06-17 01:40:07'),
(4, 'pragnant', 4, '15', 1, 1, 1, '2019-06-17 00:46:50', '2019-06-17 01:40:07'),
(5, 'Female Patient with Eczema5', 5, NULL, 1, 1, 1, '2019-06-17 00:46:50', '2019-06-17 01:40:07'),
(6, 'Question Template', 1, '14,1', 0, 1, 1, '2019-06-17 04:03:41', '2019-06-17 04:03:41'),
(7, 'New Question Answer Template', 5, NULL, 0, 1, 1, '2019-06-17 04:04:16', '2019-06-17 04:04:16'),
(8, 'Question Answer part2', 6, NULL, 0, 1, 1, '2019-06-17 04:05:45', '2019-06-17 04:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `question_choices`
--

CREATE TABLE `question_choices` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_answer` varchar(100) NOT NULL,
  `question_answer_id` int(10) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `notes_attachment` varchar(100) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_datetime` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_choices`
--

INSERT INTO `question_choices` (`id`, `question_answer`, `question_answer_id`, `notes`, `notes_attachment`, `status`, `updated_datetime`, `created_datetime`) VALUES
(7, 'New Question choice', 15, NULL, NULL, 1, '2019-08-06 08:40:50', '2019-06-21 06:46:23'),
(8, 'New second choice', 2, NULL, NULL, 1, '2019-08-06 08:31:13', '2019-06-21 06:46:55'),
(10, 'New Question choice 5', 2, NULL, NULL, 1, '2019-09-10 15:14:04', '2019-06-21 06:48:00'),
(13, 'teset 1234', 1, NULL, NULL, 1, '2019-08-06 08:12:23', '2019-07-22 05:30:10'),
(14, 'No', 2, NULL, NULL, 1, '2019-08-06 08:31:13', '2019-07-22 05:30:10'),
(15, 'Pregnant', 15, NULL, NULL, 1, '2019-08-06 08:40:42', '2019-07-22 05:30:10'),
(16, 'Trying to conceive', 12, NULL, NULL, 1, '2019-08-06 08:27:38', '2019-07-22 05:30:10'),
(17, 'Breast-feeding', 1, NULL, NULL, 1, '2019-08-06 08:12:23', '2019-07-22 05:30:10'),
(18, 'New question 123456', 2, NULL, NULL, 1, '2019-08-06 08:31:13', '2019-08-06 06:16:19'),
(19, 'zindec', 15, NULL, NULL, 1, '2019-09-10 15:12:39', '2019-09-10 15:12:39'),
(20, 'xcfg gfh fg', 13, NULL, NULL, 0, '2019-09-10 15:15:48', '2019-09-10 15:12:50'),
(21, 'Yesl;dfgk dfg dgdf', NULL, NULL, NULL, 0, '2019-09-10 15:15:41', '2019-09-10 15:13:08');

-- --------------------------------------------------------

--
-- Table structure for table `refferal_codes`
--

CREATE TABLE `refferal_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_name` varchar(200) NOT NULL,
  `referral_code` varchar(100) NOT NULL,
  `provider_id` int(10) UNSIGNED NOT NULL COMMENT 'Doctor  ID',
  `comments` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refferal_codes`
--

INSERT INTO `refferal_codes` (`id`, `org_name`, `referral_code`, `provider_id`, `comments`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Apollo 1', 'FLAT80', 66, '12asdfasd', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(2, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(3, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(4, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(5, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(6, 'Test Org', 'HGJHGJHG', 66, '12', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(7, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(8, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(9, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(10, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(11, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(12, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(13, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(14, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(15, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(16, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(17, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(18, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(19, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(20, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(21, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(22, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(23, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(24, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(25, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(26, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(27, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(28, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(29, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(30, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(31, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(32, 'Test Org', 'HGJHGJHG', 66, 'khkhkj', 1, 1, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(33, 'Test Org', 'GETFLAT30', 66, '%60.50%', 1, 0, '2019-08-07 06:58:09', '2019-08-07 06:58:09'),
(34, '12312312', '123123123', 66, '123', 1, 0, '2019-08-07 10:52:11', '2019-08-07 10:52:11'),
(35, 'Apolo2', 'FLAT20', 67, '20', 0, 0, '2019-08-07 11:51:35', '2019-08-07 11:51:35'),
(36, '2234234', 'asdasd', 67, '234', 1, 0, '2019-08-07 12:11:06', '2019-08-07 12:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `specilities`
--

CREATE TABLE `specilities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specilities`
--

INSERT INTO `specilities` (`id`, `name`, `updated_at`, `created_at`) VALUES
(1, 'General Dermatology', '2019-07-13 15:02:49', '2019-07-13 15:02:49'),
(2, 'Pediatric Dermatology', '2019-07-13 15:02:49', '2019-07-13 15:02:49'),
(3, 'Cosmetic Dermatology', '2019-07-13 15:02:49', '2019-07-13 15:02:49'),
(4, 'Mohs Surgery', '2019-07-13 15:02:49', '2019-07-13 15:02:49'),
(5, 'Dermatopathology', '2019-07-13 15:02:49', '2019-07-13 15:02:49'),
(6, 'Research Study', '2019-07-13 15:02:49', '2019-07-13 15:02:49'),
(7, 'Cutaneous Oncology', '2019-07-13 15:02:49', '2019-07-13 15:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `caregiver_id` int(11) UNSIGNED NOT NULL,
  `provider_id` int(11) UNSIGNED NOT NULL,
  `consult_cost` varchar(100) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `strCreditCardNumber` varchar(100) NOT NULL,
  `intCreditCardType` enum('Visa','Master Card','American Express','Discover') NOT NULL,
  `strPaymentDescription` varchar(100) NOT NULL,
  `strTransId` varchar(100) NOT NULL,
  `strAuthorizationCode` varchar(100) NOT NULL,
  `strBillingFirstName` varchar(100) NOT NULL,
  `strBillingLastName` varchar(100) NOT NULL,
  `strBillingAddress1` varchar(100) NOT NULL,
  `strBillingCity` varchar(100) NOT NULL,
  `strBillingState` int(11) UNSIGNED NOT NULL,
  `strBillingZipCode` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `case_id`, `caregiver_id`, `provider_id`, `consult_cost`, `payment_type`, `strCreditCardNumber`, `intCreditCardType`, `strPaymentDescription`, `strTransId`, `strAuthorizationCode`, `strBillingFirstName`, `strBillingLastName`, `strBillingAddress1`, `strBillingCity`, `strBillingState`, `strBillingZipCode`, `updated_at`, `created_at`) VALUES
(1, 141, 67, 66, '30', 'Authorized', 'XXXX0012', 'Master Card', 'Payment from Mobile', '40036616416', 'IDYRJW', 'asdadad', 'asdadadasdsd', 'asdad', 'asdfgsf', 14, '3243', '2019-08-17 19:50:56', '2019-08-17 19:50:56'),
(2, 142, 67, 66, '11', 'Authorized', 'XXXX0012', 'Visa', 'Payment from Mobile', '60126009960', '7S6EW4', 'Anil', 'Saini', 'USA', 'USA', 15, '321456', '2019-08-18 06:34:13', '2019-08-18 06:34:13'),
(3, 143, 67, 66, '11', 'Authorized', 'XXXX0012', 'Discover', 'Payment from Mobile', '60126010004', 'TBEBKU', 'Anil', 'Saini', 'USA1', 'USA', 12, '65987458', '2019-08-18 06:40:39', '2019-08-18 06:40:39'),
(4, 144, 67, 66, '11.86', 'Authorized', 'XXXX0012', 'Discover', 'Payment from Mobile', '60126010086', '3Z1B3U', 'Anil', 'Saini', 'USA Address', 'usa', 13, '98789', '2019-08-18 06:45:24', '2019-08-18 06:45:24'),
(5, 145, 67, 66, '11.86', 'Authorized', 'XXXX0012', 'Visa', 'Payment from Mobile', '40036713268', 'GBUUO7', '234', '234', '234', '234234', 2, '23424', '2019-08-19 14:34:36', '2019-08-19 14:34:36'),
(6, 146, 67, 66, '11.86', 'Authorized', 'XXXX0012', 'Visa', 'Payment from Mobile', '40036713385', 'JXUCVY', '234', '234', '234', '234234', 2, '23424', '2019-08-19 14:37:26', '2019-08-19 14:37:26'),
(7, 147, 67, 66, '30', 'Authorized', 'XXXX0012', 'Discover', 'Payment from Mobile', '40036716282', 'U2PTAK', '123', '123', '123', '123', 17, '123123', '2019-08-19 15:37:36', '2019-08-19 15:37:36'),
(8, 148, 67, 66, '30', 'Authorized', 'XXXX0012', 'Visa', 'Payment from Mobile', '40036716389', 'XQSR0W', '121321', '313', '13', '2132', 15, '321321', '2019-08-19 15:40:11', '2019-08-19 15:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `type_of_problem`
--

CREATE TABLE `type_of_problem` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_of_problem`
--

INSERT INTO `type_of_problem` (`id`, `name`, `updated_at`, `created_at`) VALUES
(1, 'Very Itchy', '2019-07-17 07:29:01', '2019-07-17 07:29:01'),
(2, 'Mildly Itchy', '2019-07-17 07:29:01', '2019-07-17 07:29:01'),
(3, 'Not Itchy', '2019-07-17 07:29:01', '2019-07-17 07:29:01'),
(4, 'Bleeding', '2019-07-17 07:29:01', '2019-07-17 07:29:01'),
(5, 'Painful', '2019-07-17 07:29:01', '2019-07-17 07:29:01'),
(6, 'Red', '2019-07-17 07:29:01', '2019-07-17 07:29:01'),
(7, 'Burning', '2019-07-17 07:29:01', '2019-07-17 07:29:01'),
(8, 'No symptoms', '2019-07-17 07:29:01', '2019-07-17 07:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(30) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `fname` varchar(30) NOT NULL,
  `mname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) NOT NULL,
  `gender` tinyint(1) UNSIGNED NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `health_care_professional` tinyint(1) UNSIGNED DEFAULT NULL,
  `new_consults` tinyint(1) UNSIGNED DEFAULT NULL,
  `speciality` varchar(50) DEFAULT NULL,
  `consult_fee` varchar(30) DEFAULT '0',
  `degrees` varchar(100) DEFAULT NULL,
  `npi` varchar(30) DEFAULT NULL,
  `user_image` varchar(100) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `access_mode` int(11) UNSIGNED DEFAULT NULL,
  `license_type` int(10) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `username`, `Title`, `fname`, `mname`, `lname`, `gender`, `dob`, `phone`, `email`, `password`, `remember_token`, `health_care_professional`, `new_consults`, `speciality`, `consult_fee`, `degrees`, `npi`, `user_image`, `status`, `access_mode`, `license_type`, `email_verified_at`, `verified`, `created_by`, `updated_at`, `created_at`) VALUES
(1, '1', 'admin', 'Mr.', 'Admin', 'SkinMD', 'Now', 0, '2019-06-11', '9825098250', 'anil.saini@techextensor.com', '$2y$10$s4NflmSv7D5m9jL7u.pLEOgbD88KO611ZX7jxfh9MVqbvCKIL0i1u', NULL, 0, 1, '1,2,4', '0', '', '', '', 1, 1, 0, NULL, 0, 1, '2019-07-28 06:44:00', '2019-06-07 06:09:08'),
(66, '2', 'brendan', 'Dr.', 'Brendan', '', 'Pillemer', 0, '1988-06-11', '9825098250', 'brendan@mailinator.com', '$2y$10$yAjukbP.rJ7pcidlNwtx/OOrIxEAy1hfRXcN7QwZenMB.uKxLUao2', 'YOlhpdaHU70e1tWjxewNCkqAuzhb4C3qN3xr0RIOVTzJNURu6SZuon6FNiFY', 0, 1, '1,3,5', '30', 'MD, PHD, FAAD', '1184850992', '1565190145.png', 1, 1, 0, NULL, 0, 1, '2019-08-10 11:37:55', '2019-06-07 06:09:08'),
(67, '3', 'brendan1', NULL, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', '9825098250', 'techextensor957@gmail.com', '$2y$10$7c40.Yh6efkSvbAdMLN0deriYdXDJ8riIL80qdRpjsBM51Ze2sCOm', 'kuGOcQW25JGlD0ieBf1Qhd6joutyMZkEoIkEjmF12hOL64AQOGVYwGn5g2QQ', 0, 1, '2,4,6', '30', 'MD, PHD, FAAD', '1184850992', '', 1, 1, 0, NULL, 1, 1, '2019-08-10 14:07:05', '2019-06-07 06:09:08'),
(73, '3', 'anilmsaini', NULL, 'Care giver', NULL, 'last bnaem', 0, '1997-07-17', '9825098250', 'brendsdfan@mailinator.com', '$2y$10$nVnXftmWi.XnddsFrm0tweYP1JlIWBXzgg4dqoz.J4lJBoG9gm3By', NULL, 0, NULL, '1,2,4', '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-07-23 12:05:09', '2019-07-08 03:34:28'),
(74, '2', 'sdfsdf', NULL, 'sdfsf', NULL, 'sdf', 0, '2000-07-06', NULL, 'nsdfsdfdsdfan@mailinator.com', '$2y$10$GvaZOtbmB14zv9cewYsJweNaEnvVAQvqydG9wkj5jszZFUb8iO8Ei', NULL, NULL, 1, '1,2,4', '0', NULL, NULL, '1562752376.png', 1, 1, 2, NULL, 0, 1, '2019-07-13 15:03:42', '2019-07-10 04:23:27'),
(75, '2', 'asdasdasdasd', 'asd', 'asd', NULL, 'asd', 0, '1996-07-03', NULL, 'brqweendan@mailinator.comq', '$2y$10$xHx6yspxlObfIxvyTHg3WeFBuxBPlfHCjS1dDn40h0vfPMaqhRGKC', NULL, NULL, 1, '1,2,4', '0', NULL, NULL, '1562752583.png', 1, 0, 2, NULL, 0, 1, '2019-07-13 15:03:44', '2019-07-10 04:26:28'),
(76, '2', 'asd74asdasd', NULL, 'Patient anilsaini', NULL, 'Pillemer5', 0, '1999-07-15', NULL, 'patiemnt@mailinator.com', '$2y$10$eyQWjlnKPkSla579F/98yOT1RU4nE.kVNm/R7vEOIEhz./WYHakl2', NULL, NULL, 1, '1,2,4', '0', NULL, NULL, '1562753530.png', 1, 2, 2, NULL, 0, 1, '2019-07-13 15:03:46', '2019-07-10 04:42:16'),
(77, '2', ';klk;l', NULL, 'k;k;l', NULL, 'k;k;lklk', 0, '1996-07-02', NULL, 'sdfsdf@sdfs.fsdf', '$2y$10$gs/eAI3RA3d7uJjPOPTXE.fFtKEdNH9zaqrLBHrqlyPtecKeE2QJi', NULL, NULL, 1, '3,5,4,7', '30', NULL, NULL, NULL, 1, 1, 1, NULL, 0, 1, '2019-07-21 11:43:13', '2019-07-21 09:59:30'),
(78, '3', '234234', NULL, 'sdfs', 'dfsdfsd', 'fsdfsdfsd', 1, '2019-07-16', '234234234234', '23423@fdgh.dfg', '$2y$10$FgnyxIMBKHYIYMpvZY22y.UiG8JJzn.qlumL3Y8Ss6L246/EwhoaO', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-07-26 01:29:37', '2019-07-26 01:29:37'),
(79, '3', '423423423', NULL, 'sdfsdf', 'sdfsdfsd', 'fsdfsdfsdf', 1, '0000-00-00', '2423423423', '4234234@wsefsdf.sdf', '$2y$10$TVIYpgaZoeOyZNX/1UODrea0/J2ZWM8INKi54vZd8C14XUEkMPjF.', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-07-26 01:58:54', '2019-07-26 01:58:54'),
(80, '3', 'anilmsaini124', NULL, 'ddd', 'ddd', 'dddd', 0, '1995-07-05', '9825098250', 'demoa@mailinator.com', '$2y$10$inkriRUK9Fwp/CWcSODo.uTLCknu6xGNDvyQvU5brj6pwF3CUKPc2', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-08-07 13:49:59', '2019-07-26 03:59:07'),
(81, '2', 'anilmsaini123', NULL, 'ddd', 'ddd', 'dddd', 0, '1995-07-05', '9825098250', '1231231@mailinator.com', '$2y$10$Ar1SFP3am/kHx0l0wz50OeZgqgSnesGzIVBeXiJZOgikJUz3DbZsa', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-08-07 13:39:48', '2019-07-26 04:02:52'),
(82, '3', 'anilmasini', NULL, 'Anil', 'M', 'Saini', 0, '1995-07-13', '123123123', 'anilmsaini1231@mailinator.com', '$2y$10$NKs9jzGGXETd7Hkv45SRaeSyJ4Yha8KGH/BJ/9RARodSpUxtgz57W', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-07-26 04:14:35', '2019-07-26 04:14:35'),
(83, '3', '1321321', NULL, 'asd', 'asdasda', 'sdasdas', 0, '1996-07-03', '9825098250', 'anilsaini@mailinator.com', '$2y$10$MvzXD1ggzmrk1dT6Gr/p4O9JAoC3.qhwbhHlJU6/Rq/lUByv/734u', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-07-26 04:18:18', '2019-07-26 04:17:54'),
(84, '3', 'anilmsaini123456', NULL, 'Anil', 'm', 'Saini', 0, '2001-08-07', '98798798798', 'anilmsaini@mailinator.com', '$2y$10$ShYew30Wv7NHmCzJrzzOVeYvDJETO0JfO8tYgri8NjFTHhoeeMGiG', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-08-07 08:26:19', '2019-08-07 08:26:03'),
(85, '3', '1234654654', NULL, 'fgfjh', 'gjhgh', 'jhgjhg', 0, '1999-08-04', '234234234234', '234@masdasd.asd', '$2y$10$ltBRjDe2/lvoJVeLQqnnZuJuuEymkcjQR532DWeUZ1HhVIyl6bVFW', NULL, 1, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-08-10 01:49:28', '2019-08-10 01:49:28'),
(86, '3', '1234654654a', NULL, 'fgfjh', 'gjhgh', 'jhgjhg', 0, '1999-08-04', '234234234234', '234@masdaaaasd.asd', '$2y$10$YYRS/a5.d1uIHacVgn2iIORQymET5LkfL7TLa979VOVhB8QzyPVHm', NULL, 1, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-08-10 01:51:13', '2019-08-10 01:51:13'),
(87, '3', 'patient1234', NULL, 'fgfjh', 'gjhgh', 'jhgjhg', 0, '1999-08-04', '234234234234', 'test12@mailinator.com', '$2y$10$DH9/3h9zYYGhTZPqTbxEZ.j.96l8Qf2fQjLiHj2tB0tgq.EUteMKC', NULL, 1, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-08-10 02:55:07', '2019-08-10 02:55:07'),
(90, '3', 'patient12343', NULL, 'fgfjh', 'gjhgh', 'jhgjhg', 0, '1999-08-04', '234234234234', 'test123@mailinator.com', '$2y$10$1IDw4xwvQT8iF.wsA8Tf6Or8MdvdURiQPXsJgsFnb.oXN2IcRyAmm', NULL, 1, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-08-10 09:48:22', '2019-08-10 02:59:30'),
(91, '3', 'asdasdasd123123', NULL, 'Brendan123123123', NULL, '123123', 0, '1993-08-10', NULL, 'brendan1212@mailinator.com', '$2y$10$OnWnSSO3z4rPPKi2wUeWT.NTVk7lkz5jv2gt7tgKrmL81DLYhCM7G', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-08-10 06:12:41', '2019-08-10 06:12:41'),
(92, '2', 'anilmsaini2019', NULL, 'Anil', 'M', 'Saini', 0, '1995-08-08', '98269225858', 'anilmsaini2019@mailinator.com', '$2y$10$wmfVPnAgJGTMogrywKF7D.iE6jR3oiiA124Hhzpe0VgTNculyJ.Li', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-08-10 11:57:09', '2019-08-10 06:24:19'),
(93, '3', 'asdasdasdasdsss', NULL, 'asdasd', NULL, 'asdasd', 0, '1988-08-10', NULL, 'brendan12312312@mailinator.com', '$2y$10$nywRbv6KqEFPFjz3dEeD9ubxZmBHEBaBG/HAY7qKFRiN8IwdwRBHO', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-08-10 06:35:06', '2019-08-10 06:35:06'),
(94, '3', 'asdasd1231231', NULL, '44654654', NULL, '54654654', 0, '1988-08-20', NULL, 'brendan12222@mailinator.com', '$2y$10$9Azh754hIgsGTJxd3nVNHuzqju1DihBhsIiFqtgyZOICv4kbHvKNC', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-08-10 06:36:51', '2019-08-10 06:36:51'),
(95, '3', 'werwe2342', NULL, 'wrfwerwe', NULL, 'werwer', 0, '1988-08-05', NULL, 'brendan122221@mailinator.com', '$2y$10$uON0ghFJ6FO0MCXMX3hOtemrCKqfXbrWZ0nfgzbVf7b3rc7fwyTHC', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-08-10 06:38:41', '2019-08-10 06:38:41'),
(96, '3', '123123123', NULL, 'asdad', 'asdasd', 'asdasdasd', 0, '1998-08-05', '1234567896', 'anil12@mailinator.com', '$2y$10$ttN6zGEv.HHT6aSOK1JbS.y4UZOgQ/8bqOMCjlMdkLU.LjVI7aXZK', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-08-10 06:41:03', '2019-08-10 06:41:03'),
(97, '3', '111111111111111111111111', NULL, 'Brendan1', NULL, 'Pillemer1', 0, '1988-08-05', NULL, 'brendan3333@mailinator.com', '$2y$10$F75EPuFnr3cWZxgcY5278O3K3BMDqJiitgMCg.pEhCUJe8wayXtba', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-08-10 06:47:41', '2019-08-10 06:47:41'),
(98, '3', 'admin234234234', NULL, 'Brendan1', NULL, 'Pillemer123123', 0, '1988-08-05', NULL, 'brendan1234@mailinator.com', '$2y$10$don8Hu3jli2lX6ylyNt3Qeg0YxLZrs3buNZvDCQs9n.k4N2hK9v7S', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-08-10 06:51:21', '2019-08-10 06:51:21'),
(99, '3', 'gjhgjhg', NULL, '654654', 'jhg', 'fghf', 0, '1997-08-04', '9825098250', 'jhghffg@mailinator.com', '$2y$10$.nLR/kJ76tEjIZRVDGcJ6uFMeG01gUs.bw9D9neAkRtsZAYknp2c.', NULL, 0, NULL, NULL, '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, '2019-08-10 06:54:15', '2019-08-10 06:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(25) NOT NULL,
  `permission_modules` varchar(100) NOT NULL,
  `created_by` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `user_type`, `permission_modules`, `created_by`, `modified_by`) VALUES
(1, 'Admin', '', '2019-05-24 07:09:10', '0000-00-00 00:00:00'),
(2, 'Practitioner', '', '2019-06-07 06:13:04', '0000-00-00 00:00:00'),
(3, 'Care Giver', '', '2019-07-05 11:57:48', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `us_state`
--

CREATE TABLE `us_state` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_state`
--

INSERT INTO `us_state` (`id`, `code`, `name`, `updated_at`, `created_at`) VALUES
(1, 'AL', 'Alabama', '2019-07-06 07:16:30', '2019-07-06 07:16:30'),
(2, 'AK', 'Alaska', '2019-07-06 07:16:30', '2019-07-06 07:16:30'),
(3, 'AZ', 'Arizona', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(4, 'AR', 'Arkansas', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(5, 'CA', 'California', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(6, 'CO', 'Colorado', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(7, 'CT', 'Connecticut', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(8, 'DE', 'Delaware', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(9, 'DC', 'District of Columbia', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(10, 'FL', 'Florida', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(11, 'GA', 'Georgia', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(12, 'HI', 'Hawaii', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(13, 'ID', 'Idaho', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(14, 'IL', 'Illinois', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(15, 'IN', 'Indiana', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(16, 'IA', 'Iowa', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(17, 'KS', 'Kansas', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(18, 'KY', 'Kentucky', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(19, 'LA', 'Louisiana', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(20, 'ME', 'Maine', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(21, 'MD', 'Maryland', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(22, 'MA', 'Massachusetts', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(23, 'MI', 'Michigan', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(24, 'MN', 'Minnesota', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(25, 'MS', 'Mississippi', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(26, 'MO', 'Missouri', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(27, 'MT', 'Montana', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(28, 'NE', 'Nebraska', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(29, 'NV', 'Nevada', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(30, 'NH', 'New Hampshire', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(31, 'NJ', 'New Jersey', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(32, 'NM', 'New Mexico', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(33, 'NY', 'New York', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(34, 'NC', 'North Carolina', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(35, 'ND', 'North Dakota', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(36, 'OH', 'Ohio', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(37, 'OK', 'Oklahoma', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(38, 'OR', 'Oregon', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(39, 'PA', 'Pennsylvania', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(40, 'RI', 'Rhode Island', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(41, 'SC', 'South Carolina', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(42, 'SD', 'South Dakota', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(43, 'TN', 'Tennessee', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(44, 'TX', 'Texas', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(45, 'UT', 'Utah', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(46, 'VT', 'Vermont', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(47, 'VA', 'Virginia', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(48, 'WA', 'Washington', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(49, 'WV', 'West Virginia', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(50, 'WI', 'Wisconsin', '2019-07-06 07:27:32', '2019-07-06 07:27:32'),
(51, 'WY', 'Wyoming', '2019-07-06 07:27:32', '2019-07-06 07:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `verify_users`
--

CREATE TABLE `verify_users` (
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verify_users`
--

INSERT INTO `verify_users` (`user_id`, `token`, `created_at`, `updated_at`) VALUES
(57, 'mSdHoUbNujbwEjRAWUPfCQstPPYTOZkl3HrwMRtX', '2019-06-28 02:11:45', '2019-06-28 02:11:45'),
(58, 'AZybXBmQzEsfw76KIUTRYBhGN3jlYOzJ8DfniW3M', '2019-06-28 02:12:44', '2019-06-28 02:12:44'),
(59, 'QQMQrlgnUhA5Ru6FnX08zL5fuWrtKazjteKdrQza', '2019-06-28 02:13:18', '2019-06-28 02:13:18'),
(60, 'bKAmWtNyNrtyzQVfIWP6sh7dd0VEPX5qo7AYHfFK', '2019-06-28 02:14:43', '2019-06-28 02:14:43'),
(61, '8at5dkH3ozdrVoJWltrFzuv3n3vzC9Pygf87sQqK', '2019-06-28 02:15:36', '2019-06-28 02:15:36'),
(62, 'mQkGcYeMoHiiNEbyPTkBRmMG3rjhPweE7vezVW3u', '2019-06-28 02:16:30', '2019-06-28 02:16:30'),
(63, 'IR2lKBskcIC755ToV2QlpjPcvffQDW1vFdSDsDHC', '2019-06-28 23:34:04', '2019-06-28 23:34:04'),
(64, 'uQIbnEqsISyZtlaLeAAS3CBhmkNscK5m9FuoYIFE', '2019-06-29 03:40:17', '2019-06-29 03:40:17'),
(65, 'UEqiHgTTdOdwOtvu84XWdnH7SPX2XEBR7xdA7J0Z', '2019-06-29 04:16:11', '2019-06-29 04:16:11'),
(78, 'VESCHbDVE6Mu08DkJT48vjtVbresrZsQMuHeJf3m', '2019-07-26 01:29:37', '2019-07-26 01:29:37'),
(79, 'rP9gK3wGRJCdG3SeqEHtmUMPvBeyBNzXH7VCD41E', '2019-07-26 01:58:54', '2019-07-26 01:58:54'),
(80, 'FtdImYjZy8iSNCsJpzPCJsdIhsK7mjEFSyslQUYv', '2019-07-26 03:59:07', '2019-07-26 03:59:07'),
(81, '43t2vkxcW8PxTy28X2pCxZYPXNP2bRRuXjwD3Igy', '2019-07-26 04:02:52', '2019-07-26 04:02:52'),
(82, 'uDIZS4W8G6np0T1MIMaCDQgzor83H3U8NcrE1bNv', '2019-07-26 04:14:35', '2019-07-26 04:14:35'),
(83, 'RCplVw9jOtYYdOXkaU3Gs8zDzSU9VmQpMzRtTCjX', '2019-07-26 04:17:54', '2019-07-26 04:17:54'),
(84, 'ksQ2dlRb2e4lexz7xJLJ4C710MCqfeDzCge7U2hK', '2019-08-07 08:26:03', '2019-08-07 08:26:03'),
(85, 'QWwFUPg3QGobQgLGIp5C6lmS5pLGaiuzwjr9Pec2', '2019-08-10 01:49:28', '2019-08-10 01:49:28'),
(86, 'HriwDC3TqDS0AgkpAHOX3VXXDkiVsHCEgHrVLK8m', '2019-08-10 01:51:13', '2019-08-10 01:51:13'),
(87, 'UkJhdSgikWmgbMA7unBWlTFGZBfaiWKEFJVjdBvP', '2019-08-10 02:55:07', '2019-08-10 02:55:07'),
(88, 'nmR59kaYaOII4xtM2RBAMczbpPIIUZYGdlnLPEkQ', '2019-08-10 02:56:47', '2019-08-10 02:56:47'),
(89, 'YRTSuzTfGCS1bjPYy5Q0ASKn7C5n2JMxM4j2Svdj', '2019-08-10 02:58:40', '2019-08-10 02:58:40'),
(90, 'XlFuNtT5i2Mh6jgBpwjoUcZ2m2BRZ2oE18C8h8qH', '2019-08-10 02:59:30', '2019-08-10 02:59:30'),
(96, '7DY5b0ptiR73vDerl2QITTZrRwApnTXSrgdyZnYj', '2019-08-10 06:41:03', '2019-08-10 06:41:03'),
(99, 'enUbxwCjHYuCiBUlEVwNBXgkzdoas4W5tKsOibAv', '2019-08-10 06:54:15', '2019-08-10 06:54:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers_of_questions`
--
ALTER TABLE `answers_of_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `body_areas`
--
ALTER TABLE `body_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `case_number` (`case_number`);

--
-- Indexes for table `case_activity_log`
--
ALTER TABLE `case_activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_additional_info`
--
ALTER TABLE `case_additional_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_photos`
--
ALTER TABLE `case_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chief_complaints`
--
ALTER TABLE `chief_complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `derm_address`
--
ALTER TABLE `derm_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `describe_problems`
--
ALTER TABLE `describe_problems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_medical_history`
--
ALTER TABLE `family_medical_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patient_caregiver_relation`
--
ALTER TABLE `patient_caregiver_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_current_medication`
--
ALTER TABLE `patient_current_medication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_drug_allergies`
--
ALTER TABLE `patient_drug_allergies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_medical_history`
--
ALTER TABLE `patient_medical_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_answer_templates`
--
ALTER TABLE `question_answer_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_choices`
--
ALTER TABLE `question_choices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refferal_codes`
--
ALTER TABLE `refferal_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specilities`
--
ALTER TABLE `specilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_of_problem`
--
ALTER TABLE `type_of_problem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_state`
--
ALTER TABLE `us_state`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers_of_questions`
--
ALTER TABLE `answers_of_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `body_areas`
--
ALTER TABLE `body_areas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `case_activity_log`
--
ALTER TABLE `case_activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `case_additional_info`
--
ALTER TABLE `case_additional_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `case_photos`
--
ALTER TABLE `case_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `chief_complaints`
--
ALTER TABLE `chief_complaints`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `derm_address`
--
ALTER TABLE `derm_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `describe_problems`
--
ALTER TABLE `describe_problems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `family_medical_history`
--
ALTER TABLE `family_medical_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1995;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient_caregiver_relation`
--
ALTER TABLE `patient_caregiver_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patient_current_medication`
--
ALTER TABLE `patient_current_medication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2863;

--
-- AUTO_INCREMENT for table `patient_details`
--
ALTER TABLE `patient_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `patient_drug_allergies`
--
ALTER TABLE `patient_drug_allergies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1952;

--
-- AUTO_INCREMENT for table `patient_medical_history`
--
ALTER TABLE `patient_medical_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2003;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `question_answer_templates`
--
ALTER TABLE `question_answer_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `question_choices`
--
ALTER TABLE `question_choices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `refferal_codes`
--
ALTER TABLE `refferal_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `specilities`
--
ALTER TABLE `specilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `type_of_problem`
--
ALTER TABLE `type_of_problem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `us_state`
--
ALTER TABLE `us_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
