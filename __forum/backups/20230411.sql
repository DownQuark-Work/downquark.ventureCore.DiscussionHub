-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 11, 2023 at 04:29 AM
-- Server version: 10.5.18-MariaDB
-- PHP Version: 8.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `downquark_devigner`
--

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_access_tokens`
--

CREATE TABLE `dvnr_access_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(40) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `type` varchar(100) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `last_ip_address` varchar(45) DEFAULT NULL,
  `last_user_agent` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dvnr_access_tokens`
--

INSERT INTO `dvnr_access_tokens` (`id`, `token`, `user_id`, `last_activity_at`, `created_at`, `type`, `title`, `last_ip_address`, `last_user_agent`) VALUES
(1, '7ohVfyxjrOIgprBtUrr4Ktau0Nv2A7YrHkS3YFVe', 1, '2023-04-11 04:17:22', '2023-04-11 03:30:18', 'session_remember', NULL, '73.123.30.220', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_api_keys`
--

CREATE TABLE `dvnr_api_keys` (
  `key` varchar(100) NOT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `allowed_ips` varchar(255) DEFAULT NULL,
  `scopes` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_activity_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_discussions`
--

CREATE TABLE `dvnr_discussions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `comment_count` int(11) NOT NULL DEFAULT 1,
  `participant_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `post_number_index` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `first_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_post_number` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `is_sticky` tinyint(1) NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_discussion_tag`
--

CREATE TABLE `dvnr_discussion_tag` (
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_discussion_user`
--

CREATE TABLE `dvnr_discussion_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `last_read_at` datetime DEFAULT NULL,
  `last_read_post_number` int(10) UNSIGNED DEFAULT NULL,
  `subscription` enum('follow','ignore') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_email_tokens`
--

CREATE TABLE `dvnr_email_tokens` (
  `token` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_flags`
--

CREATE TABLE `dvnr_flags` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `reason_detail` text DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_groups`
--

CREATE TABLE `dvnr_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_singular` varchar(100) NOT NULL,
  `name_plural` varchar(100) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dvnr_groups`
--

INSERT INTO `dvnr_groups` (`id`, `name_singular`, `name_plural`, `color`, `icon`, `is_hidden`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admins', '#B72A2A', 'fas fa-wrench', 0, NULL, NULL),
(2, 'Guest', 'Guests', NULL, NULL, 0, NULL, NULL),
(3, 'Member', 'Members', NULL, NULL, 0, NULL, NULL),
(4, 'Mod', 'Mods', '#80349E', 'fas fa-bolt', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_group_permission`
--

CREATE TABLE `dvnr_group_permission` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `permission` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dvnr_group_permission`
--

INSERT INTO `dvnr_group_permission` (`group_id`, `permission`, `created_at`) VALUES
(2, 'viewForum', NULL),
(3, 'discussion.flagPosts', '2023-04-11 03:30:18'),
(3, 'discussion.likePosts', '2023-04-11 03:30:20'),
(3, 'discussion.reply', NULL),
(3, 'discussion.replyWithoutApproval', '2023-04-11 03:30:19'),
(3, 'discussion.startWithoutApproval', '2023-04-11 03:30:19'),
(3, 'searchUsers', NULL),
(3, 'startDiscussion', NULL),
(4, 'discussion.approvePosts', '2023-04-11 03:30:19'),
(4, 'discussion.editPosts', NULL),
(4, 'discussion.hide', NULL),
(4, 'discussion.hidePosts', NULL),
(4, 'discussion.lock', '2023-04-11 03:30:20'),
(4, 'discussion.rename', NULL),
(4, 'discussion.sticky', '2023-04-11 03:30:19'),
(4, 'discussion.tag', '2023-04-11 03:30:19'),
(4, 'discussion.viewFlags', '2023-04-11 03:30:18'),
(4, 'discussion.viewIpsPosts', NULL),
(4, 'user.suspend', '2023-04-11 03:30:19'),
(4, 'user.viewLastSeenAt', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_group_user`
--

CREATE TABLE `dvnr_group_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dvnr_group_user`
--

INSERT INTO `dvnr_group_user` (`user_id`, `group_id`, `created_at`) VALUES
(1, 1, '2023-04-11 03:30:18');

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_login_providers`
--

CREATE TABLE `dvnr_login_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(100) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_migrations`
--

CREATE TABLE `dvnr_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `extension` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dvnr_migrations`
--

INSERT INTO `dvnr_migrations` (`id`, `migration`, `extension`) VALUES
(1, '2015_02_24_000000_create_access_tokens_table', NULL),
(2, '2015_02_24_000000_create_api_keys_table', NULL),
(3, '2015_02_24_000000_create_config_table', NULL),
(4, '2015_02_24_000000_create_discussions_table', NULL),
(5, '2015_02_24_000000_create_email_tokens_table', NULL),
(6, '2015_02_24_000000_create_groups_table', NULL),
(7, '2015_02_24_000000_create_notifications_table', NULL),
(8, '2015_02_24_000000_create_password_tokens_table', NULL),
(9, '2015_02_24_000000_create_permissions_table', NULL),
(10, '2015_02_24_000000_create_posts_table', NULL),
(11, '2015_02_24_000000_create_users_discussions_table', NULL),
(12, '2015_02_24_000000_create_users_groups_table', NULL),
(13, '2015_02_24_000000_create_users_table', NULL),
(14, '2015_09_15_000000_create_auth_tokens_table', NULL),
(15, '2015_09_20_224327_add_hide_to_discussions', NULL),
(16, '2015_09_22_030432_rename_notification_read_time', NULL),
(17, '2015_10_07_130531_rename_config_to_settings', NULL),
(18, '2015_10_24_194000_add_ip_address_to_posts', NULL),
(19, '2015_12_05_042721_change_access_tokens_columns', NULL),
(20, '2015_12_17_194247_change_settings_value_column_to_text', NULL),
(21, '2016_02_04_095452_add_slug_to_discussions', NULL),
(22, '2017_04_07_114138_add_is_private_to_discussions', NULL),
(23, '2017_04_07_114138_add_is_private_to_posts', NULL),
(24, '2018_01_11_093900_change_access_tokens_columns', NULL),
(25, '2018_01_11_094000_change_access_tokens_add_foreign_keys', NULL),
(26, '2018_01_11_095000_change_api_keys_columns', NULL),
(27, '2018_01_11_101800_rename_auth_tokens_to_registration_tokens', NULL),
(28, '2018_01_11_102000_change_registration_tokens_rename_id_to_token', NULL),
(29, '2018_01_11_102100_change_registration_tokens_created_at_to_datetime', NULL),
(30, '2018_01_11_120604_change_posts_table_to_innodb', NULL),
(31, '2018_01_11_155200_change_discussions_rename_columns', NULL),
(32, '2018_01_11_155300_change_discussions_add_foreign_keys', NULL),
(33, '2018_01_15_071700_rename_users_discussions_to_discussion_user', NULL),
(34, '2018_01_15_071800_change_discussion_user_rename_columns', NULL),
(35, '2018_01_15_071900_change_discussion_user_add_foreign_keys', NULL),
(36, '2018_01_15_072600_change_email_tokens_rename_id_to_token', NULL),
(37, '2018_01_15_072700_change_email_tokens_add_foreign_keys', NULL),
(38, '2018_01_15_072800_change_email_tokens_created_at_to_datetime', NULL),
(39, '2018_01_18_130400_rename_permissions_to_group_permission', NULL),
(40, '2018_01_18_130500_change_group_permission_add_foreign_keys', NULL),
(41, '2018_01_18_130600_rename_users_groups_to_group_user', NULL),
(42, '2018_01_18_130700_change_group_user_add_foreign_keys', NULL),
(43, '2018_01_18_133000_change_notifications_columns', NULL),
(44, '2018_01_18_133100_change_notifications_add_foreign_keys', NULL),
(45, '2018_01_18_134400_change_password_tokens_rename_id_to_token', NULL),
(46, '2018_01_18_134500_change_password_tokens_add_foreign_keys', NULL),
(47, '2018_01_18_134600_change_password_tokens_created_at_to_datetime', NULL),
(48, '2018_01_18_135000_change_posts_rename_columns', NULL),
(49, '2018_01_18_135100_change_posts_add_foreign_keys', NULL),
(50, '2018_01_30_112238_add_fulltext_index_to_discussions_title', NULL),
(51, '2018_01_30_220100_create_post_user_table', NULL),
(52, '2018_01_30_222900_change_users_rename_columns', NULL),
(55, '2018_09_15_041340_add_users_indicies', NULL),
(56, '2018_09_15_041828_add_discussions_indicies', NULL),
(57, '2018_09_15_043337_add_notifications_indices', NULL),
(58, '2018_09_15_043621_add_posts_indices', NULL),
(59, '2018_09_22_004100_change_registration_tokens_columns', NULL),
(60, '2018_09_22_004200_create_login_providers_table', NULL),
(61, '2018_10_08_144700_add_shim_prefix_to_group_icons', NULL),
(62, '2019_10_12_195349_change_posts_add_discussion_foreign_key', NULL),
(63, '2020_03_19_134512_change_discussions_default_comment_count', NULL),
(64, '2020_04_21_130500_change_permission_groups_add_is_hidden', NULL),
(65, '2021_03_02_040000_change_access_tokens_add_type', NULL),
(66, '2021_03_02_040500_change_access_tokens_add_id', NULL),
(67, '2021_03_02_041000_change_access_tokens_add_title_ip_agent', NULL),
(68, '2021_04_18_040500_change_migrations_add_id_primary_key', NULL),
(69, '2021_04_18_145100_change_posts_content_column_to_mediumtext', NULL),
(70, '2018_07_21_000000_seed_default_groups', NULL),
(71, '2018_07_21_000100_seed_default_group_permissions', NULL),
(72, '2021_05_10_000000_rename_permissions', NULL),
(73, '2022_05_20_000000_add_timestamps_to_groups_table', NULL),
(74, '2022_05_20_000001_add_created_at_to_group_user_table', NULL),
(75, '2022_05_20_000002_add_created_at_to_group_permission_table', NULL),
(76, '2022_07_14_000000_add_type_index_to_posts', NULL),
(77, '2022_07_14_000001_add_type_created_at_composite_index_to_posts', NULL),
(78, '2022_08_06_000000_change_access_tokens_last_activity_at_to_nullable', NULL),
(79, '2015_09_02_000000_add_flags_read_time_to_users_table', 'flarum-flags'),
(80, '2015_09_02_000000_create_flags_table', 'flarum-flags'),
(81, '2017_07_22_000000_add_default_permissions', 'flarum-flags'),
(82, '2018_06_27_101500_change_flags_rename_time_to_created_at', 'flarum-flags'),
(83, '2018_06_27_101600_change_flags_add_foreign_keys', 'flarum-flags'),
(84, '2018_06_27_105100_change_users_rename_flags_read_time_to_read_flags_at', 'flarum-flags'),
(85, '2018_09_15_043621_add_flags_indices', 'flarum-flags'),
(86, '2019_10_22_000000_change_reason_text_col_type', 'flarum-flags'),
(87, '2015_09_21_011527_add_is_approved_to_discussions', 'flarum-approval'),
(88, '2015_09_21_011706_add_is_approved_to_posts', 'flarum-approval'),
(89, '2017_07_22_000000_add_default_permissions', 'flarum-approval'),
(90, '2015_02_24_000000_create_discussions_tags_table', 'flarum-tags'),
(91, '2015_02_24_000000_create_tags_table', 'flarum-tags'),
(92, '2015_02_24_000000_create_users_tags_table', 'flarum-tags'),
(93, '2015_02_24_000000_set_default_settings', 'flarum-tags'),
(94, '2015_10_19_061223_make_slug_unique', 'flarum-tags'),
(95, '2017_07_22_000000_add_default_permissions', 'flarum-tags'),
(96, '2018_06_27_085200_change_tags_columns', 'flarum-tags'),
(97, '2018_06_27_085300_change_tags_add_foreign_keys', 'flarum-tags'),
(98, '2018_06_27_090400_rename_users_tags_to_tag_user', 'flarum-tags'),
(99, '2018_06_27_100100_change_tag_user_rename_read_time_to_marked_as_read_at', 'flarum-tags'),
(100, '2018_06_27_100200_change_tag_user_add_foreign_keys', 'flarum-tags'),
(101, '2018_06_27_103000_rename_discussions_tags_to_discussion_tag', 'flarum-tags'),
(102, '2018_06_27_103100_add_discussion_tag_foreign_keys', 'flarum-tags'),
(103, '2019_04_21_000000_add_icon_to_tags_table', 'flarum-tags'),
(104, '2022_05_20_000003_add_timestamps_to_tags_table', 'flarum-tags'),
(105, '2022_05_20_000004_add_created_at_to_discussion_tag_table', 'flarum-tags'),
(106, '2015_05_11_000000_add_suspended_until_to_users_table', 'flarum-suspend'),
(107, '2015_09_14_000000_rename_suspended_until_column', 'flarum-suspend'),
(108, '2017_07_22_000000_add_default_permissions', 'flarum-suspend'),
(109, '2018_06_27_111400_change_users_rename_suspend_until_to_suspended_until', 'flarum-suspend'),
(110, '2021_10_27_000000_add_suspend_reason_and_message', 'flarum-suspend'),
(111, '2015_05_11_000000_add_subscription_to_users_discussions_table', 'flarum-subscriptions'),
(112, '2015_02_24_000000_add_sticky_to_discussions', 'flarum-sticky'),
(113, '2017_07_22_000000_add_default_permissions', 'flarum-sticky'),
(114, '2018_09_15_043621_add_discussions_indices', 'flarum-sticky'),
(115, '2021_01_13_000000_add_discussion_last_posted_at_indices', 'flarum-sticky'),
(116, '2015_05_11_000000_create_mentions_posts_table', 'flarum-mentions'),
(117, '2015_05_11_000000_create_mentions_users_table', 'flarum-mentions'),
(118, '2018_06_27_102000_rename_mentions_posts_to_post_mentions_post', 'flarum-mentions'),
(119, '2018_06_27_102100_rename_mentions_users_to_post_mentions_user', 'flarum-mentions'),
(120, '2018_06_27_102200_change_post_mentions_post_rename_mentions_id_to_mentions_post_id', 'flarum-mentions'),
(121, '2018_06_27_102300_change_post_mentions_post_add_foreign_keys', 'flarum-mentions'),
(122, '2018_06_27_102400_change_post_mentions_user_rename_mentions_id_to_mentions_user_id', 'flarum-mentions'),
(123, '2018_06_27_102500_change_post_mentions_user_add_foreign_keys', 'flarum-mentions'),
(124, '2021_04_19_000000_set_default_settings', 'flarum-mentions'),
(125, '2022_05_20_000005_add_created_at_to_post_mentions_post_table', 'flarum-mentions'),
(126, '2022_05_20_000006_add_created_at_to_post_mentions_user_table', 'flarum-mentions'),
(127, '2022_10_21_000000_create_post_mentions_group_table', 'flarum-mentions'),
(128, '2021_03_25_000000_default_settings', 'flarum-markdown'),
(129, '2015_02_24_000000_add_locked_to_discussions', 'flarum-lock'),
(130, '2017_07_22_000000_add_default_permissions', 'flarum-lock'),
(131, '2018_09_15_043621_add_discussions_indices', 'flarum-lock'),
(132, '2015_05_11_000000_create_posts_likes_table', 'flarum-likes'),
(133, '2015_09_04_000000_add_default_like_permissions', 'flarum-likes'),
(134, '2018_06_27_100600_rename_posts_likes_to_post_likes', 'flarum-likes'),
(135, '2018_06_27_100700_change_post_likes_add_foreign_keys', 'flarum-likes'),
(136, '2021_05_10_094200_add_created_at_to_post_likes_table', 'flarum-likes'),
(137, '2018_09_29_060444_replace_emoji_shorcuts_with_unicode', 'flarum-emoji');

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_notifications`
--

CREATE TABLE `dvnr_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `from_user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `subject_id` int(10) UNSIGNED DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_password_tokens`
--

CREATE TABLE `dvnr_password_tokens` (
  `token` varchar(100) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_posts`
--

CREATE TABLE `dvnr_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `number` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL COMMENT ' ',
  `edited_at` datetime DEFAULT NULL,
  `edited_user_id` int(10) UNSIGNED DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_post_likes`
--

CREATE TABLE `dvnr_post_likes` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_post_mentions_group`
--

CREATE TABLE `dvnr_post_mentions_group` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_post_mentions_post`
--

CREATE TABLE `dvnr_post_mentions_post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_post_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_post_mentions_user`
--

CREATE TABLE `dvnr_post_mentions_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `mentions_user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_post_user`
--

CREATE TABLE `dvnr_post_user` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_registration_tokens`
--

CREATE TABLE `dvnr_registration_tokens` (
  `token` varchar(100) NOT NULL,
  `payload` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `user_attributes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_settings`
--

CREATE TABLE `dvnr_settings` (
  `key` varchar(100) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dvnr_settings`
--

INSERT INTO `dvnr_settings` (`key`, `value`) VALUES
('allow_post_editing', 'reply'),
('allow_renaming', '10'),
('allow_sign_up', '1'),
('custom_less', ''),
('default_locale', 'en'),
('default_route', '/all'),
('display_name_driver', 'username'),
('extensions_enabled', '[\"flarum-flags\",\"flarum-approval\",\"flarum-tags\",\"flarum-suspend\",\"flarum-subscriptions\",\"flarum-sticky\",\"flarum-statistics\",\"flarum-mentions\",\"flarum-markdown\",\"flarum-lock\",\"flarum-likes\",\"flarum-lang-english\",\"flarum-emoji\",\"flarum-bbcode\"]'),
('favicon_path', 'favicon-l5b9thwo.png'),
('flarum-likes.like_own_post', '0'),
('flarum-markdown.mdarea', '1'),
('flarum-mentions.allow_username_format', '1'),
('flarum-tags.max_primary_tags', '1'),
('flarum-tags.max_secondary_tags', '3'),
('flarum-tags.min_primary_tags', '1'),
('flarum-tags.min_secondary_tags', '0'),
('forum_description', 'An entangled community of designers and developers'),
('forum_title', 'devigner'),
('logo_path', 'logo-vbyxymcw.png'),
('mail_driver', 'mail'),
('mail_from', 'noreply@devigner.downquark.work'),
('slug_driver_Flarum\\Discussion\\Discussion', 'default'),
('slug_driver_Flarum\\User\\User', 'default'),
('theme_colored_header', '1'),
('theme_dark_mode', '1'),
('theme_primary_color', '#a806f9'),
('theme_secondary_color', '#a2a2a2'),
('version', '1.7.2'),
('welcome_message', 'look, read, contribute. keep it classy, and fun.'),
('welcome_title', 'welcome to the downquark forum');

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_tags`
--

CREATE TABLE `dvnr_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `background_path` varchar(100) DEFAULT NULL,
  `background_mode` varchar(100) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `default_sort` varchar(50) DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_discussion_id` int(10) UNSIGNED DEFAULT NULL,
  `last_posted_user_id` int(10) UNSIGNED DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dvnr_tags`
--

INSERT INTO `dvnr_tags` (`id`, `name`, `slug`, `description`, `color`, `background_path`, `background_mode`, `position`, `parent_id`, `default_sort`, `is_restricted`, `is_hidden`, `discussion_count`, `last_posted_at`, `last_posted_discussion_id`, `last_posted_user_id`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'DownQuark', 'dq', 'holistic discussions about downquark. questions, comments, and critiques encouraged', '#b40e0e', NULL, NULL, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 'fas fa-atom', NULL, '2023-04-11 03:55:17'),
(2, 'insight', 'insight', 'thought provoking content', '#b1b1b1', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 'fas fa-lightbulb', '2023-04-11 04:00:11', '2023-04-11 04:09:27'),
(3, 'quark', 'quark', 'miscellaneous bucket', '#b1b1b1', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 'fas fa-question', '2023-04-11 04:02:46', '2023-04-11 04:09:49'),
(4, 'Design', 'design', 'all things design', '#9d1ce3', NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 'fas fa-palette', '2023-04-11 04:07:57', '2023-04-11 04:07:57'),
(5, 'Development', 'development', 'all things development', '#e66f00', NULL, NULL, 2, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 'fas fa-code', '2023-04-11 04:11:17', '2023-04-11 04:11:17'),
(6, 'back end', 'back-end', '', '#b1b1b1', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2023-04-11 04:11:57', '2023-04-11 04:13:05'),
(7, 'front end', 'front-end', '', '#b1b1b1', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, '', '2023-04-11 04:12:24', '2023-04-11 04:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_tag_user`
--

CREATE TABLE `dvnr_tag_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `marked_as_read_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dvnr_users`
--

CREATE TABLE `dvnr_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(100) NOT NULL,
  `avatar_url` varchar(100) DEFAULT NULL,
  `preferences` blob DEFAULT NULL,
  `joined_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `marked_all_as_read_at` datetime DEFAULT NULL,
  `read_notifications_at` datetime DEFAULT NULL,
  `discussion_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `read_flags_at` datetime DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL,
  `suspend_reason` text DEFAULT NULL,
  `suspend_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dvnr_users`
--

INSERT INTO `dvnr_users` (`id`, `username`, `email`, `is_email_confirmed`, `password`, `avatar_url`, `preferences`, `joined_at`, `last_seen_at`, `marked_all_as_read_at`, `read_notifications_at`, `discussion_count`, `comment_count`, `read_flags_at`, `suspended_until`, `suspend_reason`, `suspend_message`) VALUES
(1, 'mlnck', 'dq.mlnck@gmail.com', 1, '$2y$10$NsckVlhNzZ69NJMVyZtPZ.WTQICR9V8MqpTLVAI0gPRpB.fRxUNIa', 'jZ6kZIInZ7eOtxXG.png', NULL, '2023-04-11 03:30:18', '2023-04-11 04:17:41', '2023-04-11 03:37:37', '2023-04-11 03:36:23', 0, 0, '2023-04-11 03:36:21', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dvnr_access_tokens`
--
ALTER TABLE `dvnr_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dvnr_access_tokens_token_unique` (`token`),
  ADD KEY `dvnr_access_tokens_user_id_foreign` (`user_id`),
  ADD KEY `dvnr_access_tokens_type_index` (`type`);

--
-- Indexes for table `dvnr_api_keys`
--
ALTER TABLE `dvnr_api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dvnr_api_keys_key_unique` (`key`),
  ADD KEY `dvnr_api_keys_user_id_foreign` (`user_id`);

--
-- Indexes for table `dvnr_discussions`
--
ALTER TABLE `dvnr_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dvnr_discussions_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `dvnr_discussions_first_post_id_foreign` (`first_post_id`),
  ADD KEY `dvnr_discussions_last_post_id_foreign` (`last_post_id`),
  ADD KEY `dvnr_discussions_last_posted_at_index` (`last_posted_at`),
  ADD KEY `dvnr_discussions_last_posted_user_id_index` (`last_posted_user_id`),
  ADD KEY `dvnr_discussions_created_at_index` (`created_at`),
  ADD KEY `dvnr_discussions_user_id_index` (`user_id`),
  ADD KEY `dvnr_discussions_comment_count_index` (`comment_count`),
  ADD KEY `dvnr_discussions_participant_count_index` (`participant_count`),
  ADD KEY `dvnr_discussions_hidden_at_index` (`hidden_at`),
  ADD KEY `dvnr_discussions_is_sticky_created_at_index` (`is_sticky`,`created_at`),
  ADD KEY `dvnr_discussions_is_sticky_last_posted_at_index` (`is_sticky`,`last_posted_at`),
  ADD KEY `dvnr_discussions_is_locked_index` (`is_locked`);
ALTER TABLE `dvnr_discussions` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `dvnr_discussion_tag`
--
ALTER TABLE `dvnr_discussion_tag`
  ADD PRIMARY KEY (`discussion_id`,`tag_id`),
  ADD KEY `dvnr_discussion_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `dvnr_discussion_user`
--
ALTER TABLE `dvnr_discussion_user`
  ADD PRIMARY KEY (`user_id`,`discussion_id`),
  ADD KEY `dvnr_discussion_user_discussion_id_foreign` (`discussion_id`);

--
-- Indexes for table `dvnr_email_tokens`
--
ALTER TABLE `dvnr_email_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `dvnr_email_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `dvnr_flags`
--
ALTER TABLE `dvnr_flags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dvnr_flags_post_id_foreign` (`post_id`),
  ADD KEY `dvnr_flags_user_id_foreign` (`user_id`),
  ADD KEY `dvnr_flags_created_at_index` (`created_at`);

--
-- Indexes for table `dvnr_groups`
--
ALTER TABLE `dvnr_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dvnr_group_permission`
--
ALTER TABLE `dvnr_group_permission`
  ADD PRIMARY KEY (`group_id`,`permission`);

--
-- Indexes for table `dvnr_group_user`
--
ALTER TABLE `dvnr_group_user`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD KEY `dvnr_group_user_group_id_foreign` (`group_id`);

--
-- Indexes for table `dvnr_login_providers`
--
ALTER TABLE `dvnr_login_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dvnr_login_providers_provider_identifier_unique` (`provider`,`identifier`),
  ADD KEY `dvnr_login_providers_user_id_foreign` (`user_id`);

--
-- Indexes for table `dvnr_migrations`
--
ALTER TABLE `dvnr_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dvnr_notifications`
--
ALTER TABLE `dvnr_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dvnr_notifications_from_user_id_foreign` (`from_user_id`),
  ADD KEY `dvnr_notifications_user_id_index` (`user_id`);

--
-- Indexes for table `dvnr_password_tokens`
--
ALTER TABLE `dvnr_password_tokens`
  ADD PRIMARY KEY (`token`),
  ADD KEY `dvnr_password_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `dvnr_posts`
--
ALTER TABLE `dvnr_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dvnr_posts_discussion_id_number_unique` (`discussion_id`,`number`),
  ADD KEY `dvnr_posts_edited_user_id_foreign` (`edited_user_id`),
  ADD KEY `dvnr_posts_hidden_user_id_foreign` (`hidden_user_id`),
  ADD KEY `dvnr_posts_discussion_id_number_index` (`discussion_id`,`number`),
  ADD KEY `dvnr_posts_discussion_id_created_at_index` (`discussion_id`,`created_at`),
  ADD KEY `dvnr_posts_user_id_created_at_index` (`user_id`,`created_at`),
  ADD KEY `dvnr_posts_type_index` (`type`),
  ADD KEY `dvnr_posts_type_created_at_index` (`type`,`created_at`);
ALTER TABLE `dvnr_posts` ADD FULLTEXT KEY `content` (`content`);

--
-- Indexes for table `dvnr_post_likes`
--
ALTER TABLE `dvnr_post_likes`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `dvnr_post_likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `dvnr_post_mentions_group`
--
ALTER TABLE `dvnr_post_mentions_group`
  ADD PRIMARY KEY (`post_id`,`mentions_group_id`),
  ADD KEY `dvnr_post_mentions_group_mentions_group_id_foreign` (`mentions_group_id`);

--
-- Indexes for table `dvnr_post_mentions_post`
--
ALTER TABLE `dvnr_post_mentions_post`
  ADD PRIMARY KEY (`post_id`,`mentions_post_id`),
  ADD KEY `dvnr_post_mentions_post_mentions_post_id_foreign` (`mentions_post_id`);

--
-- Indexes for table `dvnr_post_mentions_user`
--
ALTER TABLE `dvnr_post_mentions_user`
  ADD PRIMARY KEY (`post_id`,`mentions_user_id`),
  ADD KEY `dvnr_post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`);

--
-- Indexes for table `dvnr_post_user`
--
ALTER TABLE `dvnr_post_user`
  ADD PRIMARY KEY (`post_id`,`user_id`),
  ADD KEY `dvnr_post_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `dvnr_registration_tokens`
--
ALTER TABLE `dvnr_registration_tokens`
  ADD PRIMARY KEY (`token`);

--
-- Indexes for table `dvnr_settings`
--
ALTER TABLE `dvnr_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `dvnr_tags`
--
ALTER TABLE `dvnr_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dvnr_tags_slug_unique` (`slug`),
  ADD KEY `dvnr_tags_parent_id_foreign` (`parent_id`),
  ADD KEY `dvnr_tags_last_posted_user_id_foreign` (`last_posted_user_id`),
  ADD KEY `dvnr_tags_last_posted_discussion_id_foreign` (`last_posted_discussion_id`);

--
-- Indexes for table `dvnr_tag_user`
--
ALTER TABLE `dvnr_tag_user`
  ADD PRIMARY KEY (`user_id`,`tag_id`),
  ADD KEY `dvnr_tag_user_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `dvnr_users`
--
ALTER TABLE `dvnr_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dvnr_users_username_unique` (`username`),
  ADD UNIQUE KEY `dvnr_users_email_unique` (`email`),
  ADD KEY `dvnr_users_joined_at_index` (`joined_at`),
  ADD KEY `dvnr_users_last_seen_at_index` (`last_seen_at`),
  ADD KEY `dvnr_users_discussion_count_index` (`discussion_count`),
  ADD KEY `dvnr_users_comment_count_index` (`comment_count`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dvnr_access_tokens`
--
ALTER TABLE `dvnr_access_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dvnr_api_keys`
--
ALTER TABLE `dvnr_api_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dvnr_discussions`
--
ALTER TABLE `dvnr_discussions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dvnr_flags`
--
ALTER TABLE `dvnr_flags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dvnr_groups`
--
ALTER TABLE `dvnr_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dvnr_login_providers`
--
ALTER TABLE `dvnr_login_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dvnr_migrations`
--
ALTER TABLE `dvnr_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `dvnr_notifications`
--
ALTER TABLE `dvnr_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dvnr_posts`
--
ALTER TABLE `dvnr_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dvnr_tags`
--
ALTER TABLE `dvnr_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dvnr_users`
--
ALTER TABLE `dvnr_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dvnr_access_tokens`
--
ALTER TABLE `dvnr_access_tokens`
  ADD CONSTRAINT `dvnr_access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_api_keys`
--
ALTER TABLE `dvnr_api_keys`
  ADD CONSTRAINT `dvnr_api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_discussions`
--
ALTER TABLE `dvnr_discussions`
  ADD CONSTRAINT `dvnr_discussions_first_post_id_foreign` FOREIGN KEY (`first_post_id`) REFERENCES `dvnr_posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dvnr_discussions_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dvnr_discussions_last_post_id_foreign` FOREIGN KEY (`last_post_id`) REFERENCES `dvnr_posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dvnr_discussions_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dvnr_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `dvnr_discussion_tag`
--
ALTER TABLE `dvnr_discussion_tag`
  ADD CONSTRAINT `dvnr_discussion_tag_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `dvnr_discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvnr_discussion_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `dvnr_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_discussion_user`
--
ALTER TABLE `dvnr_discussion_user`
  ADD CONSTRAINT `dvnr_discussion_user_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `dvnr_discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvnr_discussion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_email_tokens`
--
ALTER TABLE `dvnr_email_tokens`
  ADD CONSTRAINT `dvnr_email_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_flags`
--
ALTER TABLE `dvnr_flags`
  ADD CONSTRAINT `dvnr_flags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `dvnr_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvnr_flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_group_permission`
--
ALTER TABLE `dvnr_group_permission`
  ADD CONSTRAINT `dvnr_group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `dvnr_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_group_user`
--
ALTER TABLE `dvnr_group_user`
  ADD CONSTRAINT `dvnr_group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `dvnr_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvnr_group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_login_providers`
--
ALTER TABLE `dvnr_login_providers`
  ADD CONSTRAINT `dvnr_login_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_notifications`
--
ALTER TABLE `dvnr_notifications`
  ADD CONSTRAINT `dvnr_notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dvnr_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_password_tokens`
--
ALTER TABLE `dvnr_password_tokens`
  ADD CONSTRAINT `dvnr_password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_posts`
--
ALTER TABLE `dvnr_posts`
  ADD CONSTRAINT `dvnr_posts_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `dvnr_discussions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvnr_posts_edited_user_id_foreign` FOREIGN KEY (`edited_user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dvnr_posts_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dvnr_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `dvnr_post_likes`
--
ALTER TABLE `dvnr_post_likes`
  ADD CONSTRAINT `dvnr_post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `dvnr_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvnr_post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_post_mentions_group`
--
ALTER TABLE `dvnr_post_mentions_group`
  ADD CONSTRAINT `dvnr_post_mentions_group_mentions_group_id_foreign` FOREIGN KEY (`mentions_group_id`) REFERENCES `dvnr_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvnr_post_mentions_group_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `dvnr_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_post_mentions_post`
--
ALTER TABLE `dvnr_post_mentions_post`
  ADD CONSTRAINT `dvnr_post_mentions_post_mentions_post_id_foreign` FOREIGN KEY (`mentions_post_id`) REFERENCES `dvnr_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvnr_post_mentions_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `dvnr_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_post_mentions_user`
--
ALTER TABLE `dvnr_post_mentions_user`
  ADD CONSTRAINT `dvnr_post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvnr_post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `dvnr_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_post_user`
--
ALTER TABLE `dvnr_post_user`
  ADD CONSTRAINT `dvnr_post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `dvnr_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvnr_post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dvnr_tags`
--
ALTER TABLE `dvnr_tags`
  ADD CONSTRAINT `dvnr_tags_last_posted_discussion_id_foreign` FOREIGN KEY (`last_posted_discussion_id`) REFERENCES `dvnr_discussions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dvnr_tags_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dvnr_tags_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `dvnr_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `dvnr_tag_user`
--
ALTER TABLE `dvnr_tag_user`
  ADD CONSTRAINT `dvnr_tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `dvnr_tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dvnr_tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `dvnr_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
