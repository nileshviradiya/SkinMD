-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2019 at 09:08 AM
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
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `log_message` text NOT NULL,
  `module_name` varchar(200) NOT NULL,
  `action` enum('insert','update','delete','') NOT NULL,
  `updated_datetime` int(11) NOT NULL,
  `created_datetime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `patient_current_medication_id` int(10) UNSIGNED DEFAULT NULL,
  `patient_drug_allergies_id` int(10) UNSIGNED DEFAULT NULL,
  `family_medical_history_id` int(10) UNSIGNED DEFAULT NULL,
  `patient_medical_history_id` int(10) UNSIGNED DEFAULT NULL,
  `derm_id` int(11) DEFAULT NULL COMMENT 'We will store derm  address id here',
  `photos_ids` varchar(100) DEFAULT NULL,
  `consult_cost` varchar(100) NOT NULL,
  `refferal_code_id` int(10) UNSIGNED DEFAULT NULL,
  `follow_up` text DEFAULT NULL,
  `bill_id` int(10) UNSIGNED DEFAULT NULL,
  `questions_answer` blob DEFAULT NULL,
  `prescriptions_ids` int(10) UNSIGNED DEFAULT NULL,
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
  `status` enum('Active','Resolved','Cancelled','') NOT NULL COMMENT 'Case Status will be one from this ''Active'', ''Resolved'', ''Cancelled''',
  `case_priority` enum('Normal') NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id`, `case_number`, `care_giver_id`, `patient_id`, `provider_id`, `patient_details_id`, `patient_fname`, `patient_mname`, `patient_lname`, `patient_gender`, `patient_dob`, `patient_caregiver_relation`, `patient_email`, `patient_phone`, `patient_pharmacy_id`, `patient_current_medication_id`, `patient_drug_allergies_id`, `family_medical_history_id`, `patient_medical_history_id`, `derm_id`, `photos_ids`, `consult_cost`, `refferal_code_id`, `follow_up`, `bill_id`, `questions_answer`, `prescriptions_ids`, `submitted_by`, `submitted_on`, `complaint_id`, `time_of_issue1`, `time_of_issue2`, `affected_area_list`, `type_of_problem1`, `type_of_problem2`, `pregnant_status`, `biopsied_or_excised`, `status`, `case_priority`, `updated_datetime`, `created_datetime`) VALUES
(27, 'ZIT7F-89XWI-GMEAW-ZSQ7X', 67, NULL, 66, 64, 'New', 'patient', 'name', 0, '2001-07-10', 3, 'father@mailinator.com', '9825098250', 32, 17, 20, 17, 17, NULL, '12,13', '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 1, 2, 'Weeks', '12,16,17,25,26,27', '2', 'Worsening', NULL, 1, 'Active', 'Normal', '2019-07-19 06:45:57', '2019-07-19 06:45:04'),
(28, '73SWS-RMYWG-V8WHE-RWBG2', 67, NULL, 66, 64, 'Anil', 'M', 'Saini', 1, '2001-07-01', 2, 'anilmsaini@mailinator.com', '9999999999', 42, 26, 21, 18, 18, NULL, '14,15,16', '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 7, 4, 'Months', '12,13,19,20,22,23,24,25,26,27', '1', 'Stable', '2', 0, 'Active', 'Normal', '2019-07-19 07:08:44', '2019-07-19 06:51:51'),
(29, 'OHLHS-E5W9D-RVPGG-1OK6O', 67, NULL, 66, 64, 'Anil', 'M', 'Saini', 1, '2001-07-01', 2, '2', '9999999999', 43, 27, 22, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 14, 0, '', NULL, '', '', '3', 0, 'Active', 'Normal', '2019-07-19 09:46:27', '2019-07-19 09:45:46'),
(30, 'GHD4U-5FNHR-7M274-P57MM', 67, NULL, 66, 64, 'Anil', 'M', 'Saini', 1, '2001-07-01', 2, '2', '9999999999', NULL, 30, 23, 19, 19, NULL, '17', '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 1, 0, '', '12,13,18', '', '', '4', 0, 'Active', 'Normal', '2019-07-19 10:46:09', '2019-07-19 10:44:19'),
(31, 'ZKOZF-AOZ4O-K2MPC-5XHEC', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, 'brendan1', '9825098250', 44, 35, 26, 21, 21, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 14, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 11:22:44', '2019-07-19 11:21:52'),
(32, 'MMQ30-C3RO8-66JJH-WD921', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', NULL, 36, 27, 22, 22, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 1, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 11:26:41', '2019-07-19 11:26:37'),
(33, 'JWD3Y-E71NJ-SN8ET-GKD31', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', 46, 39, 30, 25, 25, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 15, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 11:38:57', '2019-07-19 11:36:50'),
(34, '4UYUY-2ULY7-VNFWR-AIH4Q', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', 47, 41, 32, 27, 27, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 14, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 11:42:12', '2019-07-19 11:41:51'),
(35, 'G2XVH-3ZZ5A-1LMPI-W0F9H', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', 53, 107, 98, 93, 93, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 15, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 11:46:15', '2019-07-19 11:45:43'),
(36, '1J13M-8N1LI-TPW08-R7OK7', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', 0, 179, 111, 170, 170, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 1, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 12:23:40', '2019-07-19 12:18:36'),
(37, 'MWQDN-0NSF1-GSGDI-TV8T0', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 14, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 12:32:05', '2019-07-19 12:32:05'),
(38, 'VBMQJ-PCM4J-Z3QKH-RT3SJ', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 14, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 13:19:37', '2019-07-19 13:19:37'),
(39, '4N8RA-HP8E1-FK7FU-EUFRP', 67, NULL, 66, 66, 'some one', NULL, 'else', 0, '2001-07-18', 2, 'testnewuser@mailinator.com', '9822982256', 54, 239, 112, 235, 235, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 4, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 13:27:10', '2019-07-19 13:26:39'),
(40, '5J9D9-2BXSR-GX0KP-YIJPR', 67, NULL, 66, 66, 'some one', NULL, 'else', 0, '2001-07-18', 2, '2', '9822982256', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 15, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 13:27:45', '2019-07-19 13:27:45'),
(41, 'KT8K0-04A4X-VC4QM-XCWLD', 67, NULL, 66, 66, 'some one', NULL, 'else', 0, '2001-07-18', 2, '2', '9822982256', 65, 240, 113, 236, 236, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 1, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 13:36:37', '2019-07-19 13:36:06'),
(42, '94EKQ-UBEWE-7ZE0I-VPX40', 67, NULL, 66, 66, 'some one', NULL, 'else', 0, '2001-07-18', 2, '2', '9822982256', NULL, 241, 114, 237, 237, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 15, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 13:38:40', '2019-07-19 13:37:57'),
(43, 'ZREVL-UTN4E-VU3SO-1F8MQ', 67, NULL, 66, 66, 'some one', NULL, 'else', 0, '2001-07-18', 2, '2', '9822982256', 64, 243, 116, 239, 239, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 15, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 13:43:11', '2019-07-19 13:42:14'),
(44, 'W32W8-HMAYR-X39I7-PLP3M', 67, NULL, 66, 66, 'some one', NULL, 'else', 0, '2001-07-18', 2, '2', '9822982256', NULL, 247, 120, 243, 243, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 1, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 13:48:09', '2019-07-19 13:44:56'),
(45, 'T3YMZ-N6DWP-OHC99-4NAZV', 67, NULL, 66, 64, 'Anil', 'M', 'Saini', 1, '2001-07-01', 2, '2', '9999999999', 64, 268, 133, 252, 252, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 15, 0, '', NULL, '', '', '3', 0, 'Active', 'Normal', '2019-07-19 14:28:43', '2019-07-19 14:24:29'),
(46, 'LW5IW-FAQP7-L6JOQ-LKHAT', 67, NULL, 66, 64, 'Anil', 'M', 'Saini', 1, '2001-07-01', 2, '2', '9999999999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 1, 0, '', '12,18,22,23,25,26,27', '', '', '3', 0, 'Active', 'Normal', '2019-07-19 14:30:27', '2019-07-19 14:30:27'),
(47, '5IR48-M9TRL-1RFNT-ZZ2N1', 67, NULL, 66, 67, '234234', '23423423', '4234234234', 1, '2001-07-24', 3, 'testnewuser@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 5, 0, '', '12,17,18,23,25,26,27', '', '', '3', 0, 'Active', 'Normal', '2019-07-19 15:04:17', '2019-07-19 15:04:17'),
(48, 'FOO0W-3168B-BZ7I3-HB7DK', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', NULL, 278, 139, 256, 256, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 14, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 15:10:46', '2019-07-19 15:10:40'),
(49, 'C9XCZ-5P6SQ-IZEL3-0PG3M', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', NULL, 328, 202, 306, 306, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 15, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 15:12:16', '2019-07-19 15:12:12'),
(50, 'W8CW8-GRK84-0RQFJ-5QU9J', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', NULL, 378, 252, 356, 356, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 15, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 15:14:37', '2019-07-19 15:14:34'),
(51, 'CUJ0C-YEMCV-327CF-U28AV', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', NULL, 428, 302, 406, 406, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 14, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 15:17:03', '2019-07-19 15:17:01'),
(52, '5DRPA-WAHMB-6DOHO-P5THQ', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', NULL, 478, 352, 456, 456, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 15, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 15:18:32', '2019-07-19 15:18:30'),
(53, 'SYQRT-ZTLQK-KQWG4-6KJ9W', 67, NULL, 66, 65, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', 1, '1', '9825098250', NULL, 528, 402, 506, 506, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 15, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-19 15:19:23', '2019-07-19 15:19:17');

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
(12, '1563518563.png', '2019-07-19 06:45:04', '2019-07-19 06:45:04'),
(13, '1563518567.jpg', '2019-07-19 06:45:04', '2019-07-19 06:45:04'),
(14, '1563519003.png', '2019-07-19 06:51:51', '2019-07-19 06:51:51'),
(15, '1563519005.jpg', '2019-07-19 06:51:51', '2019-07-19 06:51:51'),
(16, '1563519007.png', '2019-07-19 06:51:51', '2019-07-19 06:51:51'),
(17, '1563533018.png', '2019-07-19 10:44:19', '2019-07-19 10:44:19');

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
(52, 67, 0, 'Parekh Hospital 1', NULL, NULL, NULL, NULL, 1, 1, NULL, '2019-07-08 05:44:09', '2019-07-08 05:44:09'),
(53, 2, 0, 'asdasd', NULL, NULL, NULL, NULL, 2, 1, NULL, '2019-07-08 14:54:21', '2019-07-08 14:54:21'),
(54, 2, 0, 'Parekh Hospital 2', NULL, NULL, NULL, NULL, 1, 1, NULL, '2019-07-08 14:54:36', '2019-07-08 14:54:36'),
(55, 74, 0, 'Parekh Hospital 2234234\r\n', NULL, NULL, NULL, NULL, 1, 1, NULL, '2019-07-08 14:54:36', '2019-07-08 14:54:36'),
(56, 75, 0, 'Parekh Hospital 2234234\r\n', NULL, NULL, NULL, NULL, 1, 1, NULL, '2019-07-08 14:54:36', '2019-07-08 14:54:36'),
(57, 76, 0, 'Parekh Hospital 2234234234234\r\n', NULL, NULL, NULL, NULL, 1, 1, NULL, '2019-07-08 14:54:36', '2019-07-08 14:54:36');

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
  `email_type` enum('Forgot Email','Register Email','Submit New Case','Resolved Case','Reject Case') NOT NULL,
  `content` text NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(17, 'Medical History', '2019-07-19 06:45:57', '2019-07-19 06:45:57'),
(18, 'werwerwer', '2019-07-19 07:08:44', '2019-07-19 07:08:44'),
(19, 'Medical History', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(20, 'werwerwer', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(21, '2344444444', '2019-07-19 11:22:44', '2019-07-19 11:22:44'),
(22, '2344444444', '2019-07-19 11:26:41', '2019-07-19 11:26:41'),
(23, '2344444444', '2019-07-19 11:37:04', '2019-07-19 11:37:04'),
(24, '2344444444', '2019-07-19 11:37:04', '2019-07-19 11:37:04'),
(25, '2344444444', '2019-07-19 11:38:57', '2019-07-19 11:38:57'),
(26, '2344444444', '2019-07-19 11:38:57', '2019-07-19 11:38:57'),
(27, '2344444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(28, '2344444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(29, '2344444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(30, '2344444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(31, '2344444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(32, '2344444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(33, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(34, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(35, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(36, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(37, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(38, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(39, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(40, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(41, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(42, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(43, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(44, '2344444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(45, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(46, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(47, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(48, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(49, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(50, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(51, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(52, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(53, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(54, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(55, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(56, '2344444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(57, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(58, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(59, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(60, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(61, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(62, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(63, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(64, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(65, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(66, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(67, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(68, '2344444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(69, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(70, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(71, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(72, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(73, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(74, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(75, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(76, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(77, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(78, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(79, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(80, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(81, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(82, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(83, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(84, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(85, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(86, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(87, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(88, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(89, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(90, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(91, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(92, '2344444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(93, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(94, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(95, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(96, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(97, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(98, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(99, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(100, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(101, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(102, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(103, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(104, '2344444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(105, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(106, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(107, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(108, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(109, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(110, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(111, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(112, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(113, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(114, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(115, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(116, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(117, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(118, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(119, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(120, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(121, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(122, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(123, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(124, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(125, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(126, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(127, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(128, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(129, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(130, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(131, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(132, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(133, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(134, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(135, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(136, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(137, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(138, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(139, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(140, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(141, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(142, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(143, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(144, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(145, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(146, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(147, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(148, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(149, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(150, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(151, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(152, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(153, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(154, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(155, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(156, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(157, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(158, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(159, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(160, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(161, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(162, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(163, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(164, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(165, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(166, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(167, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(168, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(169, '2344444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(170, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(171, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(172, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(173, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(174, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(175, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(176, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(177, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(178, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(179, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(180, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(181, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(182, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(183, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(184, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(185, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(186, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(187, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(188, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(189, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(190, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(191, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(192, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(193, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(194, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(195, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(196, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(197, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(198, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(199, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(200, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(201, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(202, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(203, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(204, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(205, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(206, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(207, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(208, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(209, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(210, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(211, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(212, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(213, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(214, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(215, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(216, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(217, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(218, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(219, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(220, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(221, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(222, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(223, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(224, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(225, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(226, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(227, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(228, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(229, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(230, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(231, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(232, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(233, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(234, '2344444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(235, '234234', '2019-07-19 13:27:10', '2019-07-19 13:27:10'),
(236, '234234', '2019-07-19 13:36:37', '2019-07-19 13:36:37'),
(237, '234234', '2019-07-19 13:38:40', '2019-07-19 13:38:40'),
(238, '234234', '2019-07-19 13:38:40', '2019-07-19 13:38:40'),
(239, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(240, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(241, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(242, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(243, '234234', '2019-07-19 13:48:09', '2019-07-19 13:48:09'),
(244, 'Medical History', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(245, 'werwerwer', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(246, 'Medical History', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(247, 'werwerwer', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(248, 'Medical History', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(249, 'werwerwer', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(250, 'Medical History', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(251, 'werwerwer', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(252, 'Medical History', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(253, 'werwerwer', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(254, 'Medical History', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(255, 'werwerwer', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(256, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(257, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(258, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(259, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(260, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(261, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(262, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(263, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(264, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(265, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(266, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(267, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(268, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(269, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(270, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(271, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(272, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(273, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(274, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(275, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(276, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(277, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(278, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(279, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(280, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(281, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(282, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(283, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(284, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(285, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(286, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(287, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(288, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(289, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(290, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(291, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(292, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(293, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(294, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(295, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(296, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(297, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(298, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(299, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(300, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(301, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(302, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(303, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(304, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(305, '2344444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(306, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(307, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(308, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(309, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(310, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(311, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(312, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(313, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(314, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(315, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(316, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(317, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(318, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(319, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(320, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(321, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(322, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(323, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(324, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(325, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(326, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(327, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(328, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(329, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(330, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(331, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(332, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(333, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(334, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(335, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(336, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(337, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(338, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(339, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(340, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(341, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(342, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(343, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(344, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(345, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(346, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(347, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(348, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(349, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(350, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(351, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(352, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(353, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(354, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(355, '2344444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(356, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(357, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(358, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(359, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(360, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(361, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(362, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(363, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(364, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(365, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(366, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(367, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(368, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(369, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(370, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(371, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(372, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(373, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(374, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(375, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(376, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(377, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(378, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(379, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(380, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(381, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(382, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(383, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(384, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(385, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(386, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(387, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(388, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(389, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(390, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(391, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(392, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(393, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(394, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(395, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(396, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(397, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(398, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(399, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(400, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(401, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(402, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(403, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(404, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(405, '2344444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(406, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(407, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(408, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(409, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(410, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(411, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(412, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(413, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(414, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(415, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(416, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(417, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(418, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(419, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(420, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(421, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(422, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(423, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(424, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(425, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(426, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(427, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(428, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(429, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(430, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(431, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(432, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(433, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(434, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(435, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(436, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(437, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(438, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(439, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(440, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(441, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(442, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(443, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(444, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(445, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(446, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(447, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(448, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(449, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(450, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(451, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(452, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(453, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(454, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(455, '2344444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(456, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(457, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(458, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(459, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(460, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(461, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(462, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(463, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(464, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(465, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(466, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(467, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(468, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(469, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(470, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(471, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(472, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(473, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(474, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(475, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(476, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(477, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(478, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(479, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(480, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(481, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(482, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(483, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(484, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(485, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(486, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(487, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(488, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(489, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(490, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(491, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(492, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(493, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(494, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(495, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(496, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(497, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(498, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(499, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(500, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(501, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(502, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(503, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(504, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(505, '2344444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(506, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(507, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(508, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(509, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(510, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(511, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(512, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(513, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(514, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(515, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(516, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(517, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(518, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(519, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(520, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(521, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(522, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(523, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(524, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(525, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(526, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(527, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(528, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(529, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(530, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(531, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(532, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(533, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(534, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(535, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(536, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(537, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(538, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(539, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(540, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(541, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(542, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(543, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(544, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(545, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(546, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(547, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(548, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(549, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(550, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(551, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(552, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(553, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(554, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(555, '2344444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23');

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
('brendan@mailinator.com', '$2y$10$0fFawy5RmhTZjMWPNg3BAeKBGHZqFnkO8iZ1GYKg6o5Ycdzzx0yEO', '2019-07-02 00:06:50');

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
(17, 'Current Medications', '2019-07-19 06:45:57', '2019-07-19 06:45:57'),
(18, 'werwerwer', '2019-07-19 06:52:21', '2019-07-19 06:52:21'),
(19, 'werwerwer', '2019-07-19 06:59:40', '2019-07-19 06:59:40'),
(20, 'werwerwer', '2019-07-19 07:04:20', '2019-07-19 07:04:20'),
(21, 'werwerwer', '2019-07-19 07:04:50', '2019-07-19 07:04:50'),
(22, 'werwerwer', '2019-07-19 07:05:05', '2019-07-19 07:05:05'),
(23, 'werwerwer', '2019-07-19 07:05:24', '2019-07-19 07:05:24'),
(24, 'werwerwer', '2019-07-19 07:05:42', '2019-07-19 07:05:42'),
(25, 'werwerwer', '2019-07-19 07:06:02', '2019-07-19 07:06:02'),
(26, 'werwerwer', '2019-07-19 07:08:44', '2019-07-19 07:08:44'),
(27, 'Current Medications', '2019-07-19 09:46:27', '2019-07-19 09:46:27'),
(28, 'werwerwer', '2019-07-19 09:46:27', '2019-07-19 09:46:27'),
(29, 'Current 3', '2019-07-19 09:46:27', '2019-07-19 09:46:27'),
(30, 'Current Medications', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(31, 'werwerwer', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(32, 'Current Medications', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(33, 'werwerwer', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(34, 'Current 3', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(35, '234444444', '2019-07-19 11:22:44', '2019-07-19 11:22:44'),
(36, '234444444', '2019-07-19 11:26:41', '2019-07-19 11:26:41'),
(37, '234444444', '2019-07-19 11:37:04', '2019-07-19 11:37:04'),
(38, '234444444', '2019-07-19 11:37:04', '2019-07-19 11:37:04'),
(39, '234444444', '2019-07-19 11:38:57', '2019-07-19 11:38:57'),
(40, '234444444', '2019-07-19 11:38:57', '2019-07-19 11:38:57'),
(41, '234444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(42, '234444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(43, '234444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(44, '234444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(45, '234444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(46, '234444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(47, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(48, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(49, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(50, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(51, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(52, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(53, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(54, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(55, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(56, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(57, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(58, '234444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(59, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(60, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(61, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(62, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(63, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(64, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(65, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(66, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(67, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(68, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(69, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(70, '234444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(71, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(72, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(73, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(74, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(75, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(76, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(77, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(78, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(79, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(80, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(81, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(82, '234444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(83, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(84, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(85, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(86, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(87, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(88, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(89, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(90, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(91, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(92, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(93, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(94, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(95, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(96, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(97, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(98, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(99, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(100, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(101, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(102, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(103, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(104, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(105, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(106, '234444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(107, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(108, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(109, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(110, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(111, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(112, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(113, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(114, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(115, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(116, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(117, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(118, '234444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(119, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(120, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(121, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(122, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(123, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(124, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(125, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(126, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(127, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(128, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(129, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(130, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(131, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(132, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(133, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(134, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(135, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(136, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(137, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(138, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(139, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(140, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(141, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(142, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(143, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(144, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(145, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(146, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(147, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(148, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(149, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(150, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(151, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(152, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(153, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(154, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(155, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(156, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(157, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(158, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(159, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(160, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(161, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(162, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(163, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(164, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(165, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(166, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(167, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(168, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(169, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(170, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(171, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(172, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(173, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(174, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(175, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(176, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(177, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(178, '234444444', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(179, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(180, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(181, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(182, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(183, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(184, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(185, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(186, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(187, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(188, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(189, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(190, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(191, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(192, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(193, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(194, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(195, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(196, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(197, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(198, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(199, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(200, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(201, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(202, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(203, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(204, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(205, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(206, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(207, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(208, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(209, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(210, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(211, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(212, '234444444', '2019-07-19 12:23:39', '2019-07-19 12:23:39'),
(213, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(214, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(215, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(216, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(217, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(218, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(219, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(220, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(221, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(222, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(223, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(224, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(225, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(226, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(227, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(228, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(229, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(230, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(231, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(232, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(233, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(234, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(235, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(236, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(237, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(238, '234444444', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(239, '234234', '2019-07-19 13:27:10', '2019-07-19 13:27:10'),
(240, '234234', '2019-07-19 13:36:37', '2019-07-19 13:36:37'),
(241, '234234', '2019-07-19 13:38:40', '2019-07-19 13:38:40'),
(242, '234234', '2019-07-19 13:38:40', '2019-07-19 13:38:40'),
(243, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(244, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(245, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(246, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(247, '234234', '2019-07-19 13:48:09', '2019-07-19 13:48:09'),
(248, 'Current Medications', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(249, 'werwerwer', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(250, 'Current Medications', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(251, 'werwerwer', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(252, 'Current 3', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(253, 'Current Medications', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(254, 'werwerwer', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(255, 'Current Medications', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(256, 'werwerwer', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(257, 'Current 3', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(258, 'Current Medications', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(259, 'werwerwer', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(260, 'Current Medications', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(261, 'werwerwer', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(262, 'Current 3', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(263, 'Current Medications', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(264, 'werwerwer', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(265, 'Current Medications', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(266, 'werwerwer', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(267, 'Current 3', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(268, 'Current Medications', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(269, 'werwerwer', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(270, 'Current Medications', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(271, 'werwerwer', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(272, 'Current 3', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(273, 'Current Medications', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(274, 'werwerwer', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(275, 'Current Medications', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(276, 'werwerwer', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(277, 'Current 3', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(278, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(279, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(280, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(281, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(282, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(283, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(284, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(285, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(286, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(287, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(288, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(289, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(290, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(291, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(292, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(293, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(294, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(295, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(296, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(297, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(298, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(299, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(300, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(301, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(302, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(303, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(304, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(305, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(306, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(307, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(308, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(309, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(310, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(311, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(312, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(313, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(314, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(315, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(316, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(317, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(318, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(319, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(320, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(321, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(322, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(323, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(324, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(325, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(326, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(327, '234444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(328, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(329, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(330, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(331, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(332, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(333, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(334, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(335, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(336, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(337, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(338, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(339, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(340, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(341, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(342, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(343, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(344, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(345, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(346, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(347, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(348, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(349, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(350, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(351, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(352, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(353, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(354, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(355, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(356, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(357, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(358, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(359, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(360, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(361, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(362, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(363, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(364, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(365, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(366, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(367, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(368, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(369, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(370, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(371, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(372, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(373, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(374, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(375, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(376, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(377, '234444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(378, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(379, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(380, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(381, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(382, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(383, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(384, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(385, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(386, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(387, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(388, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(389, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(390, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(391, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(392, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(393, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(394, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(395, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(396, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(397, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(398, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(399, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(400, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(401, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(402, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(403, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(404, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(405, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(406, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(407, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(408, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(409, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(410, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(411, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(412, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(413, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(414, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(415, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(416, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(417, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(418, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(419, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(420, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(421, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(422, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(423, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(424, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(425, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(426, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(427, '234444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(428, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(429, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(430, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(431, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(432, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(433, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(434, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(435, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(436, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(437, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(438, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(439, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(440, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(441, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(442, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(443, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(444, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(445, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(446, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(447, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(448, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(449, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(450, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(451, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(452, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(453, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(454, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(455, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(456, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(457, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(458, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(459, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(460, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(461, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(462, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(463, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(464, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(465, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(466, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(467, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(468, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(469, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(470, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(471, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(472, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(473, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(474, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(475, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(476, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(477, '234444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(478, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(479, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(480, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(481, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(482, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(483, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(484, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(485, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(486, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(487, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(488, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(489, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(490, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(491, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(492, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(493, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(494, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(495, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(496, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(497, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(498, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(499, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(500, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(501, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(502, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(503, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(504, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(505, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(506, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(507, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(508, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(509, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(510, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(511, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(512, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(513, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(514, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(515, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(516, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(517, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(518, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(519, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(520, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(521, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(522, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(523, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(524, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(525, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(526, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(527, '234444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(528, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(529, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(530, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(531, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(532, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(533, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(534, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(535, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(536, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(537, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(538, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(539, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(540, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(541, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(542, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(543, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(544, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(545, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(546, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(547, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(548, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(549, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(550, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(551, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(552, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(553, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(554, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(555, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(556, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(557, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(558, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(559, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(560, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(561, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(562, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(563, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(564, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(565, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(566, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(567, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(568, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(569, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(570, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(571, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(572, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(573, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(574, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(575, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(576, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(577, '234444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23');

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
(64, 67, 2, 'Anil', 'M', 'Saini', 1, '2001-07-01', '2', '9999999999', '32,42,43,64,64,64', '268,269,270,271,272,273,274,275,276,277,258,259,260,261,262,263,264,265,266,267,248,249,250,251,252,253,254,255,256,257,30,31,32,33,34,27,28,29,26,17', '133,134,135,136,137,138,127,128,129,130,131,132,121,122,123,124,125,126,23,24,25,22,21,20', '252,253,254,255,248,249,250,251,244,245,246,247,19,20,18,17', '252,253,254,255,248,249,250,251,244,245,246,247,19,20,18,17', '2019-07-19 06:45:04', '2019-07-19 06:45:04'),
(65, 67, 1, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', '1', '9825098250', '44,45,46,47,48,49,50,51,52,53', '528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,', '402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,', '506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,', '506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,', '2019-07-19 11:21:52', '2019-07-19 11:21:52'),
(66, 67, 2, 'some one', NULL, 'else', 0, '2001-07-18', '2', '9822982256', '54,65,64', '247,243,244,245,246,241,242,240,239', '120,116,117,118,119,114,115,113,112', '243,239,240,241,242,237,238,236,235', '243,239,240,241,242,237,238,236,235', '2019-07-19 13:26:39', '2019-07-19 13:26:39'),
(67, 67, 3, '234234', '23423423', '4234234234', 1, '2001-07-24', 'testnewuser@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, '2019-07-19 15:04:17', '2019-07-19 15:04:17');

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
(20, 'Drug Allergies', '2019-07-19 06:45:57', '2019-07-19 06:45:57'),
(21, 'werwerwerwer', '2019-07-19 07:08:44', '2019-07-19 07:08:44'),
(22, 'asdasdasd', '2019-07-19 09:46:27', '2019-07-19 09:46:27'),
(23, 'Drug Allergies', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(24, 'werwerwerwer', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(25, 'asdasdasd', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(26, '23444444444', '2019-07-19 11:22:44', '2019-07-19 11:22:44'),
(27, '23444444444', '2019-07-19 11:26:41', '2019-07-19 11:26:41'),
(28, '23444444444', '2019-07-19 11:37:04', '2019-07-19 11:37:04'),
(29, '23444444444', '2019-07-19 11:37:04', '2019-07-19 11:37:04'),
(30, '23444444444', '2019-07-19 11:38:57', '2019-07-19 11:38:57'),
(31, '23444444444', '2019-07-19 11:38:57', '2019-07-19 11:38:57'),
(32, '23444444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(33, '23444444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(34, '23444444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(35, '23444444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(36, '23444444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(37, '23444444444', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(38, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(39, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(40, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(41, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(42, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(43, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(44, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(45, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(46, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(47, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(48, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(49, '23444444444', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(50, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(51, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(52, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(53, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(54, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(55, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(56, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(57, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(58, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(59, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(60, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(61, '23444444444', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(62, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(63, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(64, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(65, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(66, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(67, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(68, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(69, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(70, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(71, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(72, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(73, '23444444444', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(74, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(75, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(76, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(77, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(78, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(79, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(80, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(81, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(82, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(83, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(84, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(85, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(86, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(87, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(88, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(89, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(90, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(91, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(92, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(93, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(94, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(95, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(96, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(97, '23444444444', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(98, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(99, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(100, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(101, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(102, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(103, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(104, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(105, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(106, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(107, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(108, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(109, '23444444444', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(110, 'asd', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(111, 'asd', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(112, '234234', '2019-07-19 13:27:10', '2019-07-19 13:27:10'),
(113, '234234', '2019-07-19 13:36:37', '2019-07-19 13:36:37'),
(114, '234234', '2019-07-19 13:38:40', '2019-07-19 13:38:40'),
(115, '234234', '2019-07-19 13:38:40', '2019-07-19 13:38:40'),
(116, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(117, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(118, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(119, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(120, '234234', '2019-07-19 13:48:09', '2019-07-19 13:48:09'),
(121, 'Drug Allergies', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(122, 'werwerwerwer', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(123, 'asdasdasd', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(124, 'Drug Allergies', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(125, 'werwerwerwer', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(126, 'asdasdasd', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(127, 'Drug Allergies', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(128, 'werwerwerwer', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(129, 'asdasdasd', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(130, 'Drug Allergies', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(131, 'werwerwerwer', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(132, 'asdasdasd', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(133, 'Drug Allergies', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(134, 'werwerwerwer', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(135, 'asdasdasd', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(136, 'Drug Allergies', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(137, 'werwerwerwer', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(138, 'asdasdasd', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(139, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(140, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(141, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(142, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(143, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(144, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(145, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(146, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(147, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(148, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(149, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(150, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(151, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(152, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(153, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(154, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(155, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(156, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(157, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(158, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(159, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(160, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(161, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(162, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(163, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(164, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(165, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(166, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(167, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(168, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(169, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(170, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(171, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(172, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(173, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(174, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(175, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(176, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(177, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(178, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(179, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(180, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(181, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(182, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(183, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(184, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(185, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(186, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(187, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(188, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(189, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(190, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(191, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(192, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(193, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(194, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(195, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(196, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(197, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(198, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(199, '23444444444', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(200, 'asd', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(201, 'asd', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(202, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(203, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(204, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(205, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(206, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(207, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(208, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(209, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(210, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(211, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(212, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(213, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(214, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(215, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(216, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(217, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(218, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(219, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(220, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(221, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(222, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(223, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(224, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(225, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(226, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(227, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(228, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(229, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(230, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(231, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(232, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(233, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(234, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(235, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(236, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(237, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(238, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(239, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(240, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(241, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(242, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(243, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(244, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(245, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(246, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(247, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(248, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(249, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(250, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(251, '23444444444', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(252, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(253, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(254, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(255, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(256, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(257, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(258, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(259, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(260, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(261, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(262, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(263, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(264, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(265, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(266, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(267, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(268, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(269, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(270, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(271, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(272, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(273, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(274, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(275, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(276, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(277, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(278, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(279, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(280, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(281, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(282, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(283, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(284, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(285, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(286, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(287, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(288, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(289, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(290, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(291, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(292, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(293, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(294, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(295, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(296, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(297, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(298, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(299, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(300, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(301, '23444444444', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(302, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(303, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(304, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(305, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(306, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(307, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(308, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(309, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(310, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(311, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(312, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(313, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(314, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(315, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(316, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(317, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(318, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(319, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(320, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(321, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(322, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(323, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(324, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(325, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(326, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(327, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(328, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(329, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(330, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(331, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(332, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(333, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(334, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(335, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(336, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(337, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(338, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(339, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(340, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(341, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(342, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(343, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(344, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(345, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(346, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(347, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(348, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(349, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(350, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(351, '23444444444', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(352, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(353, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(354, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(355, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(356, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(357, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(358, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(359, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(360, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(361, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(362, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(363, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(364, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(365, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(366, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(367, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(368, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(369, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(370, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(371, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(372, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(373, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(374, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(375, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(376, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(377, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(378, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(379, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(380, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(381, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(382, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(383, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(384, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(385, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(386, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(387, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(388, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(389, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(390, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(391, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(392, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(393, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(394, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(395, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(396, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(397, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(398, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(399, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(400, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(401, '23444444444', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(402, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(403, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(404, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(405, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(406, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(407, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(408, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(409, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(410, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(411, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(412, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(413, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(414, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(415, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(416, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(417, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(418, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(419, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(420, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(421, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(422, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(423, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(424, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(425, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(426, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(427, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(428, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(429, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(430, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(431, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(432, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(433, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(434, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(435, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(436, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(437, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(438, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(439, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(440, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(441, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(442, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(443, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(444, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(445, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(446, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(447, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(448, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(449, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(450, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(451, '23444444444', '2019-07-19 15:19:23', '2019-07-19 15:19:23');

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
(17, 'Medical History', '2019-07-19 06:45:57', '2019-07-19 06:45:57'),
(18, 'werwerwer', '2019-07-19 07:08:44', '2019-07-19 07:08:44'),
(19, 'Medical History', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(20, 'werwerwer', '2019-07-19 10:46:09', '2019-07-19 10:46:09'),
(21, '233333333333', '2019-07-19 11:22:44', '2019-07-19 11:22:44'),
(22, '233333333333', '2019-07-19 11:26:41', '2019-07-19 11:26:41'),
(23, '233333333333', '2019-07-19 11:37:04', '2019-07-19 11:37:04'),
(24, '233333333333', '2019-07-19 11:37:04', '2019-07-19 11:37:04'),
(25, '233333333333', '2019-07-19 11:38:57', '2019-07-19 11:38:57'),
(26, '233333333333', '2019-07-19 11:38:57', '2019-07-19 11:38:57'),
(27, '233333333333', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(28, '233333333333', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(29, '233333333333', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(30, '233333333333', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(31, '233333333333', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(32, '233333333333', '2019-07-19 11:42:12', '2019-07-19 11:42:12'),
(33, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(34, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(35, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(36, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(37, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(38, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(39, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(40, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(41, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(42, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(43, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(44, '233333333333', '2019-07-19 11:45:49', '2019-07-19 11:45:49'),
(45, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(46, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(47, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(48, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(49, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(50, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(51, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(52, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(53, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(54, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(55, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(56, '233333333333', '2019-07-19 11:45:53', '2019-07-19 11:45:53'),
(57, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(58, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(59, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(60, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(61, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(62, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(63, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(64, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(65, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(66, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(67, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(68, '233333333333', '2019-07-19 11:46:05', '2019-07-19 11:46:05'),
(69, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(70, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(71, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(72, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(73, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(74, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(75, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(76, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(77, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(78, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(79, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(80, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(81, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(82, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(83, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(84, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(85, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(86, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(87, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(88, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(89, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(90, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(91, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(92, '233333333333', '2019-07-19 11:46:06', '2019-07-19 11:46:06'),
(93, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(94, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(95, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(96, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(97, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(98, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(99, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(100, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(101, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(102, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(103, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(104, '233333333333', '2019-07-19 11:46:15', '2019-07-19 11:46:15'),
(105, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(106, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(107, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(108, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(109, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(110, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(111, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(112, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(113, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(114, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(115, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(116, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(117, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(118, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(119, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(120, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(121, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(122, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(123, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(124, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(125, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(126, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(127, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(128, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(129, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(130, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(131, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(132, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(133, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(134, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(135, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(136, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(137, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(138, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(139, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(140, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(141, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(142, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(143, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(144, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(145, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(146, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(147, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(148, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(149, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(150, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(151, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(152, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(153, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(154, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(155, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(156, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(157, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(158, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(159, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(160, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(161, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(162, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(163, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(164, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(165, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(166, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(167, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(168, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(169, '233333333333', '2019-07-19 12:20:10', '2019-07-19 12:20:10'),
(170, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(171, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(172, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(173, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(174, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(175, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(176, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(177, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(178, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(179, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(180, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(181, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(182, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(183, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(184, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(185, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(186, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(187, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(188, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(189, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(190, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(191, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(192, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(193, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(194, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(195, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(196, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(197, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(198, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(199, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(200, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(201, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(202, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(203, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(204, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(205, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(206, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(207, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(208, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(209, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(210, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(211, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(212, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(213, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(214, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(215, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(216, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(217, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(218, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(219, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(220, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(221, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(222, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(223, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(224, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(225, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(226, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(227, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(228, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(229, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(230, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(231, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(232, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(233, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(234, '233333333333', '2019-07-19 12:23:40', '2019-07-19 12:23:40'),
(235, '234234', '2019-07-19 13:27:10', '2019-07-19 13:27:10'),
(236, '234234', '2019-07-19 13:36:37', '2019-07-19 13:36:37'),
(237, '234234', '2019-07-19 13:38:40', '2019-07-19 13:38:40'),
(238, '234234', '2019-07-19 13:38:40', '2019-07-19 13:38:40'),
(239, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(240, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(241, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(242, '234234', '2019-07-19 13:43:11', '2019-07-19 13:43:11'),
(243, '234234', '2019-07-19 13:48:09', '2019-07-19 13:48:09'),
(244, 'Medical History', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(245, 'werwerwer', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(246, 'Medical History', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(247, 'werwerwer', '2019-07-19 14:24:39', '2019-07-19 14:24:39'),
(248, 'Medical History', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(249, 'werwerwer', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(250, 'Medical History', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(251, 'werwerwer', '2019-07-19 14:28:06', '2019-07-19 14:28:06'),
(252, 'Medical History', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(253, 'werwerwer', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(254, 'Medical History', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(255, 'werwerwer', '2019-07-19 14:28:43', '2019-07-19 14:28:43'),
(256, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(257, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(258, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(259, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(260, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(261, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(262, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(263, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(264, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(265, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(266, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(267, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(268, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(269, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(270, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(271, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(272, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(273, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(274, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(275, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(276, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(277, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(278, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(279, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(280, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(281, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(282, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(283, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(284, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(285, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(286, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(287, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(288, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(289, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(290, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(291, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(292, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(293, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(294, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(295, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(296, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(297, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(298, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(299, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(300, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(301, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(302, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(303, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(304, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(305, '233333333333', '2019-07-19 15:10:46', '2019-07-19 15:10:46'),
(306, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(307, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(308, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(309, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(310, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(311, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(312, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(313, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(314, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(315, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(316, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(317, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(318, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(319, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(320, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(321, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(322, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(323, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(324, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(325, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(326, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(327, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(328, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(329, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(330, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(331, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(332, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(333, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(334, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(335, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(336, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(337, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(338, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(339, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(340, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(341, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(342, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(343, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(344, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(345, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(346, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(347, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(348, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(349, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(350, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(351, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(352, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(353, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(354, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(355, '233333333333', '2019-07-19 15:12:16', '2019-07-19 15:12:16'),
(356, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(357, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(358, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(359, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(360, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(361, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(362, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(363, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(364, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(365, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(366, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(367, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(368, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(369, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(370, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(371, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(372, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(373, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(374, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(375, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(376, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(377, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(378, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(379, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(380, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(381, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(382, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(383, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(384, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(385, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(386, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(387, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(388, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(389, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(390, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(391, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(392, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(393, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(394, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(395, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(396, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(397, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(398, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(399, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(400, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(401, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(402, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(403, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(404, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(405, '233333333333', '2019-07-19 15:14:37', '2019-07-19 15:14:37'),
(406, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(407, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(408, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(409, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(410, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(411, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(412, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(413, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(414, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(415, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(416, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(417, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(418, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(419, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(420, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(421, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(422, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(423, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(424, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(425, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(426, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(427, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(428, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(429, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(430, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(431, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(432, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(433, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(434, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(435, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(436, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(437, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(438, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(439, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(440, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(441, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(442, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(443, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(444, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(445, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(446, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(447, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(448, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(449, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(450, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(451, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(452, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(453, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(454, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(455, '233333333333', '2019-07-19 15:17:03', '2019-07-19 15:17:03'),
(456, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(457, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(458, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(459, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(460, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(461, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(462, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(463, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(464, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(465, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(466, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(467, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(468, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(469, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(470, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(471, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(472, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(473, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(474, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(475, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(476, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(477, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(478, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(479, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(480, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(481, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(482, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(483, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(484, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(485, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(486, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(487, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(488, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(489, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(490, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(491, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(492, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(493, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(494, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(495, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(496, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(497, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(498, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(499, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(500, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(501, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(502, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(503, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(504, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(505, '233333333333', '2019-07-19 15:18:32', '2019-07-19 15:18:32'),
(506, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(507, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(508, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(509, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(510, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(511, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(512, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(513, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(514, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(515, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(516, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(517, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(518, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(519, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(520, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(521, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(522, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(523, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(524, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(525, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(526, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(527, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(528, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(529, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(530, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(531, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(532, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(533, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(534, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(535, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(536, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(537, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(538, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(539, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(540, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(541, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(542, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(543, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(544, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(545, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(546, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(547, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(548, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(549, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(550, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(551, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(552, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(553, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(554, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23'),
(555, '233333333333', '2019-07-19 15:19:23', '2019-07-19 15:19:23');

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
(13, 'new pharmacy', '1131322132', NULL, 1, '2019-07-18 11:10:46', '2019-07-18 11:10:46'),
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
(54, 'ewerwe', '2344444444', NULL, 1, '2019-07-19 13:27:10', '2019-07-19 13:27:10');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) UNSIGNED NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `medication` varchar(100) NOT NULL,
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
(1, 27, 'Prescription', '1132', 1, NULL, '1231231233', NULL, NULL, 1, '2019-07-22 06:17:01', '2019-06-21 12:45:54'),
(3, 1, 'Prescription', '1132', 1, NULL, '123123123', NULL, NULL, 1, '2019-06-21 12:51:14', '2019-06-21 12:45:54'),
(4, 32, 'asdasdasdasdasdasdasd', 'asdasd', 1, 'asd', '1234567899', 'asd', 'asdasd', 1, '2019-07-22 06:17:47', '2019-06-22 05:28:54');

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
(1, 'Is the patient pregnant, trying to become pregnant, or nursing?', 1, 1, 'Text Area', '', '', 1, '2019-07-18 08:08:11', '2019-06-19 18:30:00'),
(2, 'Where is it 2?', 2, 1, 'Text Area', '', '', 1, '2019-06-20 05:45:04', '2019-06-19 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `question_answer_templates`
--

CREATE TABLE `question_answer_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(100) NOT NULL,
  `chief_complaints` int(10) UNSIGNED NOT NULL,
  `patient_gender` tinyint(1) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL COMMENT 'Admin ID',
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_answer_templates`
--

INSERT INTO `question_answer_templates` (`id`, `question`, `chief_complaints`, `patient_gender`, `created_by`, `status`, `updated_datetime`, `created_datetime`) VALUES
(3, 'Female Patient with Eczema3', 3, 1, 1, 1, '2019-06-17 00:46:50', '2019-06-17 01:40:07'),
(4, 'Female Patient with Eczema4', 4, 1, 1, 1, '2019-06-17 00:46:50', '2019-06-17 01:40:07'),
(5, 'Female Patient with Eczema5', 5, 1, 1, 1, '2019-06-17 00:46:50', '2019-06-17 01:40:07'),
(6, 'Question Template', 3, 0, 1, 1, '2019-06-17 04:03:41', '2019-06-17 04:03:41'),
(7, 'New Question Answer Template', 5, 0, 1, 1, '2019-06-17 04:04:16', '2019-06-17 04:04:16'),
(8, 'Question Answer part2', 6, 0, 1, 1, '2019-06-17 04:05:45', '2019-06-17 04:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `question_choices`
--

CREATE TABLE `question_choices` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_answer` varchar(100) NOT NULL,
  `question_answer_id` int(10) UNSIGNED NOT NULL,
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
(7, 'New Question choice', 1, NULL, NULL, 0, '2019-07-22 05:29:20', '2019-06-21 06:46:23'),
(8, 'New second choice', 8, NULL, NULL, 1, '2019-06-21 07:04:21', '2019-06-21 06:46:55'),
(10, 'New Question choice 5', 1, NULL, NULL, 1, '2019-07-22 06:14:32', '2019-06-21 06:48:00'),
(13, 'teset 1234', 2, NULL, NULL, 1, '2019-07-22 05:30:10', '2019-07-22 05:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `refferal_codes`
--

CREATE TABLE `refferal_codes` (
  `id` int(10) UNSIGNED NOT NULL,
  `org_name` varchar(100) NOT NULL,
  `referral_code` varchar(100) NOT NULL,
  `provider_id` int(10) UNSIGNED NOT NULL,
  `comments` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'We will store care giver user id here',
  `case_id` int(10) UNSIGNED NOT NULL,
  `type_of_card` enum('Visa','Mastercard','American Express','Discover') NOT NULL,
  `consult_fee` varchar(100) NOT NULL,
  `type_of_code` enum('discount','referral') DEFAULT NULL,
  `ref_discount_code` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `street_address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL,
  `zip_code` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `transaction_status` enum('Failed','Successful','Pending') NOT NULL,
  `transaction_message` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, '1', 'admin', 'Mr.', 'Admin', 'SkinMD', 'Now', 0, '2019-06-11', '9825098250', 'demo@mailinator.com', '$2y$10$3BDvrdgYRNPsqD9I5AJEIucaUFbjYBVuTJB794hclVSXL2EAdFyHa', NULL, 0, 1, '1,2,4', '0', '', '', '', 1, 1, 0, NULL, 0, 1, '2019-07-13 15:03:33', '2019-06-07 06:09:08'),
(66, '2', 'brendan', 'Dr.', 'Brendan', '', 'Pillemer', 0, '1988-06-11', '9825098250', 'brendan@mailinator.com', '$2y$10$3BDvrdgYRNPsqD9I5AJEIucaUFbjYBVuTJB794hclVSXL2EAdFyHa', 'YOlhpdaHU70e1tWjxewNCkqAuzhb4C3qN3xr0RIOVTzJNURu6SZuon6FNiFY', 0, 1, '1,3,5', '30', 'MD, PHD, FAAD', '1184850992', '1562750159.png', 1, 1, 0, NULL, 0, 1, '2019-07-15 11:25:29', '2019-06-07 06:09:08'),
(67, '3', 'brendan1', NULL, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', '9825098250', 'brendan1@mailinator.com', '$2y$10$3BDvrdgYRNPsqD9I5AJEIucaUFbjYBVuTJB794hclVSXL2EAdFyHa', '9y9k80x2eTa0AoyX45keSuhzSolJj5cq3adcB8AyQ20st1RccakXpQiHKpf3', 0, 1, '2,4,6', '30', 'MD, PHD, FAAD', '1184850992', '', 1, 1, 0, NULL, 1, 1, '2019-07-19 15:20:13', '2019-06-07 06:09:08'),
(73, '3', 'sdfsdfsdf', NULL, 'Care giver', NULL, 'last bnaem', 0, '1997-07-17', '9825098250', 'brendsdfan@mailinator.com', '$2y$10$nVnXftmWi.XnddsFrm0tweYP1JlIWBXzgg4dqoz.J4lJBoG9gm3By', NULL, 0, NULL, '1,2,4', '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-07-13 15:03:40', '2019-07-08 03:34:28'),
(74, '2', 'sdfsdf', NULL, 'sdfsf', NULL, 'sdf', 0, '2000-07-06', NULL, 'nsdfsdfdsdfan@mailinator.com', '$2y$10$GvaZOtbmB14zv9cewYsJweNaEnvVAQvqydG9wkj5jszZFUb8iO8Ei', NULL, NULL, 1, '1,2,4', '0', NULL, NULL, '1562752376.png', 1, 1, 2, NULL, 0, 1, '2019-07-13 15:03:42', '2019-07-10 04:23:27'),
(75, '2', 'asdasdasdasd', 'asd', 'asd', NULL, 'asd', 0, '1996-07-03', NULL, 'brqweendan@mailinator.comq', '$2y$10$xHx6yspxlObfIxvyTHg3WeFBuxBPlfHCjS1dDn40h0vfPMaqhRGKC', NULL, NULL, 1, '1,2,4', '0', NULL, NULL, '1562752583.png', 1, 0, 2, NULL, 0, 1, '2019-07-13 15:03:44', '2019-07-10 04:26:28'),
(76, '2', 'asd74asdasd', NULL, 'Patient anilsaini', NULL, 'Pillemer5', 0, '1999-07-15', NULL, 'patiemnt@mailinator.com', '$2y$10$eyQWjlnKPkSla579F/98yOT1RU4nE.kVNm/R7vEOIEhz./WYHakl2', NULL, NULL, 1, '1,2,4', '0', NULL, NULL, '1562753530.png', 1, 2, 2, NULL, 0, 1, '2019-07-13 15:03:46', '2019-07-10 04:42:16'),
(77, '2', ';klk;l', NULL, 'k;k;l', NULL, 'k;k;lklk', 0, '1996-07-02', NULL, 'sdfsdf@sdfs.fsdf', '$2y$10$gs/eAI3RA3d7uJjPOPTXE.fFtKEdNH9zaqrLBHrqlyPtecKeE2QJi', NULL, NULL, 1, '3,5,4,7', '30', NULL, NULL, NULL, 1, 1, 1, NULL, 0, 1, '2019-07-21 11:43:13', '2019-07-21 09:59:30');

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
(65, 'UEqiHgTTdOdwOtvu84XWdnH7SPX2XEBR7xdA7J0Z', '2019-06-29 04:16:11', '2019-06-29 04:16:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
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
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `body_areas`
--
ALTER TABLE `body_areas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `case_additional_info`
--
ALTER TABLE `case_additional_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `case_photos`
--
ALTER TABLE `case_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_medical_history`
--
ALTER TABLE `family_medical_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=556;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT for table `patient_details`
--
ALTER TABLE `patient_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `patient_drug_allergies`
--
ALTER TABLE `patient_drug_allergies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

--
-- AUTO_INCREMENT for table `patient_medical_history`
--
ALTER TABLE `patient_medical_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=556;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `question_answer_templates`
--
ALTER TABLE `question_answer_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `question_choices`
--
ALTER TABLE `question_choices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `refferal_codes`
--
ALTER TABLE `refferal_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specilities`
--
ALTER TABLE `specilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_of_problem`
--
ALTER TABLE `type_of_problem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

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
