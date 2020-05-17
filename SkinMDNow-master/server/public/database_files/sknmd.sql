-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2019 at 04:19 PM
-- Server version: 10.1.40-MariaDB
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
-- Database: `sknmd`
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
  `name` varchar(30) NOT NULL,
  `gender_type` tinyint(3) UNSIGNED NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_number` varchar(30) NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(10) UNSIGNED NOT NULL COMMENT 'Doctor''s ID, selected from request form',
  `relation_with_patient` enum('Self','Mother','Father','Spouse','HealthCare Professional','Other') NOT NULL,
  `patient_fname` varchar(30) NOT NULL,
  `patient_midname` varchar(30) DEFAULT NULL,
  `patient_lname` varchar(30) DEFAULT NULL,
  `reply_email_from_provider` varchar(30) NOT NULL COMMENT 'Email where Provider''s reply will be sent',
  `phone_number` varchar(30) NOT NULL,
  `photos_ids` varchar(100) DEFAULT NULL,
  `consult_cost` varchar(100) NOT NULL,
  `refferal_code_id` int(10) UNSIGNED DEFAULT NULL,
  `follow_up` text,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `questions_answer` blob,
  `prescriptions_ids` int(10) UNSIGNED DEFAULT NULL,
  `submitted_by` int(10) UNSIGNED NOT NULL COMMENT 'Patient ID, will store when pationet submit form so login id will store here',
  `submitted_on` date NOT NULL,
  `affected_area_gender` tinyint(3) UNSIGNED NOT NULL,
  `affected_area_side` tinyint(3) UNSIGNED NOT NULL,
  `affected_area_list` varchar(100) NOT NULL,
  `is_pregnant` enum('No','Pregnant','Trying to conceive','Breast-feeding') NOT NULL,
  `status` enum('Active','Resolved','Cancelled','') NOT NULL COMMENT 'Case Status will be one from this ''Active'', ''Resolved'', ''Cancelled''',
  `case_priority` enum('Normal') NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id`, `case_number`, `patient_id`, `provider_id`, `relation_with_patient`, `patient_fname`, `patient_midname`, `patient_lname`, `reply_email_from_provider`, `phone_number`, `photos_ids`, `consult_cost`, `refferal_code_id`, `follow_up`, `bill_id`, `questions_answer`, `prescriptions_ids`, `submitted_by`, `submitted_on`, `affected_area_gender`, `affected_area_side`, `affected_area_list`, `is_pregnant`, `status`, `case_priority`, `updated_datetime`, `created_datetime`) VALUES
(1, 'GGIGIUGIUWEJHVJH-987987', 3, 2, 'Self', 'Anil', 'M', 'Saini', 'test@mailinator.com', '89798789987', '', '121', 0, '', 0, '', 0, 1, '2019-06-07', 1, 1, '1', 'No', 'Active', 'Normal', '2019-06-07 15:09:42', '2019-06-10 22:33:09'),
(2, 'GGIGIUGIUWEJHVJH-987988', 3, 2, 'Self', 'Ramesh', 'M', 'Saini', 'test@mailinator.com', '89798789987', '', '121', 0, '', 0, '', 0, 1, '2019-06-07', 1, 1, '1', 'No', 'Resolved', 'Normal', '2019-06-07 15:09:53', '2019-06-03 01:01:19'),
(3, 'GGIGIUGIUWEJHVJH-9879889', 3, 2, 'Self', 'Kushal', 'M', 'Saini', 'test@mailinator.com', '89798789987', '', '121', 0, '', 0, '', 0, 1, '2019-06-07', 1, 1, '1', 'No', 'Active', 'Normal', '2019-06-07 15:10:03', '2019-06-03 02:01:37'),
(4, 'GGIGIUGIUWEJHVJH-9963', 3, 2, 'Self', 'Navin', 'M', 'Saini', 'test@mailinator.com', '89798789987', '', '121', 0, '', 0, NULL, 0, 1, '2019-06-07', 1, 1, '1', 'No', 'Resolved', 'Normal', '2019-06-07 15:10:13', '2019-06-25 06:43:34'),
(5, 'GGIGIUGIUWEJHVJH-1233987', 3, 2, 'Self', 'Gaurav', 'M', 'Saini', 'test@mailinator.com', '89798789987', '', '121', 0, '', 0, NULL, 0, 1, '2019-06-07', 1, 1, '1', 'No', 'Resolved', 'Normal', '2019-06-07 15:10:25', '2019-06-17 10:04:32');

-- --------------------------------------------------------

--
-- Table structure for table `case_photos`
--

CREATE TABLE `case_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `img_name` varchar(30) NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chief_complaints`
--

CREATE TABLE `chief_complaints` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `owner` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `display_order` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('Percentage','Amount','','') NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `id` int(10) UNSIGNED NOT NULL,
  `pharmacy_name` varchar(30) NOT NULL,
  `pharmacy_fax` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) UNSIGNED NOT NULL,
  `medication` varchar(100) NOT NULL,
  `frequency` varchar(30) NOT NULL,
  `pharmacy` int(11) UNSIGNED NOT NULL,
  `quantity` varchar(30) NOT NULL,
  `fax_pharmacy` varchar(30) NOT NULL,
  `refills` varchar(30) NOT NULL,
  `comments` varchar(100) NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `notes` text NOT NULL,
  `notes_attachment` varchar(100) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question_answer_template`
--

CREATE TABLE `question_answer_template` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(100) NOT NULL,
  `chief_complaints` int(10) UNSIGNED NOT NULL,
  `patient_gender` tinyint(1) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question_choices`
--

CREATE TABLE `question_choices` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_answer` varchar(100) NOT NULL,
  `question_answer_id` int(10) UNSIGNED NOT NULL,
  `notes` text NOT NULL,
  `notes_attachment` varchar(100) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `updated_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(30) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `Title` varchar(30) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `mname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `gender` tinyint(1) UNSIGNED NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `health_care_professional` tinyint(1) UNSIGNED NOT NULL,
  `new_consults` tinyint(1) UNSIGNED NOT NULL,
  `speciality` varchar(100) NOT NULL,
  `consult_fee` varchar(30) NOT NULL,
  `degrees` varchar(100) NOT NULL,
  `npi` varchar(30) NOT NULL,
  `user_image` varchar(100) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `license_type` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `username`, `Title`, `fname`, `mname`, `lname`, `gender`, `dob`, `phone`, `email`, `password`, `remember_token`, `health_care_professional`, `new_consults`, `speciality`, `consult_fee`, `degrees`, `npi`, `user_image`, `status`, `license_type`, `created_by`, `updated_at`, `created_at`) VALUES
(1, '1', 'demo@gmail.com', 'Mr.', 'Admin', 'SkinMD', 'Now', 1, '2019-06-11', '9825098250', 'demo@gmail.com', '$2y$10$3BDvrdgYRNPsqD9I5AJEIucaUFbjYBVuTJB794hclVSXL2EAdFyHa', NULL, 0, 0, '', '', '', '', '', 1, 0, 1, '2019-06-07 06:11:06', '2019-06-07 06:09:08'),
(2, '2', 'practitioner@mailinator.com', 'Mr.', 'Practitioner', 'SkinMD', 'Now', 1, '2019-06-11', '9825098250', 'practitioner@mailinator.com', '$2y$10$3BDvrdgYRNPsqD9I5AJEIucaUFbjYBVuTJB794hclVSXL2EAdFyHa', NULL, 0, 0, '', '', '', '', '', 1, 0, 1, '2019-06-07 06:11:06', '2019-06-07 06:09:08'),
(3, '3', 'patient@mailinator.com', 'Mr.', 'Patient', 'SkinMD', 'Now', 1, '2019-06-11', '9825098250', 'patient@mailinator.com', '$2y$10$3BDvrdgYRNPsqD9I5AJEIucaUFbjYBVuTJB794hclVSXL2EAdFyHa', NULL, 0, 0, '', '', '', '', '', 1, 0, 1, '2019-06-07 06:14:59', '2019-06-07 06:09:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(25) NOT NULL,
  `permission_modules` varchar(100) NOT NULL,
  `created_by` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `user_type`, `permission_modules`, `created_by`, `modified_by`) VALUES
(1, 'Admin', '', '2019-05-24 07:09:10', '0000-00-00 00:00:00'),
(2, 'Practitioner', '', '2019-06-07 06:13:04', '0000-00-00 00:00:00'),
(3, 'Patient', '', '2019-05-24 07:09:39', '0000-00-00 00:00:00');

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
-- Indexes for table `question_answer_template`
--
ALTER TABLE `question_answer_template`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `case_photos`
--
ALTER TABLE `case_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chief_complaints`
--
ALTER TABLE `chief_complaints`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_answer_template`
--
ALTER TABLE `question_answer_template`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_choices`
--
ALTER TABLE `question_choices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refferal_codes`
--
ALTER TABLE `refferal_codes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
