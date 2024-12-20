-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 20, 2024 at 01:27 AM
-- Server version: 8.0.31
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `os_ticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `ost_api_key`
--

DROP TABLE IF EXISTS `ost_api_key`;
CREATE TABLE IF NOT EXISTS `ost_api_key` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apikey` (`apikey`),
  KEY `ipaddr` (`ipaddr`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_api_key`
--

INSERT INTO `ost_api_key` (`id`, `isactive`, `ipaddr`, `apikey`, `can_create_tickets`, `can_exec_cron`, `notes`, `updated`, `created`) VALUES
(1, 1, '110.38.228.180', 'A350EF8146472AB0DB9B1F18B4F49E48', 1, 1, '', '2024-12-20 05:02:31', '2024-12-20 05:02:31'),
(2, 1, '192.168.117.137', '0472BA1E29443C8388E66CBFEA4FA884', 1, 1, '', '2024-12-20 06:10:10', '2024-12-20 06:10:10'),
(3, 1, '127.0.0.1', 'EC37855CF2406107CE8D6D1E40FD6211', 1, 1, '', '2024-12-20 06:12:23', '2024-12-20 06:12:23'),
(4, 1, '::1', 'EBBC6812D73767013163C5F442F041C0', 1, 1, '', '2024-12-20 06:16:24', '2024-12-20 06:16:24');

-- --------------------------------------------------------

--
-- Table structure for table `ost_attachment`
--

DROP TABLE IF EXISTS `ost_attachment`;
CREATE TABLE IF NOT EXISTS `ost_attachment` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `object_id` int UNSIGNED NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inline` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file-type` (`object_id`,`file_id`,`type`),
  UNIQUE KEY `file_object` (`file_id`,`object_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_attachment`
--

INSERT INTO `ost_attachment` (`id`, `object_id`, `type`, `file_id`, `name`, `inline`, `lang`) VALUES
(1, 1, 'C', 2, NULL, 0, NULL),
(2, 8, 'T', 1, NULL, 1, NULL),
(3, 9, 'T', 1, NULL, 1, NULL),
(4, 10, 'T', 1, NULL, 1, NULL),
(5, 11, 'T', 1, NULL, 1, NULL),
(6, 12, 'T', 1, NULL, 1, NULL),
(7, 13, 'T', 1, NULL, 1, NULL),
(8, 14, 'T', 1, NULL, 1, NULL),
(9, 16, 'T', 1, NULL, 1, NULL),
(10, 17, 'T', 1, NULL, 1, NULL),
(11, 18, 'T', 1, NULL, 1, NULL),
(12, 19, 'T', 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_canned_response`
--

DROP TABLE IF EXISTS `ost_canned_response`;
CREATE TABLE IF NOT EXISTS `ost_canned_response` (
  `canned_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `isenabled` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`canned_id`),
  UNIQUE KEY `title` (`title`),
  KEY `dept_id` (`dept_id`),
  KEY `active` (`isenabled`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_canned_response`
--

INSERT INTO `ost_canned_response` (`canned_id`, `dept_id`, `isenabled`, `title`, `response`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'What is osTicket (sample)?', 'osTicket is a widely-used open source support ticket system, an\nattractive alternative to higher-cost and complex customer support\nsystems - simple, lightweight, reliable, open source, web-based and easy\nto setup and use.', 'en_US', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(2, 0, 1, 'Sample (with variables)', 'Hi %{ticket.name.first},\n<br>\n<br>\nYour ticket #%{ticket.number} created on %{ticket.create_date} is in\n%{ticket.dept.name} department.', 'en_US', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `ost_config`
--

DROP TABLE IF EXISTS `ost_config`;
CREATE TABLE IF NOT EXISTS `ost_config` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespace` (`namespace`,`key`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_config`
--

INSERT INTO `ost_config` (`id`, `namespace`, `key`, `value`, `updated`) VALUES
(1, 'core', 'admin_email', 'sarmad.dts@gmail.com', '2024-12-19 23:53:01'),
(2, 'core', 'helpdesk_url', 'http://localhost/os_ticket/', '2024-12-19 23:53:01'),
(3, 'core', 'helpdesk_title', 'TesTech', '2024-12-19 23:53:01'),
(4, 'core', 'schema_signature', '5fb92bef17f3b603659e024c01cc7a59', '2024-12-19 23:53:01'),
(5, 'schedule.1', 'configuration', '{\"holidays\":[4]}', '2024-12-19 23:53:00'),
(6, 'core', 'time_format', 'hh:mm a', '2024-12-19 23:53:00'),
(7, 'core', 'date_format', 'MM/dd/y', '2024-12-19 23:53:00'),
(8, 'core', 'datetime_format', 'MM/dd/y h:mm a', '2024-12-19 23:53:00'),
(9, 'core', 'daydatetime_format', 'EEE, MMM d y h:mm a', '2024-12-19 23:53:00'),
(10, 'core', 'default_priority_id', '2', '2024-12-19 23:53:00'),
(11, 'core', 'enable_daylight_saving', '', '2024-12-19 23:53:00'),
(12, 'core', 'reply_separator', '-- reply above this line --', '2024-12-19 23:53:00'),
(13, 'core', 'isonline', '1', '2024-12-19 23:53:00'),
(14, 'core', 'staff_ip_binding', '', '2024-12-19 23:53:00'),
(15, 'core', 'staff_max_logins', '4', '2024-12-19 23:53:00'),
(16, 'core', 'staff_login_timeout', '2', '2024-12-19 23:53:00'),
(17, 'core', 'staff_session_timeout', '30', '2024-12-19 23:53:00'),
(18, 'core', 'passwd_reset_period', '', '2024-12-19 23:53:00'),
(19, 'core', 'client_max_logins', '4', '2024-12-19 23:53:00'),
(20, 'core', 'client_login_timeout', '2', '2024-12-19 23:53:00'),
(21, 'core', 'client_session_timeout', '30', '2024-12-19 23:53:00'),
(22, 'core', 'max_page_size', '25', '2024-12-19 23:53:00'),
(23, 'core', 'max_open_tickets', '', '2024-12-19 23:53:00'),
(24, 'core', 'autolock_minutes', '3', '2024-12-19 23:53:00'),
(25, 'core', 'default_smtp_id', '', '2024-12-19 23:53:00'),
(26, 'core', 'use_email_priority', '', '2024-12-19 23:53:00'),
(27, 'core', 'enable_kb', '', '2024-12-19 23:53:00'),
(28, 'core', 'enable_premade', '1', '2024-12-19 23:53:00'),
(29, 'core', 'enable_captcha', '', '2024-12-19 23:53:00'),
(30, 'core', 'enable_auto_cron', '', '2024-12-19 23:53:00'),
(31, 'core', 'enable_mail_polling', '', '2024-12-19 23:53:00'),
(32, 'core', 'send_sys_errors', '1', '2024-12-19 23:53:00'),
(33, 'core', 'send_sql_errors', '1', '2024-12-19 23:53:00'),
(34, 'core', 'send_login_errors', '1', '2024-12-19 23:53:00'),
(35, 'core', 'save_email_headers', '1', '2024-12-19 23:53:00'),
(36, 'core', 'strip_quoted_reply', '1', '2024-12-19 23:53:00'),
(37, 'core', 'ticket_autoresponder', '', '2024-12-19 23:53:00'),
(38, 'core', 'message_autoresponder', '', '2024-12-19 23:53:00'),
(39, 'core', 'ticket_notice_active', '1', '2024-12-19 23:53:00'),
(40, 'core', 'ticket_alert_active', '1', '2024-12-19 23:53:00'),
(41, 'core', 'ticket_alert_admin', '1', '2024-12-19 23:53:00'),
(42, 'core', 'ticket_alert_dept_manager', '1', '2024-12-19 23:53:00'),
(43, 'core', 'ticket_alert_dept_members', '', '2024-12-19 23:53:00'),
(44, 'core', 'message_alert_active', '1', '2024-12-19 23:53:00'),
(45, 'core', 'message_alert_laststaff', '1', '2024-12-19 23:53:00'),
(46, 'core', 'message_alert_assigned', '1', '2024-12-19 23:53:00'),
(47, 'core', 'message_alert_dept_manager', '', '2024-12-19 23:53:00'),
(48, 'core', 'note_alert_active', '', '2024-12-19 23:53:00'),
(49, 'core', 'note_alert_laststaff', '1', '2024-12-19 23:53:00'),
(50, 'core', 'note_alert_assigned', '1', '2024-12-19 23:53:00'),
(51, 'core', 'note_alert_dept_manager', '', '2024-12-19 23:53:00'),
(52, 'core', 'transfer_alert_active', '', '2024-12-19 23:53:00'),
(53, 'core', 'transfer_alert_assigned', '', '2024-12-19 23:53:00'),
(54, 'core', 'transfer_alert_dept_manager', '1', '2024-12-19 23:53:00'),
(55, 'core', 'transfer_alert_dept_members', '', '2024-12-19 23:53:00'),
(56, 'core', 'overdue_alert_active', '1', '2024-12-19 23:53:00'),
(57, 'core', 'overdue_alert_assigned', '1', '2024-12-19 23:53:00'),
(58, 'core', 'overdue_alert_dept_manager', '1', '2024-12-19 23:53:00'),
(59, 'core', 'overdue_alert_dept_members', '', '2024-12-19 23:53:00'),
(60, 'core', 'assigned_alert_active', '1', '2024-12-19 23:53:00'),
(61, 'core', 'assigned_alert_staff', '1', '2024-12-19 23:53:00'),
(62, 'core', 'assigned_alert_team_lead', '', '2024-12-19 23:53:00'),
(63, 'core', 'assigned_alert_team_members', '', '2024-12-19 23:53:00'),
(64, 'core', 'auto_claim_tickets', '1', '2024-12-19 23:53:00'),
(65, 'core', 'auto_refer_closed', '1', '2024-12-19 23:53:00'),
(66, 'core', 'collaborator_ticket_visibility', '1', '2024-12-19 23:53:00'),
(67, 'core', 'require_topic_to_close', '', '2024-12-19 23:53:00'),
(68, 'core', 'show_related_tickets', '1', '2024-12-19 23:53:00'),
(69, 'core', 'show_assigned_tickets', '1', '2024-12-19 23:53:00'),
(70, 'core', 'show_answered_tickets', '', '2024-12-19 23:53:00'),
(71, 'core', 'hide_staff_name', '', '2024-12-19 23:53:00'),
(72, 'core', 'disable_agent_collabs', '', '2024-12-19 23:53:00'),
(73, 'core', 'overlimit_notice_active', '', '2024-12-19 23:53:00'),
(74, 'core', 'email_attachments', '1', '2024-12-19 23:53:00'),
(75, 'core', 'ticket_number_format', '######', '2024-12-19 23:53:00'),
(76, 'core', 'ticket_sequence_id', '', '2024-12-19 23:53:00'),
(77, 'core', 'queue_bucket_counts', '', '2024-12-19 23:53:00'),
(78, 'core', 'allow_external_images', '', '2024-12-19 23:53:00'),
(79, 'core', 'task_number_format', '#', '2024-12-19 23:53:00'),
(80, 'core', 'task_sequence_id', '2', '2024-12-19 23:53:00'),
(81, 'core', 'log_level', '2', '2024-12-19 23:53:00'),
(82, 'core', 'log_graceperiod', '12', '2024-12-19 23:53:00'),
(83, 'core', 'client_registration', 'public', '2024-12-19 23:53:00'),
(84, 'core', 'default_ticket_queue', '1', '2024-12-19 23:53:00'),
(85, 'core', 'embedded_domain_whitelist', 'youtube.com, dailymotion.com, vimeo.com, player.vimeo.com, web.microsoftstream.com', '2024-12-19 23:53:00'),
(86, 'core', 'max_file_size', '2097152', '2024-12-19 23:57:49'),
(87, 'core', 'landing_page_id', '1', '2024-12-19 23:53:00'),
(88, 'core', 'thank-you_page_id', '2', '2024-12-19 23:53:00'),
(89, 'core', 'offline_page_id', '3', '2024-12-19 23:53:00'),
(90, 'core', 'system_language', 'en_US', '2024-12-19 23:53:01'),
(91, 'mysqlsearch', 'reindex', '0', '2024-12-19 23:57:50'),
(92, 'core', 'default_email_id', '1', '2024-12-19 23:53:01'),
(93, 'core', 'alert_email_id', '2', '2024-12-19 23:53:01'),
(94, 'core', 'default_dept_id', '1', '2024-12-19 23:53:01'),
(95, 'core', 'default_sla_id', '1', '2024-12-19 23:53:01'),
(96, 'core', 'schedule_id', '1', '2024-12-19 23:53:01'),
(97, 'core', 'default_template_id', '1', '2024-12-19 23:53:01'),
(98, 'core', 'default_timezone', 'Asia/Karachi', '2024-12-19 23:53:01'),
(99, 'core', 'default_storage_bk', 'D', '2024-12-19 23:57:49'),
(100, 'core', 'force_https', '', '2024-12-19 23:57:49'),
(101, 'core', 'date_formats', '', '2024-12-19 23:57:49'),
(102, 'core', 'default_locale', 'en_US', '2024-12-19 23:57:49'),
(103, 'core', 'secondary_langs', '', '2024-12-19 23:57:49'),
(104, 'core', 'enable_avatars', '1', '2024-12-19 23:57:49'),
(105, 'core', 'enable_richtext', '1', '2024-12-19 23:57:49'),
(106, 'core', 'files_req_auth', '1', '2024-12-19 23:57:49'),
(107, 'core', 'allow_iframes', '', '2024-12-19 23:57:49'),
(108, 'core', 'acl', '', '2024-12-19 23:57:49'),
(109, 'core', 'acl_backend', '0', '2024-12-20 00:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `ost_content`
--

DROP TABLE IF EXISTS `ost_content`;
CREATE TABLE IF NOT EXISTS `ost_content` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `isactive` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_content`
--

INSERT INTO `ost_content` (`id`, `isactive`, `type`, `name`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'landing', 'Landing', '<h1>Welcome to the Support Center</h1> <p> In order to streamline support requests and better serve you, we utilize a support ticket system. Every support request is assigned a unique ticket number which you can use to track the progress and responses online. For your reference we provide complete archives and history of all your support requests. A valid email address is required to submit a ticket. </p>', 'The Landing Page refers to the content of the Customer Portal\'s initial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(2, 1, 'thank-you', 'Thank You', '<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>', 'This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(3, 1, 'offline', 'Offline', '<div><h1>\n<span style=\"font-size: medium\">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>', 'The Offline Page appears in the Customer Portal when the Help Desk is offline.', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(4, 1, 'registration-staff', 'Welcome to osTicket', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System<br /> %{company.name}</em> </div>', 'This template defines the initial email (optional) sent to Agents when an account is created on their behalf.', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(5, 1, 'pwreset-staff', 'osTicket Staff Password Reset', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(6, 1, 'banner-staff', 'Authentication Required', '', 'This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(7, 1, 'registration-client', 'Welcome to %{company.name}', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(8, 1, 'pwreset-client', '%{company.name} Help Desk Access', '<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>', 'This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.', '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(9, 1, 'banner-client', 'Sign in to %{company.name}', 'To better serve you, we encourage our Clients to register for an account.', 'This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.', '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(10, 1, 'registration-confirm', 'Account registration', '<div><strong>Thanks for registering for an account.</strong><br/> <br /> We\'ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>', 'This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.', '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(11, 1, 'registration-thanks', 'Account Confirmed!', '<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You\'ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>', 'This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.', '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(12, 1, 'access-link', 'Ticket [#%{ticket.number}] Access Link', '<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href=\"%{recipient.ticket_link}\">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>', 'This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.', '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(13, 1, 'email2fa-staff', 'osTicket Two Factor Authentication', '<h3><strong>Hi %{staff.name.first},</strong></h3> <div> You have just logged into for the helpdesk at %{url}.<br /> <br /> Use the verification code below to finish logging into the helpdesk.<br /> <br /> %{otp}<br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>', 'This template defines the email sent to Staff who use Email for Two Factor Authentication', '2024-12-20 04:53:01', '2024-12-20 04:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `ost_department`
--

DROP TABLE IF EXISTS `ost_department`;
CREATE TABLE IF NOT EXISTS `ost_department` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int UNSIGNED DEFAULT NULL,
  `tpl_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int UNSIGNED NOT NULL DEFAULT '0',
  `schedule_id` int UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int UNSIGNED NOT NULL DEFAULT '0',
  `autoresp_email_id` int UNSIGNED NOT NULL DEFAULT '0',
  `manager_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `ispublic` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `path` varchar(128) NOT NULL DEFAULT '/',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`pid`),
  KEY `manager_id` (`manager_id`),
  KEY `autoresp_email_id` (`autoresp_email_id`),
  KEY `tpl_id` (`tpl_id`),
  KEY `flags` (`flags`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_department`
--

INSERT INTO `ost_department` (`id`, `pid`, `tpl_id`, `sla_id`, `schedule_id`, `email_id`, `autoresp_email_id`, `manager_id`, `flags`, `name`, `signature`, `ispublic`, `group_membership`, `ticket_auto_response`, `message_auto_response`, `path`, `updated`, `created`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 0, 4, 'Support', 'Support Department', 1, 1, 1, 1, '/1/', '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(2, NULL, 0, 1, 0, 0, 0, 0, 4, 'Sales', 'Sales and Customer Retention', 1, 1, 1, 1, '/2/', '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(3, NULL, 0, 0, 0, 0, 0, 0, 4, 'Maintenance', 'Maintenance Department', 1, 0, 1, 1, '/3/', '2024-12-20 04:52:59', '2024-12-20 04:52:59');

-- --------------------------------------------------------

--
-- Table structure for table `ost_draft`
--

DROP TABLE IF EXISTS `ost_draft`;
CREATE TABLE IF NOT EXISTS `ost_draft` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int UNSIGNED NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `namespace` (`namespace`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_email`
--

DROP TABLE IF EXISTS `ost_email`;
CREATE TABLE IF NOT EXISTS `ost_email` (
  `email_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `noautoresp` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int UNSIGNED NOT NULL DEFAULT '2',
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email` (`email`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_email`
--

INSERT INTO `ost_email` (`email_id`, `noautoresp`, `priority_id`, `dept_id`, `topic_id`, `email`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 2, 1, 0, 'testech@gmail.com', 'Support', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(2, 0, 2, 1, 0, 'alerts@gmail.com', 'osTicket Alerts', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(3, 0, 2, 1, 0, 'noreply@gmail.com', '', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_account`
--

DROP TABLE IF EXISTS `ost_email_account`;
CREATE TABLE IF NOT EXISTS `ost_email_account` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `email_id` int UNSIGNED NOT NULL,
  `type` enum('mailbox','smtp') NOT NULL DEFAULT 'mailbox',
  `auth_bk` varchar(128) NOT NULL,
  `auth_id` varchar(16) DEFAULT NULL,
  `active` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int NOT NULL,
  `folder` varchar(255) DEFAULT NULL,
  `protocol` enum('IMAP','POP','SMTP','OTHER') NOT NULL DEFAULT 'OTHER',
  `encryption` enum('NONE','AUTO','SSL') NOT NULL DEFAULT 'AUTO',
  `fetchfreq` tinyint UNSIGNED NOT NULL DEFAULT '5',
  `fetchmax` tinyint UNSIGNED DEFAULT '30',
  `postfetch` enum('archive','delete','nothing') NOT NULL DEFAULT 'nothing',
  `archivefolder` varchar(255) DEFAULT NULL,
  `allow_spoofing` tinyint UNSIGNED DEFAULT '0',
  `num_errors` int UNSIGNED NOT NULL DEFAULT '0',
  `last_error_msg` tinytext,
  `last_error` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `email_id` (`email_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template`
--

DROP TABLE IF EXISTS `ost_email_template`;
CREATE TABLE IF NOT EXISTS `ost_email_template` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tpl_id` int UNSIGNED NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_email_template`
--

INSERT INTO `ost_email_template` (`id`, `tpl_id`, `code_name`, `subject`, `body`, `notes`, `created`, `updated`) VALUES
(1, 1, 'ticket.autoresp', 'Support Ticket Opened [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <p>A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. </p> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(2, 1, 'ticket.autoreply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> with the following automatic reply <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or information, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(3, 1, 'message.autoresp', 'Message Confirmation', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> has been noted <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You can view the support request progress <a href=\"%%7Brecipient.ticket_link%7D\">online here</a></em> </div>', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(4, 1, 'ticket.notice', '%{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href=\"%%7Brecipient.ticket_link%7D\">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{message} <br /> <br /> %{response} <br /> <br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href=\"%%7Brecipient.ticket_link%7D\">view this ticket\'s progress online</a>. <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(5, 1, 'ticket.overlimit', 'Open Tickets Limit Reached', '<h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href=\"%%7Burl%7D/tickets.php?e=%%7Bticket.email%7D\">login to our helpdesk</a>. <br /> <br /> Thank you,<br /> Support Ticket System', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(6, 1, 'ticket.reply', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">login to your account</a> for a complete archive of all your support requests and responses.</em></div>', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(7, 1, 'ticket.activity.notice', 'Re: %{ticket.subject} [#%{ticket.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on ticket <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">#%{ticket.number}</a>. To participate, simply reply to this email or <a href=\"%%7Brecipient.ticket_link%7D\" style=\"color:rgb(84, 141, 212)\">click here</a> for a complete archive of the ticket thread.</em> </div>', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(8, 1, 'ticket.alert', 'New Ticket Alert', '<h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(9, 1, 'message.alert', 'New Message Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{poster.name} </td> </tr> <tr><td><strong>Department</strong>: </td> <td>%{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(10, 1, 'note.alert', 'New Internal Activity Alert', '<h3><strong>Hi %{recipient.name},</strong></h3> An agent has logged activity on ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{note.poster} </td> </tr> <tr><td><strong>Title</strong>: </td> <td>%{note.title} </td> </tr> </tbody> </table> <br /> %{note.message} <br /> <br /> <hr /> To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system <br /> <br /> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(11, 1, 'assigned.alert', 'Ticket Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> <table><tbody><tr><td><strong>From</strong>: </td> <td>%{ticket.name} </td> </tr> <tr><td><strong>Subject</strong>: </td> <td>%{ticket.subject} </td> </tr> </tbody> </table> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(12, 1, 'transfer.alert', 'Ticket #%{ticket.number} transfer - %{ticket.dept.name}', '<h3>Hi %{recipient.name},</h3> Ticket <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\">login</a> to the support ticket system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(13, 1, 'ticket.overdue', 'Stale Ticket Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href=\"%%7Bticket.staff_link%7D\">#%{ticket.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href=\"%%7Bticket.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system. You\'re receiving this notice because the ticket is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(14, 1, 'task.alert', 'New Task Alert', '<h2>Hi %{recipient.name},</h2> New task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> created <br /> <br /> <table><tbody><tr><td><strong>Department</strong>: </td> <td>%{task.dept.name} </td> </tr> </tbody> </table> <br /> %{task.description} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(15, 1, 'task.activity.notice', 'Re: %{task.title} [#%{task.number}]', '<h3><strong>Dear %{recipient.name.first},</strong></h3> <div><em>%{poster.name}</em> just logged a message to a task in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You\'re getting this email because you are a collaborator on task #%{task.number}. To participate, simply reply to this email.</em> </div>', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(16, 1, 'task.activity.alert', 'Task Activity [#%{task.number}] - %{activity.title}', '<h3><strong>Hi %{recipient.name},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> updated: %{activity.description} <br /> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(17, 1, 'task.assignment.alert', 'Task Assigned to you', '<h3><strong>Hi %{assignee.name.first},</strong></h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(18, 1, 'task.transfer.alert', 'Task #%{task.number} transfer - %{task.dept.name}', '<h3>Hi %{recipient.name},</h3> Task <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> has been transferred to the %{task.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote>%{comments} </blockquote> <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\">login</a> to the support system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"https://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(19, 1, 'task.overdue.alert', 'Stale Task Alert', '<h3><strong>Hi %{recipient.name}</strong>,</h3> A task, <a href=\"%%7Btask.staff_link%7D\">#%{task.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tasks are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{task.dept.manager.name} <hr /> <div>To view or respond to the task, please <a href=\"%%7Btask.staff_link%7D\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support system. You\'re receiving this notice because the task is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />', NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `ost_email_template_group`
--

DROP TABLE IF EXISTS `ost_email_template_group`;
CREATE TABLE IF NOT EXISTS `ost_email_template_group` (
  `tpl_id` int NOT NULL AUTO_INCREMENT,
  `isactive` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL,
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_email_template_group`
--

INSERT INTO `ost_email_template_group` (`tpl_id`, `isactive`, `name`, `lang`, `notes`, `created`, `updated`) VALUES
(1, 1, 'osTicket Default Template (HTML)', 'en_US', 'Default osTicket templates', '2024-12-20 04:53:01', '2024-12-19 23:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `ost_event`
--

DROP TABLE IF EXISTS `ost_event`;
CREATE TABLE IF NOT EXISTS `ost_event` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_event`
--

INSERT INTO `ost_event` (`id`, `name`, `description`) VALUES
(1, 'created', NULL),
(2, 'closed', NULL),
(3, 'reopened', NULL),
(4, 'assigned', NULL),
(5, 'released', NULL),
(6, 'transferred', NULL),
(7, 'referred', NULL),
(8, 'overdue', NULL),
(9, 'edited', NULL),
(10, 'viewed', NULL),
(11, 'error', NULL),
(12, 'collab', NULL),
(13, 'resent', NULL),
(14, 'deleted', NULL),
(15, 'merged', NULL),
(16, 'unlinked', NULL),
(17, 'linked', NULL),
(18, 'login', NULL),
(19, 'logout', NULL),
(20, 'message', NULL),
(21, 'note', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq`
--

DROP TABLE IF EXISTS `ost_faq`;
CREATE TABLE IF NOT EXISTS `ost_faq` (
  `faq_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int UNSIGNED NOT NULL DEFAULT '0',
  `ispublished` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`faq_id`),
  UNIQUE KEY `question` (`question`),
  KEY `category_id` (`category_id`),
  KEY `ispublished` (`ispublished`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_category`
--

DROP TABLE IF EXISTS `ost_faq_category`;
CREATE TABLE IF NOT EXISTS `ost_faq_category` (
  `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_pid` int UNSIGNED DEFAULT NULL,
  `ispublic` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `ispublic` (`ispublic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_faq_topic`
--

DROP TABLE IF EXISTS `ost_faq_topic`;
CREATE TABLE IF NOT EXISTS `ost_faq_topic` (
  `faq_id` int UNSIGNED NOT NULL,
  `topic_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`faq_id`,`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_file`
--

DROP TABLE IF EXISTS `ost_file`;
CREATE TABLE IF NOT EXISTS `ost_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `size` bigint UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ft` (`ft`),
  KEY `key` (`key`),
  KEY `signature` (`signature`),
  KEY `type` (`type`),
  KEY `created` (`created`),
  KEY `size` (`size`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_file`
--

INSERT INTO `ost_file` (`id`, `ft`, `bk`, `type`, `size`, `key`, `signature`, `name`, `attrs`, `created`) VALUES
(1, 'T', 'D', 'image/png', 9452, 'b56944cb4722cc5cda9d1e23a3ea7fbc', 'gjMyblHhAxCQvzLfPBW3EjMUY1AmQQmz', 'powered-by-osticket.png', NULL, '2024-12-20 04:53:00'),
(2, 'T', 'D', 'text/plain', 24, 'R2gzIMWtx86n3ccfeGGNagoRoTDtol7o', 'MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls', 'osTicket.txt', NULL, '2024-12-20 04:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `ost_file_chunk`
--

DROP TABLE IF EXISTS `ost_file_chunk`;
CREATE TABLE IF NOT EXISTS `ost_file_chunk` (
  `file_id` int NOT NULL,
  `chunk_id` int NOT NULL,
  `filedata` longblob NOT NULL,
  PRIMARY KEY (`file_id`,`chunk_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_file_chunk`
--

INSERT INTO `ost_file_chunk` (`file_id`, `chunk_id`, `filedata`) VALUES
(1, 0, 0x89504e470d0a1a0a0000000d49484452000000da0000002808060000009847e4c900000a43694343504943432070726f66696c65000078da9d53775893f7163edff7650f5642d8f0b1976c81002223ac08c81059a21092006184101240c585880a561415119c4855c482d50a489d88e2a028b867418a885a8b555c38ee1fdca7b57d7aefededfbd7fbbce79ce7fcce79cf0f8011122691e6a26a003952853c3ad81f8f4f48c4c9bd80021548e0042010e6cbc26705c50000f00379787e74b03ffc01af6f00020070d52e2412c7e1ff83ba50265700209100e02212e70b01905200c82e54c81400c81800b053b3640a009400006c797c422200aa0d00ecf4493e0500d8a993dc1700d8a21ca908008d0100992847240240bb00605581522c02c0c200a0ac40222e04c0ae018059b632470280bd0500768e58900f4060008099422ccc0020380200431e13cd03204c03a030d2bfe0a95f7085b8480100c0cb95cd974bd23314b895d01a77f2f0e0e221e2c26cb142611729106609e4229c979b231348e7034cce0c00001af9d1c1fe383f90e7e6e4e1e666e76ceff4c5a2fe6bf06f223e21f1dffebc8c020400104ecfefda5fe5e5d60370c701b075bf6ba95b00da560068dff95d33db09a05a0ad07af98b7938fc401e9ea150c83c1d1c0a0b0bed2562a1bd30e38b3eff33e16fe08b7ef6fc401efedb7af000719a4099adc0a383fd71616e76ae528ee7cb0442316ef7e723fec7857ffd8e29d1e234b15c2c158af15889b850224dc779b952914421c995e212e97f32f11f96fd0993770d00ac864fc04eb607b5cb6cc07eee01028b0e58d27600407ef32d8c1a0b91001067343279f7000093bff98f402b0100cd97a4e30000bce8185ca894174cc608000044a0812ab041070cc114acc00e9cc11dbcc01702610644400c24c03c104206e4801c0aa11896411954c03ad804b5b0031aa0119ae110b4c131380de7e0125c81eb70170660189ec218bc86090441c8081361213a8811628ed822ce0817998e04226148349280a420e988145122c5c872a402a9426a915d4823f22d7214398d5c40fa90dbc820328afc8abc47319481b25103d4027540b9a81f1a8ac6a073d174340f5d8096a26bd11ab41e3d80b6a2a7d14be87574007d8a8e6380d1310e668cd9615c8c87456089581a26c71663e55835568f35631d583776151bc09e61ef0824028b8013ec085e8410c26c82909047584c5843a825ec23b412ba085709838431c2272293a84fb4257a12f9c478623ab1905846ac26ee211e219e255e270e135f9348240ec992e44e0a21259032490b496b48db482da453a43ed210699c4c26eb906dc9dee408b280ac209791b7900f904f92fbc9c3e4b7143ac588e24c09a22452a494124a35653fe504a59f324299a0aa51cda99ed408aa883a9f5a496da076502f5387a91334759a25cd9b1643cba42da3d5d09a696769f7682fe974ba09dd831e4597d097d26be807e9e7e983f4770c0d860d83c7486228196b197b19a718b7192f994ca605d39799c85430d7321b9967980f986f55582af62a7c1591ca12953a9556957e95e7aa545573553fd579aa0b54ab550fab5e567da64655b350e3a909d416abd5a91d55bba936aece5277528f50cf515fa3be5ffd82fa630db2868546a08648a35463b7c6198d2116c63265f15842d6725603eb2c6b984d625bb2f9ec4c7605fb1b762f7b4c534373aa66ac6691669de671cd010ec6b1e0f039d99c4ace21ce0dce7b2d032d3f2db1d66aad66ad7ead37da7adabeda62ed72ed16edebdaef75709d409d2c9df53a6d3af77509ba36ba51ba85badb75cfea3ed363eb79e909f5caf50ee9ddd147f56df4a3f517eaefd6efd11f373034083690196c313863f0cc9063e86b9869b8d1f084e1a811cb68ba91c468a3d149a327b826ee8767e33578173e66ac6f1c62ac34de65dc6b3c61626932dba4c4a4c5e4be29cd946b9a66bad1b4d374ccccc82cdcacd8acc9ec8e39d59c6b9e61bed9bcdbfc8d85a5459cc54a8b368bc796da967ccb05964d96f7ac98563e567956f556d7ac49d65ceb2ceb6dd6576c501b579b0c9b3a9bcbb6a8ad9badc4769b6ddf14e2148f29d229f5536eda31ecfcec0aec9aec06ed39f661f625f66df6cf1dcc1c121dd63b743b7c727475cc766c70bceba4e134c3a9c4a9c3e957671b67a1739df33517a64b90cb1297769717536da78aa76e9f7acb95e51aeebad2b5d3f5a39bbb9bdcadd96dd4ddcc3dc57dabfb4d2e9b1bc95dc33def41f4f0f758e271cce39da79ba7c2f390e72f5e765e595efbbd1e4fb39c269ed6306dc8dbc45be0bdcb7b603a3e3d65facee9033ec63e029f7a9f87bea6be22df3dbe237ed67e997e07fc9efb3bfacbfd8ff8bfe179f216f14e056001c101e501bd811a81b3036b031f049904a50735058d05bb062f0c3e15420c090d591f72936fc017f21bf96333dc672c9ad115ca089d155a1bfa30cc264c1ed6118e86cf08df107e6fa6f94ce9ccb60888e0476c88b81f69199917f97d14292a32aa2eea51b453747174f72cd6ace459fb67bd8ef18fa98cb93bdb6ab6727667ac6a6c526c63ec9bb880b8aab8817887f845f1971274132409ed89e4c4d8c43d89e37302e76c9a339ce49a54967463aee5dca2b917e6e9cecb9e773c593559907c3885981297b23fe5832042502f184fe5a76e4d1d13f2849b854f45bea28da251b1b7b84a3c92e69d5695f638dd3b7d43fa68864f4675c633094f522b79911992b923f34d5644d6deaccfd971d92d39949c949ca3520d6996b42bd730b728b74f662b2b930de479e66dca1b9387caf7e423f973f3db156c854cd1a3b452ae500e164c2fa82b785b185b78b848bd485ad433df66feeaf9230b82167cbd90b050b8b0b3d8b87859f1e022bf45bb16238b5317772e315d52ba647869f0d27dcb68cbb296fd50e2585255f26a79dcf28e5283d2a5a5432b82573495a994c9cb6eaef45ab9631561956455ef6a97d55b567f2a17955fac70aca8aef8b046b8e6e2574e5fd57cf5796ddadade4ab7caedeb48eba4eb6eacf759bfaf4abd6a41d5d086f00dad1bf18de51b5f6d4ade74a17a6af58ecdb4cdcacd03356135ed5bccb6acdbf2a136a3f67a9d7f5dcb56fdadabb7bed926dad6bfdd777bf30e831d153bdeef94ecbcb52b78576bbd457df56ed2ee82dd8f1a621bbabfe67eddb847774fc59e8f7ba57b07f645efeb6a746f6cdcafbfbfb2096d52368d1e483a70e59b806fda9bed9a77b5705a2a0ec241e5c127dfa67c7be350e8a1cec3dcc3cddf997fb7f508eb48792bd23abf75ac2da36da03da1bdefe88ca39d1d5e1d47beb7ff7eef31e36375c7358f579ea09d283df1f9e48293e3a764a79e9d4e3f3dd499dc79f74cfc996b5d515dbd6743cf9e3f1774ee4cb75ff7c9f3dee78f5df0bc70f422f762db25b74bad3dae3d477e70fde148af5b6feb65f7cbed573cae74f44deb3bd1efd37ffa6ac0d573d7f8d72e5d9f79bdefc6ec1bb76e26dd1cb825baf5f876f6ed17770aee4cdc5d7a8f78affcbedafdea07fa0fea7fb4feb165c06de0f860c060cfc3590fef0e09879efe94ffd387e1d247cc47d52346238d8f9d1f1f1b0d1abdf264ce93e1a7b2a713cfca7e56ff79eb73abe7dffde2fb4bcf58fcd8f00bf98bcfbfae79a9f372efaba9af3ac723c71fbcce793df1a6fcadcedb7defb8efbadfc7bd1f9928fc40fe50f3d1fa63c7a7d04ff73ee77cfefc2ff784f3fb803925110000001974455874536f6674776172650041646f626520496d616765526561647971c9653c0000032869545874584d4c3a636f6d2e61646f62652e786d7000000000003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e362d633031342037392e3135363739372c20323031342f30382f32302d30393a35333a30322020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204343203230313420284d6163696e746f7368292220786d704d4d3a496e7374616e636549443d22786d702e6969643a36453243393544454136373331314534424443444446393146414639344441352220786d704d4d3a446f63756d656e7449443d22786d702e6469643a3645324339354446413637333131453442444344444639314641463934444135223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4346413734453446413637313131453442444344444639314641463934444135222073745265663a646f63756d656e7449443d22786d702e6469643a4346413734453530413637313131453442444344444639314641463934444135222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3e8bfef6ca0000170b4944415478daec5d099c53d5d53f2f7b32c9646680617118905d3637d0cfad282aa82d0af6f3b3b62ef52bd6d685ba206eb54a15c1adf6538b52b4d53a564454a42c0565d132a86c82a0ac82ec8b0233ccc24c9297f7dd9bfc6f73e64e92c90c5071ccf9fd0e249397f7eebbf7fccff99f73efbb31860f1f4e593936a4da74d2d8eeef53b17f2f51c4fd5d6b7e4ba19385ee177a9bd0ed8d3e832534dfa4d2351ebafaad3cb2d92cb219cd636c6d59f3ceca11920b849e27f4c742af68f4b7a342f34c5ab8de4d3f9b12a4b0005d7301991447d63ebed7e2125a283457a85d680d22d2be26463405995d8dfeb63f4a4b44241bfa463e5902642d7d518a5a59a065e5bb29ad849e2a7480d0d384b617ea05e024bb89080d093d287495d0e94267093d90c1b9edf85f82b4a2d19451006dc65617ed2bb3538f76618a449b57c76781f6fd908e42af14fabf42bb65f89dde42af12ba4ce848a10bd21c9b23741803f3bb42c709fd6d4657921015003b74c8205f8ed9ec4096cdd19abf7884de2e74210cbf5b13ce2123e05ca1f7e37cc9e45788921c3af703d80d47b3a049b3b739e989d21c2aca8d36cb81c802adf94a6ba15385fe41e87147c04e1e018dbc00399da49b4542ef4d13b97e2d343fed999d16d57ee3a0498b7dd426b779e56559ead8fce504a16f0aed7584cf7b2e72bbbd426b01b8d6691c763f8a97fa1f4c471bb71db4d194b51e6a17c8022d2bdf1d9151e695a30032253ee47c99caef285ecd1c9b92df0aea58e88fc672b3e654d2cf52c7e62d922af6ff96ae2de3d152a1cb8556b1bfcb4249cb3a47ca54cc23fec93569fe1a0f4522061946f31d946c443be65c5fe470befd736aca64f19193f5427f227487d00e427f29f432e477dfc4efcf8abbf76094e6adf4d0a4955e9ab6d14d6e41218de63cac59cb3e86bc9e11a592eda79019f60aab6b74f54de64a7725f9bb9c3c2eff0fddc2c342bf04555c47f142493f11e7a6935d00cc6fc6d0f4e55e07fdf4a502ba654690262ef791d76191c76135efb1cd9af7b123d2a36f3e14a4903d4c5eabd1fe5d468e9edadf4a854e04008347b9f9e385be56871afaa22171232119c50e96dbe9c036173d58eaa7399b5c541532c8efb2a87bab08990263d1e68db32cd08e297a61086bb36cb4fa4031f5cfdf127b9da104845ea3fd4d4694a1145f62d5e62837fd39a1a312ad11912b274aabd67b68f1976eea901fa1055b5cf468690eb5f34763343127271eb14debfb31b68eb3cf3e3b6be1c7904c9bbf8cdedcdd8bfab7d824dc7cc67ef02c8a97dd95940178df20b66c10dae22834572ed31a416ad58808c2729de2e37372c914579db5c94d0b05d00c579472dd227ab5689eab3eb211ed3b99a75994e7aa8a17452c8f30de8c5cbe5c31ef62ef1f12ba04afe522e12784be91c178cbfcea75d04c59ccc8a37839df29b412f95e5b009b50f45856e70c820e4e58e1a5cdbb9d542822598fb689758bdf57906581760c8add885255d843353541f2d84399d04759363f91bdff40e8abda316b8456537c82399dc849ee0758cae8a3c42a907244ca2280f64ca18384ce8e013d2a401834e9ab3d4eca775a146a19891539be2570c9f6ca2561edf17e8fd079420f6581969598f8edb5b4a2a20d95ecec4bc33b7f4854eb6fe82b8329be1e51c95f11c5b874a1d4eb1489196349ec559ec8b142229456daaac856673e4cca761457a653e2319b7cf258bbb6ee70d1b0c979b4eda09d5a78a37252ad1dc527b723a0b029fd0bc5579a48aa5b20d48df6ca08bab109dd2823f23d4207328afb43a1dbb240cb4a4c2c11481c24cbddb528f11b149f074e29329aa9b027170fbf9be498ae1ab5d42f2acff027725a9f4b44dcfb561e9d2828dfd567098c1db2c59b107b80c650935d6159c720b96adf8a3d42b39d0a22347e6e80566e7752f7b691588e46f155ff72517315ce904a64e4dc041a7abef437147f22e079a13765a963568e8a14b8aae9fdbddde8e4e00eea259442fe5460cb038553f24fd03b5d4e4e79b15819de7a37e2b61e731cb4d17df302f4e4877e6a2fa8dfac0d6eaa0e1bb4b7d246c37ad7d0c80b2a880ec46696db89e6b48c3529d7dc459ee8a1454b7cf4d66a0f15b73415c808f91c01340d492ef2c2969478b6cddbc42e8c6ac0361b88a8474a8e475ff786d39891055a7a31601c4e78e3508ae33c38a6065efec82418369376d40468555911f50aec8d47b6e4f36a72deac2f5eef448ea58ba461dd539aa3db9a496dc2b74c9c951b1afb5e20669d9d5acb0286413336ba636b0f0f08a0e57b2c1a39a052dcb14057b55125a0b05ae464f3b7d718e3576df6866f9e9627724b8a1dc74af68af65530c33759dea7447e26172aaf07d8f2d1ff9587317effe985263d50483a09efc76581d6b0c8817e01b98f7cd46434c59f3ae6d287e2eb0adbe3987b8ed4c5a30254c7b92b68b22cf38b88d6397777aacd7ae4fc5800afbf04fdd2e5062d874b80cc4e2f52dbf0cdcfcccc0ddd332d488581682b9f61150b70796d762bd2ca67c9a7a537b7f24523f3b63ae9ea92022ab9f28004db12ea5a3b78f906d7ce817715c92a89af4b71a83857e05180cc0580c8b63c04f07b589e269dd2a39478505452cf3b50c49120fc239c979b9ab225c2b727ed19c8482fbc648196a22641f179a90ef83f999517a0b2e54c6ac8870b36e1903d22b2391ca174391a5fa8bb32491e24dbf500e94bed2cda2d22d96801b2179ef9672eddfe76b0b038dfbcc9618b3da8d99e5d4d562a17442d7ab263303a7ff27a3779dfc9a347cfaf282f793dbf7cd2a75e5bb9d3bab66361e41671813ed1ba516a8bd0c729be624497afd96b79839f4a40e3fdd66398e5a44b96b7a1a0a36c657f16680d4b84d1c50329a8e341786e19fd761f8d46380d934ab69d4277772a25476c5ecd96cc8b2af944fb4c56dcfe86aa20972951d378c0e631d74e1054f1376fe69dd12edf7cce65a753a256ec3e5e84d1c8fce807422f911a8ed2bdc707cd715345def6c53e3b2ddeee143431fa74aff6a111a66944c5e7938d3855947d271fd11922f44f42cf107a9d9623f19ccdc5de77a2f8960b76383bb984ec1f49ba463ec83a18d4b91011b312e3b080e24f103444e5e5b3729782d606e18cc653dd6df22ea6f814462125a638e48a9b49ac827922faba9386a78be18465db2a1c48e04e45c366a3027435c5e74b1623c1ae4c929b0c42e2e7c54517c13311e3d936500895a0cbfd248a1156373203f6e33b1edce81e50221931fac393c8b9a0f9e0f2c40ca115dab91e83d4055c7913a8d520e42816aa72ff22aa57b23e139d9583aadd7a16fa53f17d1b8b14ea7c3f419fc8364ea3f88a0c79ce8b700e3948ab9200a2ad8a1ec436c2310c8b361fcaa750d41e075a7d69cd220fa78db2523706c512259206de4fdee8c48dfbedd18b1f6b4355216a2f403631e0b27a09ca27f3895b847ea5e577d7a3fa375600715fae2bf67dea986f5e651834221436b6898ebdc2a80ff47384fe1db6f421c5d75c72e2ca6b9e4a4e02ad54f29724409351f74eaabfae53c9f9a0a5e9e6cc241b795a285f16f53aeb7be9c0e4130757012c94a40db7012f8310b975b9041a73d60e7886e7d1b07168e80fd817e682e7abd02e9fde7d099e8a8b1cec6728be625b1ad673f04c37e3fc5246a1e42baf251fa128c1df47c33822f03412a47281ea29da3556c218168236498fd91946f50d3aef200658523e39b1da513b4729dab412efefa6f813c05e96d34cc8b052c6238bccd32e637f1b05e02fc2a0f5c0352f64d4497a6639b92ce79be6087d4f672b3e7b38be06b2be7871ef2aeaeec06bb9825edf5a6035a2ca72b975c0dc751efabacaa016bee81d22924990cd455b7507548b5cb50ad1718cc8df66e5ba2de90ccfb5e2cdba2f49342538b47b30c63722572b6ba01fab01bc54858c47615fe9641302433ab6f6a80632d9c6e1b8df7600dd59ecf3b5c82dbba3df7bc0b6fa30c79f4eec3656fdf1c2e0fb2131fd9a798817019a020040814c469979e8401f3af63a78e6103aac2f2b459fc3ae752e5e0710663d300809b25718c85622628510a64bd01935ac3347a0ed8468741e0cb823c02bc1f5193e3f0bf7e0c7bd3d82f698308e7d309ece1974a0c9bcd710b4750dfe5688b6ca39ac298c6674d1bc7e3bbc9e579f395874c874c68a23290a364578fd3972a2f3e138b8bc1feb5f4b80cc1fa5671704e80e919715e644fb8a9cec06ac9abf2b09c8b8bc0a1b90ece15aadf4fe759aef2d40df47f0dd4ccaf2a9a2dd4d1ac8c2601fd2f15e4ef10d825e461008a5c8ab09c7ddc8decf60202314b8ce624ce54644da7e9478d68e40379f84d31f053ac9dbfe216cf23119c06c1a979527fe394070298b6203e1010650624ee65550aef371ace2acf701040bf1fe7480e838189d92229627aa0d5c2621c2aa05b2b7e3264f4747d78262de0b6e1d66605d0bca3012e7e8064e3d1c6d3f9112cf6bf5c2ebdb1958ef46243f1714b5b1320614fc62500a15b106c1d89570b6309819eb7bf5124541196f68bf8c7caeea64f9591eebb7452cc7716a51659830d7ed5460d2cb4b7c3462662e15e444c9668bf5878cda6fb3e89e4ed444f87fc381aad2fd3d6c2c75d98131b95ca3a48d957614df558b8bbcee50b09a77c042ae475ffb293117a700bb034e9f6fa9b00481a196a51043d8e712c47fc6e726d281fbd8e79781cd3c0150717eff36aaaeb29d636d5a989ec0e6623ec609945c04a35586f104a302ff82272018f879f83e21dcb646bee447b42c0705cd47e408b2ca4d4f16c966200fca017551e7ec0bc0d5e0fd6e78aaa9888aaa48f019724c173cdc348a3f662fe517a07152a683ea124acabf078dc9a41225650522a389c8328e1d73211cd6a78c21a81caf27f37ecbeb700d234a65110fe5b92b523d759dcbfa6d03a35e4abe821155927ca8b2ca46ef6f709343bcf60bfa28685f6f16493399cc5d0e70754234fb2bae712ea2d6431897028db6495bd9494d9b6754116d288bfc0446f287469c672f22ea5896b7ae41fff05d99af003323b0a82949ce3507e3ad72d801acc063d3a87dcaaae347dafb8540a90340511bbe7c00bac2450128884e919ee57794d8cca5150cfe7544ce4b0096fe68d42ae459aa43a5112e8331dbe0557258343c9e79a2c5cc903bb2c8f95f42bf40874431707e166d78de56cbdeaf03e8bb6708b4355a65f22b78d0e3e048b602cc27c3500d44e9beac9feb806c77ad9ffa04f6500719cdcc64f978ec3e5d68f716fcad428bb09bd50f47bcbed447afadf052b7c2887cc8d260fd9ce98f51ec8113ea0276f011a2dbd3a0c00f42bf86432c45eeb688524ff8672a03b5f72f36f2fb39a070aa382103c4ad8ce613ec94afa07122425a0c3435781d4832c5a2072d473aa09949383325a9bed524f1827c998b1b615919db190015013c1edcb4a45abd19c857b39bd80f301bec26aad1e6cf61546ecde055b9d8c3a2d35a749a9d1213a6657008aa1ad8d4690e2345bf998c46a836ce06fde90c2adb07ed5c0be7f36f17bead26482709903dd06336b96d2210c4b636a85710e9c61cdc4a561451530f712aeab2a862a793a62cf3519ba0a99e64b6b17bce34d2f07b72b2b11c08ca7521c6b21fe8d71046a16ea3a62de8b592cc17963761aeed4cadb89183ea376940e37b509e4ce996ae252490c206281dd0f42771fbb063b6800214c31b77609e946040f90c8835180809b40b1065f6c0b0d4e31a97b2c8f239c01566d5a3a19a975625f508aeafa2939d4d2896c3abfa71ce61f0faea7307bedf17f75180e8a8775ecb0c9377d20a1c525a30c7b28b45cd4fe0746e60c587c5e897b86559063dde6d2e15f9f7922706325faafd434e60c6ae8a2821966bc7fb4dd0c48dfb1d34759d9bba251ebc3429b18f48a65b1cf8d02f11aa3b191b01f5fd107d5c8cfe389b152ae458fc8cd4063d4d77680d1a740ad1135c2722dc0ac684ec5a7e1b4d33b513812d39d938da523889a41f0e67865f4075574e7fc0e634bab2ea939acfb99b356235cbf3545e520c63530f10560268a762e03e62002318e48fd8353aa12cfb77cc6354a7a8506d619dd70ff9a2fabc27a620fe0f45096530c35815d48e42498b46785c791dbe95c055ecf522ad38a1728e1fe3f55bfc8445de723a217f0b051d358864494196c768ed275a345774b0b681b6af67ce3413e986b2f676e43cc751fd5d882df4ff5c140706e2d8412812351560116d0e2caf09e79a8cc2899256a81afa5864afd12aa6e750628ef53ca61742252bfb23632e562aa0e911ed14508e1994982c56d59979283a8c00b04623227c4675378699c1aa6c2b0028bf96b4efc580f462f3149fb282cc6078da975052fd1237d59d150f2a29f92e5e5528e85c8ece9c8af73b0186b6e884ab50d0990083790305971e1ac01b0299eac7f1e8fc001c886acb1bec3899a7fd1ac704d01f1ff393dedd7901d9648551e665a99fae1e0c5af309c6454fc0b7fddb68c206752988d0d0eeb5b468bb33b6210e9b5b5355c427a8e15f8c198871fc1ba2f5c7282efd94524f0eaf42d1621cf2ba579b18d1b668efafd48b470dc84e14abd6c0299eceeee90e7c56a61546fc68ffc126445deef4ea453413206b8f12797f366877e2f517a03ddfe0c43f44a9bd279bb3b99575fc622de1547310fb984795b29479ad7988ac07603897a20cdf1dc73c850a612b56c20d68f73209f31f11789aab31d7d1964d41bc817997296cde6b24b8fcb3ac1c1d4891c3799937fc1cfd740da2956acb48f4012f362dd34ac075263c7d22a251c4956e407bb36af04b1ab52e60112d4eb1420605da86e99ad3ab687fb54d2f5e95829d5cdf80111531765302c32f474a509421bd360f23a2bda339b611193a4362fdb10bf6f080e6181e44c48d52dd5fcc398df886430d8bfe53555d5345343bbcf218d0421faa6faf22a228f907f8f7507829278ce503ccb570cab20f03d409de9dd39c7b01885012ef340509fee5302c17403a15d14c958d7f815c6a13d55ff0f96718f930388230ee63068b2221dceb2c783737aef11a0a149df09d64fb227e8168e083e793e7ba19f9de7e50953949b8fd2c4653e7d43b6b6d4046323f0a25fb357a7c3afab83568d044eddb43d87447c254455493e57d2dfecb717a1ce77b0aa5fb6949eeb31051bf330cfe23e6cc6474fe2dc621d91c4457440cd223772365261cb09a1af1c0514e44fb7781950c80dd946aed71b2a2d47b70a4a318061e076b9b08a7a3162bdc8f7b180f675a0bc7ab72d0a56c0cabc122fc6c8e6d246cdb702449123f8031bb603cc9f8cb3a2493ea07ec4269e6629642939d635d9acedd806b38718db0768d43946492579315e87855de0f27b91f799ebfc0a118aca0f05192e90e2e07883d6f0419858133b581568598202596fe7c46f5d73d8a56ca072bad9e18248b45275e391b4ff5374bed01cf4cf51c83e8bdb25a1b850e19e4c8abb349ce3478f88761b0cfc24195e13ecec4679dd08fb7b3b3be00605f0b631c073a1ac1980d46b42844e49d7e184033d1b73329b1be533ab8df205f3f08f0b580935ca84d29e8b4ee1938d67e782f03c6efc1c64621d5506ee97f702f07d8bde502d8250c685b70dd8b5865732cdabec491a20a6965904cd311981fc9440ef7814a4b4b728fd675944198294ac0772202f664b4b1fef2a5785eb618cce257c8fb0a700fd310c9e624b9c60044f728a22d8b5d069d5d14a2d33a86686bb99de76984fc6433febf15aa8ff12bf0ee3bd8df556efe340a4bc9b650280350c768fdebd70a3b5e061ebbc6b2942c075d7c9e018458becbabb105547709569ec6de760004bc10750baabf8fe0be9e625328c114d5d9965a3f3d0c6718607892dad1a135c04d59391a92835c53816c33a8653a59096ae6426ea976a14a3597730306fb7ad27f9d53d0c62e27d4d2259b6a68cc9c80005a3d5ff01aa2f3a598f66801606f06655b9ae2bacb29f123f132a76907b0ec039d9f4dc937d7998e625618f7f515ab844e4074f253fd5f195d8aebfd08ff7766154875cd994865a6e37f0b6dd0e9ffdb486b06205ab544dbbdf8ee2728989d838ab91f4e541ebb15e77c5f3be722b4eb564a4c8dc99469bef1f2cb2ff742688ca0911bb3b838e222a9c62fe12177c2fb7f9aecc0ebca4635e5fc7654212b51c1ad2f4193464f0fd298d21cea10349b439f1a70306a43950a4acc2736b8a3519a7ed40b377644332fd84235a8aad540db5a2070c9e3cbfe5f800100b3e0af98735d4afd0000000049454e44ae426082),
(2, 0, 0x43616e6e6564204174746163686d656e747320526f636b21);

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter`
--

DROP TABLE IF EXISTS `ost_filter`;
CREATE TABLE IF NOT EXISTS `ost_filter` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `execorder` int UNSIGNED NOT NULL DEFAULT '99',
  `isactive` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `flags` int UNSIGNED DEFAULT '0',
  `status` int UNSIGNED NOT NULL DEFAULT '0',
  `match_all_rules` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `email_id` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `email_id` (`email_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_filter`
--

INSERT INTO `ost_filter` (`id`, `execorder`, `isactive`, `flags`, `status`, `match_all_rules`, `stop_onmatch`, `target`, `email_id`, `name`, `notes`, `created`, `updated`) VALUES
(1, 99, 1, 0, 0, 0, 0, 'Email', 0, 'SYSTEM BAN LIST', 'Internal list for email banning. Do not remove', '2024-12-20 04:53:00', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_action`
--

DROP TABLE IF EXISTS `ost_filter_action`;
CREATE TABLE IF NOT EXISTS `ost_filter_action` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `filter_id` int UNSIGNED NOT NULL,
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(24) NOT NULL,
  `configuration` text,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_id` (`filter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_filter_action`
--

INSERT INTO `ost_filter_action` (`id`, `filter_id`, `sort`, `type`, `configuration`, `updated`) VALUES
(1, 1, 1, 'reject', '[]', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_filter_rule`
--

DROP TABLE IF EXISTS `ost_filter_rule`;
CREATE TABLE IF NOT EXISTS `ost_filter_rule` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `filter_id` int UNSIGNED NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  KEY `filter_id` (`filter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_filter_rule`
--

INSERT INTO `ost_filter_rule` (`id`, `filter_id`, `what`, `how`, `val`, `isactive`, `notes`, `created`, `updated`) VALUES
(1, 1, 'email', 'equal', 'test@example.com', 1, '', '0000-00-00 00:00:00', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form`
--

DROP TABLE IF EXISTS `ost_form`;
CREATE TABLE IF NOT EXISTS `ost_form` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int UNSIGNED DEFAULT NULL,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `flags` int UNSIGNED NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_form`
--

INSERT INTO `ost_form` (`id`, `pid`, `type`, `flags`, `title`, `instructions`, `name`, `notes`, `created`, `updated`) VALUES
(1, NULL, 'U', 1, 'Contact Information', NULL, '', NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(2, NULL, 'T', 1, 'Ticket Details', 'Please Describe Your Issue', '', 'This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.', '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(3, NULL, 'C', 1, 'Company Information', 'Details available in email templates', '', NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(4, NULL, 'O', 1, 'Organization Information', 'Details on user organization', '', NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(5, NULL, 'A', 1, 'Task Details', 'Please Describe The Issue', '', 'This form is used to create a task.', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(6, NULL, 'L1', 0, 'Ticket Status Properties', 'Properties that can be set on a ticket status.', '', NULL, '2024-12-20 04:53:00', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry`
--

DROP TABLE IF EXISTS `ost_form_entry`;
CREATE TABLE IF NOT EXISTS `ost_form_entry` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_id` int UNSIGNED NOT NULL,
  `object_id` int UNSIGNED DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int UNSIGNED NOT NULL DEFAULT '1',
  `extra` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_lookup` (`object_type`,`object_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_form_entry`
--

INSERT INTO `ost_form_entry` (`id`, `form_id`, `object_id`, `object_type`, `sort`, `extra`, `created`, `updated`) VALUES
(1, 4, 1, 'O', 1, NULL, '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(2, 3, NULL, 'C', 1, NULL, '2024-12-20 04:53:01', '2024-12-20 04:53:01'),
(3, 1, 1, 'U', 1, NULL, '2024-12-20 04:53:02', '2024-12-20 04:53:02'),
(4, 2, 1, 'T', 0, '{\"disable\":[]}', '2024-12-20 04:53:02', '2024-12-20 04:53:02'),
(5, 1, 2, 'U', 1, NULL, '2024-12-20 05:11:20', '2024-12-20 05:11:20'),
(6, 2, 2, 'T', 0, '{\"disable\":[]}', '2024-12-20 05:11:20', '2024-12-20 05:11:20'),
(7, 1, 3, 'U', 1, NULL, '2024-12-20 06:19:18', '2024-12-20 06:19:18'),
(8, 2, 3, 'T', 1, NULL, '2024-12-20 06:19:18', '2024-12-20 06:19:18'),
(9, 2, 4, 'T', 1, NULL, '2024-12-20 06:19:20', '2024-12-20 06:19:20'),
(10, 2, 5, 'T', 1, NULL, '2024-12-20 06:19:23', '2024-12-20 06:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_entry_values`
--

DROP TABLE IF EXISTS `ost_form_entry_values`;
CREATE TABLE IF NOT EXISTS `ost_form_entry_values` (
  `entry_id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED NOT NULL,
  `value` text,
  `value_id` int DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_form_entry_values`
--

INSERT INTO `ost_form_entry_values` (`entry_id`, `field_id`, `value`, `value_id`) VALUES
(2, 23, 'TesTech', NULL),
(2, 24, NULL, NULL),
(2, 25, NULL, NULL),
(2, 26, NULL, NULL),
(4, 20, 'osTicket Installed!', NULL),
(5, 3, '4343432223X0000', NULL),
(5, 4, NULL, NULL),
(6, 20, 'Test Issue', NULL),
(6, 22, 'Normal', 2),
(3, 3, NULL, NULL),
(3, 4, NULL, NULL),
(7, 3, NULL, NULL),
(7, 4, NULL, NULL),
(8, 20, 'Login issue', NULL),
(8, 22, 'Low', 1),
(9, 20, 'Payment error', NULL),
(9, 22, 'Normal', 2),
(10, 20, 'Password reset', NULL),
(10, 22, 'High', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ost_form_field`
--

DROP TABLE IF EXISTS `ost_form_field`;
CREATE TABLE IF NOT EXISTS `ost_form_field` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED DEFAULT '1',
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int UNSIGNED NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_form_field`
--

INSERT INTO `ost_form_field` (`id`, `form_id`, `flags`, `type`, `label`, `name`, `configuration`, `sort`, `hint`, `created`, `updated`) VALUES
(1, 1, 489395, 'text', 'Email Address', 'email', '{\"size\":40,\"length\":64,\"validator\":\"email\"}', 1, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(2, 1, 489395, 'text', 'Full Name', 'name', '{\"size\":40,\"length\":64}', 2, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(3, 1, 13057, 'phone', 'Phone Number', 'phone', NULL, 3, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(4, 1, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 4, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(20, 2, 489265, 'text', 'Issue Summary', 'subject', '{\"size\":40,\"length\":50}', 1, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(21, 2, 480547, 'thread', 'Issue Details', 'message', NULL, 2, 'Details on the reason(s) for opening the ticket.', '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(22, 2, 274609, 'priority', 'Priority Level', 'priority', NULL, 3, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(23, 3, 291249, 'text', 'Company Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(24, 3, 274705, 'text', 'Website', 'website', '{\"size\":40,\"length\":64}', 2, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(25, 3, 274705, 'phone', 'Phone Number', 'phone', '{\"ext\":false}', 3, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(26, 3, 12545, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"html\":false,\"length\":100}', 4, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(27, 4, 489395, 'text', 'Name', 'name', '{\"size\":40,\"length\":64}', 1, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(28, 4, 13057, 'memo', 'Address', 'address', '{\"rows\":2,\"cols\":40,\"length\":100,\"html\":false}', 2, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(29, 4, 13057, 'phone', 'Phone', 'phone', NULL, 3, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(30, 4, 13057, 'text', 'Website', 'website', '{\"size\":40,\"length\":0}', 4, NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59'),
(31, 4, 12289, 'memo', 'Internal Notes', 'notes', '{\"rows\":4,\"cols\":40}', 5, NULL, '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(32, 5, 487601, 'text', 'Title', 'title', '{\"size\":40,\"length\":50}', 1, NULL, '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(33, 5, 413939, 'thread', 'Description', 'description', NULL, 2, 'Details on the reason(s) for creating the task.', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(34, 6, 487665, 'state', 'State', 'state', '{\"prompt\":\"State of a ticket\"}', 1, NULL, '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(35, 6, 471073, 'memo', 'Description', 'description', '{\"rows\":\"2\",\"cols\":\"40\",\"html\":\"\",\"length\":\"100\"}', 3, NULL, '2024-12-20 04:53:00', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_group`
--

DROP TABLE IF EXISTS `ost_group`;
CREATE TABLE IF NOT EXISTS `ost_group` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(120) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic`
--

DROP TABLE IF EXISTS `ost_help_topic`;
CREATE TABLE IF NOT EXISTS `ost_help_topic` (
  `topic_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `topic_pid` int UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `noautoresp` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED DEFAULT '0',
  `status_id` int UNSIGNED NOT NULL DEFAULT '0',
  `priority_id` int UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int UNSIGNED NOT NULL DEFAULT '0',
  `page_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sequence_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `topic` varchar(128) NOT NULL DEFAULT '',
  `number_format` varchar(32) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic` (`topic`,`topic_pid`),
  KEY `topic_pid` (`topic_pid`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`,`team_id`),
  KEY `sla_id` (`sla_id`),
  KEY `page_id` (`page_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_help_topic`
--

INSERT INTO `ost_help_topic` (`topic_id`, `topic_pid`, `ispublic`, `noautoresp`, `flags`, `status_id`, `priority_id`, `dept_id`, `staff_id`, `team_id`, `sla_id`, `page_id`, `sequence_id`, `sort`, `topic`, `number_format`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 1, 'General Inquiry', NULL, 'Questions about products or services', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(2, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Feedback', NULL, 'Tickets that primarily concern the sales and billing departments', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(10, 0, 1, 0, 2, 0, 2, 3, 0, 0, 0, 0, 0, 0, 'Report a Problem', NULL, 'Product, service, or equipment related issues', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(11, 10, 1, 0, 2, 0, 3, 0, 0, 0, 1, 0, 0, 1, 'Access Issue', NULL, 'Report an inability access a physical or virtual asset', '2024-12-20 04:53:00', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_help_topic_form`
--

DROP TABLE IF EXISTS `ost_help_topic_form`;
CREATE TABLE IF NOT EXISTS `ost_help_topic_form` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `topic_id` int UNSIGNED NOT NULL DEFAULT '0',
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '1',
  `extra` text,
  PRIMARY KEY (`id`),
  KEY `topic-form` (`topic_id`,`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_help_topic_form`
--

INSERT INTO `ost_help_topic_form` (`id`, `topic_id`, `form_id`, `sort`, `extra`) VALUES
(1, 1, 2, 1, '{\"disable\":[]}'),
(2, 2, 2, 1, '{\"disable\":[]}'),
(3, 10, 2, 1, '{\"disable\":[]}'),
(4, 11, 2, 1, '{\"disable\":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list`
--

DROP TABLE IF EXISTS `ost_list`;
CREATE TABLE IF NOT EXISTS `ost_list` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `masks` int UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `configuration` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_list`
--

INSERT INTO `ost_list` (`id`, `name`, `name_plural`, `sort_mode`, `masks`, `type`, `configuration`, `notes`, `created`, `updated`) VALUES
(1, 'Ticket Status', 'Ticket Statuses', 'SortCol', 13, 'ticket-status', '{\"handler\":\"TicketStatusList\"}', 'Ticket statuses', '2024-12-20 04:53:00', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_list_items`
--

DROP TABLE IF EXISTS `ost_list_items`;
CREATE TABLE IF NOT EXISTS `ost_list_items` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `list_id` int DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '1',
  `properties` text,
  PRIMARY KEY (`id`),
  KEY `list_item_lookup` (`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_lock`
--

DROP TABLE IF EXISTS `ost_lock`;
CREATE TABLE IF NOT EXISTS `ost_lock` (
  `lock_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`lock_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_note`
--

DROP TABLE IF EXISTS `ost_note`;
CREATE TABLE IF NOT EXISTS `ost_note` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int UNSIGNED DEFAULT NULL,
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text,
  `status` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ext_id` (`ext_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_organization`
--

DROP TABLE IF EXISTS `ost_organization`;
CREATE TABLE IF NOT EXISTS `ost_organization` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int UNSIGNED NOT NULL DEFAULT '0',
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_organization`
--

INSERT INTO `ost_organization` (`id`, `name`, `manager`, `status`, `domain`, `extra`, `created`, `updated`) VALUES
(1, 'osTicket', '', 8, '', NULL, '2024-12-19 23:53:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_organization__cdata`
--

DROP TABLE IF EXISTS `ost_organization__cdata`;
CREATE TABLE IF NOT EXISTS `ost_organization__cdata` (
  `org_id` int UNSIGNED NOT NULL,
  `name` mediumtext,
  `address` mediumtext,
  `phone` mediumtext,
  `website` mediumtext,
  `notes` mediumtext,
  PRIMARY KEY (`org_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_plugin`
--

DROP TABLE IF EXISTS `ost_plugin`;
CREATE TABLE IF NOT EXISTS `ost_plugin` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(64) DEFAULT NULL,
  `notes` text,
  `installed` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `install_path` (`install_path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_plugin_instance`
--

DROP TABLE IF EXISTS `ost_plugin_instance`;
CREATE TABLE IF NOT EXISTS `ost_plugin_instance` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `plugin_id` int UNSIGNED NOT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_id` (`plugin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue`
--

DROP TABLE IF EXISTS `ost_queue`;
CREATE TABLE IF NOT EXISTS `ost_queue` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `columns_id` int UNSIGNED DEFAULT NULL,
  `sort_id` int UNSIGNED DEFAULT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(60) DEFAULT NULL,
  `config` text,
  `filter` varchar(64) DEFAULT NULL,
  `root` varchar(32) DEFAULT NULL,
  `path` varchar(80) NOT NULL DEFAULT '/',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_queue`
--

INSERT INTO `ost_queue` (`id`, `parent_id`, `columns_id`, `sort_id`, `flags`, `staff_id`, `sort`, `title`, `config`, `filter`, `root`, `path`, `created`, `updated`) VALUES
(1, 0, NULL, 1, 3, 0, 1, 'Open', '[[\"status__state\",\"includes\",{\"open\":\"Open\"}]]', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(2, 1, NULL, 4, 43, 0, 1, 'Open', '{\"criteria\":[[\"isanswered\",\"nset\",null]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(3, 1, NULL, 4, 43, 0, 2, 'Answered', '{\"criteria\":[[\"isanswered\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(4, 1, NULL, 4, 43, 0, 3, 'Overdue', '{\"criteria\":[[\"isoverdue\",\"set\",null]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(5, 0, NULL, 3, 3, 0, 3, 'My Tickets', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\",\"T\":\"One of my teams\"}],[\"status__state\",\"includes\",{\"open\":\"Open\"}]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(6, 5, NULL, NULL, 43, 0, 1, 'Assigned to Me', '{\"criteria\":[[\"assignee\",\"includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(7, 5, NULL, NULL, 43, 0, 2, 'Assigned to Teams', '{\"criteria\":[[\"assignee\",\"!includes\",{\"M\":\"Me\"}]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(8, 0, NULL, 5, 3, 0, 4, 'Closed', '{\"criteria\":[[\"status__state\",\"includes\",{\"closed\":\"Closed\"}]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(9, 8, NULL, 5, 43, 0, 1, 'Today', '{\"criteria\":[[\"closed\",\"period\",\"td\"]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(10, 8, NULL, 5, 43, 0, 2, 'Yesterday', '{\"criteria\":[[\"closed\",\"period\",\"yd\"]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(11, 8, NULL, 5, 43, 0, 3, 'This Week', '{\"criteria\":[[\"closed\",\"period\",\"tw\"]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(12, 8, NULL, 5, 43, 0, 4, 'This Month', '{\"criteria\":[[\"closed\",\"period\",\"tm\"]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(13, 8, NULL, 6, 43, 0, 5, 'This Quarter', '{\"criteria\":[[\"closed\",\"period\",\"tq\"]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(14, 8, NULL, 7, 43, 0, 6, 'This Year', '{\"criteria\":[[\"closed\",\"period\",\"ty\"]],\"conditions\":[]}', NULL, 'T', '/', '2024-12-20 04:53:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_column`
--

DROP TABLE IF EXISTS `ost_queue_column`;
CREATE TABLE IF NOT EXISTS `ost_queue_column` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `primary` varchar(64) NOT NULL DEFAULT '',
  `secondary` varchar(64) DEFAULT NULL,
  `filter` varchar(32) DEFAULT NULL,
  `truncate` varchar(16) DEFAULT NULL,
  `annotations` text,
  `conditions` text,
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_queue_column`
--

INSERT INTO `ost_queue_column` (`id`, `flags`, `name`, `primary`, `secondary`, `filter`, `truncate`, `annotations`, `conditions`, `extra`) VALUES
(1, 0, 'Ticket #', 'number', NULL, 'link:ticketP', 'wrap', '[{\"c\":\"TicketSourceDecoration\",\"p\":\"b\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(2, 0, 'Date Created', 'created', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(3, 0, 'Subject', 'cdata__subject', NULL, 'link:ticket', 'ellipsis', '[{\"c\":\"TicketThreadCount\",\"p\":\">\"},{\"c\":\"ThreadAttachmentCount\",\"p\":\"a\"},{\"c\":\"OverdueFlagDecoration\",\"p\":\"<\"},{\"c\":\"LockDecoration\",\"p\":\"<\"}]', '[{\"crit\":[\"isanswered\",\"nset\",null],\"prop\":{\"font-weight\":\"bold\"}}]', NULL),
(4, 0, 'User Name', 'user__name', NULL, NULL, 'wrap', '[{\"c\":\"ThreadCollaboratorCount\",\"p\":\">\"}]', '[]', NULL),
(5, 0, 'Priority', 'cdata__priority', NULL, NULL, 'wrap', '[]', '[]', NULL),
(6, 0, 'Status', 'status__id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(7, 0, 'Close Date', 'closed', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(8, 0, 'Assignee', 'assignee', NULL, NULL, 'wrap', '[]', '[]', NULL),
(9, 0, 'Due Date', 'duedate', 'est_duedate', 'date:human', 'wrap', '[]', '[]', NULL),
(10, 0, 'Last Updated', 'lastupdate', NULL, 'date:full', 'wrap', '[]', '[]', NULL),
(11, 0, 'Department', 'dept_id', NULL, NULL, 'wrap', '[]', '[]', NULL),
(12, 0, 'Last Message', 'thread__lastmessage', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(13, 0, 'Last Response', 'thread__lastresponse', NULL, 'date:human', 'wrap', '[]', '[]', NULL),
(14, 0, 'Team', 'team_id', NULL, NULL, 'wrap', '[]', '[]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_columns`
--

DROP TABLE IF EXISTS `ost_queue_columns`;
CREATE TABLE IF NOT EXISTS `ost_queue_columns` (
  `queue_id` int UNSIGNED NOT NULL,
  `column_id` int UNSIGNED NOT NULL,
  `staff_id` int UNSIGNED NOT NULL,
  `bits` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '1',
  `heading` varchar(64) DEFAULT NULL,
  `width` int UNSIGNED NOT NULL DEFAULT '100',
  PRIMARY KEY (`queue_id`,`column_id`,`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_queue_columns`
--

INSERT INTO `ost_queue_columns` (`queue_id`, `column_id`, `staff_id`, `bits`, `sort`, `heading`, `width`) VALUES
(1, 1, 0, 1, 1, 'Ticket', 100),
(1, 10, 0, 1, 2, 'Last Updated', 150),
(1, 3, 0, 1, 3, 'Subject', 300),
(1, 4, 0, 1, 4, 'From', 185),
(1, 5, 0, 1, 5, 'Priority', 85),
(1, 8, 0, 1, 6, 'Assigned To', 160),
(2, 1, 0, 1, 1, 'Ticket', 100),
(2, 10, 0, 1, 2, 'Last Updated', 150),
(2, 3, 0, 1, 3, 'Subject', 300),
(2, 4, 0, 1, 4, 'From', 185),
(2, 5, 0, 1, 5, 'Priority', 85),
(2, 8, 0, 1, 6, 'Assigned To', 160),
(3, 1, 0, 1, 1, 'Ticket', 100),
(3, 10, 0, 1, 2, 'Last Updated', 150),
(3, 3, 0, 1, 3, 'Subject', 300),
(3, 4, 0, 1, 4, 'From', 185),
(3, 5, 0, 1, 5, 'Priority', 85),
(3, 8, 0, 1, 6, 'Assigned To', 160),
(4, 1, 0, 1, 1, 'Ticket', 100),
(4, 9, 0, 1, 9, 'Due Date', 150),
(4, 3, 0, 1, 3, 'Subject', 300),
(4, 4, 0, 1, 4, 'From', 185),
(4, 5, 0, 1, 5, 'Priority', 85),
(4, 8, 0, 1, 6, 'Assigned To', 160),
(5, 1, 0, 1, 1, 'Ticket', 100),
(5, 10, 0, 1, 2, 'Last Update', 150),
(5, 3, 0, 1, 3, 'Subject', 300),
(5, 4, 0, 1, 4, 'From', 185),
(5, 5, 0, 1, 5, 'Priority', 85),
(5, 11, 0, 1, 6, 'Department', 160),
(6, 1, 0, 1, 1, 'Ticket', 100),
(6, 10, 0, 1, 2, 'Last Update', 150),
(6, 3, 0, 1, 3, 'Subject', 300),
(6, 4, 0, 1, 4, 'From', 185),
(6, 5, 0, 1, 5, 'Priority', 85),
(6, 11, 0, 1, 6, 'Department', 160),
(7, 1, 0, 1, 1, 'Ticket', 100),
(7, 10, 0, 1, 2, 'Last Update', 150),
(7, 3, 0, 1, 3, 'Subject', 300),
(7, 4, 0, 1, 4, 'From', 185),
(7, 5, 0, 1, 5, 'Priority', 85),
(7, 14, 0, 1, 6, 'Team', 160),
(8, 1, 0, 1, 1, 'Ticket', 100),
(8, 7, 0, 1, 2, 'Date Closed', 150),
(8, 3, 0, 1, 3, 'Subject', 300),
(8, 4, 0, 1, 4, 'From', 185),
(8, 8, 0, 1, 6, 'Closed By', 160),
(9, 1, 0, 1, 1, 'Ticket', 100),
(9, 7, 0, 1, 2, 'Date Closed', 150),
(9, 3, 0, 1, 3, 'Subject', 300),
(9, 4, 0, 1, 4, 'From', 185),
(9, 8, 0, 1, 6, 'Closed By', 160),
(10, 1, 0, 1, 1, 'Ticket', 100),
(10, 7, 0, 1, 2, 'Date Closed', 150),
(10, 3, 0, 1, 3, 'Subject', 300),
(10, 4, 0, 1, 4, 'From', 185),
(10, 8, 0, 1, 6, 'Closed By', 160),
(11, 1, 0, 1, 1, 'Ticket', 100),
(11, 7, 0, 1, 2, 'Date Closed', 150),
(11, 3, 0, 1, 3, 'Subject', 300),
(11, 4, 0, 1, 4, 'From', 185),
(11, 8, 0, 1, 6, 'Closed By', 160),
(12, 1, 0, 1, 1, 'Ticket', 100),
(12, 7, 0, 1, 2, 'Date Closed', 150),
(12, 3, 0, 1, 3, 'Subject', 300),
(12, 4, 0, 1, 4, 'From', 185),
(12, 8, 0, 1, 6, 'Closed By', 160),
(13, 1, 0, 1, 1, 'Ticket', 100),
(13, 7, 0, 1, 2, 'Date Closed', 150),
(13, 3, 0, 1, 3, 'Subject', 300),
(13, 4, 0, 1, 4, 'From', 185),
(13, 8, 0, 1, 6, 'Closed By', 160),
(14, 1, 0, 1, 1, 'Ticket', 100),
(14, 7, 0, 1, 2, 'Date Closed', 150),
(14, 3, 0, 1, 3, 'Subject', 300),
(14, 4, 0, 1, 4, 'From', 185),
(14, 8, 0, 1, 6, 'Closed By', 160);

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_config`
--

DROP TABLE IF EXISTS `ost_queue_config`;
CREATE TABLE IF NOT EXISTS `ost_queue_config` (
  `queue_id` int UNSIGNED NOT NULL,
  `staff_id` int UNSIGNED NOT NULL,
  `setting` text,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`queue_id`,`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_export`
--

DROP TABLE IF EXISTS `ost_queue_export`;
CREATE TABLE IF NOT EXISTS `ost_queue_export` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue_id` int UNSIGNED NOT NULL,
  `path` varchar(64) NOT NULL DEFAULT '',
  `heading` varchar(64) DEFAULT NULL,
  `sort` int UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `queue_id` (`queue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_sort`
--

DROP TABLE IF EXISTS `ost_queue_sort`;
CREATE TABLE IF NOT EXISTS `ost_queue_sort` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `root` varchar(32) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `columns` text,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_queue_sort`
--

INSERT INTO `ost_queue_sort` (`id`, `root`, `name`, `columns`, `updated`) VALUES
(1, NULL, 'Priority + Most Recently Updated', '[\"-cdata__priority\",\"-lastupdate\"]', '2024-12-20 04:53:00'),
(2, NULL, 'Priority + Most Recently Created', '[\"-cdata__priority\",\"-created\"]', '2024-12-20 04:53:00'),
(3, NULL, 'Priority + Due Date', '[\"-cdata__priority\",\"-est_duedate\"]', '2024-12-20 04:53:00'),
(4, NULL, 'Due Date', '[\"-est_duedate\"]', '2024-12-20 04:53:00'),
(5, NULL, 'Closed Date', '[\"-closed\"]', '2024-12-20 04:53:00'),
(6, NULL, 'Create Date', '[\"-created\"]', '2024-12-20 04:53:00'),
(7, NULL, 'Update Date', '[\"-lastupdate\"]', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_queue_sorts`
--

DROP TABLE IF EXISTS `ost_queue_sorts`;
CREATE TABLE IF NOT EXISTS `ost_queue_sorts` (
  `queue_id` int UNSIGNED NOT NULL,
  `sort_id` int UNSIGNED NOT NULL,
  `bits` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`queue_id`,`sort_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_queue_sorts`
--

INSERT INTO `ost_queue_sorts` (`queue_id`, `sort_id`, `bits`, `sort`) VALUES
(1, 1, 0, 0),
(1, 2, 0, 0),
(1, 3, 0, 0),
(1, 4, 0, 0),
(1, 6, 0, 0),
(1, 7, 0, 0),
(5, 1, 0, 0),
(5, 2, 0, 0),
(5, 3, 0, 0),
(5, 4, 0, 0),
(5, 6, 0, 0),
(5, 7, 0, 0),
(6, 1, 0, 0),
(6, 2, 0, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(7, 1, 0, 0),
(7, 2, 0, 0),
(7, 3, 0, 0),
(7, 4, 0, 0),
(7, 6, 0, 0),
(7, 7, 0, 0),
(8, 5, 0, 0),
(8, 1, 0, 0),
(8, 2, 0, 0),
(8, 3, 0, 0),
(8, 4, 0, 0),
(8, 6, 0, 0),
(8, 7, 0, 0),
(9, 5, 0, 0),
(9, 1, 0, 0),
(9, 2, 0, 0),
(9, 3, 0, 0),
(9, 4, 0, 0),
(9, 6, 0, 0),
(9, 7, 0, 0),
(10, 5, 0, 0),
(10, 1, 0, 0),
(10, 2, 0, 0),
(10, 3, 0, 0),
(10, 4, 0, 0),
(10, 6, 0, 0),
(10, 7, 0, 0),
(11, 5, 0, 0),
(11, 1, 0, 0),
(11, 2, 0, 0),
(11, 3, 0, 0),
(11, 4, 0, 0),
(11, 6, 0, 0),
(11, 7, 0, 0),
(12, 5, 0, 0),
(12, 1, 0, 0),
(12, 2, 0, 0),
(12, 3, 0, 0),
(12, 4, 0, 0),
(12, 6, 0, 0),
(12, 7, 0, 0),
(13, 5, 0, 0),
(13, 1, 0, 0),
(13, 2, 0, 0),
(13, 3, 0, 0),
(13, 4, 0, 0),
(13, 6, 0, 0),
(13, 7, 0, 0),
(14, 5, 0, 0),
(14, 1, 0, 0),
(14, 2, 0, 0),
(14, 3, 0, 0),
(14, 4, 0, 0),
(14, 6, 0, 0),
(14, 7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ost_role`
--

DROP TABLE IF EXISTS `ost_role`;
CREATE TABLE IF NOT EXISTS `ost_role` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `flags` int UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(64) DEFAULT NULL,
  `permissions` text,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_role`
--

INSERT INTO `ost_role` (`id`, `flags`, `name`, `permissions`, `notes`, `created`, `updated`) VALUES
(1, 1, 'All Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.delete\":1,\"ticket.edit\":1,\"thread.edit\":1,\"ticket.link\":1,\"ticket.markanswered\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.delete\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with unlimited access', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(2, 1, 'Expanded Access', '{\"ticket.assign\":1,\"ticket.close\":1,\"ticket.create\":1,\"ticket.edit\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.reply\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.close\":1,\"task.create\":1,\"task.edit\":1,\"task.reply\":1,\"task.transfer\":1,\"canned.manage\":1}', 'Role with expanded access', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(3, 1, 'Limited Access', '{\"ticket.assign\":1,\"ticket.create\":1,\"ticket.link\":1,\"ticket.merge\":1,\"ticket.refer\":1,\"ticket.release\":1,\"ticket.transfer\":1,\"task.assign\":1,\"task.reply\":1,\"task.transfer\":1}', 'Role with limited access', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(4, 1, 'View only', NULL, 'Simple role with no permissions', '2024-12-20 04:53:00', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_schedule`
--

DROP TABLE IF EXISTS `ost_schedule`;
CREATE TABLE IF NOT EXISTS `ost_schedule` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_schedule`
--

INSERT INTO `ost_schedule` (`id`, `flags`, `name`, `timezone`, `description`, `created`, `updated`) VALUES
(1, 1, 'Monday - Friday 8am - 5pm with U.S. Holidays', NULL, '', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(2, 1, '24/7', NULL, '', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(3, 1, '24/5', NULL, '', '2024-12-20 04:53:00', '2024-12-20 04:53:00'),
(4, 0, 'U.S. Holidays', NULL, '', '2024-12-20 04:53:00', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_schedule_entry`
--

DROP TABLE IF EXISTS `ost_schedule_entry`;
CREATE TABLE IF NOT EXISTS `ost_schedule_entry` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `schedule_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `repeats` varchar(16) NOT NULL DEFAULT 'never',
  `starts_on` date DEFAULT NULL,
  `starts_at` time DEFAULT NULL,
  `ends_on` date DEFAULT NULL,
  `ends_at` time DEFAULT NULL,
  `stops_on` datetime DEFAULT NULL,
  `day` tinyint DEFAULT NULL,
  `week` tinyint DEFAULT NULL,
  `month` tinyint DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `repeats` (`repeats`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_schedule_entry`
--

INSERT INTO `ost_schedule_entry` (`id`, `schedule_id`, `flags`, `sort`, `name`, `repeats`, `starts_on`, `starts_at`, `ends_on`, `ends_at`, `stops_on`, `day`, `week`, `month`, `created`, `updated`) VALUES
(1, 1, 0, 0, 'Monday', 'weekly', '2019-01-07', '08:00:00', '2019-01-07', '17:00:00', NULL, 1, NULL, NULL, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(2, 1, 0, 0, 'Tuesday', 'weekly', '2019-01-08', '08:00:00', '2019-01-08', '17:00:00', NULL, 2, NULL, NULL, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(3, 1, 0, 0, 'Wednesday', 'weekly', '2019-01-09', '08:00:00', '2019-01-09', '17:00:00', NULL, 3, NULL, NULL, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(4, 1, 0, 0, 'Thursday', 'weekly', '2019-01-10', '08:00:00', '2019-01-10', '17:00:00', NULL, 4, NULL, NULL, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(5, 1, 0, 0, 'Friday', 'weekly', '2019-01-11', '08:00:00', '2019-01-11', '17:00:00', NULL, 5, NULL, NULL, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(6, 2, 0, 0, 'Daily', 'daily', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(7, 3, 0, 0, 'Weekdays', 'weekdays', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(8, 4, 0, 0, 'New Year\'s Day', 'yearly', '2019-01-01', '00:00:00', '2019-01-01', '23:59:59', NULL, 1, NULL, 1, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(9, 4, 0, 0, 'MLK Day', 'yearly', '2019-01-21', '00:00:00', '2019-01-21', '23:59:59', NULL, 1, 3, 1, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(10, 4, 0, 0, 'Memorial Day', 'yearly', '2019-05-27', '00:00:00', '2019-05-27', '23:59:59', NULL, 1, -1, 5, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(11, 4, 0, 0, 'Independence Day (4th of July)', 'yearly', '2019-07-04', '00:00:00', '2019-07-04', '23:59:59', NULL, 4, NULL, 7, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(12, 4, 0, 0, 'Labor Day', 'yearly', '2019-09-02', '00:00:00', '2019-09-02', '23:59:59', NULL, 1, 1, 9, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(13, 4, 0, 0, 'Indigenous Peoples\' Day (Whodat Columbus)', 'yearly', '2019-10-14', '00:00:00', '2019-10-14', '23:59:59', NULL, 1, 2, 10, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(14, 4, 0, 0, 'Veterans Day', 'yearly', '2019-11-11', '00:00:00', '2019-11-11', '23:59:59', NULL, 11, NULL, 11, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(15, 4, 0, 0, 'Thanksgiving Day', 'yearly', '2019-11-28', '00:00:00', '2019-11-28', '23:59:59', NULL, 4, 4, 11, '0000-00-00 00:00:00', '2024-12-20 04:53:00'),
(16, 4, 0, 0, 'Christmas Day', 'yearly', '2019-11-25', '00:00:00', '2019-11-25', '23:59:59', NULL, 25, NULL, 12, '0000-00-00 00:00:00', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sequence`
--

DROP TABLE IF EXISTS `ost_sequence`;
CREATE TABLE IF NOT EXISTS `ost_sequence` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `flags` int UNSIGNED DEFAULT NULL,
  `next` bigint UNSIGNED NOT NULL DEFAULT '1',
  `increment` int DEFAULT '1',
  `padding` char(1) DEFAULT '0',
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_sequence`
--

INSERT INTO `ost_sequence` (`id`, `name`, `flags`, `next`, `increment`, `padding`, `updated`) VALUES
(1, 'General Tickets', 1, 1, 1, '0', '0000-00-00 00:00:00'),
(2, 'Tasks Sequence', 1, 1, 1, '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_session`
--

DROP TABLE IF EXISTS `ost_session`;
CREATE TABLE IF NOT EXISTS `ost_session` (
  `session_id` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `updated` (`session_updated`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `ost_session`
--

INSERT INTO `ost_session` (`session_id`, `session_data`, `session_expire`, `session_updated`, `user_id`, `user_ip`, `user_agent`) VALUES
('c0gciohvajpp0eq7l8qp9sg0l4', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238633437626439663636373431656137316364376466396565363538373133633462326137333236223b733a343a2274696d65223b693a313733343635323438323b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32343a222f6f735f7469636b65742f7363702f61646d696e2e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31323a226c6f63616c3a7361726d6164223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2232346336626664326361316337636263333263366431653934313063663762623a313733343635323437393a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313733343635323438393b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31323a22417369612f4b617261636869223b7d6c61737463726f6e63616c6c7c693a313733343635323438323b5454447c693a313733343635323634333b, '2024-12-20 04:57:23', '2024-12-20 04:55:23', '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('o2ogs9hest9qqcvcb6ka2v62p4', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238633437626439663636373431656137316364376466396565363538373133633462326137333236223b733a343a2274696d65223b693a313733343635323438323b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32343a222f6f735f7469636b65742f7363702f61646d696e2e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31323a226c6f63616c3a7361726d6164223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2232346336626664326361316337636263333263366431653934313063663762623a313733343635323437393a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313733343635343332333b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31323a22417369612f4b617261636869223b7d6c61737463726f6e63616c6c7c693a313733343635323438323b, '2024-12-20 04:57:23', '2024-12-20 04:55:23', '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('36negv1qknh14l3li82a00m1kt', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238633437626439663636373431656137316364376466396565363538373133633462326137333236223b733a343a2274696d65223b693a313733343635343038373b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32343a222f6f735f7469636b65742f7363702f61646d696e2e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31323a226c6f63616c3a7361726d6164223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2265323465306437636635326431333134666166623266643636376133313366383a313733343635343037383a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313733343635343332333b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31323a22417369612f4b617261636869223b7d6c61737463726f6e63616c6c7c693a313733343635343037393b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032342d31322d32302030343a35333a3030223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e745572766d3474566d7a64427563625f635153786556364f417044674c5f595a223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a323b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313733343635343037393b7d7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d693a323b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a333a7b693a303b693a313b693a313b693a323b693a323b693a333b7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d3a513a75736572737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d5454447c693a313733343635343634343b, '2024-12-20 05:30:44', '2024-12-20 05:28:44', '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('52h8t3ljqu5a30j7alb5desnl8', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2230636131383733373963643162663536313363656565326437623339353166393964393933346335223b733a343a2274696d65223b693a313733343635333438323b7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31323a22417369612f4b617261636869223b7d, '2024-12-21 05:10:25', '2024-12-20 05:11:22', '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('0uegbmc1jnatjsh3fce0omfd5p', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237363733313333636638626365373064323736353462653631373964623030633265373666303566223b733a343a2274696d65223b693a313733343635333636323b7d5f617574687c613a323a7b733a343a2275736572223b613a323a7b733a373a22737472696b6573223b693a353b733a31303a226c617374737472696b65223b693a313733343635333633343b7d733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a31303a226c6f63616c3a72617a61223b733a333a22326661223b4e3b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f735f7469636b65742f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2230616662353133343638633736383332616538306130636232393162396334633a313733343635333635393a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313733343635333636393b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032342d31322d32302030343a35333a3030223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31323a22417369612f4b617261636869223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e745572766d3474566d7a64427563625f635153786556364f417044674c5f595a223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a303b733a323a227132223b643a303b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313733343635333636303b7d7d6c61737463726f6e63616c6c7c693a313733343635333636303b5454447c693a313733343635333838343b, '2024-12-20 05:18:04', '2024-12-20 05:16:04', '2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0'),
('hqkbu4f58e973tdkappkfa6ls0', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2237363733313333636638626365373064323736353462653631373964623030633265373666303566223b733a343a2274696d65223b693a313733343635333736383b7d5f617574687c613a323a7b733a343a2275736572223b613a323a7b733a373a22737472696b6573223b693a353b733a31303a226c617374737472696b65223b693a313733343635333633343b7d733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a31303a226c6f63616c3a72617a61223b733a333a22326661223b4e3b7d7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f735f7469636b65742f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2236366237376439653365653366363932396461623265353937336362363031373a313733343635333736343a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313733343635353536343b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032342d31322d32302030343a35333a3030223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31323a22417369612f4b617261636869223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e745572766d3474566d7a64427563625f635153786556364f417044674c5f595a223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a303b733a323a227132223b643a303b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313733343635333636303b7d7d6c61737463726f6e63616c6c7c693a313733343635333636303b, '2024-12-20 05:46:04', '2024-12-20 05:16:08', '2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0'),
('6e9u4b4ms918lu8r0c787le789', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238633437626439663636373431656137316364376466396565363538373133633462326137333236223b733a343a2274696d65223b693a313733343635363938313b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32343a222f6f735f7469636b65742f7363702f61646d696e2e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31323a226c6f63616c3a7361726d6164223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2234623339623033363131393831383066646136313164336337633964336364623a313733343635363938313a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313733343635363332343b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31323a22417369612f4b617261636869223b7d6c61737463726f6e63616c6c7c693a313733343635353635383b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032342d31322d32302030343a35333a3030223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e745572766d3474566d7a64427563625f635153786556364f417044674c5f595a223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a323b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313733343635353437363b7d7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d693a323b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a333a7b693a303b693a313b693a313b693a323b693a323b693a333b7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d3a513a75736572737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d3a513a6f7267737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a31323a224f7267616e697a6174696f6e223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a343a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31303a22757365725f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31303a22757365725f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a353a227573657273223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d5454447c693a313733343635373130323b, '2024-12-20 06:11:42', '2024-12-20 06:09:42', '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('c61qksipulecvt2cnekj82tre9', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2239646538333463393961373738613063346438663838623538346135383134316132636536303366223b733a343a2274696d65223b693a313733343635353736353b7d5f617574687c613a323a7b733a343a2275736572223b4e3b733a353a227374616666223b4e3b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f735f7469636b65742f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d, '2024-12-21 05:44:19', '2024-12-20 05:49:25', '0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('n9cetsta63hkk7epsigt3rdtln', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2238633437626439663636373431656137316364376466396565363538373133633462326137333236223b733a343a2274696d65223b693a313733343635373632333b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a32343a222f6f735f7469636b65742f7363702f61646d696e2e706870223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a313b733a333a226b6579223b733a31323a226c6f63616c3a7361726d6164223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2237386234623731356361353264663838323633663361613833396637663436333a313733343635373538333a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313733343635383738323b6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31323a22417369612f4b617261636869223b7d6c61737463726f6e63616c6c7c693a313733343635373538343b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032342d31322d32302030343a35333a3030223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e312e745572766d3474566d7a64427563625f635153786556364f417044674c5f595a223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a323b733a323a227132223b643a323b733a323a227136223b643a303b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a303b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313733343635373439343b7d7d3a3a513a417c733a303a22223b3a51413a3a736f72747c613a323a7b693a303b733a373a2263726561746564223b693a313b693a303b7d3a513a7461736b737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a225461736b223b733a31313a22636f6e73747261696e7473223b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31333a22666c6167735f5f686173626974223b693a313b7d7d7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a323b693a323b613a333a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31333a22666c6167735f5f686173626974223b693a313b733a383a2273746166665f6964223b693a313b7d7d693a313b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a323a7b733a31363a227469636b65745f5f73746166665f6964223b693a313b733a32313a227469636b65745f5f7374617475735f5f7374617465223b733a343a226f70656e223b7d7d693a323b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a31313a22646570745f69645f5f696e223b613a333a7b693a303b693a313b693a313b693a323b693a323b693a333b7d7d7d7d7d7d7d7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a383a222d63726561746564223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a31333a7b733a323a226964223b733a323a226964223b733a363a226e756d626572223b733a363a226e756d626572223b733a373a2263726561746564223b733a373a2263726561746564223b733a383a2273746166665f6964223b733a383a2273746166665f6964223b733a373a227465616d5f6964223b733a373a227465616d5f6964223b733a31363a2273746166665f5f66697273746e616d65223b733a31363a2273746166665f5f66697273746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31353a2273746166665f5f6c6173746e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a227465616d5f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31303a22646570745f5f6e616d65223b733a31323a2263646174615f5f7469746c65223b733a31323a2263646174615f5f7469746c65223b733a353a22666c616773223b733a353a22666c616773223b733a31343a227469636b65745f5f6e756d626572223b733a31343a227469636b65745f5f6e756d626572223b733a31373a227469636b65745f5f7469636b65745f6964223b733a31373a227469636b65745f5f7469636b65745f6964223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a333a7b733a31323a22636f6c6c61625f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a22636f6c6c61625f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a32313a227468726561645f5f636f6c6c61626f7261746f7273223b733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31363a226174746163686d656e745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31363a226174746163686d656e745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a33363a227468726561645f5f656e74726965735f5f6174746163686d656e74735f5f696e6c696e65223b7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a32383a227468726561645f5f656e74726965735f5f6174746163686d656e7473223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d733a31323a227468726561645f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227468726561645f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b4f3a373a2253716c43617365223a353a7b733a353a22616c696173223b4e3b733a353a226361736573223b613a313a7b693a303b613a323a7b693a303b4f3a313a2251223a333a7b693a303b693a303b693a313b693a303b693a323b613a313a7b733a33303a227468726561645f5f656e74726965735f5f666c6167735f5f686173626974223b693a343b7d7d693a313b4e3b7d7d733a343a22656c7365223b4f3a383a2253716c4669656c64223a353a7b733a353a22616c696173223b4e3b733a383a226f70657261746f72223b4e3b733a383a226f706572616e6473223b4e3b733a353a226c6576656c223b693a303b733a353a226669656c64223b733a31393a227468726561645f5f656e74726965735f5f6964223b7d733a343a2266756e63223b733a343a2243415345223b733a343a2261726773223b613a303a7b7d7d733a383a2264697374696e6374223b623a313b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d3a513a75736572737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a343a2255736572223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a373a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a32323a2264656661756c745f656d61696c5f5f61646472657373223b733a31313a226163636f756e745f5f6964223b733a31313a226163636f756e745f5f6964223b733a31353a226163636f756e745f5f737461747573223b733a31353a226163636f756e745f5f737461747573223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31323a227469636b65745f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31323a227469636b65745f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a373a227469636b657473223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d3a513a6f7267737c4f3a383a225175657279536574223a31363a7b733a353a226d6f64656c223b733a31323a224f7267616e697a6174696f6e223b733a31313a22636f6e73747261696e7473223b613a303a7b7d733a31363a22706174685f636f6e73747261696e7473223b613a303a7b7d733a383a226f72646572696e67223b613a313a7b693a303b733a343a226e616d65223b7d733a373a2272656c61746564223b623a303b733a363a2276616c756573223b613a343a7b733a323a226964223b733a323a226964223b733a343a226e616d65223b733a343a226e616d65223b733a373a2263726561746564223b733a373a2263726561746564223b733a373a2275706461746564223b733a373a2275706461746564223b7d733a353a226465666572223b613a303a7b7d733a31303a2261676772656761746564223b623a303b733a31313a22616e6e6f746174696f6e73223b613a313a7b733a31303a22757365725f636f756e74223b4f3a31323a2253716c416767726567617465223a353a7b733a353a22616c696173223b733a31303a22757365725f636f756e74223b733a343a2266756e63223b733a353a22434f554e54223b733a343a2265787072223b733a353a227573657273223b733a383a2264697374696e6374223b623a303b733a31303a22636f6e73747261696e74223b623a303b7d7d733a353a226578747261223b613a303a7b7d733a383a2264697374696e6374223b613a303a7b7d733a343a226c6f636b223b623a303b733a353a22636861696e223b613a303a7b7d733a373a226f7074696f6e73223b613a303a7b7d733a343a2269746572223b693a323b733a383a22636f6d70696c6572223b733a31333a224d7953716c436f6d70696c6572223b7d, '2024-12-20 06:49:43', '2024-12-20 06:20:25', '1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'),
('i63t74q424n5pvhnsp1lfl6uv0', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266336339373161653264626339333532323761666564376563626161636166373761363538383234223b733a343a2274696d65223b693a313733343635373631343b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f735f7469636b65742f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a31303a226c6f63616c3a72617a61223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2263623135353337653739363139623864663136383463323363653032343934383a313733343635373631333a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313733343635373632333b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032342d31322d32302030343a35333a3030223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31323a22417369612f4b617261636869223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e745572766d3474566d7a64427563625f635153786556364f417044674c5f595a223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313733343635373631343b7d7d6c61737463726f6e63616c6c7c693a313733343635373631343b5454447c693a313733343635373734383b, '2024-12-20 06:22:28', '2024-12-20 06:20:28', '2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0'),
('ias8uaam18r0b7j27mmd8giooq', 0x637372667c613a323a7b733a353a22746f6b656e223b733a34303a2266336339373161653264626339333532323761666564376563626161636166373761363538383234223b733a343a2274696d65223b693a313733343635373632393b7d5f73746166667c613a313a7b733a343a2261757468223b613a323a7b733a343a2264657374223b733a31353a222f6f735f7469636b65742f7363702f223b733a333a226d7367223b733a32333a2241757468656e7469636174696f6e205265717569726564223b7d7d5f617574687c613a313a7b733a353a227374616666223b613a333a7b733a323a226964223b693a323b733a333a226b6579223b733a31303a226c6f63616c3a72617a61223b733a333a22326661223b4e3b7d7d3a746f6b656e7c613a313a7b733a353a227374616666223b733a37363a2263623135353337653739363139623864663136383463323363653032343934383a313733343635373631333a3833376563353735346635303363666161656530393239666434383937346537223b7d54494d455f424f4d427c693a313733343635393432383b3a3a513a547c693a313b736f72747c613a313a7b693a313b613a323a7b733a393a227175657565736f7274223b4f3a393a225175657565536f7274223a373a7b733a323a226874223b613a353a7b733a323a226964223b693a313b733a343a22726f6f74223b4e3b733a343a226e616d65223b733a33323a225072696f72697479202b204d6f737420526563656e746c792055706461746564223b733a373a22636f6c756d6e73223b733a33343a225b222d63646174615f5f7072696f72697479222c222d6c617374757064617465225d223b733a373a2275706461746564223b733a31393a22323032342d31322d32302030343a35333a3030223b7d733a353a226469727479223b613a303a7b7d733a373a225f5f6e65775f5f223b623a303b733a31313a225f5f64656c657465645f5f223b623a303b733a31323a225f5f64656665727265645f5f223b613a303a7b7d733a383a225f636f6c756d6e73223b613a323a7b733a31353a2263646174615f5f7072696f72697479223b623a313b733a31303a226c617374757064617465223b623a313b7d733a363a225f6578747261223b4e3b7d733a333a22646972223b693a303b7d7d6366673a636f72657c613a313a7b733a31313a2264625f74696d657a6f6e65223b733a31323a22417369612f4b617261636869223b7d71636f756e74737c613a313a7b733a34383a22636f756e74732e7175657565732e322e745572766d3474566d7a64427563625f635153786556364f417044674c5f595a223b613a323a7b733a363a22636f756e7473223b613a31343a7b733a323a227131223b643a313b733a323a227132223b643a313b733a323a227136223b643a313b733a323a227139223b643a303b733a323a227133223b643a303b733a323a227137223b643a303b733a333a22713130223b643a303b733a323a227134223b643a303b733a323a227135223b643a313b733a333a22713131223b643a303b733a323a227138223b643a303b733a333a22713132223b643a303b733a333a22713133223b643a303b733a333a22713134223b643a303b7d733a343a2274696d65223b693a313733343635373631343b7d7d6c61737463726f6e63616c6c7c693a313733343635373631343b, '2024-12-20 06:50:28', '2024-12-20 06:20:29', '2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `ost_sla`
--

DROP TABLE IF EXISTS `ost_sla`;
CREATE TABLE IF NOT EXISTS `ost_sla` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `schedule_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '3',
  `grace_period` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_sla`
--

INSERT INTO `ost_sla` (`id`, `schedule_id`, `flags`, `grace_period`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 3, 18, 'Default SLA', NULL, '2024-12-20 04:52:59', '2024-12-20 04:52:59');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff`
--

DROP TABLE IF EXISTS `ost_staff`;
CREATE TABLE IF NOT EXISTS `ost_staff` (
  `staff_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `onvacation` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `assigned_only` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `change_passwd` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `max_page_size` int UNSIGNED NOT NULL DEFAULT '0',
  `auto_refresh_rate` int UNSIGNED NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `extra` text,
  `permissions` text,
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  KEY `dept_id` (`dept_id`),
  KEY `issuperuser` (`isadmin`),
  KEY `isactive` (`isactive`),
  KEY `onvacation` (`onvacation`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_staff`
--

INSERT INTO `ost_staff` (`staff_id`, `dept_id`, `role_id`, `username`, `firstname`, `lastname`, `passwd`, `backend`, `email`, `phone`, `phone_ext`, `mobile`, `signature`, `lang`, `timezone`, `locale`, `notes`, `isactive`, `isadmin`, `isvisible`, `onvacation`, `assigned_only`, `show_assigned_tickets`, `change_passwd`, `max_page_size`, `auto_refresh_rate`, `default_signature_type`, `default_paper_size`, `extra`, `permissions`, `created`, `lastlogin`, `passwdreset`, `updated`) VALUES
(1, 1, 1, 'sarmad', 'Sarmad', 'Soomro', '$2a$08$NssAOysYJKU7PfnQQTvGSuhpxv8lrYU6y/EMdBBDzVu2GUl4HbJrG', NULL, 'sarmad.dts@gmail.com', '', NULL, '', '', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 25, 0, 'none', 'Letter', '{\"browser_lang\":\"en_US\"}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"emails.banlist\":1,\"visibility.departments\":1}', '2024-12-20 04:53:01', '2024-12-20 04:54:39', '2024-12-20 04:53:01', '2024-12-20 04:54:39'),
(2, 2, 4, 'raza', 'raza', 'ali', '$2a$08$sMMqmB3WTc6yY9gO.sGM4eNir7PakX.C.x1vXMZCqqp38KIRdtc..', '', 'raza_ali@gmail.com', '(123) 456-7678', '0000', '00000000', '', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, 0, 0, 0, 'none', 'Letter', '{\"def_assn_role\":true,\"browser_lang\":\"en_US\"}', '{\"user.create\":1,\"user.delete\":1,\"user.edit\":1,\"user.manage\":1,\"user.dir\":1,\"org.create\":1,\"org.delete\":1,\"org.edit\":1,\"faq.manage\":1,\"visibility.agents\":1,\"visibility.departments\":1}', '2024-12-20 05:10:17', '2024-12-20 06:20:13', '2024-12-20 05:13:38', '2024-12-20 06:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `ost_staff_dept_access`
--

DROP TABLE IF EXISTS `ost_staff_dept_access`;
CREATE TABLE IF NOT EXISTS `ost_staff_dept_access` (
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `role_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`staff_id`,`dept_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_staff_dept_access`
--

INSERT INTO `ost_staff_dept_access` (`staff_id`, `dept_id`, `role_id`, `flags`) VALUES
(1, 2, 1, 1),
(1, 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_syslog`
--

DROP TABLE IF EXISTS `ost_syslog`;
CREATE TABLE IF NOT EXISTS `ost_syslog` (
  `log_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_syslog`
--

INSERT INTO `ost_syslog` (`log_id`, `log_type`, `title`, `log`, `logger`, `ip_address`, `created`, `updated`) VALUES
(1, 'Debug', 'osTicket installed!', 'Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!', '', '::1', '2024-12-20 04:53:04', '2024-12-20 04:53:04'),
(2, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '::1', '2024-12-20 05:11:22', '2024-12-20 05:11:22'),
(3, 'Warning', 'Failed login attempt (user)', 'Username: raza_ali@gmail.com IP: ::1 Time: Dec 20, 2024, 12:13 am UTC Attempts: 3', '', '::1', '2024-12-20 05:13:09', '2024-12-20 05:13:09'),
(4, 'Error', 'Excessive login attempts (user)', 'Excessive login attempts by a user. Username: raza_ali@gmail.com IP: ::1 Time: Dec 20, 2024, 12:13 am UTC Attempts: 5', '', '::1', '2024-12-20 05:13:54', '2024-12-20 05:13:54'),
(5, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '::1', '2024-12-20 05:13:56', '2024-12-20 05:13:56'),
(6, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '::1', '2024-12-20 05:15:49', '2024-12-20 05:15:49'),
(7, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:37:46', '2024-12-20 05:37:46'),
(8, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:37:46', '2024-12-20 05:37:46'),
(9, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:37:46', '2024-12-20 05:37:46'),
(10, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:41:02', '2024-12-20 05:41:02'),
(11, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:41:02', '2024-12-20 05:41:02'),
(12, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:41:02', '2024-12-20 05:41:02'),
(13, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:44:25', '2024-12-20 05:44:25'),
(14, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:44:25', '2024-12-20 05:44:25'),
(15, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:44:25', '2024-12-20 05:44:25'),
(16, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:50:23', '2024-12-20 05:50:23'),
(17, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:50:23', '2024-12-20 05:50:23'),
(18, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:50:23', '2024-12-20 05:50:23'),
(19, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:56:41', '2024-12-20 05:56:41'),
(20, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:56:41', '2024-12-20 05:56:41'),
(21, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:56:41', '2024-12-20 05:56:41'),
(22, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:57:13', '2024-12-20 05:57:13'),
(23, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:57:13', '2024-12-20 05:57:13'),
(24, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:57:13', '2024-12-20 05:57:13'),
(25, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:58:06', '2024-12-20 05:58:06'),
(26, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:58:15', '2024-12-20 05:58:15'),
(27, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 05:59:49', '2024-12-20 05:59:49'),
(28, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 06:04:32', '2024-12-20 06:04:32'),
(29, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 06:04:32', '2024-12-20 06:04:32'),
(30, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 06:04:32', '2024-12-20 06:04:32'),
(31, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 06:04:54', '2024-12-20 06:04:54'),
(32, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 06:04:54', '2024-12-20 06:04:54'),
(33, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 06:04:54', '2024-12-20 06:04:54'),
(34, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 06:08:29', '2024-12-20 06:08:29'),
(35, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 06:08:29', '2024-12-20 06:08:29'),
(36, 'Warning', 'API Error (401)', 'Valid API key required [A350EF8146472AB0DB9B1F18B4F49E48] ', '', '::1', '2024-12-20 06:08:29', '2024-12-20 06:08:29'),
(37, 'Warning', 'API Error (401)', 'Valid API key required [0472BA1E29443C8388E66CBFEA4FA884] ', '', '::1', '2024-12-20 06:10:33', '2024-12-20 06:10:33'),
(38, 'Warning', 'API Error (401)', 'Valid API key required [0472BA1E29443C8388E66CBFEA4FA884] ', '', '::1', '2024-12-20 06:10:33', '2024-12-20 06:10:33'),
(39, 'Warning', 'API Error (401)', 'Valid API key required [0472BA1E29443C8388E66CBFEA4FA884] ', '', '::1', '2024-12-20 06:10:33', '2024-12-20 06:10:33'),
(40, 'Warning', 'API Error (401)', 'Valid API key required [0472BA1E29443C8388E66CBFEA4FA884] ', '', '::1', '2024-12-20 06:10:33', '2024-12-20 06:10:33'),
(41, 'Warning', 'API Error (401)', 'Valid API key required [0472BA1E29443C8388E66CBFEA4FA884] ', '', '::1', '2024-12-20 06:10:33', '2024-12-20 06:10:33'),
(42, 'Warning', 'API Error (401)', 'Valid API key required [0472BA1E29443C8388E66CBFEA4FA884] ', '', '::1', '2024-12-20 06:10:33', '2024-12-20 06:10:33'),
(43, 'Warning', 'API Error (401)', 'Valid API key required [0472BA1E29443C8388E66CBFEA4FA884] ', '', '::1', '2024-12-20 06:11:24', '2024-12-20 06:11:24'),
(44, 'Warning', 'API Error (401)', 'Valid API key required [0472BA1E29443C8388E66CBFEA4FA884] ', '', '::1', '2024-12-20 06:11:24', '2024-12-20 06:11:24'),
(45, 'Warning', 'API Error (401)', 'Valid API key required [0472BA1E29443C8388E66CBFEA4FA884] ', '', '::1', '2024-12-20 06:11:24', '2024-12-20 06:11:24'),
(46, 'Warning', 'API Error (401)', 'Valid API key required [EC37855CF2406107CE8D6D1E40FD6211] ', '', '::1', '2024-12-20 06:12:40', '2024-12-20 06:12:40'),
(47, 'Warning', 'API Error (401)', 'Valid API key required [EC37855CF2406107CE8D6D1E40FD6211] ', '', '::1', '2024-12-20 06:12:40', '2024-12-20 06:12:40'),
(48, 'Warning', 'API Error (401)', 'Valid API key required [EC37855CF2406107CE8D6D1E40FD6211] ', '', '::1', '2024-12-20 06:12:40', '2024-12-20 06:12:40'),
(49, 'Error', 'Unexpected Data (400)', 'status: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:17:07', '2024-12-20 06:17:07'),
(50, 'Error', 'Unexpected Data (400)', 'dept_id: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:17:07', '2024-12-20 06:17:07'),
(51, 'Warning', 'API Error (500)', 'Unable to create new ticket :user Incomplete client information [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:17:07', '2024-12-20 06:17:07'),
(52, 'Error', 'Unexpected Data (400)', 'status: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:17:07', '2024-12-20 06:17:07'),
(53, 'Error', 'Unexpected Data (400)', 'dept_id: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:17:07', '2024-12-20 06:17:07'),
(54, 'Warning', 'API Error (500)', 'Unable to create new ticket :user Incomplete client information [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:17:08', '2024-12-20 06:17:08'),
(55, 'Error', 'Unexpected Data (400)', 'status: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:17:08', '2024-12-20 06:17:08'),
(56, 'Error', 'Unexpected Data (400)', 'dept_id: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:17:08', '2024-12-20 06:17:08'),
(57, 'Warning', 'API Error (500)', 'Unable to create new ticket :user Incomplete client information [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:17:08', '2024-12-20 06:17:08'),
(58, 'Error', 'Unexpected Data (400)', 'status: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:19:18', '2024-12-20 06:19:18'),
(59, 'Error', 'Unexpected Data (400)', 'dept_id: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:19:18', '2024-12-20 06:19:18'),
(60, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '::1', '2024-12-20 06:19:20', '2024-12-20 06:19:20'),
(61, 'Error', 'Unexpected Data (400)', 'status: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:19:20', '2024-12-20 06:19:20'),
(62, 'Error', 'Unexpected Data (400)', 'dept_id: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:19:20', '2024-12-20 06:19:20'),
(63, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '::1', '2024-12-20 06:19:23', '2024-12-20 06:19:23'),
(64, 'Error', 'Unexpected Data (400)', 'status: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:19:23', '2024-12-20 06:19:23'),
(65, 'Error', 'Unexpected Data (400)', 'dept_id: Unexpected data received in API request [EBBC6812D73767013163C5F442F041C0] ', '', '::1', '2024-12-20 06:19:23', '2024-12-20 06:19:23'),
(66, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '::1', '2024-12-20 06:19:25', '2024-12-20 06:19:25'),
(67, 'Error', 'Mailer Error', 'Unable to email via Sendmail Unable to send mail: mail(): Failed to connect to mailserver at \"localhost\" port 25, verify your \"SMTP\" and \"smtp_port\" setting in php.ini or use ini_set() ', '', '::1', '2024-12-20 06:20:25', '2024-12-20 06:20:25');

-- --------------------------------------------------------

--
-- Table structure for table `ost_task`
--

DROP TABLE IF EXISTS `ost_task`;
CREATE TABLE IF NOT EXISTS `ost_task` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `object_id` int NOT NULL DEFAULT '0',
  `object_type` char(1) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `team_id` (`team_id`),
  KEY `created` (`created`),
  KEY `object` (`object_id`,`object_type`),
  KEY `flags` (`flags`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_task__cdata`
--

DROP TABLE IF EXISTS `ost_task__cdata`;
CREATE TABLE IF NOT EXISTS `ost_task__cdata` (
  `task_id` int UNSIGNED NOT NULL,
  `title` mediumtext,
  PRIMARY KEY (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_team`
--

DROP TABLE IF EXISTS `ost_team`;
CREATE TABLE IF NOT EXISTS `ost_team` (
  `team_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `lead_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '1',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `name` (`name`),
  KEY `lead_id` (`lead_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_team`
--

INSERT INTO `ost_team` (`team_id`, `lead_id`, `flags`, `name`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 'Level I Support', 'Tier 1 support, responsible for the initial iteraction with customers', '2024-12-20 04:53:00', '2024-12-20 04:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_team_member`
--

DROP TABLE IF EXISTS `ost_team_member`;
CREATE TABLE IF NOT EXISTS `ost_team_member` (
  `team_id` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`team_id`,`staff_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread`
--

DROP TABLE IF EXISTS `ost_thread`;
CREATE TABLE IF NOT EXISTS `ost_thread` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `object_id` int UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `extra` text,
  `lastresponse` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `object_type` (`object_type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_thread`
--

INSERT INTO `ost_thread` (`id`, `object_id`, `object_type`, `extra`, `lastresponse`, `lastmessage`, `created`) VALUES
(1, 1, 'T', NULL, NULL, '2024-12-20 04:53:02', '2024-12-20 04:53:02'),
(2, 2, 'T', NULL, NULL, '2024-12-20 05:11:20', '2024-12-20 05:11:20'),
(3, 3, 'T', NULL, NULL, '2024-12-20 06:19:18', '2024-12-20 06:19:18'),
(4, 4, 'T', NULL, NULL, '2024-12-20 06:19:20', '2024-12-20 06:19:20'),
(5, 5, 'T', NULL, NULL, '2024-12-20 06:19:23', '2024-12-20 06:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_collaborator`
--

DROP TABLE IF EXISTS `ost_thread_collaborator`;
CREATE TABLE IF NOT EXISTS `ost_thread_collaborator` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `flags` int UNSIGNED NOT NULL DEFAULT '1',
  `thread_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collab` (`thread_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry`
--

DROP TABLE IF EXISTS `ost_thread_entry`;
CREATE TABLE IF NOT EXISTS `ost_thread_entry` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int UNSIGNED NOT NULL DEFAULT '0',
  `thread_id` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `type` char(1) NOT NULL DEFAULT '',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `poster` varchar(128) NOT NULL DEFAULT '',
  `editor` int UNSIGNED DEFAULT NULL,
  `editor_type` char(1) DEFAULT NULL,
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `extra` text,
  `recipients` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `thread_id` (`thread_id`),
  KEY `staff_id` (`staff_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_thread_entry`
--

INSERT INTO `ost_thread_entry` (`id`, `pid`, `thread_id`, `staff_id`, `user_id`, `type`, `flags`, `poster`, `editor`, `editor_type`, `source`, `title`, `body`, `format`, `ip_address`, `extra`, `recipients`, `created`, `updated`) VALUES
(1, 0, 1, 0, 1, 'M', 65, 'osTicket Team', NULL, NULL, 'Web', 'osTicket Installed!', ' <p>Thank you for choosing osTicket. </p> <p>Please make sure you join the <a href=\"https://forum.osticket.com\">osTicket forums</a> and our <a href=\"https://osticket.com\">mailing list</a> to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the <a href=\"https://docs.osticket.com\">osTicket Docs</a> provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. </p> <p>If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. </p> <p>If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at <a href=\"https://supportsystem.com\">https://supportsystem.com/</a> -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. </p> <p>Cheers, </p> <p>-<br /> osTicket Team - https://osticket.com/ </p> <p><strong>PS.</strong> Don\'t just make customers happy, make happy customers! </p>', 'html', '::1', NULL, NULL, '2024-12-20 04:53:02', '0000-00-00 00:00:00'),
(2, 0, 2, 0, 2, 'M', 65, 'Test User', NULL, NULL, '', NULL, '<p>Test Summary</p>', 'html', '::1', NULL, NULL, '2024-12-20 05:11:20', '0000-00-00 00:00:00'),
(3, 0, 3, 0, 3, 'M', 1, 'John Doe', NULL, NULL, 'API', 'Login issue', ',&quot;User cannot log in with correct credentials&quot;', 'text', '::1', NULL, NULL, '2024-12-20 06:19:18', '0000-00-00 00:00:00'),
(4, 0, 4, 0, 3, 'M', 1, 'John Doe', NULL, NULL, 'API', 'Payment error', '&quot;Payment gateway fails to process&quot;,', 'text', '::1', NULL, NULL, '2024-12-20 06:19:20', '0000-00-00 00:00:00'),
(5, 0, 5, 0, 3, 'M', 1, 'John Doe', NULL, NULL, 'API', 'Password reset', '&quot;User needs password reset link sent&quot;', 'text', '::1', NULL, NULL, '2024-12-20 06:19:23', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry_email`
--

DROP TABLE IF EXISTS `ost_thread_entry_email`;
CREATE TABLE IF NOT EXISTS `ost_thread_entry_email` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `thread_entry_id` int UNSIGNED NOT NULL,
  `email_id` int UNSIGNED DEFAULT NULL,
  `mid` varchar(255) NOT NULL,
  `headers` text,
  PRIMARY KEY (`id`),
  KEY `thread_entry_id` (`thread_entry_id`),
  KEY `mid` (`mid`),
  KEY `email_id` (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_entry_merge`
--

DROP TABLE IF EXISTS `ost_thread_entry_merge`;
CREATE TABLE IF NOT EXISTS `ost_thread_entry_merge` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `thread_entry_id` int UNSIGNED NOT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `thread_entry_id` (`thread_entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_event`
--

DROP TABLE IF EXISTS `ost_thread_event`;
CREATE TABLE IF NOT EXISTS `ost_thread_event` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `thread_id` int UNSIGNED NOT NULL DEFAULT '0',
  `thread_type` char(1) NOT NULL DEFAULT '',
  `event_id` int UNSIGNED DEFAULT NULL,
  `staff_id` int UNSIGNED NOT NULL,
  `team_id` int UNSIGNED NOT NULL,
  `dept_id` int UNSIGNED NOT NULL,
  `topic_id` int UNSIGNED NOT NULL,
  `data` varchar(1024) DEFAULT NULL COMMENT 'Encoded differences',
  `username` varchar(128) NOT NULL DEFAULT 'SYSTEM',
  `uid` int UNSIGNED DEFAULT NULL,
  `uid_type` char(1) NOT NULL DEFAULT 'S',
  `annulled` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_state` (`thread_id`,`event_id`,`timestamp`),
  KEY `ticket_stats` (`timestamp`,`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_thread_event`
--

INSERT INTO `ost_thread_event` (`id`, `thread_id`, `thread_type`, `event_id`, `staff_id`, `team_id`, `dept_id`, `topic_id`, `data`, `username`, `uid`, `uid_type`, `annulled`, `timestamp`) VALUES
(1, 1, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 1, 'U', 0, '2024-12-20 04:53:02'),
(2, 2, 'T', 1, 0, 0, 1, 1, NULL, 'SYSTEM', 2, 'U', 0, '2024-12-20 05:11:20'),
(3, 2, 'T', 4, 2, 0, 1, 1, '{\"staff\":[2,\"raza ali\"]}', 'sarmad', 1, 'S', 0, '2024-12-20 05:15:47'),
(4, 3, 'T', 1, 0, 0, 1, 0, NULL, 'SYSTEM', 3, 'U', 0, '2024-12-20 06:19:18'),
(5, 4, 'T', 1, 0, 0, 1, 0, NULL, 'SYSTEM', 3, 'U', 0, '2024-12-20 06:19:20'),
(6, 5, 'T', 1, 0, 0, 1, 0, NULL, 'SYSTEM', 3, 'U', 0, '2024-12-20 06:19:23'),
(7, 5, 'T', 4, 2, 0, 1, 0, '{\"staff\":[2,\"raza ali\"]}', 'sarmad', 1, 'S', 0, '2024-12-20 06:20:23');

-- --------------------------------------------------------

--
-- Table structure for table `ost_thread_referral`
--

DROP TABLE IF EXISTS `ost_thread_referral`;
CREATE TABLE IF NOT EXISTS `ost_thread_referral` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `thread_id` int UNSIGNED NOT NULL,
  `object_id` int UNSIGNED NOT NULL,
  `object_type` char(1) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref` (`object_id`,`object_type`,`thread_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket`
--

DROP TABLE IF EXISTS `ost_ticket`;
CREATE TABLE IF NOT EXISTS `ost_ticket` (
  `ticket_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_pid` int UNSIGNED DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_email_id` int UNSIGNED NOT NULL DEFAULT '0',
  `status_id` int UNSIGNED NOT NULL DEFAULT '0',
  `dept_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sla_id` int UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int UNSIGNED NOT NULL DEFAULT '0',
  `staff_id` int UNSIGNED NOT NULL DEFAULT '0',
  `team_id` int UNSIGNED NOT NULL DEFAULT '0',
  `email_id` int UNSIGNED NOT NULL DEFAULT '0',
  `lock_id` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `source_extra` varchar(40) DEFAULT NULL,
  `isoverdue` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `isanswered` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `est_duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `user_id` (`user_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `team_id` (`team_id`),
  KEY `status_id` (`status_id`),
  KEY `created` (`created`),
  KEY `closed` (`closed`),
  KEY `duedate` (`duedate`),
  KEY `topic_id` (`topic_id`),
  KEY `sla_id` (`sla_id`),
  KEY `ticket_pid` (`ticket_pid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_ticket`
--

INSERT INTO `ost_ticket` (`ticket_id`, `ticket_pid`, `number`, `user_id`, `user_email_id`, `status_id`, `dept_id`, `sla_id`, `topic_id`, `staff_id`, `team_id`, `email_id`, `lock_id`, `flags`, `sort`, `ip_address`, `source`, `source_extra`, `isoverdue`, `isanswered`, `duedate`, `est_duedate`, `reopened`, `closed`, `lastupdate`, `created`, `updated`) VALUES
(1, NULL, '846612', 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '::1', 'Web', NULL, 0, 0, NULL, '2024-12-23 17:00:00', NULL, NULL, '2024-12-20 04:53:02', '2024-12-20 04:53:02', '2024-12-20 04:53:04'),
(2, NULL, '359908', 2, 0, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0, '::1', 'Web', NULL, 0, 0, NULL, '2024-12-23 17:00:00', NULL, NULL, '2024-12-20 05:11:20', '2024-12-20 05:11:20', '2024-12-20 05:15:47'),
(3, NULL, '644072', 3, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, '::1', 'API', NULL, 0, 0, NULL, '2024-12-23 17:00:00', NULL, NULL, '2024-12-20 06:19:18', '2024-12-20 06:19:18', '2024-12-20 06:19:18'),
(4, NULL, '411082', 3, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, '::1', 'API', NULL, 0, 0, NULL, '2024-12-23 17:00:00', NULL, NULL, '2024-12-20 06:19:20', '2024-12-20 06:19:20', '2024-12-20 06:19:21'),
(5, NULL, '542852', 3, 0, 1, 1, 1, 0, 2, 0, 0, 0, 0, 0, '::1', 'API', NULL, 0, 0, NULL, '2024-12-23 17:00:00', NULL, NULL, '2024-12-20 06:19:23', '2024-12-20 06:19:23', '2024-12-20 06:20:23');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_priority`
--

DROP TABLE IF EXISTS `ost_ticket_priority`;
CREATE TABLE IF NOT EXISTS `ost_ticket_priority` (
  `priority_id` tinyint NOT NULL AUTO_INCREMENT,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`priority_id`),
  UNIQUE KEY `priority` (`priority`),
  KEY `priority_urgency` (`priority_urgency`),
  KEY `ispublic` (`ispublic`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_ticket_priority`
--

INSERT INTO `ost_ticket_priority` (`priority_id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `ispublic`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket_status`
--

DROP TABLE IF EXISTS `ost_ticket_status`;
CREATE TABLE IF NOT EXISTS `ost_ticket_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int UNSIGNED NOT NULL DEFAULT '0',
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `state` (`state`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_ticket_status`
--

INSERT INTO `ost_ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{\"description\":\"Open tickets.\"}', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Resolved tickets\"}', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Closed tickets. Tickets will still be accessible on client and staff panels.\"}', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{\"description\":\"Tickets only adminstratively available but no longer accessible on ticket queues and client panel.\"}', '2024-12-20 04:53:00', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{\"description\":\"Tickets queued for deletion. Not accessible on ticket queues.\"}', '2024-12-20 04:53:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ost_ticket__cdata`
--

DROP TABLE IF EXISTS `ost_ticket__cdata`;
CREATE TABLE IF NOT EXISTS `ost_ticket__cdata` (
  `ticket_id` int UNSIGNED NOT NULL,
  `subject` mediumtext,
  `priority` mediumtext,
  PRIMARY KEY (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_ticket__cdata`
--

INSERT INTO `ost_ticket__cdata` (`ticket_id`, `subject`, `priority`) VALUES
(1, 'osTicket Installed!', NULL),
(2, 'Test Issue', '2'),
(3, 'Login issue', '1'),
(4, 'Payment error', '2'),
(5, 'Password reset', '3');

-- --------------------------------------------------------

--
-- Table structure for table `ost_translation`
--

DROP TABLE IF EXISTS `ost_translation`;
CREATE TABLE IF NOT EXISTS `ost_translation` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `object_hash` char(16) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `type` enum('phrase','article','override') DEFAULT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `revision` int UNSIGNED DEFAULT NULL,
  `agent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `lang` varchar(16) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `source_text` text,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`lang`),
  KEY `object_hash` (`object_hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_user`
--

DROP TABLE IF EXISTS `ost_user`;
CREATE TABLE IF NOT EXISTS `ost_user` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `org_id` int UNSIGNED NOT NULL,
  `default_email_id` int NOT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  KEY `default_email_id` (`default_email_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_user`
--

INSERT INTO `ost_user` (`id`, `org_id`, `default_email_id`, `status`, `name`, `created`, `updated`) VALUES
(1, 1, 1, 0, 'osTicket Team', '2024-12-20 04:53:02', '2024-12-20 04:53:04'),
(2, 0, 2, 0, 'Test User', '2024-12-20 05:11:20', '2024-12-20 05:11:20'),
(3, 0, 3, 0, 'John Doe', '2024-12-20 06:19:18', '2024-12-20 06:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_account`
--

DROP TABLE IF EXISTS `ost_user_account`;
CREATE TABLE IF NOT EXISTS `ost_user_account` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '0',
  `timezone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `extra` text,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ost_user_email`
--

DROP TABLE IF EXISTS `ost_user_email`;
CREATE TABLE IF NOT EXISTS `ost_user_email` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL,
  `flags` int UNSIGNED NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  KEY `user_email_lookup` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_user_email`
--

INSERT INTO `ost_user_email` (`id`, `user_id`, `flags`, `address`) VALUES
(1, 1, 0, 'feedback@osticket.com'),
(2, 2, 0, 'test@gmail.com'),
(3, 3, 0, 'johndoe@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `ost_user__cdata`
--

DROP TABLE IF EXISTS `ost_user__cdata`;
CREATE TABLE IF NOT EXISTS `ost_user__cdata` (
  `user_id` int UNSIGNED NOT NULL,
  `email` mediumtext,
  `name` mediumtext,
  `phone` mediumtext,
  `notes` mediumtext,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost_user__cdata`
--

INSERT INTO `ost_user__cdata` (`user_id`, `email`, `name`, `phone`, `notes`) VALUES
(2, NULL, NULL, '4343432223X0000', ''),
(1, NULL, NULL, '', ''),
(3, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ost__search`
--

DROP TABLE IF EXISTS `ost__search`;
CREATE TABLE IF NOT EXISTS `ost__search` (
  `object_type` varchar(8) NOT NULL,
  `object_id` int UNSIGNED NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`object_type`,`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ost__search`
--

INSERT INTO `ost__search` (`object_type`, `object_id`, `title`, `content`) VALUES
('H', 1, 'osTicket Installed!', 'Thank you for choosing osTicket. Please make sure you join the osTicket forums and our mailing list to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket Docs provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at https://supportsystem.com/ -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. Cheers, - osTicket Team - https://osticket.com/ PS. Don\'t just make customers happy, make happy customers!'),
('T', 1, '846612 osTicket Installed!', ''),
('U', 1, 'osTicket Team', 'feedback@osticket.com'),
('O', 1, 'osTicket', ''),
('U', 2, 'Test User', '(434) 343-2223 x0000 test@gmail.com\ntest@gmail.com'),
('T', 2, '359908 Test Issue', 'Test Issue'),
('H', 2, '', 'Test Summary'),
('U', 3, 'John Doe', ' johndoe@example.com\njohndoe@example.com'),
('T', 3, '644072 Login issue', 'Login issue'),
('H', 3, 'Login issue', ',&quot;User cannot log in with correct credentials&quot;'),
('T', 4, '411082 Payment error', 'Payment error'),
('H', 4, 'Payment error', '&quot;Payment gateway fails to process&quot;,'),
('T', 5, '542852 Password reset', 'Password reset'),
('H', 5, 'Password reset', '&quot;User needs password reset link sent&quot;');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ost__search`
--
ALTER TABLE `ost__search` ADD FULLTEXT KEY `search` (`title`,`content`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
