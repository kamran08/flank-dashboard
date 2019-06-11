-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2019 at 06:58 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adonis_flank`
--

-- --------------------------------------------------------

--
-- Table structure for table `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '1553685009200_user', 1, '2019-04-03 13:56:22'),
(2, '1553685009207_token', 1, '2019-04-03 13:56:22'),
(5, '1554389852524_review_schema', 2, '2019-04-04 15:10:16'),
(7, '1554390189840_legend_schema', 3, '2019-04-04 15:17:16'),
(8, '1554641568596_legend_image_schema', 4, '2019-04-07 12:55:21'),
(9, '1554641581168_review_image_schema', 4, '2019-04-07 12:55:21'),
(10, '1554675365235_question_schema', 5, '2019-04-07 22:19:45'),
(11, '1554675402398_answers_schema', 5, '2019-04-07 22:19:45'),
(13, '1554898110876_busniess_hour_schema', 7, '2019-04-10 12:30:30'),
(14, '1555240536646_pulse_schema', 8, '2019-04-14 11:39:19'),
(15, '1555314652073_attribute_schema', 9, '2019-04-15 08:17:50'),
(16, '1555314671143_review_attribute_schema', 9, '2019-04-15 08:17:50'),
(19, '1556457272451_school_schema', 10, '2019-04-29 13:32:18'),
(20, '1556534073075_school_coach_schema', 10, '2019-04-29 13:32:18'),
(21, '1557006652805_school_coach_review_schema', 11, '2019-05-04 21:53:32'),
(22, '1557090430435_coach_review_image_schema', 12, '2019-05-05 21:10:25'),
(23, '1557122529041_coach_review_attributes_schema', 13, '2019-05-06 06:04:54'),
(24, '1554883104457_reviewimo_schema', 14, '2019-05-09 07:17:37'),
(25, '1558985138053_coach_imos_schema', 15, '2019-05-27 19:28:02'),
(26, '1559037376779_school_question_schema', 16, '2019-05-28 09:58:33'),
(27, '1559037387142_school_answer_schema', 16, '2019-05-28 09:58:33'),
(29, '1559089935858_product_schema', 17, '2019-05-29 10:25:09'),
(30, '1559325291077_recent_review_schema', 18, '2019-05-31 17:56:17'),
(31, '1559379229895_product_review_atrribute_schema', 19, '2019-06-01 09:00:46'),
(32, '1559379253801_product_review_schema', 19, '2019-06-01 09:00:46'),
(33, '1559379262497_product_question_schema', 19, '2019-06-01 09:00:46'),
(34, '1559379274691_product_answer_schema', 19, '2019-06-01 09:00:46'),
(35, '1559379388081_product_image_schema', 19, '2019-06-01 09:00:46'),
(36, '1559379408058_product_review_image_schema', 19, '2019-06-01 09:00:46'),
(37, '1559379498437_product_imo_schema', 19, '2019-06-01 09:00:46');

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `question_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 'This is the Frist question First answer', '2019-04-08 15:52:53', '2019-04-08 15:52:53'),
(4, 3, 1, 'This is some ', '2019-04-09 23:34:00', '2019-04-09 23:34:00'),
(5, 3, 1, 'This is some ', '2019-04-09 23:34:10', '2019-04-09 23:34:10'),
(6, 3, 1, 'This is some ', '2019-04-09 23:34:12', '2019-04-09 23:34:12'),
(7, 4, 3, 'This is some answers...!', '2019-04-10 23:50:08', '2019-04-10 23:50:08'),
(8, 5, 3, 'This is lot of answer!', '2019-04-10 23:50:52', '2019-04-10 23:50:52'),
(9, 4, 3, 'this is some answer', '2019-04-10 23:57:52', '2019-04-10 23:57:52'),
(10, 4, 3, 'answer!1', '2019-04-10 23:59:47', '2019-04-10 23:59:47'),
(11, NULL, 4, 'This is good question...', '2019-04-23 20:15:17', '2019-04-23 20:15:17'),
(12, 5, 4, 'This is good question...', '2019-04-23 20:35:28', '2019-04-23 20:35:28'),
(13, 5, 4, 'This is excellent question...', '2019-04-23 20:36:24', '2019-04-23 20:36:24'),
(14, 9, 4, 'This is Sad!', '2019-04-24 14:44:40', '2019-04-24 14:44:40'),
(15, 9, 4, 'This is poor!', '2019-04-24 14:45:13', '2019-04-24 14:45:13'),
(16, 8, 4, 'This is nice Question!', '2019-05-01 13:29:12', '2019-05-01 13:29:12');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` text,
  `points` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `content`, `points`, `created_at`, `updated_at`) VALUES
(1, 'Does He ride the storm?', 5, '2019-04-15 00:00:00', NULL),
(2, 'Cookie Cutter approach?', 5, '2019-04-15 00:00:00', NULL),
(3, 'Does he bring supplies?', 10, '2019-04-15 00:00:00', NULL),
(4, 'Quick heals for games?', 5, '2019-04-15 00:00:00', NULL),
(5, 'Does he pass the sniff test?', 5, '2019-04-15 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `busniess_hours`
--

CREATE TABLE `busniess_hours` (
  `id` int(10) UNSIGNED NOT NULL,
  `legend_id` int(10) UNSIGNED DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `busniess_hours`
--

INSERT INTO `busniess_hours` (`id`, `legend_id`, `time`, `day`, `created_at`, `updated_at`) VALUES
(3, 3, '10:00 AM-03:00 PM', 'Monday', '2019-04-10 19:48:23', '2019-04-10 19:48:23'),
(4, 3, '02:00 AM-07:00 AM', 'Tuesday', '2019-04-10 19:48:23', '2019-04-10 19:48:23'),
(5, 3, '11:00 AM-03:00 PM', 'Wednesday', '2019-04-10 19:48:23', '2019-04-10 19:48:23'),
(6, 2, '11:00 AM-08:00 PM', 'Monday', '2019-04-18 15:24:08', '2019-04-18 15:24:08'),
(7, 2, '11:00 AM-08:00 PM', 'Tuesday', '2019-04-18 15:24:08', '2019-04-18 15:24:08'),
(8, 2, '11:00 AM-08:00 PM', 'Wednesday', '2019-04-18 15:24:08', '2019-04-18 15:24:08'),
(9, 2, '11:00 AM-08:00 PM', 'Thursday', '2019-04-18 15:24:08', '2019-04-18 15:24:08'),
(10, 2, '11:00 AM-08:00 PM', 'Saturday', '2019-04-18 15:24:08', '2019-04-18 15:24:08'),
(11, 2, '11:00 AM-08:00 PM', 'Sunday', '2019-04-18 15:24:08', '2019-04-18 15:24:08'),
(23, 1, '10:00 AM-06:00 PM', 'Tuesday', '2019-05-19 16:12:59', '2019-05-19 16:12:59'),
(24, 5, '06:00 PM-08:00 PM', 'Monday', '2019-05-29 05:58:34', '2019-05-29 05:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `coach_imos`
--

CREATE TABLE `coach_imos` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cool` int(11) DEFAULT '0',
  `funny` int(11) DEFAULT '0',
  `useful` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coach_imos`
--

INSERT INTO `coach_imos` (`id`, `review_id`, `user_id`, `cool`, `funny`, `useful`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, 1, 0, '2019-05-28 15:54:19', '2019-05-28 15:54:19'),
(2, 1, 1, 0, 0, 1, '2019-05-28 15:54:42', '2019-05-28 15:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `coach_review_attributes`
--

CREATE TABLE `coach_review_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED DEFAULT NULL,
  `attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coach_review_attributes`
--

INSERT INTO `coach_review_attributes` (`id`, `review_id`, `attribute_id`, `user_id`, `points`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, 5, '2019-05-06 12:36:58', '2019-05-06 12:36:58'),
(2, 1, 2, 4, 5, '2019-05-06 12:36:58', '2019-05-06 12:36:58'),
(3, 1, 3, 4, -10, '2019-05-06 12:36:58', '2019-05-06 12:36:58'),
(4, 1, 4, 4, 5, '2019-05-06 12:36:58', '2019-05-06 12:36:58'),
(5, 1, 5, 4, 5, '2019-05-06 12:36:58', '2019-05-06 12:36:58'),
(6, 2, 1, 1, 5, '2019-05-28 06:17:47', '2019-05-28 06:17:47'),
(7, 2, 2, 1, 5, '2019-05-28 06:17:47', '2019-05-28 06:17:47'),
(8, 2, 3, 1, 10, '2019-05-28 06:17:47', '2019-05-28 06:17:47'),
(9, 2, 4, 1, 5, '2019-05-28 06:17:47', '2019-05-28 06:17:47'),
(10, 2, 5, 1, -5, '2019-05-28 06:17:47', '2019-05-28 06:17:47'),
(11, 3, 1, 8, 5, '2019-05-30 01:47:36', '2019-05-30 01:47:36'),
(12, 3, 2, 8, 5, '2019-05-30 01:47:36', '2019-05-30 01:47:36'),
(13, 3, 3, 8, -10, '2019-05-30 01:47:36', '2019-05-30 01:47:36'),
(14, 3, 4, 8, 5, '2019-05-30 01:47:36', '2019-05-30 01:47:36'),
(15, 3, 5, 8, 5, '2019-05-30 01:47:36', '2019-05-30 01:47:36'),
(16, 4, 1, 8, 5, '2019-05-31 21:44:56', '2019-05-31 21:44:56'),
(17, 4, 2, 8, 5, '2019-05-31 21:44:56', '2019-05-31 21:44:56'),
(18, 4, 3, 8, 10, '2019-05-31 21:44:56', '2019-05-31 21:44:56'),
(19, 4, 4, 8, -5, '2019-05-31 21:44:56', '2019-05-31 21:44:56'),
(20, 4, 5, 8, 5, '2019-05-31 21:44:56', '2019-05-31 21:44:56'),
(21, 5, 1, 8, 5, '2019-05-31 21:45:45', '2019-05-31 21:45:45'),
(22, 5, 2, 8, 5, '2019-05-31 21:45:45', '2019-05-31 21:45:45'),
(23, 5, 3, 8, 10, '2019-05-31 21:45:45', '2019-05-31 21:45:45'),
(24, 5, 4, 8, -5, '2019-05-31 21:45:46', '2019-05-31 21:45:46'),
(25, 5, 5, 8, 5, '2019-05-31 21:45:46', '2019-05-31 21:45:46'),
(26, 6, 1, 8, 5, '2019-05-31 21:55:35', '2019-05-31 21:55:35'),
(27, 6, 2, 8, 5, '2019-05-31 21:55:35', '2019-05-31 21:55:35'),
(28, 6, 3, 8, -10, '2019-05-31 21:55:35', '2019-05-31 21:55:35'),
(29, 6, 4, 8, -5, '2019-05-31 21:55:35', '2019-05-31 21:55:35'),
(30, 6, 5, 8, 5, '2019-05-31 21:55:35', '2019-05-31 21:55:35'),
(31, 7, 1, 8, -5, '2019-05-31 21:58:26', '2019-05-31 21:58:26'),
(32, 7, 2, 8, -5, '2019-05-31 21:58:26', '2019-05-31 21:58:26'),
(33, 7, 3, 8, 10, '2019-05-31 21:58:26', '2019-05-31 21:58:26'),
(34, 7, 4, 8, 5, '2019-05-31 21:58:26', '2019-05-31 21:58:26'),
(35, 7, 5, 8, -5, '2019-05-31 21:58:26', '2019-05-31 21:58:26'),
(36, 8, 1, 8, 5, '2019-05-31 22:00:06', '2019-05-31 22:00:06'),
(37, 8, 2, 8, 5, '2019-05-31 22:00:06', '2019-05-31 22:00:06'),
(38, 8, 3, 8, -10, '2019-05-31 22:00:06', '2019-05-31 22:00:06'),
(39, 8, 4, 8, 5, '2019-05-31 22:00:06', '2019-05-31 22:00:06'),
(40, 8, 5, 8, 5, '2019-05-31 22:00:06', '2019-05-31 22:00:06'),
(41, 9, 1, 1, 5, '2019-06-02 14:34:14', '2019-06-02 14:34:14'),
(42, 9, 2, 1, 5, '2019-06-02 14:34:14', '2019-06-02 14:34:14'),
(43, 9, 3, 1, -10, '2019-06-02 14:34:14', '2019-06-02 14:34:14'),
(44, 9, 4, 1, -5, '2019-06-02 14:34:14', '2019-06-02 14:34:14'),
(45, 9, 5, 1, -5, '2019-06-02 14:34:14', '2019-06-02 14:34:14'),
(46, 10, 1, 1, 5, '2019-06-02 14:50:44', '2019-06-02 14:50:44'),
(47, 10, 2, 1, 5, '2019-06-02 14:50:44', '2019-06-02 14:50:44'),
(48, 10, 3, 1, 10, '2019-06-02 14:50:44', '2019-06-02 14:50:44'),
(49, 10, 4, 1, 5, '2019-06-02 14:50:44', '2019-06-02 14:50:44'),
(50, 10, 5, 1, -5, '2019-06-02 14:50:44', '2019-06-02 14:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `coach_review_images`
--

CREATE TABLE `coach_review_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED DEFAULT NULL,
  `school_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coach_review_images`
--

INSERT INTO `coach_review_images` (`id`, `review_id`, `school_id`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '/uploads/1557124598892.png', '2019-05-06 12:36:58', '2019-05-06 12:36:58'),
(2, 9, 0, '/uploads/1559464443047.jpeg', '2019-06-02 14:34:14', '2019-06-02 14:34:14'),
(3, 9, 0, '/uploads/1559464449698.png', '2019-06-02 14:34:14', '2019-06-02 14:34:14'),
(4, 9, 0, '/uploads/1559464452147.png', '2019-06-02 14:34:14', '2019-06-02 14:34:14'),
(5, 10, 0, '/uploads/1559465428418.png', '2019-06-02 14:50:44', '2019-06-02 14:50:44'),
(6, 10, 0, '/uploads/1559465431256.png', '2019-06-02 14:50:44', '2019-06-02 14:50:44'),
(7, 10, 0, '/uploads/1559465433951.png', '2019-06-02 14:50:44', '2019-06-02 14:50:44'),
(8, 30, 0, '/uploads/1560096014271.jpeg', '2019-06-09 22:00:31', '2019-06-09 22:00:31'),
(9, 30, 0, '/uploads/1560096017676.jpeg', '2019-06-09 22:00:31', '2019-06-09 22:00:31');

-- --------------------------------------------------------

--
-- Table structure for table `legends`
--

CREATE TABLE `legends` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `address` text,
  `phone` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL DEFAULT '/uploads/four.jpg',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `legends`
--

INSERT INTO `legends` (`id`, `user_id`, `name`, `address`, `phone`, `img`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nazmul', 'Dhaka,Bangladesh', '01681189844', '/image/school logo.png', '2019-04-04 21:23:13', '2019-05-19 16:12:59'),
(2, 2, 'Appify Lab', 'Lotif-Monjil,Pathantula,Sylhet,Bangladesh', '+8801681189844', '/image/school logo.png', NULL, '2019-04-18 15:24:08'),
(3, 3, 'Ashraf', 'Dhaka,Bangladesh', '01681189844', '/image/school logo.png', NULL, '2019-04-10 19:48:23'),
(4, 4, 'Kamran Ahmed', 'Sylhet,Bangladesh', '', '/image/school logo.png', '2019-04-04 21:30:30', '2019-04-04 23:06:42'),
(5, 8, 'Product Hero', 'Uttara,Dhaka,Bangladesh', '01772430812', '/uploads/four.jpg', '2019-05-29 01:15:40', '2019-05-29 05:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `legend_images`
--

CREATE TABLE `legend_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `legend_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `legend_images`
--

INSERT INTO `legend_images` (`id`, `legend_id`, `url`, `created_at`, `updated_at`) VALUES
(25, 2, '/uploads/1555598317645.jpeg', '2019-04-18 20:38:59', '2019-04-18 20:38:59'),
(26, 2, '/uploads/1555598323470.png', '2019-04-18 20:38:59', '2019-04-18 20:38:59'),
(27, 2, '/uploads/1555598329705.png', '2019-04-18 20:38:59', '2019-04-18 20:38:59'),
(37, 4, '/uploads/1556031887039.png', '2019-04-23 21:04:49', '2019-04-23 21:04:49'),
(38, 1, '/uploads/1555687289767.png', '2019-06-11 12:12:59', '2019-06-11 12:12:59'),
(39, 1, '/uploads/1555687296481.png', '2019-06-11 12:12:59', '2019-06-11 12:12:59'),
(40, 1, '/uploads/1555687308158.jpeg', '2019-06-11 12:12:59', '2019-06-11 12:12:59'),
(41, 1, '/uploads/1555688031454.jpeg', '2019-06-11 12:13:00', '2019-06-11 12:13:00'),
(42, 1, '/uploads/1555688037239.jpeg', '2019-06-11 12:13:00', '2019-06-11 12:13:00'),
(43, 1, '/uploads/1560233576788.jpeg', '2019-06-11 12:13:00', '2019-06-11 12:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` text,
  `price` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `img` varchar(60) DEFAULT '/uploads/four.jpg',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `name`, `category`, `address`, `description`, `price`, `active`, `img`, `created_at`, `updated_at`) VALUES
(1, 8, 'Product 1', 'Food', 'Sylhet,Bangladesh', 'This is a product call Product 1. The price of this product 1 is 50  and Category is Food', 50, 1, '/uploads/four.png', '2019-06-01 14:31:44', '2019-06-11 21:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `product_answers`
--

CREATE TABLE `product_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_answers`
--

INSERT INTO `product_answers` (`id`, `question_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 2, 8, 'And this is The first Answer!', '2019-06-11 21:57:30', '2019-06-11 21:57:30'),
(2, 3, 8, 'Hello .. This is my answer!', '2019-06-11 22:32:06', '2019-06-11 22:32:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_imos`
--

CREATE TABLE `product_imos` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cool` int(11) DEFAULT '0',
  `funny` int(11) DEFAULT '0',
  `useful` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_imos`
--

INSERT INTO `product_imos` (`id`, `review_id`, `user_id`, `cool`, `funny`, `useful`, `created_at`, `updated_at`) VALUES
(3, 3, 1, 0, 0, 1, '2019-06-03 00:55:09', '2019-06-03 00:55:09');

-- --------------------------------------------------------

--
-- Table structure for table `product_questions`
--

CREATE TABLE `product_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_questions`
--

INSERT INTO `product_questions` (`id`, `user_id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'This is Frist Product Question Data!', '2019-06-03 05:57:53', '2019-06-03 05:57:53'),
(3, 8, 1, 'This is Second Product Question!', '2019-06-11 22:13:05', '2019-06-11 22:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `reviwer_id` int(11) DEFAULT NULL,
  `content` text,
  `rating` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `reviwer_id`, `content`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 'It might have unravelled very differently for Shanaka, the 27-year-old international allrounder, had he attended Sunday morning mass at St Sebastian\'s Church in Negombo, his hometown, that day with his mother and grandmother. He chose not to, being tired after a 170-kilometre trip home from Anuradhapura the previous evening', 4, '2019-06-01 17:04:25', '2019-06-01 17:04:25'),
(2, 1, 1, 'It might have unravelled very differently for Shanaka, the 27-year-old international allrounder, had he attended Sunday morning mass at St Sebastian\'s Church in Negombo, his hometown, that day with his mother and grandmother. He chose not to, being tired after a 170-kilometre trip home from Anuradhapura the previous evening', 2, '2019-06-02 14:41:12', '2019-06-02 14:41:12'),
(3, 1, 1, 'It might have unravelled very differently for Shanaka, the 27-year-old international allrounder, had he attended Sunday morning mass at St Sebastian\'s Church in Negombo, his hometown, that day with his mother and grandmother. He chose not to, being tired after a 170-kilometre trip home from Anuradhapura the previous evening', 2, '2019-06-02 14:45:28', '2019-06-02 14:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_review_atrributes`
--

CREATE TABLE `product_review_atrributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `revew_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `isPositive` int(1) DEFAULT '0',
  `isNegative` int(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_review_images`
--

CREATE TABLE `product_review_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_review_images`
--

INSERT INTO `product_review_images` (`id`, `review_id`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, '/uploads/1559387045553.jpeg', '2019-06-01 17:04:25', '2019-06-01 17:04:25'),
(2, 1, '/uploads/1559387047945.jpeg', '2019-06-01 17:04:25', '2019-06-01 17:04:25'),
(3, 1, '/uploads/1559387050890.jpeg', '2019-06-01 17:04:25', '2019-06-01 17:04:25'),
(4, 2, '/uploads/1559464845544.jpeg', '2019-06-02 14:41:12', '2019-06-02 14:41:12'),
(5, 2, '/uploads/1559464848971.jpeg', '2019-06-02 14:41:12', '2019-06-02 14:41:12'),
(6, 2, '/uploads/1559464851936.jpeg', '2019-06-02 14:41:12', '2019-06-02 14:41:12'),
(7, 3, '/uploads/1559465103875.jpeg', '2019-06-02 14:45:28', '2019-06-02 14:45:28'),
(8, 3, '/uploads/1559465106423.jpeg', '2019-06-02 14:45:28', '2019-06-02 14:45:28'),
(9, 3, '/uploads/1559465109838.jpeg', '2019-06-02 14:45:28', '2019-06-02 14:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `pulses`
--

CREATE TABLE `pulses` (
  `id` int(10) UNSIGNED NOT NULL,
  `legend_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `good` int(11) NOT NULL DEFAULT '0',
  `bad` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pulses`
--

INSERT INTO `pulses` (`id`, `legend_id`, `user_id`, `good`, `bad`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 1, 0, '2019-04-14 18:42:20', '2019-04-14 18:42:20'),
(2, 3, 3, 0, 1, '2019-04-14 18:47:05', '2019-04-14 18:47:05'),
(3, 3, 3, 0, 1, '2019-04-14 18:47:09', '2019-04-14 18:47:09'),
(4, 3, 3, 1, 0, '2019-04-14 19:18:09', '2019-04-14 19:18:09'),
(5, 3, 3, 1, 0, '2019-04-14 19:18:13', '2019-04-14 19:18:13'),
(6, 3, 3, 0, 1, '2019-04-14 19:25:48', '2019-04-14 19:25:48'),
(7, 3, 3, 0, 1, '2019-04-14 19:36:25', '2019-04-14 19:36:25'),
(8, 3, 3, 1, 0, '2019-04-14 19:37:43', '2019-04-14 19:37:43'),
(9, 3, 3, 1, 0, '2019-04-14 19:40:16', '2019-04-14 19:40:16'),
(10, 3, 3, 1, 0, '2019-04-14 19:40:20', '2019-04-14 19:40:20'),
(11, 3, 3, 0, 1, '2019-04-14 19:40:37', '2019-04-14 19:40:37'),
(12, 3, 3, 1, 0, '2019-04-14 19:40:45', '2019-04-14 19:40:45'),
(13, 3, 3, 1, 0, '2019-04-14 19:41:11', '2019-04-14 19:41:11'),
(14, 3, 3, 0, 1, '2019-04-14 19:41:14', '2019-04-14 19:41:14'),
(15, 3, 3, 0, 1, '2019-04-14 19:41:16', '2019-04-14 19:41:16'),
(16, 3, 3, 0, 1, '2019-04-14 19:41:19', '2019-04-14 19:41:19'),
(17, 3, 3, 0, 1, '2019-04-14 19:41:21', '2019-04-14 19:41:21'),
(18, 3, 3, 1, 0, '2019-04-14 19:41:23', '2019-04-14 19:41:23'),
(19, 3, 3, 1, 0, '2019-04-14 19:41:24', '2019-04-14 19:41:24'),
(20, 2, 3, 1, 0, '2019-04-16 23:31:05', '2019-04-16 23:31:05'),
(21, 2, 3, 0, 1, '2019-04-16 23:31:07', '2019-04-16 23:31:07'),
(22, 2, 3, 1, 0, '2019-04-16 23:31:08', '2019-04-16 23:31:08'),
(23, 2, 3, 1, 0, '2019-04-16 23:31:09', '2019-04-16 23:31:09'),
(24, 2, 3, 1, 0, '2019-04-16 23:31:11', '2019-04-16 23:31:11'),
(25, 2, 3, 1, 0, '2019-04-16 23:31:14', '2019-04-16 23:31:14'),
(26, 2, 3, 1, 0, '2019-04-16 23:31:14', '2019-04-16 23:31:14'),
(27, 2, 3, 1, 0, '2019-04-16 23:31:14', '2019-04-16 23:31:14'),
(28, 2, 3, 1, 0, '2019-04-16 23:31:15', '2019-04-16 23:31:15'),
(29, 2, 3, 1, 0, '2019-04-16 23:31:15', '2019-04-16 23:31:15'),
(30, 2, 3, 1, 0, '2019-04-16 23:31:15', '2019-04-16 23:31:15'),
(31, 2, 3, 1, 0, '2019-04-16 23:31:15', '2019-04-16 23:31:15'),
(32, 2, 3, 1, 0, '2019-04-16 23:31:17', '2019-04-16 23:31:17'),
(33, 2, 3, 1, 0, '2019-04-16 23:31:18', '2019-04-16 23:31:18'),
(34, 2, 3, 1, 0, '2019-04-16 23:31:19', '2019-04-16 23:31:19'),
(35, 2, 3, 1, 0, '2019-04-16 23:31:20', '2019-04-16 23:31:20'),
(36, 2, 3, 1, 0, '2019-04-16 23:31:21', '2019-04-16 23:31:21'),
(37, 1, 1, 1, 0, '2019-04-19 21:21:17', '2019-04-19 21:21:17'),
(38, 1, 4, 1, 0, '2019-04-22 22:42:32', '2019-04-22 22:42:32');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `legend_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_id`, `legend_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'This is First Question!', '2019-04-08 04:29:05', '2019-04-08 04:29:05'),
(2, 1, 1, 'This is the Second Question?', '2019-04-08 04:34:14', '2019-04-08 04:34:14'),
(3, 1, 1, 'This is some question', '2019-04-09 23:33:39', '2019-04-09 23:33:39'),
(4, 1, 2, 'This i', '2019-04-09 23:35:26', '2019-04-09 23:35:26'),
(5, 1, 2, 'This i', '2019-04-09 23:35:26', '2019-04-09 23:35:26'),
(6, 3, 2, 'hello world...................', '2019-04-16 23:30:34', '2019-04-16 23:30:34'),
(7, 4, 2, 'aaaffffffffffffffffffffffffffffffff', '2019-04-23 16:23:08', '2019-04-23 16:23:08'),
(8, 4, 2, 'It might have unravelled very differently for Shanaka, the 27-year-old internationa?', '2019-04-23 21:00:28', '2019-04-23 21:00:28'),
(9, 4, 2, 'It might have unravelled very differently for Shanaka, the 27-year-old internationa?', '2019-04-23 21:01:27', '2019-04-23 21:01:27'),
(10, 4, 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the ', '2019-04-23 21:23:27', '2019-04-23 21:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `recent_reviews`
--

CREATE TABLE `recent_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED DEFAULT NULL,
  `review_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recent_reviews`
--

INSERT INTO `recent_reviews` (`id`, `review_id`, `review_type`, `created_at`, `updated_at`) VALUES
(5, 3, 'App/Models/ProductReview', '2019-06-02 14:45:28', '2019-06-02 14:45:28'),
(6, 28, 'App/Models/Review', '2019-06-02 14:50:09', '2019-06-02 14:50:09'),
(7, 10, 'App/Models/SchoolCoachReview', '2019-06-02 14:50:44', '2019-06-02 14:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `reviewimos`
--

CREATE TABLE `reviewimos` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `cool` tinyint(1) DEFAULT '0',
  `funny` tinyint(1) DEFAULT '0',
  `useful` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviewimos`
--

INSERT INTO `reviewimos` (`id`, `review_id`, `user_id`, `cool`, `funny`, `useful`, `created_at`, `updated_at`) VALUES
(1, 26, 1, 1, 1, 1, '2019-05-09 00:00:00', '2019-05-19 14:37:22'),
(2, 26, 4, 1, 1, 1, '2019-05-09 00:00:00', '2019-05-09 00:00:00'),
(3, 26, 6, 1, 1, 1, '2019-05-09 00:00:00', '2019-05-09 00:00:00'),
(4, 26, 3, 1, 1, 1, '2019-05-09 00:00:00', '2019-05-09 00:00:00'),
(5, 24, 1, 0, 1, 0, '2019-05-19 14:39:37', '2019-05-19 14:39:37'),
(6, 23, 1, 0, 0, 1, '2019-05-19 14:40:10', '2019-05-19 14:40:29'),
(8, 25, 1, 1, 1, 0, '2019-06-03 04:02:05', '2019-06-10 18:51:50'),
(9, 24, 8, 1, 0, 0, '2019-06-09 17:52:27', '2019-06-09 17:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `reviewFor` int(11) NOT NULL,
  `reviwer_id` int(11) NOT NULL,
  `school_id` int(10) DEFAULT NULL,
  `review_type` varchar(15) NOT NULL,
  `content` text NOT NULL,
  `rating` int(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `reviewFor`, `reviwer_id`, `school_id`, `review_type`, `content`, `rating`, `created_at`, `updated_at`) VALUES
(10, 2, 1, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-04-07 19:15:46', '2019-04-07 19:15:46'),
(11, 2, 1, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-04-07 19:20:59', '2019-04-07 19:20:59'),
(12, 2, 1, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-04-07 19:25:19', '2019-04-07 19:25:19'),
(13, 2, 1, NULL, 'legend', 'That makes it his second-best record in a season in a Madrid shirt, and he is now just two strikes behind his record of 32 that he achieved during his third campaign with the club, in 2011/12.', 5, '2019-04-07 20:45:33', '2019-04-07 20:45:33'),
(14, 2, 1, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-04-07 20:49:44', '2019-04-07 20:49:44'),
(15, 2, 1, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-04-07 20:51:46', '2019-04-07 20:51:46'),
(16, 4, 3, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 3, '2019-04-11 00:34:33', '2019-04-11 00:34:33'),
(17, 2, 3, NULL, 'legend', 'That makes it his second-best record in a season in a Madrid shirt, and he is now just two strikes behind his record of 32 that he achieved during his third campaign with the club, in 2011/12.', 5, '2019-04-11 00:35:59', '2019-04-11 00:35:59'),
(18, 2, 3, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 3, '2019-04-11 00:53:43', '2019-04-11 00:53:43'),
(19, 3, 1, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-04-16 16:35:23', '2019-04-16 16:35:23'),
(20, 2, 3, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-04-16 16:41:13', '2019-04-16 16:41:13'),
(21, 2, 3, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 4, '2019-04-16 16:48:10', '2019-04-16 16:48:10'),
(22, 2, 3, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 4, '2019-04-16 16:48:45', '2019-04-16 16:48:45'),
(23, 2, 3, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-04-16 16:51:35', '2019-04-16 16:51:35'),
(24, 2, 3, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-04-16 16:51:53', '2019-04-16 16:51:53'),
(25, 1, 4, NULL, 'legend', 'It might have unravelled very differently for Shanaka, the 27-year-old international allrounder, had he attended Sunday morning mass at St Sebastian\'s Church in Negombo, his hometown, that day with his mother and grandmother. He chose not to, being tired after a 170-kilometre trip home from Anuradhapura the previous evening', 5, '2019-04-22 22:41:31', '2019-04-22 22:41:31'),
(26, 2, 4, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus ', 4, '2019-04-23 21:22:34', '2019-04-23 21:22:34'),
(27, 4, 1, NULL, 'legend', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting', 4, '2019-06-02 14:32:44', '2019-06-02 14:32:44'),
(28, 1, 3, NULL, 'legend', 'It might have unravelled very differently for Shanaka, the 27-year-old international allrounder, had he attended Sunday morning mass at St Sebastian\'s Church in Negombo, his hometown, that day with his mother and grandmother. He chose not to, being tired after a 170-kilometre trip home from Anuradhapura the previous evening', 3, '2019-06-02 14:50:09', '2019-06-02 14:50:09'),
(29, 2, 8, NULL, 'legend', 'This is Good/orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but ', 5, '2019-06-09 21:12:55', '2019-06-09 21:12:55'),
(30, 4, 8, 2, 'school', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,', 4, '2019-06-09 22:00:31', '2019-06-09 22:00:31'),
(31, 1, 1, NULL, 'product', 'It might have unravelled very differently for Shanaka, the 27-year-old international allrounder, had he attended Sunday morning mass at St Sebastian\'s Church in Negombo, his hometown, that day with h', 5, '2019-06-09 22:09:15', '2019-06-09 22:09:15'),
(32, 1, 1, NULL, 'product', 'It might have unravelled very differently for Shanaka, the 27-year-old international allrounder, had he attended Sunday morning mass at St Sebastian\'s Church in Negombo, his hometown, that day with his mother and grandmother. He chose not to, being tired after a 170-kilometre trip home from Anuradhapura the previous evening', 4, '2019-06-09 22:10:03', '2019-06-09 22:10:03');

-- --------------------------------------------------------

--
-- Table structure for table `review_attributes`
--

CREATE TABLE `review_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `points` int(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_attributes`
--

INSERT INTO `review_attributes` (`id`, `review_id`, `attribute_id`, `user_id`, `points`, `created_at`, `updated_at`) VALUES
(1, 22, 1, 3, 5, '2019-04-16 16:48:45', '2019-04-16 16:48:45'),
(2, 22, 2, 3, 5, '2019-04-16 16:48:45', '2019-04-16 16:48:45'),
(3, 22, 3, 3, -10, '2019-04-16 16:48:45', '2019-04-16 16:48:45'),
(4, 22, 4, 3, -5, '2019-04-16 16:48:45', '2019-04-16 16:48:45'),
(5, 22, 5, 3, 5, '2019-04-16 16:48:45', '2019-04-16 16:48:45'),
(6, 23, 1, 3, 5, '2019-04-16 16:51:35', '2019-04-16 16:51:35'),
(7, 23, 2, 3, 5, '2019-04-16 16:51:35', '2019-04-16 16:51:35'),
(8, 23, 3, 3, 10, '2019-04-16 16:51:35', '2019-04-16 16:51:35'),
(9, 23, 4, 3, 5, '2019-04-16 16:51:35', '2019-04-16 16:51:35'),
(10, 23, 5, 3, 5, '2019-04-16 16:51:35', '2019-04-16 16:51:35'),
(11, 24, 1, 3, -5, '2019-04-16 16:51:53', '2019-04-16 16:51:53'),
(12, 24, 2, 3, -5, '2019-04-16 16:51:53', '2019-04-16 16:51:53'),
(13, 24, 3, 3, 10, '2019-04-16 16:51:53', '2019-04-16 16:51:53'),
(14, 24, 4, 3, 5, '2019-04-16 16:51:53', '2019-04-16 16:51:53'),
(15, 24, 5, 3, 5, '2019-04-16 16:51:53', '2019-04-16 16:51:53'),
(16, 25, 1, 4, 5, '2019-04-22 22:41:31', '2019-04-22 22:41:31'),
(17, 25, 2, 4, 5, '2019-04-22 22:41:31', '2019-04-22 22:41:31'),
(18, 25, 3, 4, 10, '2019-04-22 22:41:31', '2019-04-22 22:41:31'),
(19, 25, 4, 4, -5, '2019-04-22 22:41:31', '2019-04-22 22:41:31'),
(20, 25, 5, 4, 5, '2019-04-22 22:41:31', '2019-04-22 22:41:31'),
(21, 26, 1, 4, 5, '2019-04-23 21:22:34', '2019-04-23 21:22:34'),
(22, 26, 2, 4, 5, '2019-04-23 21:22:34', '2019-04-23 21:22:34'),
(23, 26, 3, 4, -10, '2019-04-23 21:22:34', '2019-04-23 21:22:34'),
(24, 26, 4, 4, 5, '2019-04-23 21:22:34', '2019-04-23 21:22:34'),
(25, 26, 5, 4, 5, '2019-04-23 21:22:34', '2019-04-23 21:22:34'),
(26, 27, 1, 1, 5, '2019-06-02 14:32:44', '2019-06-02 14:32:44'),
(27, 27, 2, 1, 5, '2019-06-02 14:32:44', '2019-06-02 14:32:44'),
(28, 27, 3, 1, -10, '2019-06-02 14:32:44', '2019-06-02 14:32:44'),
(29, 27, 4, 1, -5, '2019-06-02 14:32:44', '2019-06-02 14:32:44'),
(30, 27, 5, 1, 5, '2019-06-02 14:32:44', '2019-06-02 14:32:44'),
(31, 28, 1, 1, 5, '2019-06-02 14:50:09', '2019-06-02 14:50:09'),
(32, 28, 2, 1, 5, '2019-06-02 14:50:09', '2019-06-02 14:50:09'),
(33, 28, 3, 1, 10, '2019-06-02 14:50:09', '2019-06-02 14:50:09'),
(34, 28, 4, 1, -5, '2019-06-02 14:50:09', '2019-06-02 14:50:09'),
(35, 28, 5, 1, -5, '2019-06-02 14:50:09', '2019-06-02 14:50:09'),
(36, 29, 1, 8, 5, '2019-06-09 21:12:55', '2019-06-09 21:12:55'),
(37, 29, 2, 8, 5, '2019-06-09 21:12:55', '2019-06-09 21:12:55'),
(38, 29, 3, 8, 10, '2019-06-09 21:12:55', '2019-06-09 21:12:55'),
(39, 29, 4, 8, -5, '2019-06-09 21:12:55', '2019-06-09 21:12:55'),
(40, 29, 5, 8, -5, '2019-06-09 21:12:55', '2019-06-09 21:12:55'),
(41, 30, 1, 8, 5, '2019-06-09 22:00:31', '2019-06-09 22:00:31'),
(42, 30, 2, 8, 5, '2019-06-09 22:00:31', '2019-06-09 22:00:31'),
(43, 30, 3, 8, 10, '2019-06-09 22:00:31', '2019-06-09 22:00:31'),
(44, 31, 1, 1, -5, '2019-06-09 22:09:15', '2019-06-09 22:09:15'),
(45, 31, 2, 1, -5, '2019-06-09 22:09:15', '2019-06-09 22:09:15'),
(46, 31, 3, 1, 10, '2019-06-09 22:09:15', '2019-06-09 22:09:15'),
(47, 31, 4, 1, 5, '2019-06-09 22:09:15', '2019-06-09 22:09:15'),
(48, 31, 5, 1, 5, '2019-06-09 22:09:15', '2019-06-09 22:09:15'),
(49, 32, 1, 1, 5, '2019-06-09 22:10:03', '2019-06-09 22:10:03'),
(50, 32, 2, 1, 5, '2019-06-09 22:10:03', '2019-06-09 22:10:03'),
(51, 32, 3, 1, 10, '2019-06-09 22:10:03', '2019-06-09 22:10:03'),
(52, 32, 4, 1, -5, '2019-06-09 22:10:03', '2019-06-09 22:10:03'),
(53, 32, 5, 1, 5, '2019-06-09 22:10:03', '2019-06-09 22:10:03');

-- --------------------------------------------------------

--
-- Table structure for table `review_images`
--

CREATE TABLE `review_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review_images`
--

INSERT INTO `review_images` (`id`, `review_id`, `url`, `created_at`, `updated_at`) VALUES
(1, 25, '/uploads/1555951271768.jpeg', '2019-04-22 22:41:31', '2019-04-22 22:41:31'),
(2, 25, '/uploads/1555951276020.png', '2019-04-22 22:41:31', '2019-04-22 22:41:31'),
(3, 25, '/uploads/1555951279605.jpeg', '2019-04-22 22:41:31', '2019-04-22 22:41:31'),
(4, 27, '/uploads/1559464342825.jpeg', '2019-06-02 14:32:44', '2019-06-02 14:32:44'),
(5, 27, '/uploads/1559464346578.jpeg', '2019-06-02 14:32:44', '2019-06-02 14:32:44'),
(6, 27, '/uploads/1559464349235.jpeg', '2019-06-02 14:32:44', '2019-06-02 14:32:44'),
(7, 28, '/uploads/1559465391298.jpeg', '2019-06-02 14:50:09', '2019-06-02 14:50:09'),
(8, 28, '/uploads/1559465394758.png', '2019-06-02 14:50:09', '2019-06-02 14:50:09'),
(9, 28, '/uploads/1559465396991.jpeg', '2019-06-02 14:50:09', '2019-06-02 14:50:09'),
(10, 29, '/uploads/1560093131257.jpeg', '2019-06-09 21:12:55', '2019-06-09 21:12:55'),
(11, 29, '/uploads/1560093133636.jpeg', '2019-06-09 21:12:55', '2019-06-09 21:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` int(10) UNSIGNED NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `schoolName` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `division` varchar(255) DEFAULT NULL,
  `sport` varchar(255) DEFAULT NULL,
  `roster` varchar(255) DEFAULT NULL,
  `alumni` varchar(255) DEFAULT NULL,
  `interestedAthletes` varchar(255) DEFAULT NULL,
  `committedRecruit` varchar(255) DEFAULT NULL,
  `placedAthletes` varchar(255) DEFAULT NULL,
  `teamWebsite` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `logo`, `schoolName`, `city`, `state`, `division`, `sport`, `roster`, `alumni`, `interestedAthletes`, `committedRecruit`, `placedAthletes`, `teamWebsite`, `created_at`, `updated_at`) VALUES
(1, 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=79f7part&sportEnum=1&width=90&height=90', 'Lawrence Technological University', 'Southfield', 'MI', NULL, 'Baseball', '', '0', NULL, '24', NULL, 'http://www.ltu.athletics.com/', '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(2, 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=fresnocitycollege&sportEnum=256&width=90&height=90', 'Fresno City College', 'Fresno', 'CA', NULL, 'Football', '17', '93', NULL, NULL, '6', NULL, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(3, 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=cgcc&sportEnum=1&width=90&height=90', 'Chandler-Gilbert Community College', 'Chandler', 'AZ', NULL, 'Baseball', '14', '145', NULL, NULL, '93', 'http://www.cgc.edu/athletics/mSports/baseball/Pages/home.aspx', '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(4, 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=q74wtjyn&sportEnum=1&width=90&height=90', 'OLS Knights', 'New York', 'NY', NULL, 'Baseball', '0', '0', NULL, NULL, '0', NULL, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(5, 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=montana&sportEnum=256&width=90&height=90', 'Montana State University', 'Bozeman', 'MT', NULL, 'Football', '', '0', NULL, '12', '0', NULL, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(6, 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=f6hatfr7&sportEnum=1&width=90&height=90', 'Fresno City College', 'Des Plaines', 'IL', NULL, 'Baseball', '125', '422', NULL, NULL, '187', 'http://www.hometeamsonline.com/teams/?u=ILLINOISINDIANS&s=baseball&t=c', '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(7, 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=j4k4cpt7&sportEnum=1&width=90&height=90', 'California Baseball Academy', 'Rancho Cucamonga', 'CA', NULL, 'Baseball', '291', '393', NULL, NULL, '266', 'http://www.cbabaseball.org', '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(8, 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=nwosu&sportEnum=256&width=90&height=90', 'Northwestern Oklahoma State University', 'Alva', 'OK', NULL, 'Football', '', '0', NULL, '21', '266', 'http://riderangersride.com/index.aspx?path=football&', '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(9, 'https://team.fieldlevel.com/none/media/TeamLogo.jpg?shortName=edw7gh4f&sportEnum=1&width=90&height=90', 'Monroe College - Bronx', 'New York', 'NY', NULL, 'Baseball', '16', '2', NULL, NULL, '0', 'https://monroeexpress.com/index.aspx?path=baseball', '2019-05-04 17:39:44', '2019-05-04 17:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `school_answers`
--

CREATE TABLE `school_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_answers`
--

INSERT INTO `school_answers` (`id`, `question_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'This is First Answer of First Question.', '2019-05-29 01:05:47', '2019-05-29 01:05:47'),
(2, 5, 8, 'And this is First Answer!', '2019-06-11 22:52:57', '2019-06-11 22:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `school_coaches`
--

CREATE TABLE `school_coaches` (
  `id` int(10) UNSIGNED NOT NULL,
  `school_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `average_rating` float NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_coaches`
--

INSERT INTO `school_coaches` (`id`, `school_id`, `name`, `average_rating`, `created_at`, `updated_at`) VALUES
(1, 2, 'Tony Caviglia', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(2, 2, 'Connor Shannon', 4, '2019-05-04 17:39:44', '2019-05-31 22:00:06'),
(3, 2, 'Keith Travis', 4.6, '2019-05-04 17:39:44', '2019-05-31 21:58:26'),
(4, 2, 'Vince Branstetter', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(5, 2, 'Dwayne Wright', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(6, 2, 'Patrick Markarian', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(7, 2, 'Dennis Randle', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(8, 2, 'Mark Hetherington', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(9, 2, 'Jesus Reyes', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(10, 2, 'Ryan Ruschhaupt', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(11, 2, 'Drew Brown', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(12, 2, 'Rick Scheidt', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(13, 3, 'Russell Luce', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(14, 3, 'Jon Watson', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(15, 3, 'Mike Campbell', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(16, 3, 'Dave Pankenier', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(17, 3, 'Ed Yeager', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(18, 4, 'Marcelo Perez III', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(19, 6, 'Connor Flowers', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(20, 6, 'Mike Randazzo', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(21, 6, 'Conor Philbin', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(22, 6, 'Tyler Albright', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(23, 6, 'Matt Mahay', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(24, 6, 'Anthony Concialdi', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(25, 6, 'Matt Smith', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(26, 6, 'Bryce Skelton', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(27, 6, 'Greg Partyka', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(28, 6, 'Marc Mantucca', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(29, 6, 'Mike Pugliese', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(30, 6, 'Tyler Pazik', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(31, 7, 'Josh Glassey', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(32, 7, 'John Berumen', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(33, 7, 'Patrick Murphy', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(34, 7, 'Andrew Takayoshi', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(35, 7, 'Tim McCollum', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(36, 7, 'Carlos Ramirez', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(37, 7, 'Jon Paino', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(38, 7, 'Joe Spiers', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(39, 7, 'Tim Blume', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(40, 9, 'John Torres', 0, '2019-05-04 17:39:44', '2019-05-04 17:39:44'),
(41, NULL, NULL, 0, '2019-05-06 13:15:11', '2019-05-06 13:15:11'),
(42, NULL, NULL, 0, '2019-05-06 13:18:58', '2019-05-06 13:18:58'),
(43, 8, 'John Torres', 0, '2019-05-06 13:23:40', '2019-05-06 13:23:40'),
(44, 1, 'france', 0, '2019-05-30 14:58:45', '2019-05-30 14:58:45'),
(45, 4, 'h', 0, '2019-06-10 18:36:42', '2019-06-10 18:36:42'),
(46, 4, 'h', 0, '2019-06-10 18:36:43', '2019-06-10 18:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `school_coach_reviews`
--

CREATE TABLE `school_coach_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `reviwer_id` int(11) DEFAULT NULL,
  `content` text,
  `rating` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_coach_reviews`
--

INSERT INTO `school_coach_reviews` (`id`, `coach_id`, `school_id`, `reviwer_id`, `content`, `rating`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-05-06 12:36:58', '2019-05-06 12:36:58'),
(2, 2, 2, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus', 4, '2019-05-28 06:17:47', '2019-05-28 06:17:47'),
(3, 26, 6, 8, 'He is Awesome', 5, '2019-05-30 01:47:36', '2019-05-30 01:47:36'),
(4, 3, 2, 8, 'He is only for Testring Purpose.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', 4, '2019-05-31 21:44:56', '2019-05-31 21:44:56'),
(5, 3, 2, 8, 'He is only for Testring Purpose.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', 4, '2019-05-31 21:45:45', '2019-05-31 21:45:45'),
(6, 3, 2, 8, 'Again For testing Purpose!Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 5, '2019-05-31 21:55:35', '2019-05-31 21:55:35'),
(7, 3, 2, 8, 'Again Boys Again..It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5, '2019-05-31 21:58:26', '2019-05-31 21:58:26'),
(8, 2, 2, 8, 'He is ok .. As long as we are testing him!Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer ', 4, '2019-05-31 22:00:06', '2019-05-31 22:00:06'),
(9, 4, 2, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', 3, '2019-06-02 14:34:14', '2019-06-02 14:34:14'),
(10, 1, 2, 1, 'It might have unravelled very differently for Shanaka, the 27-year-old international allrounder, had he attended Sunday morning mass at St Sebastian\'s Church in Negombo, his hometown, that day with his mother and grandmother. He chose not to, being tired after a 170-kilometre trip home from Anuradhapura the previous evening', 4, '2019-06-02 14:50:44', '2019-06-02 14:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `school_questions`
--

CREATE TABLE `school_questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_questions`
--

INSERT INTO `school_questions` (`id`, `user_id`, `school_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'This is The First Question of Fresno City Collage?', '2019-05-28 16:44:36', '2019-05-28 16:44:36'),
(2, 1, 2, 'This is The Second Question of Fresno City Collage?', '2019-05-28 16:46:14', '2019-05-28 16:46:14'),
(3, 1, 2, 'This is the 3rd Question of the Fresno City Collage', '2019-05-28 22:24:40', '2019-05-28 22:24:40'),
(4, 8, 3, 'Hello This is First Question', '2019-06-11 22:33:22', '2019-06-11 22:33:22'),
(5, 8, 4, 'This is OLS Knights First Question!', '2019-06-11 22:36:07', '2019-06-11 22:36:07'),
(6, 8, 5, 'This is Montana Knights First Question!', '2019-06-11 22:40:20', '2019-06-11 22:40:20'),
(7, 8, 4, 'There is Some Cookie!', '2019-06-11 22:55:27', '2019-06-11 22:55:27');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(80) NOT NULL,
  `lastName` varchar(80) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(60) NOT NULL,
  `birthday` varchar(254) DEFAULT NULL,
  `zip` varchar(60) DEFAULT NULL,
  `address` text NOT NULL,
  `img` varchar(100) NOT NULL DEFAULT '/uploads/profile.png',
  `packType` int(60) NOT NULL,
  `accountActivationToken` varchar(60) DEFAULT NULL,
  `passwordToken` varchar(60) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `birthday`, `zip`, `address`, `img`, `packType`, `accountActivationToken`, `passwordToken`, `created_at`, `updated_at`) VALUES
(1, 'Nazmul', 'Chowdhury', 'nazmul@gmail.com', '$2a$10$2IL0iJW53DuuyE9hOXAWqek3Pq8mkWHEkx6XSvx9xFX1G8PIdtUFS', '2000-04-29T18:00:00.000Z', '3210', 'Sreemangal,Sylhet,Bangladesh', '/uploads/profile.png ', 2, NULL, NULL, '2019-04-03 20:20:09', '2019-06-03 22:45:37'),
(2, 'sadek', 'hossain', 'sadek@gmail.com', '$2a$10$74hKKbdqOoB30dDPmTHNme/6xrMSxwENg4yAqOFWgkOrY6u7Itr1G', '2019-04-23T18:00:00.000Z', 'as', '', '/uploads/profile.png ', 2, NULL, NULL, '2019-04-03 20:56:19', '2019-04-03 20:56:19'),
(3, 'Ashraf', 'Hakimi', 'ashraf@gmail.com', '$2a$10$oSQAkhdVNZoDEKJ5ZYfC/u2Wr/zfDKsp2EsJ426Chop.3KYovo7kG', '', '3210', 'Sylhet,Bangladesh', '/uploads/profile.png ', 2, NULL, NULL, '2019-04-04 21:23:13', '2019-04-12 19:25:47'),
(4, 'Kamran', 'Ahmed', 'kamran@gmail.com', '$2a$10$FVg.RimiYbj1Os.mNgY46.0fLo58o2a4RAHiQtPNt.HiaUtbw25Ne', '', '3210', '', '/uploads/profile.png ', 2, NULL, NULL, '2019-04-04 21:30:30', '2019-04-04 21:30:30'),
(5, 'Sakil ', 'Rahman', 'sakil@gmail.com', '$2a$10$ybgVFc20M1JB2TH9FfZlpux1UrIGTnHDrn/yHhNgIeZLvCYo3QG0.', '', '3210', '', '/uploads/profile.png ', 1, NULL, NULL, '2019-04-04 23:07:42', '2019-04-04 23:07:42'),
(6, 'Kollol', 'Cahk', 'kollol@gmail.com', '$2a$10$gFw38St07Ogy9Q4ln8ud4e6KmSA6FSPM547Cl8p/lzKZVUnI5ggxS', '', '3210', '', '/uploads/profile.png ', 1, NULL, NULL, '2019-04-04 23:13:34', '2019-04-04 23:13:34'),
(7, 'Humayun', 'Rahi', 'rahi@boss.com', '$2a$10$t.D/M9IMjso2iCIUatzWYOG0Yzzyf6WPpyblR0w51SDjmcFzxJac6', '', '', 'Sylhet,Bangladesh', '/uploads/profile.png', 1, NULL, NULL, '2019-04-09 23:07:49', '2019-04-09 23:20:27'),
(8, 'Product', 'Hero', 'product@gmail.com', '$2a$10$cE09niCSD2P6otFaItlSK.DB0K0VZqNTC2iVPkKfW6pNFYD9Ic3im', '1996-04-30T18:00:00.000Z', '3210', '', '/uploads/profile.png', 3, NULL, NULL, '2019-05-29 01:15:40', '2019-05-29 01:15:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `busniess_hours`
--
ALTER TABLE `busniess_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `legend_id` (`legend_id`);

--
-- Indexes for table `coach_imos`
--
ALTER TABLE `coach_imos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coach_review_attributes`
--
ALTER TABLE `coach_review_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_id` (`attribute_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `coach_review_images`
--
ALTER TABLE `coach_review_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legends`
--
ALTER TABLE `legends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legend_images`
--
ALTER TABLE `legend_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_answers`
--
ALTER TABLE `product_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_imos`
--
ALTER TABLE `product_imos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_questions`
--
ALTER TABLE `product_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_review_atrributes`
--
ALTER TABLE `product_review_atrributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_review_images`
--
ALTER TABLE `product_review_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pulses`
--
ALTER TABLE `pulses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recent_reviews`
--
ALTER TABLE `recent_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `reviewimos`
--
ALTER TABLE `reviewimos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviewimos_ibfk_1` (`user_id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_attributes`
--
ALTER TABLE `review_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_images`
--
ALTER TABLE `review_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_answers`
--
ALTER TABLE `school_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_coaches`
--
ALTER TABLE `school_coaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_coaches_ibfk_1` (`school_id`);

--
-- Indexes for table `school_coach_reviews`
--
ALTER TABLE `school_coach_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_questions`
--
ALTER TABLE `school_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `busniess_hours`
--
ALTER TABLE `busniess_hours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `coach_imos`
--
ALTER TABLE `coach_imos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coach_review_attributes`
--
ALTER TABLE `coach_review_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `coach_review_images`
--
ALTER TABLE `coach_review_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `legends`
--
ALTER TABLE `legends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `legend_images`
--
ALTER TABLE `legend_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_answers`
--
ALTER TABLE `product_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_imos`
--
ALTER TABLE `product_imos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_questions`
--
ALTER TABLE `product_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_review_atrributes`
--
ALTER TABLE `product_review_atrributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_review_images`
--
ALTER TABLE `product_review_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pulses`
--
ALTER TABLE `pulses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recent_reviews`
--
ALTER TABLE `recent_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reviewimos`
--
ALTER TABLE `reviewimos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `review_attributes`
--
ALTER TABLE `review_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `review_images`
--
ALTER TABLE `review_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `school_answers`
--
ALTER TABLE `school_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `school_coaches`
--
ALTER TABLE `school_coaches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `school_coach_reviews`
--
ALTER TABLE `school_coach_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `school_questions`
--
ALTER TABLE `school_questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `busniess_hours`
--
ALTER TABLE `busniess_hours`
  ADD CONSTRAINT `busniess_hours_ibfk_1` FOREIGN KEY (`legend_id`) REFERENCES `legends` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coach_review_attributes`
--
ALTER TABLE `coach_review_attributes`
  ADD CONSTRAINT `coach_review_attributes_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coach_review_attributes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviewimos`
--
ALTER TABLE `reviewimos`
  ADD CONSTRAINT `reviewimos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviewimos_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `school_coaches`
--
ALTER TABLE `school_coaches`
  ADD CONSTRAINT `school_coaches_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
