-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 09, 2025 at 06:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `in2info`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2025_03_06_174701_create_products_table', 1),
(12, '2025_03_07_183037_create_orders_table', 1),
(13, '2025_03_08_190826_add_is_admin_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `customer_address`, `customer_phone`, `items`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 'Barea Mikawi', 'Main Street', '71295479', '\"[{\\\"id\\\":4,\\\"name\\\":\\\"AirPods Pro\\\",\\\"price\\\":\\\"249.00\\\",\\\"image\\\":\\\"http:\\\\\\/\\\\\\/127.0.0.1:8000\\\\\\/images\\\\\\/airpodspro.jpeg\\\",\\\"description\\\":\\\"High-quality wireless earbuds with noise cancellation.\\\",\\\"quantity\\\":1},{\\\"id\\\":3,\\\"name\\\":\\\"iPad Pro 2024\\\",\\\"price\\\":\\\"1099.00\\\",\\\"image\\\":\\\"http:\\\\\\/\\\\\\/127.0.0.1:8000\\\\\\/images\\\\\\/ipadpro.jpg\\\",\\\"description\\\":\\\"The latest iPad Pro with improved display and features.\\\",\\\"quantity\\\":1}]\"', 1348.00, '2025-03-08 15:31:14', '2025-03-08 15:31:14'),
(2, 'AHMD MOHSEN', 'BYBLOS JBEIL', '71234567', '\"[{\\\"id\\\":22,\\\"name\\\":\\\"Iphone 16 pro max\\\",\\\"price\\\":\\\"1900.00\\\",\\\"image\\\":\\\"http:\\\\\\/\\\\\\/127.0.0.1:8000\\\\\\/storage\\\\\\/images\\\\\\/DAmS6231ulK7FSnzHP66Sdd5WLPVOAIuP2XLstsM.jpg\\\",\\\"description\\\":\\\"The latest iPhone with amazing features\\\",\\\"quantity\\\":1}]\"', 1900.00, '2025-03-09 12:14:29', '2025-03-09 12:14:29'),
(3, 'AHMD MOHSEN', 'BYBLOS JBEIL', '71234567', '\"[{\\\"id\\\":22,\\\"name\\\":\\\"Iphone 16 pro max\\\",\\\"price\\\":\\\"1900.00\\\",\\\"image\\\":\\\"http:\\\\\\/\\\\\\/127.0.0.1:8000\\\\\\/storage\\\\\\/images\\\\\\/DAmS6231ulK7FSnzHP66Sdd5WLPVOAIuP2XLstsM.jpg\\\",\\\"description\\\":\\\"The latest iPhone with amazing features\\\",\\\"quantity\\\":1}]\"', 1900.00, '2025-03-09 12:14:29', '2025-03-09 12:14:29');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `created_at`, `updated_at`) VALUES
(2, 'iPhone 15', 999.00, 'The previous version of iPhone with solid performance.', 'images/iphone15.jpg', '2025-03-07 12:27:25', '2025-03-07 12:27:25'),
(3, 'iPad Pro 2024', 1099.00, 'The latest iPad Pro with improved display and features.', 'images/ipadpro.jpg', '2025-03-07 12:27:25', '2025-03-07 12:27:25'),
(4, 'AirPods Pro', 249.00, 'High-quality wireless earbuds with noise cancellation.', 'images/airpodspro.jpeg', '2025-03-07 12:27:25', '2025-03-07 12:27:25'),
(5, 'PS5', 499.00, 'PlayStation 5 with advanced graphics and performance.', 'images/ps5.jpg', '2025-03-07 12:27:25', '2025-03-07 12:27:25'),
(6, 'Samsung Galaxy S25', 899.00, 'The latest Samsung phone with a powerful camera.', 'images/s25.jpg', '2025-03-07 12:27:25', '2025-03-07 12:27:25'),
(7, 'Samsung Galaxy S24', 799.00, 'Previous model of Galaxy S with great performance.', 'images/s24.jpg', '2025-03-07 12:27:25', '2025-03-07 12:27:25'),
(18, 'Macbook Pro', 1600.00, 'acBook Pro with Apple M1 chip and stunning display', 'images/Mzf518v11aMa8tZpqKhkSrQQo9I6HA9Y86PqD8ST.jpg', '2025-03-08 16:12:58', '2025-03-08 16:56:21'),
(22, 'Iphone 16 pro max', 1900.00, 'The latest iPhone with amazing features', 'images/DAmS6231ulK7FSnzHP66Sdd5WLPVOAIuP2XLstsM.jpg', '2025-03-09 11:37:13', '2025-03-09 11:37:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'Baria Mikawi', 'bariamikawi@gmail.com', NULL, '$2y$10$mdDwIhFn59VKWWERKPaTjOCqs7t/.BBVEL.gFjRK.mvj59KVUS5V.', NULL, '2025-03-08 09:35:45', '2025-03-08 09:35:45', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
