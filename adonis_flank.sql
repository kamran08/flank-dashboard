-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2019 at 06:42 PM
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
(12, '1554883104457_reviewimo_schema', 6, '2019-04-10 08:00:45'),
(13, '1554898110876_busniess_hour_schema', 7, '2019-04-10 12:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
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
(10, 4, 3, 'answer!1', '2019-04-10 23:59:47', '2019-04-10 23:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `busniess_hours`
--

CREATE TABLE `busniess_hours` (
  `id` int(10) UNSIGNED NOT NULL,
  `legend_id` int(11) DEFAULT NULL,
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
(5, 3, '11:00 AM-03:00 PM', 'Wednesday', '2019-04-10 19:48:23', '2019-04-10 19:48:23');

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
(1, 1, 'Nazmul', '', '', '/image/school logo.png', '2019-04-04 21:23:13', '2019-04-04 21:23:13'),
(2, 2, 'Sadek', '', '', '/image/school logo.png', NULL, NULL),
(3, 3, 'Ashraf', 'Dhaka,Bangladesh', '01681189844', '/image/school logo.png', NULL, '2019-04-10 19:48:23'),
(4, 4, 'Kamran Ahmed', 'Sylhet,Bangladesh', '', '/image/school logo.png', '2019-04-04 21:30:30', '2019-04-04 23:06:42');

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
(9, 1, '/uploads/1554673241080.jpeg', '2019-04-08 03:41:24', '2019-04-08 03:41:24'),
(10, 1, '/uploads/1554673251270.jpeg', '2019-04-08 03:41:24', '2019-04-08 03:41:24'),
(11, 1, '/uploads/1554673281154.jpeg', '2019-04-08 03:41:24', '2019-04-08 03:41:24');

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
(5, 1, 2, 'This i', '2019-04-09 23:35:26', '2019-04-09 23:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `reviewimos`
--

CREATE TABLE `reviewimos` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `imo` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviewimos`
--

INSERT INTO `reviewimos` (`id`, `review_id`, `user_id`, `imo`, `created_at`, `updated_at`) VALUES
(1, 10, 3, 'Useful', '2019-04-10 14:17:26', '2019-04-10 14:17:26'),
(2, 10, 3, 'Funny', '2019-04-10 14:53:21', '2019-04-10 14:53:21'),
(3, 11, 3, 'Useful', '2019-04-10 14:53:23', '2019-04-10 14:53:23'),
(4, 11, 3, 'Cool', '2019-04-10 14:53:24', '2019-04-10 14:53:24'),
(5, 11, 3, 'Funny', '2019-04-10 14:53:27', '2019-04-10 14:53:27'),
(6, 12, 3, 'Useful', '2019-04-10 14:53:30', '2019-04-10 14:53:30'),
(7, 12, 3, 'Cool', '2019-04-10 14:53:31', '2019-04-10 14:53:31'),
(8, 12, 3, 'Funny', '2019-04-10 14:53:32', '2019-04-10 14:53:32'),
(9, 14, 3, 'Funny', '2019-04-10 14:53:34', '2019-04-10 14:53:34'),
(10, 14, 3, 'Cool', '2019-04-10 14:53:35', '2019-04-10 14:53:35'),
(11, 15, 3, 'Useful', '2019-04-10 14:53:37', '2019-04-10 14:53:37'),
(12, 15, 3, 'Cool', '2019-04-10 14:53:38', '2019-04-10 14:53:38');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `reviewFor` int(11) NOT NULL,
  `reviwer_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `rating` int(1) NOT NULL DEFAULT '0',
  `q1` int(11) DEFAULT NULL,
  `q2` int(11) DEFAULT NULL,
  `q3` int(11) DEFAULT NULL,
  `q4` int(11) DEFAULT NULL,
  `q5` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `reviewFor`, `reviwer_id`, `content`, `rating`, `q1`, `q2`, `q3`, `q4`, `q5`, `created_at`, `updated_at`) VALUES
(10, 2, 1, 'He is a good coach', 5, 1, 1, 1, 1, 0, '2019-04-07 19:15:46', '2019-04-07 19:15:46'),
(11, 2, 1, 'He is good coach', 5, 1, 1, 1, 1, 0, '2019-04-07 19:20:59', '2019-04-07 19:20:59'),
(12, 2, 1, 'He is Awesome!', 5, 1, 1, 1, 1, 0, '2019-04-07 19:25:19', '2019-04-07 19:25:19'),
(13, 2, 1, 'This coach uis good.', 5, 1, 1, 1, 1, 1, '2019-04-07 20:45:33', '2019-04-07 20:45:33'),
(14, 2, 1, 'He is cool Page', 5, 1, 1, 1, 1, 0, '2019-04-07 20:49:44', '2019-04-07 20:49:44'),
(15, 2, 1, 'he is awesome coach', 5, 1, 1, 1, 0, 0, '2019-04-07 20:51:46', '2019-04-07 20:51:46'),
(16, 2, 3, 'This is Review 3 Rating', 3, 0, 1, 1, 1, 1, '2019-04-11 00:34:33', '2019-04-11 00:34:33'),
(17, 2, 3, 'This is Rating 5', 5, 1, 1, 1, 0, 0, '2019-04-11 00:35:59', '2019-04-11 00:35:59'),
(18, 2, 3, 'Review 3', 3, 1, 1, 1, 1, 1, '2019-04-11 00:53:43', '2019-04-11 00:53:43');

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
(1, 12, '/uploads/1554643498542.jpeg', '2019-04-07 19:25:19', '2019-04-07 19:25:19'),
(2, 12, '/uploads/1554643503060.jpeg', '2019-04-07 19:25:19', '2019-04-07 19:25:19'),
(3, 13, '/uploads/1554648324981.jpeg', '2019-04-07 20:45:33', '2019-04-07 20:45:33'),
(4, 13, '/uploads/1554648327032.jpeg', '2019-04-07 20:45:33', '2019-04-07 20:45:33'),
(5, 14, '/uploads/1554648555064.jpeg', '2019-04-07 20:49:44', '2019-04-07 20:49:44'),
(6, 14, '/uploads/1554648557317.jpeg', '2019-04-07 20:49:44', '2019-04-07 20:49:44'),
(7, 17, '/uploads/1554921353824.png', '2019-04-11 00:35:59', '2019-04-11 00:35:59'),
(8, 17, '/uploads/1554921357561.png', '2019-04-11 00:35:59', '2019-04-11 00:35:59');

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
(1, 'Nazmul', 'Chowdhury', 'nazmul@gmail.com', '$2a$10$2IL0iJW53DuuyE9hOXAWqek3Pq8mkWHEkx6XSvx9xFX1G8PIdtUFS', '2000-04-29T18:00:00.000Z', '3210', 'Sreemangal,Sylhet,Bangladesh', '/uploads/profile.png ', 2, NULL, NULL, '2019-04-03 20:20:09', '2019-04-09 22:38:16'),
(2, 'sadek', 'hossain', 'sadek@gmail.com', '$2a$10$74hKKbdqOoB30dDPmTHNme/6xrMSxwENg4yAqOFWgkOrY6u7Itr1G', '2019-04-23T18:00:00.000Z', 'as', '', '/uploads/profile.png ', 2, NULL, NULL, '2019-04-03 20:56:19', '2019-04-03 20:56:19'),
(3, 'Ashraf', 'Hakimi', 'ashraf@gmail.com', '$2a$10$oSQAkhdVNZoDEKJ5ZYfC/u2Wr/zfDKsp2EsJ426Chop.3KYovo7kG', '', '3210', '', '/uploads/profile.png ', 2, NULL, NULL, '2019-04-04 21:23:13', '2019-04-04 21:23:13'),
(4, 'Kamran', 'Ahmed', 'kamran@gmail.com', '$2a$10$FVg.RimiYbj1Os.mNgY46.0fLo58o2a4RAHiQtPNt.HiaUtbw25Ne', '', '3210', '', '/uploads/profile.png ', 2, NULL, NULL, '2019-04-04 21:30:30', '2019-04-04 21:30:30'),
(5, 'Sakil ', 'Rahman', 'sakil@gmail.com', '$2a$10$ybgVFc20M1JB2TH9FfZlpux1UrIGTnHDrn/yHhNgIeZLvCYo3QG0.', '', '3210', '', '/uploads/profile.png ', 1, NULL, NULL, '2019-04-04 23:07:42', '2019-04-04 23:07:42'),
(6, 'Kollol', 'Cahk', 'kollol@gmail.com', '$2a$10$gFw38St07Ogy9Q4ln8ud4e6KmSA6FSPM547Cl8p/lzKZVUnI5ggxS', '', '3210', '', '/uploads/profile.png ', 1, NULL, NULL, '2019-04-04 23:13:34', '2019-04-04 23:13:34'),
(7, 'Humayun', 'Rahi', 'rahi@gmail.com', '$2a$10$t.D/M9IMjso2iCIUatzWYOG0Yzzyf6WPpyblR0w51SDjmcFzxJac6', '', '', 'Sylhet,Bangladesh', '/uploads/profile.png', 1, NULL, NULL, '2019-04-09 23:07:49', '2019-04-09 23:20:27');

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `busniess_hours`
--
ALTER TABLE `busniess_hours`
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
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviewimos`
--
ALTER TABLE `reviewimos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_images`
--
ALTER TABLE `review_images`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `busniess_hours`
--
ALTER TABLE `busniess_hours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `legends`
--
ALTER TABLE `legends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `legend_images`
--
ALTER TABLE `legend_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviewimos`
--
ALTER TABLE `reviewimos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `review_images`
--
ALTER TABLE `review_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
