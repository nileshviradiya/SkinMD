-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2019 at 05:43 PM
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
(25, 'CSRU5-SI0O2-4UGQQ-IPPMF', 67, NULL, 66, 63, 'Anil', NULL, 'SAini', 0, '2001-07-03', 3, 'testnewuser@mailinator.com', '9825098250', 29, 16, 16, 16, 16, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, 0, '0000-00-00', 14, 0, '', NULL, '', '', NULL, 0, 'Active', 'Normal', '2019-07-18 15:23:21', '2019-07-18 14:31:13');

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
(1, 'Acne', 40, NULL, 1, 0, '2019-07-01 06:59:46', '2019-06-16 17:00:00'),
(2, 'Rash', 1, '', 2, 1, '2019-06-17 00:35:49', '2019-06-16 17:00:00'),
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
(11, '234234', '2019-07-18 15:17:32', '2019-07-18 15:17:32'),
(12, '234234', '2019-07-18 15:18:23', '2019-07-18 15:18:23'),
(13, '234234', '2019-07-18 15:21:14', '2019-07-18 15:21:14'),
(14, '234234', '2019-07-18 15:22:04', '2019-07-18 15:22:04'),
(15, '234234', '2019-07-18 15:22:41', '2019-07-18 15:22:41'),
(16, '234234', '2019-07-18 15:23:21', '2019-07-18 15:23:21');

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
(11, '234234', '2019-07-18 15:17:32', '2019-07-18 15:17:32'),
(12, '234234', '2019-07-18 15:18:23', '2019-07-18 15:18:23'),
(13, '234234', '2019-07-18 15:21:14', '2019-07-18 15:21:14'),
(14, '234234', '2019-07-18 15:22:04', '2019-07-18 15:22:04'),
(15, '234234', '2019-07-18 15:22:41', '2019-07-18 15:22:41'),
(16, '234234', '2019-07-18 15:23:21', '2019-07-18 15:23:21');

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
(61, 67, 3, 'Anil', NULL, 'SAini', 0, '2001-07-03', 'testnewuser@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, '2019-07-18 14:30:24', '2019-07-18 14:30:24'),
(62, 67, 3, 'Anil', NULL, 'SAini', 0, '2001-07-03', 'testnewuser@mailinator.com', '9825098250', NULL, NULL, NULL, NULL, NULL, '2019-07-18 14:30:32', '2019-07-18 14:30:32'),
(63, 67, 3, 'Anil', NULL, 'SAini', 0, '2001-07-03', 'testnewuser@mailinator.com', '9825098250', '29', '16', '16', '16', '16', '2019-07-18 14:31:13', '2019-07-18 14:31:13');

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
(11, '23444444444444', '2019-07-18 15:17:32', '2019-07-18 15:17:32'),
(12, '23444444444444', '2019-07-18 15:18:23', '2019-07-18 15:18:23'),
(13, '23444444444444', '2019-07-18 15:21:14', '2019-07-18 15:21:14'),
(14, '23444444444444', '2019-07-18 15:22:04', '2019-07-18 15:22:04'),
(15, '23444444444444', '2019-07-18 15:22:41', '2019-07-18 15:22:41'),
(16, '23444444444444', '2019-07-18 15:23:21', '2019-07-18 15:23:21');

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
(11, '234234234', '2019-07-18 15:17:32', '2019-07-18 15:17:32'),
(12, '234234234', '2019-07-18 15:18:23', '2019-07-18 15:18:23'),
(13, '234234234', '2019-07-18 15:21:14', '2019-07-18 15:21:14'),
(14, '234234234', '2019-07-18 15:22:04', '2019-07-18 15:22:04'),
(15, '234234234', '2019-07-18 15:22:41', '2019-07-18 15:22:41'),
(16, '234234234', '2019-07-18 15:23:21', '2019-07-18 15:23:21');

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
(29, 'dfgdfg', '2344444444', NULL, 1, '2019-07-18 15:23:21', '2019-07-18 15:23:21');

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
(1, 1, 'Prescription', '1132', 1, NULL, '123123123', NULL, NULL, 1, '2019-06-21 12:51:14', '2019-06-21 12:45:54'),
(3, 1, 'Prescription', '1132', 1, NULL, '123123123', NULL, NULL, 1, '2019-06-21 12:51:14', '2019-06-21 12:45:54'),
(4, 1, 'asdasdasdasdasdasdasd', 'asdasd', 1, 'asd', '1234567899', 'asd', 'asdasd', 1, '2019-06-22 05:28:54', '2019-06-22 05:28:54'),
(6, 1, 'sdfsdfsdfsdfsfsdf', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-07-03 14:23:31', '2019-07-03 14:23:31'),
(7, 1, 'sdasdadsdasd', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-07-03 14:23:42', '2019-07-03 14:23:42');

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
(7, 'New Question choice', 5, NULL, NULL, 0, '2019-06-21 07:04:02', '2019-06-21 06:46:23'),
(8, 'New second choice', 8, NULL, NULL, 1, '2019-06-21 07:04:21', '2019-06-21 06:46:55'),
(10, 'New Question choice 5', 5, NULL, NULL, 1, '2019-06-21 07:04:51', '2019-06-21 06:48:00');

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
(67, '3', 'brendan1', NULL, 'Mark', NULL, 'Pillemer', 0, '1988-06-11', '9825098250', 'brendan1@mailinator.com', '$2y$10$3BDvrdgYRNPsqD9I5AJEIucaUFbjYBVuTJB794hclVSXL2EAdFyHa', 'Jeuep3uj8e7eHYNLboFzNlKHPgOBnzKwz0mTX9snGMA3Zy9L6QUe6iVaRc6I', 0, 1, '2,4,6', '30', 'MD, PHD, FAAD', '1184850992', '', 1, 1, 0, NULL, 1, 1, '2019-07-17 05:43:18', '2019-06-07 06:09:08'),
(73, '3', 'sdfsdfsdf', NULL, 'Care giver', NULL, 'last bnaem', 0, '1997-07-17', '9825098250', 'brendsdfan@mailinator.com', '$2y$10$nVnXftmWi.XnddsFrm0tweYP1JlIWBXzgg4dqoz.J4lJBoG9gm3By', NULL, 0, NULL, '1,2,4', '0', NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 1, '2019-07-13 15:03:40', '2019-07-08 03:34:28'),
(74, '2', 'sdfsdf', NULL, 'sdfsf', NULL, 'sdf', 0, '2000-07-06', NULL, 'nsdfsdfdsdfan@mailinator.com', '$2y$10$GvaZOtbmB14zv9cewYsJweNaEnvVAQvqydG9wkj5jszZFUb8iO8Ei', NULL, NULL, 1, '1,2,4', '0', NULL, NULL, '1562752376.png', 1, 1, 2, NULL, 0, 1, '2019-07-13 15:03:42', '2019-07-10 04:23:27'),
(75, '2', 'asdasdasdasd', 'asd', 'asd', NULL, 'asd', 0, '1996-07-03', NULL, 'brqweendan@mailinator.comq', '$2y$10$xHx6yspxlObfIxvyTHg3WeFBuxBPlfHCjS1dDn40h0vfPMaqhRGKC', NULL, NULL, 1, '1,2,4', '0', NULL, NULL, '1562752583.png', 1, 0, 2, NULL, 0, 1, '2019-07-13 15:03:44', '2019-07-10 04:26:28'),
(76, '2', 'asd74asdasd', NULL, 'Patient anilsaini', NULL, 'Pillemer5', 0, '1999-07-15', NULL, 'patiemnt@mailinator.com', '$2y$10$eyQWjlnKPkSla579F/98yOT1RU4nE.kVNm/R7vEOIEhz./WYHakl2', NULL, NULL, 1, '1,2,4', '0', NULL, NULL, '1562753530.png', 1, 2, 2, NULL, 0, 1, '2019-07-13 15:03:46', '2019-07-10 04:42:16');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `case_additional_info`
--
ALTER TABLE `case_additional_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `case_photos`
--
ALTER TABLE `case_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `patient_details`
--
ALTER TABLE `patient_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `patient_drug_allergies`
--
ALTER TABLE `patient_drug_allergies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `patient_medical_history`
--
ALTER TABLE `patient_medical_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

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
