-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2019 at 06:12 PM
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
(9, '1554641581168_review_image_schema', 4, '2019-04-07 12:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `legends`
--

CREATE TABLE `legends` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
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
(1, 1, 'Nazmul', NULL, NULL, '/uploads/four.jpeg', '2019-04-04 21:23:13', '2019-04-04 21:23:13'),
(2, 2, 'Sadek', NULL, NULL, '/uploads/four.jpeg', NULL, NULL),
(3, 3, 'Ashraf', NULL, NULL, '/uploads/four.jpeg', NULL, NULL),
(4, 4, 'Kamran Ahmed', 'Sylhet,Bangladesh', NULL, '/uploads/four.jpeg', '2019-04-04 21:30:30', '2019-04-04 23:06:42');

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
(3, 1, '/uploads/1554648218786.png', '2019-04-07 20:43:40', '2019-04-07 20:43:40');

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
(16, 0, 1, 'uihnkjnkjjmn', 0, 1, 0, 0, 0, 0, '2019-04-07 20:57:41', '2019-04-07 20:57:41');

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
(6, 14, '/uploads/1554648557317.jpeg', '2019-04-07 20:49:44', '2019-04-07 20:49:44');

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
  `packType` int(60) NOT NULL,
  `accountActivationToken` varchar(60) DEFAULT NULL,
  `passwordToken` varchar(60) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `birthday`, `zip`, `packType`, `accountActivationToken`, `passwordToken`, `created_at`, `updated_at`) VALUES
(1, 'Nazmul', 'Chowdhury', 'nazmul@gmail.com', '$2a$10$2IL0iJW53DuuyE9hOXAWqek3Pq8mkWHEkx6XSvx9xFX1G8PIdtUFS', '2000-04-29T18:00:00.000Z', '3210', 2, NULL, NULL, '2019-04-03 20:20:09', '2019-04-03 20:20:09'),
(2, 'sadek', 'hossain', 'sadek@gmail.com', '$2a$10$74hKKbdqOoB30dDPmTHNme/6xrMSxwENg4yAqOFWgkOrY6u7Itr1G', '2019-04-23T18:00:00.000Z', 'as', 2, NULL, NULL, '2019-04-03 20:56:19', '2019-04-03 20:56:19'),
(3, 'Ashraf', 'Hakimi', 'ashraf@gmail.com', '$2a$10$oSQAkhdVNZoDEKJ5ZYfC/u2Wr/zfDKsp2EsJ426Chop.3KYovo7kG', '', '3210', 2, NULL, NULL, '2019-04-04 21:23:13', '2019-04-04 21:23:13'),
(4, 'Kamran', 'Ahmed', 'kamran@gmail.com', '$2a$10$FVg.RimiYbj1Os.mNgY46.0fLo58o2a4RAHiQtPNt.HiaUtbw25Ne', '', '3210', 2, NULL, NULL, '2019-04-04 21:30:30', '2019-04-04 21:30:30'),
(5, 'Sakil ', 'Rahman', 'sakil@gmail.com', '$2a$10$ybgVFc20M1JB2TH9FfZlpux1UrIGTnHDrn/yHhNgIeZLvCYo3QG0.', '', '3210', 1, NULL, NULL, '2019-04-04 23:07:42', '2019-04-04 23:07:42'),
(6, 'Kollol', 'Cahk', 'kollol@gmail.com', '$2a$10$gFw38St07Ogy9Q4ln8ud4e6KmSA6FSPM547Cl8p/lzKZVUnI5ggxS', '', '3210', 1, NULL, NULL, '2019-04-04 23:13:34', '2019-04-04 23:13:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `legends`
--
ALTER TABLE `legends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `legend_images`
--
ALTER TABLE `legend_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `review_images`
--
ALTER TABLE `review_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
