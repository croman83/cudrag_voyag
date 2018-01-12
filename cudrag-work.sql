-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 12, 2018 at 08:02 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cudrag`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title_ru` text COLLATE utf8_unicode_ci,
  `title_ro` text COLLATE utf8_unicode_ci,
  `title_en` text COLLATE utf8_unicode_ci,
  `image` text COLLATE utf8_unicode_ci,
  `description_mini_ru` mediumtext COLLATE utf8_unicode_ci,
  `description_mini_ro` mediumtext COLLATE utf8_unicode_ci,
  `description_mini_en` mediumtext COLLATE utf8_unicode_ci,
  `description_ru` longtext COLLATE utf8_unicode_ci,
  `description_ro` longtext COLLATE utf8_unicode_ci,
  `description_en` longtext COLLATE utf8_unicode_ci,
  `seo_title_ru` text COLLATE utf8_unicode_ci,
  `seo_title_ro` text COLLATE utf8_unicode_ci,
  `seo_title_en` text COLLATE utf8_unicode_ci,
  `seo_description_ru` text COLLATE utf8_unicode_ci,
  `seo_description_ro` text COLLATE utf8_unicode_ci,
  `seo_description_en` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title_ru`, `title_ro`, `title_en`, `image`, `description_mini_ru`, `description_mini_ro`, `description_mini_en`, `description_ru`, `description_ro`, `description_en`, `seo_title_ru`, `seo_title_ro`, `seo_title_en`, `seo_description_ru`, `seo_description_ro`, `seo_description_en`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Первый заголовок', NULL, NULL, 'blogs/January2018/iK4auncDTX3CCe3xnZeR.jpg', '<p>Это маленькое описание</p>', NULL, NULL, NULL, NULL, NULL, 'Сео заголовок', NULL, NULL, 'Сео описание', NULL, NULL, 1, 'pervyj-zagolovok', '2018-01-12 14:41:02', '2018-01-12 14:41:02'),
(2, 'Вторая новость', NULL, NULL, 'blogs/January2018/HMC57X7Nl8NDE4SDCFbV.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'vtoraya-novost-', '2018-01-12 14:53:50', '2018-01-12 14:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `slug`, `created_at`, `updated_at`, `image`, `name_ru`, `name_ro`, `name_en`, `status`) VALUES
(1, NULL, 1, 'dekor', '2018-01-11 15:06:42', '2018-01-12 06:12:28', 'categories/January2018/8PfXmU7V5vaTW9DRwuhT.jpg', 'Декор', 'Decorul', 'Decor', 1),
(2, NULL, 1, 'decoration', '2018-01-11 16:34:37', '2018-01-12 07:11:22', 'categories/January2018/2OSlCGTpX3WwbX0BBmGZ.jpg', 'Оформление', 'Decorarea', 'Decoration', 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(2, 1, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '', 2),
(3, 1, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, '', 3),
(4, 1, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 4),
(5, 1, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 5),
(6, 1, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 6),
(7, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(8, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}', 8),
(9, 1, 'meta_description', 'text_area', 'meta_description', 1, 0, 1, 1, 1, 1, '', 9),
(10, 1, 'meta_keywords', 'text_area', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 10),
(11, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(12, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 12),
(13, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 13),
(14, 2, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(15, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '', 2),
(16, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '', 3),
(17, 2, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 4),
(18, 2, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, '', 5),
(19, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"}}', 6),
(20, 2, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, '', 7),
(21, 2, 'meta_keywords', 'text', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 8),
(22, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(23, 2, 'created_at', 'timestamp', 'created_at', 1, 1, 1, 0, 0, 0, '', 10),
(24, 2, 'updated_at', 'timestamp', 'updated_at', 1, 0, 0, 0, 0, 0, '', 11),
(25, 2, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, '', 12),
(26, 3, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, NULL, 1),
(27, 3, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, NULL, 2),
(28, 3, 'email', 'text', 'email', 1, 1, 1, 1, 1, 1, NULL, 3),
(29, 3, 'password', 'password', 'password', 1, 0, 0, 1, 1, 0, NULL, 4),
(30, 3, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', 10),
(31, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, NULL, 5),
(32, 3, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, NULL, 6),
(33, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, NULL, 7),
(34, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(35, 5, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(36, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(37, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(38, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(39, 4, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, NULL, 1),
(40, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(41, 4, 'order', 'text', 'order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(43, 4, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name_en\"}}', 4),
(44, 4, 'created_at', 'timestamp', 'created_at', 0, 0, 1, 0, 0, 0, NULL, 10),
(45, 4, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, NULL, 11),
(46, 6, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(47, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(48, 6, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(49, 6, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(50, 6, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(51, 1, 'seo_title', 'text', 'seo_title', 0, 1, 1, 1, 1, 1, '', 14),
(52, 1, 'featured', 'checkbox', 'featured', 1, 1, 1, 1, 1, 1, '', 15),
(53, 3, 'role_id', 'text', 'role_id', 0, 1, 1, 1, 1, 1, NULL, 9),
(54, 4, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"600\",\"height\":null}}', 5),
(55, 4, 'name_ru', 'text', 'Name Ru', 0, 1, 1, 1, 1, 1, NULL, 7),
(56, 4, 'name_ro', 'text', 'Name Ro', 0, 1, 1, 1, 1, 1, NULL, 8),
(57, 4, 'name_en', 'text', 'Name En', 0, 1, 1, 1, 1, 1, NULL, 6),
(58, 4, 'status', 'checkbox', 'Status', 1, 1, 1, 1, 1, 1, NULL, 9),
(59, 3, 'locale', 'text', 'Locale', 1, 0, 1, 0, 1, 1, NULL, 10),
(60, 7, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(61, 7, 'product_id', 'number', 'Product Id', 0, 1, 1, 1, 1, 1, NULL, 2),
(62, 7, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1200\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"}]}', 3),
(63, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(64, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(65, 10, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(66, 10, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1200\",\"height\":null}}', 2),
(67, 10, 'name_ru', 'text', 'Name Ru', 0, 1, 1, 1, 1, 1, NULL, 3),
(68, 10, 'name_ro', 'text', 'Name Ro', 0, 1, 1, 1, 1, 1, NULL, 4),
(69, 10, 'name_en', 'text', 'Name En', 0, 1, 1, 1, 1, 1, NULL, 5),
(70, 10, 'title_ru', 'text', 'Title Ru', 0, 1, 1, 1, 1, 1, NULL, 6),
(71, 10, 'title_ro', 'text', 'Title Ro', 0, 1, 1, 1, 1, 1, NULL, 7),
(72, 10, 'title_en', 'text', 'Title En', 0, 1, 1, 1, 1, 1, NULL, 8),
(73, 10, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, NULL, 9),
(74, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 10),
(75, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 11),
(76, 10, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 1, 1, NULL, 12),
(77, 11, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(78, 11, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1200\",\"height\":null},\"display\":{\"width\":\"6\"}}', 2),
(79, 11, 'name_ru', 'text', 'Name Ru', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 3),
(80, 11, 'name_ro', 'text', 'Name Ro', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 4),
(81, 11, 'name_en', 'text', 'Name En', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 5),
(82, 11, 'title_ru', 'text', 'Title Ru', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 6),
(83, 11, 'title_ro', 'text', 'Title Ro', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 7),
(84, 11, 'title_en', 'text', 'Title En', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 8),
(85, 11, 'link', 'text', 'Link', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 9),
(86, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 10),
(87, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 11),
(88, 11, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 12),
(89, 12, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(90, 12, 'title_ru', 'text', 'Title Ru', 0, 1, 1, 1, 1, 1, NULL, 2),
(91, 12, 'title_ro', 'text', 'Title Ro', 0, 0, 1, 1, 1, 1, NULL, 3),
(92, 12, 'title_en', 'text', 'Title En', 0, 0, 1, 1, 1, 1, NULL, 4),
(93, 12, 'category_image', 'image', 'Category Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"600\",\"height\":null}}', 5),
(94, 12, 'description_mini_ru', 'rich_text_box', 'Description Mini Ru', 0, 0, 1, 1, 1, 1, NULL, 7),
(95, 12, 'description_mini_ro', 'rich_text_box', 'Description Mini Ro', 0, 0, 1, 1, 1, 1, NULL, 8),
(96, 12, 'description_mini_en', 'rich_text_box', 'Description Mini En', 0, 0, 1, 1, 1, 1, NULL, 9),
(97, 12, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title_en\",\"forceUpdate\":true}}', 6),
(98, 12, 'description_ru', 'rich_text_box', 'Description Ru', 0, 0, 1, 1, 1, 1, NULL, 10),
(99, 12, 'description_ro', 'rich_text_box', 'Description Ro', 0, 0, 1, 1, 1, 1, NULL, 11),
(100, 12, 'description_en', 'rich_text_box', 'Description En', 0, 0, 1, 1, 1, 1, NULL, 12),
(101, 12, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 1, 0, NULL, 13),
(102, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 14),
(103, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 15),
(104, 13, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(105, 13, 'title_ru', 'text', 'Title Ru', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 2),
(106, 13, 'title_ro', 'text', 'Title Ro', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 3),
(107, 13, 'title_en', 'text', 'Title En', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 4),
(108, 13, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"600\",\"height\":null},\"display\":{\"width\":\"12\"}}', 5),
(109, 13, 'description_mini_ru', 'rich_text_box', 'Description Mini Ru', 0, 0, 1, 1, 1, 1, NULL, 6),
(110, 13, 'description_mini_ro', 'rich_text_box', 'Description Mini Ro', 0, 0, 1, 1, 1, 1, NULL, 7),
(111, 13, 'description_mini_en', 'rich_text_box', 'Description Mini En', 0, 0, 1, 1, 1, 1, NULL, 8),
(112, 13, 'description_ru', 'rich_text_box', 'Description Ru', 0, 0, 1, 1, 1, 1, NULL, 9),
(113, 13, 'description_ro', 'rich_text_box', 'Description Ro', 0, 0, 1, 1, 1, 1, NULL, 10),
(114, 13, 'description_en', 'rich_text_box', 'Description En', 0, 0, 1, 1, 1, 1, NULL, 11),
(115, 13, 'seo_title_ru', 'text', 'Seo Title Ru', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 12),
(116, 13, 'seo_title_ro', 'text', 'Seo Title Ro', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 13),
(117, 13, 'seo_title_en', 'text', 'Seo Title En', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 14),
(118, 13, 'seo_description_ru', 'text_area', 'Seo Description Ru', 0, 0, 1, 1, 1, 1, NULL, 15),
(119, 13, 'seo_description_ro', 'text_area', 'Seo Description Ro', 0, 0, 1, 1, 1, 1, NULL, 16),
(120, 13, 'seo_description_en', 'text_area', 'Seo Description En', 0, 0, 1, 1, 1, 1, NULL, 17),
(121, 13, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 1, 1, NULL, 18),
(122, 13, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title_ru\",\"forceUpdate\":true}}', 19),
(123, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 20),
(124, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 21);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `created_at`, `updated_at`) VALUES
(1, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, '2018-01-11 14:24:07', '2018-01-11 14:24:07'),
(2, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, '2018-01-11 14:24:07', '2018-01-11 14:24:07'),
(3, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', NULL, NULL, 1, 0, '2018-01-11 14:24:07', '2018-01-11 17:29:23'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '2018-01-11 14:24:07', '2018-01-11 15:05:18'),
(5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, '2018-01-11 14:24:07', '2018-01-11 14:24:07'),
(6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, '2018-01-11 14:24:07', '2018-01-11 14:24:07'),
(7, 'Productimages', 'productimages', 'Productimage', 'Productimages', 'voyager-images', 'App\\Productimage', NULL, NULL, NULL, 1, 0, '2018-01-11 17:55:47', '2018-01-11 17:55:47'),
(10, 'mainslider', 'mainslider', 'Mainslider', 'Mainsliders', 'voyager-photos', 'App\\Mainslider', NULL, NULL, NULL, 1, 0, '2018-01-12 08:52:21', '2018-01-12 08:53:16'),
(11, 'mainsliders', 'mainsliders', 'Слайдер', 'Слайдеры', 'voyager-photos', 'App\\Mainslider', NULL, NULL, NULL, 1, 0, '2018-01-12 08:56:53', '2018-01-12 11:15:15'),
(12, 'Partners', 'partners', 'Партнеры', 'Партнеры', 'voyager-people', 'App\\Partner', NULL, NULL, NULL, 1, 0, '2018-01-12 11:38:42', '2018-01-12 11:39:08'),
(13, 'blogs', 'blogs', 'Блог', 'Блоги', 'voyager-news', 'App\\Blog', NULL, NULL, NULL, 1, 0, '2018-01-12 13:57:40', '2018-01-12 14:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `mainsliders`
--

CREATE TABLE `mainsliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `name_ru` text COLLATE utf8_unicode_ci,
  `name_ro` text COLLATE utf8_unicode_ci,
  `name_en` text COLLATE utf8_unicode_ci,
  `title_ru` text COLLATE utf8_unicode_ci,
  `title_ro` text COLLATE utf8_unicode_ci,
  `title_en` text COLLATE utf8_unicode_ci,
  `link` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mainsliders`
--

INSERT INTO `mainsliders` (`id`, `image`, `name_ru`, `name_ro`, `name_en`, `title_ru`, `title_ro`, `title_en`, `link`, `created_at`, `updated_at`, `status`) VALUES
(1, 'mainsliders/January2018/kCy2DLhYZVcxHa4wtAk6.jpg', 'Wedding', 'Wedding', 'Wedding', 'This is the best wedding', NULL, 'This is the best wedding', 'wedding', '2018-01-12 09:04:00', '2018-01-12 10:01:59', 1),
(2, 'mainsliders/January2018/5gyI7Psx9N1TcHg1ifyd.jpg', 'Decor_ru', 'Decor_ro', 'Decor_en', 'Decor', 'Decor', 'Decor', 'test', '2018-01-12 09:05:49', '2018-01-12 09:31:26', 1),
(3, 'mainsliders/January2018/MRhf49hkjsVaupTzSY9y.jpg', 'Paper', 'Paper', 'Paper', 'Paper', 'Paper', 'Paper', 'Paper', '2018-01-12 09:39:18', '2018-01-12 09:39:18', 1),
(4, 'mainsliders/January2018/LlIHXEXXu7Ead6Z4KGgs.jpg', 'Test', 'Test', 'Test', 'Test', 'Test', 'Test', 'test', '2018-01-12 10:24:46', '2018-01-12 10:24:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2018-01-11 14:24:08', '2018-01-11 14:24:08'),
(2, 'upper', '2018-01-12 07:14:00', '2018-01-12 07:14:00');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Главная', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2018-01-11 14:24:08', '2018-01-11 14:58:21', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2018-01-11 14:24:08', '2018-01-12 11:41:15', 'voyager.media.index', NULL),
(3, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 9, '2018-01-11 14:24:08', '2018-01-12 11:41:15', 'voyager.posts.index', NULL),
(4, 1, 'Пользователи', '', '_self', 'voyager-person', '#000000', NULL, 12, '2018-01-11 14:24:08', '2018-01-12 11:41:03', 'voyager.users.index', 'null'),
(5, 1, 'Категории', '', '_self', 'voyager-categories', '#000000', NULL, 2, '2018-01-11 14:24:08', '2018-01-12 11:41:03', 'voyager.categories.index', 'null'),
(6, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 10, '2018-01-11 14:24:08', '2018-01-12 11:41:03', 'voyager.pages.index', NULL),
(7, 1, 'Права', '', '_self', 'voyager-lock', '#000000', NULL, 11, '2018-01-11 14:24:08', '2018-01-12 11:41:03', 'voyager.roles.index', 'null'),
(8, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2018-01-11 14:24:08', '2018-01-12 11:41:15', NULL, NULL),
(9, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 8, 1, '2018-01-11 14:24:08', '2018-01-12 11:14:20', 'voyager.menus.index', NULL),
(10, 1, 'Database', '', '_self', 'voyager-data', NULL, 8, 2, '2018-01-11 14:24:08', '2018-01-12 11:14:20', 'voyager.database.index', NULL),
(11, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 8, 3, '2018-01-11 14:24:08', '2018-01-12 11:14:20', 'voyager.compass.index', NULL),
(12, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 8, 4, '2018-01-11 14:24:08', '2018-01-12 11:14:20', 'voyager.hooks', NULL),
(13, 1, 'Настройки', '', '_self', 'voyager-settings', '#000000', NULL, 7, '2018-01-11 14:24:08', '2018-01-12 11:41:15', 'voyager.settings.index', 'null'),
(14, 1, 'Productimages', '/admin/productimages', '_self', 'voyager-images', NULL, NULL, 8, '2018-01-11 17:55:47', '2018-01-12 11:41:15', NULL, NULL),
(16, 1, 'Слайдер', '/admin/mainsliders', '_self', 'voyager-photos', '#000000', NULL, 4, '2018-01-12 08:56:53', '2018-01-12 11:41:15', NULL, ''),
(17, 1, 'Партнеры', '/admin/partners', '_self', 'voyager-people', '#000000', NULL, 3, '2018-01-12 11:38:42', '2018-01-12 11:41:15', NULL, ''),
(18, 1, 'Блоги', '/admin/blogs', '_self', 'voyager-news', NULL, NULL, 13, '2018-01-12 13:57:41', '2018-01-12 13:57:41', NULL, NULL);

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_add_permission_group_id_to_permissions_table', 1),
(17, '2017_01_15_000000_create_permission_groups_table', 1),
(18, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(19, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(20, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(21, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(22, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(23, '2017_08_05_000000_add_group_to_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Partners`
--

CREATE TABLE `Partners` (
  `id` int(10) UNSIGNED NOT NULL,
  `title_ru` text COLLATE utf8_unicode_ci,
  `title_ro` text COLLATE utf8_unicode_ci,
  `title_en` text COLLATE utf8_unicode_ci,
  `category_image` text COLLATE utf8_unicode_ci,
  `description_mini_ru` mediumtext COLLATE utf8_unicode_ci,
  `description_mini_ro` mediumtext COLLATE utf8_unicode_ci,
  `description_mini_en` mediumtext COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_ru` longtext COLLATE utf8_unicode_ci,
  `description_ro` longtext COLLATE utf8_unicode_ci,
  `description_en` longtext COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Partners`
--

INSERT INTO `Partners` (`id`, `title_ru`, `title_ro`, `title_en`, `category_image`, `description_mini_ru`, `description_mini_ro`, `description_mini_en`, `slug`, `description_ru`, `description_ro`, `description_en`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ILoveYou', 'ILoveYou', 'ILoveYou', 'partners/January2018/XYnChLjOqZnqMzPjfB00.jpg', '<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации \"Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..\" Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам \"lorem ipsum\" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis commodi consequuntur est excepturi fugit incidunt, laborum magni, maxime minima minus nam necessitatibus nulla officia quia reiciendis similique sit voluptate voluptates</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis commodi consequuntur est excepturi fugit incidunt, laborum magni, maxime minima minus nam necessitatibus nulla officia quia reiciendis similique sit voluptate voluptates</p>', 'iloveyou', NULL, NULL, NULL, 1, '2018-01-12 11:43:52', '2018-01-12 12:12:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
(1, 'browse_admin', NULL, '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(2, 'browse_database', NULL, '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(3, 'browse_media', NULL, '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(4, 'browse_compass', NULL, '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(5, 'browse_hooks', NULL, '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(6, 'browse_menus', 'menus', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(7, 'read_menus', 'menus', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(8, 'edit_menus', 'menus', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(9, 'add_menus', 'menus', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(10, 'delete_menus', 'menus', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(11, 'browse_pages', 'pages', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(12, 'read_pages', 'pages', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(13, 'edit_pages', 'pages', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(14, 'add_pages', 'pages', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(15, 'delete_pages', 'pages', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(16, 'browse_roles', 'roles', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(17, 'read_roles', 'roles', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(18, 'edit_roles', 'roles', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(19, 'add_roles', 'roles', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(20, 'delete_roles', 'roles', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(21, 'browse_users', 'users', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(22, 'read_users', 'users', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(23, 'edit_users', 'users', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(24, 'add_users', 'users', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(25, 'delete_users', 'users', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(26, 'browse_posts', 'posts', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(27, 'read_posts', 'posts', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(28, 'edit_posts', 'posts', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(29, 'add_posts', 'posts', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(30, 'delete_posts', 'posts', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(31, 'browse_categories', 'categories', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(32, 'read_categories', 'categories', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(33, 'edit_categories', 'categories', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(34, 'add_categories', 'categories', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(35, 'delete_categories', 'categories', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(36, 'browse_settings', 'settings', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(37, 'read_settings', 'settings', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(38, 'edit_settings', 'settings', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(39, 'add_settings', 'settings', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(40, 'delete_settings', 'settings', '2018-01-11 14:24:08', '2018-01-11 14:24:08', NULL),
(41, 'browse_Productimages', 'Productimages', '2018-01-11 17:55:47', '2018-01-11 17:55:47', NULL),
(42, 'read_Productimages', 'Productimages', '2018-01-11 17:55:47', '2018-01-11 17:55:47', NULL),
(43, 'edit_Productimages', 'Productimages', '2018-01-11 17:55:47', '2018-01-11 17:55:47', NULL),
(44, 'add_Productimages', 'Productimages', '2018-01-11 17:55:47', '2018-01-11 17:55:47', NULL),
(45, 'delete_Productimages', 'Productimages', '2018-01-11 17:55:47', '2018-01-11 17:55:47', NULL),
(46, 'browse_mainslider', 'mainslider', '2018-01-12 08:52:21', '2018-01-12 08:52:21', NULL),
(47, 'read_mainslider', 'mainslider', '2018-01-12 08:52:21', '2018-01-12 08:52:21', NULL),
(48, 'edit_mainslider', 'mainslider', '2018-01-12 08:52:21', '2018-01-12 08:52:21', NULL),
(49, 'add_mainslider', 'mainslider', '2018-01-12 08:52:21', '2018-01-12 08:52:21', NULL),
(50, 'delete_mainslider', 'mainslider', '2018-01-12 08:52:21', '2018-01-12 08:52:21', NULL),
(51, 'browse_mainsliders', 'mainsliders', '2018-01-12 08:56:53', '2018-01-12 08:56:53', NULL),
(52, 'read_mainsliders', 'mainsliders', '2018-01-12 08:56:53', '2018-01-12 08:56:53', NULL),
(53, 'edit_mainsliders', 'mainsliders', '2018-01-12 08:56:53', '2018-01-12 08:56:53', NULL),
(54, 'add_mainsliders', 'mainsliders', '2018-01-12 08:56:53', '2018-01-12 08:56:53', NULL),
(55, 'delete_mainsliders', 'mainsliders', '2018-01-12 08:56:53', '2018-01-12 08:56:53', NULL),
(56, 'browse_Partners', 'Partners', '2018-01-12 11:38:42', '2018-01-12 11:38:42', NULL),
(57, 'read_Partners', 'Partners', '2018-01-12 11:38:42', '2018-01-12 11:38:42', NULL),
(58, 'edit_Partners', 'Partners', '2018-01-12 11:38:42', '2018-01-12 11:38:42', NULL),
(59, 'add_Partners', 'Partners', '2018-01-12 11:38:42', '2018-01-12 11:38:42', NULL),
(60, 'delete_Partners', 'Partners', '2018-01-12 11:38:42', '2018-01-12 11:38:42', NULL),
(61, 'browse_blogs', 'blogs', '2018-01-12 13:57:41', '2018-01-12 13:57:41', NULL),
(62, 'read_blogs', 'blogs', '2018-01-12 13:57:41', '2018-01-12 13:57:41', NULL),
(63, 'edit_blogs', 'blogs', '2018-01-12 13:57:41', '2018-01-12 13:57:41', NULL),
(64, 'add_blogs', 'blogs', '2018-01-12 13:57:41', '2018-01-12 13:57:41', NULL),
(65, 'delete_blogs', 'blogs', '2018-01-12 13:57:41', '2018-01-12 13:57:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Productimages`
--

CREATE TABLE `Productimages` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2018-01-11 14:24:08', '2018-01-11 14:24:08'),
(2, 'user', 'Normal User', '2018-01-11 14:24:08', '2018-01-11 14:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'CuDrag.md', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/January2018/ceUa4oaPxmWYRuJrIVHa.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/January2018/0VEGfRACE8UzEkox0p18.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'CuDrag', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Добро пожаловать в админку', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/January2018/n1JH9RUvTF85r4sSjcDG.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'menu_items', 'title', 1, 'en', 'Dashboard', '2018-01-11 14:58:21', '2018-01-11 14:58:21'),
(2, 'menu_items', 'title', 1, 'ro', '', '2018-01-11 14:58:21', '2018-01-11 14:58:21'),
(3, 'menu_items', 'title', 7, 'en', 'Roles', '2018-01-11 14:58:33', '2018-01-11 14:58:33'),
(4, 'menu_items', 'title', 7, 'ro', '', '2018-01-11 14:58:33', '2018-01-11 14:58:33'),
(5, 'menu_items', 'title', 4, 'en', 'Users', '2018-01-11 14:58:45', '2018-01-11 14:58:45'),
(6, 'menu_items', 'title', 4, 'ro', '', '2018-01-11 14:58:45', '2018-01-11 14:58:45'),
(7, 'menu_items', 'title', 13, 'en', 'Settings', '2018-01-11 14:59:11', '2018-01-11 14:59:11'),
(8, 'menu_items', 'title', 13, 'ro', '', '2018-01-11 14:59:11', '2018-01-11 14:59:11'),
(9, 'menu_items', 'title', 5, 'en', 'Categories', '2018-01-11 15:00:52', '2018-01-11 15:00:52'),
(10, 'menu_items', 'title', 5, 'ro', '', '2018-01-11 15:00:52', '2018-01-11 15:00:52'),
(11, 'data_types', 'display_name_singular', 4, 'en', 'Category', '2018-01-11 15:05:18', '2018-01-11 15:05:18'),
(12, 'data_types', 'display_name_singular', 4, 'ro', '', '2018-01-11 15:05:18', '2018-01-11 15:05:18'),
(13, 'data_types', 'display_name_plural', 4, 'en', 'Categories', '2018-01-11 15:05:18', '2018-01-11 15:05:18'),
(14, 'data_types', 'display_name_plural', 4, 'ro', '', '2018-01-11 15:05:18', '2018-01-11 15:05:18'),
(15, 'categories', 'slug', 1, 'en', 'decor', '2018-01-11 15:06:42', '2018-01-11 15:06:42'),
(16, 'categories', 'slug', 1, 'ro', 'decorul', '2018-01-11 15:06:42', '2018-01-11 15:06:42'),
(17, 'categories', 'name', 1, 'en', 'Decor', '2018-01-11 15:06:42', '2018-01-11 15:06:42'),
(18, 'categories', 'name', 1, 'ro', 'Decorul', '2018-01-11 15:06:42', '2018-01-11 15:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `locale` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `created_at`, `updated_at`, `locale`) VALUES
(1, 1, 'roman', 'casian.roma@gmail.com', 'users/January2018/Bvm4saZIDuL2lmslywYh.jpg', '$2y$10$VIXC9B3.qX0yUxwQztSeAeoKS9JdqnzVfvnLsF8bE3u2PtXf7yeO2', 'iTqQB3ukpkDNvRjhB7kC54WtLwqdORgHKkreUQv2QocY2fnJ6mwNzjCaVZoT', '2018-01-11 14:25:19', '2018-01-12 12:18:45', 'ru');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `mainsliders`
--
ALTER TABLE `mainsliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `Partners`
--
ALTER TABLE `Partners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `partners_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_groups_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `Productimages`
--
ALTER TABLE `Productimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

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
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `mainsliders`
--
ALTER TABLE `mainsliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Partners`
--
ALTER TABLE `Partners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Productimages`
--
ALTER TABLE `Productimages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
