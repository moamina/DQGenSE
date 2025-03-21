/*
SQLyog Ultimate v8.53 
MySQL - 5.7.43-log : Database - raddb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`raddb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_520_ci */;

USE `raddb`;

/*Table structure for table `batch_history` */

DROP TABLE IF EXISTS `batch_history`;

CREATE TABLE `batch_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_name` varchar(64) DEFAULT NULL COMMENT 'an identifier name of the batch instance',
  `batch_description` varchar(256) DEFAULT NULL COMMENT 'general description of the entry',
  `hotspot_id` int(11) DEFAULT '0' COMMENT 'the hotspot business id associated with this batch instance',
  `batch_status` varchar(128) NOT NULL DEFAULT 'Pending' COMMENT 'the batch status',
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batch_name` (`batch_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `billing_history` */

DROP TABLE IF EXISTS `billing_history`;

CREATE TABLE `billing_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL,
  `billAmount` varchar(200) DEFAULT NULL,
  `billAction` varchar(128) NOT NULL DEFAULT 'Unavailable',
  `billPerformer` varchar(200) DEFAULT NULL,
  `billReason` varchar(200) DEFAULT NULL,
  `paymentmethod` varchar(200) DEFAULT NULL,
  `cash` varchar(200) DEFAULT NULL,
  `creditcardname` varchar(200) DEFAULT NULL,
  `creditcardnumber` varchar(200) DEFAULT NULL,
  `creditcardverification` varchar(200) DEFAULT NULL,
  `creditcardtype` varchar(200) DEFAULT NULL,
  `creditcardexp` varchar(200) DEFAULT NULL,
  `coupon` varchar(200) DEFAULT NULL,
  `discount` varchar(200) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `billing_merchant` */

DROP TABLE IF EXISTS `billing_merchant`;

CREATE TABLE `billing_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL DEFAULT '',
  `password` varchar(128) NOT NULL DEFAULT '',
  `mac` varchar(200) NOT NULL DEFAULT '',
  `pin` varchar(200) NOT NULL DEFAULT '',
  `txnId` varchar(200) NOT NULL DEFAULT '',
  `planName` varchar(128) NOT NULL DEFAULT '',
  `planId` int(11) NOT NULL,
  `quantity` varchar(200) NOT NULL DEFAULT '',
  `business_email` varchar(200) NOT NULL DEFAULT '',
  `business_id` varchar(200) NOT NULL DEFAULT '',
  `txn_type` varchar(200) NOT NULL DEFAULT '',
  `txn_id` varchar(200) NOT NULL DEFAULT '',
  `payment_type` varchar(200) NOT NULL DEFAULT '',
  `payment_tax` varchar(200) NOT NULL DEFAULT '',
  `payment_cost` varchar(200) NOT NULL DEFAULT '',
  `payment_fee` varchar(200) NOT NULL DEFAULT '',
  `payment_total` varchar(200) NOT NULL DEFAULT '',
  `payment_currency` varchar(200) NOT NULL DEFAULT '',
  `first_name` varchar(200) NOT NULL DEFAULT '',
  `last_name` varchar(200) NOT NULL DEFAULT '',
  `payer_email` varchar(200) NOT NULL DEFAULT '',
  `payer_address_name` varchar(200) NOT NULL DEFAULT '',
  `payer_address_street` varchar(200) NOT NULL DEFAULT '',
  `payer_address_country` varchar(200) NOT NULL DEFAULT '',
  `payer_address_country_code` varchar(200) NOT NULL DEFAULT '',
  `payer_address_city` varchar(200) NOT NULL DEFAULT '',
  `payer_address_state` varchar(200) NOT NULL DEFAULT '',
  `payer_address_zip` varchar(200) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `payment_status` varchar(200) NOT NULL DEFAULT '',
  `pending_reason` varchar(200) NOT NULL DEFAULT '',
  `reason_code` varchar(200) NOT NULL DEFAULT '',
  `receipt_ID` varchar(200) NOT NULL DEFAULT '',
  `payment_address_status` varchar(200) NOT NULL DEFAULT '',
  `vendor_type` varchar(200) NOT NULL DEFAULT '',
  `payer_status` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `billing_paypal` */

DROP TABLE IF EXISTS `billing_paypal`;

CREATE TABLE `billing_paypal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `mac` varchar(200) DEFAULT NULL,
  `pin` varchar(200) DEFAULT NULL,
  `txnId` varchar(200) DEFAULT NULL,
  `planName` varchar(128) DEFAULT NULL,
  `planId` varchar(200) DEFAULT NULL,
  `quantity` varchar(200) DEFAULT NULL,
  `receiver_email` varchar(200) DEFAULT NULL,
  `business` varchar(200) DEFAULT NULL,
  `tax` varchar(200) DEFAULT NULL,
  `mc_gross` varchar(200) DEFAULT NULL,
  `mc_fee` varchar(200) DEFAULT NULL,
  `mc_currency` varchar(200) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `payer_email` varchar(200) DEFAULT NULL,
  `address_name` varchar(200) DEFAULT NULL,
  `address_street` varchar(200) DEFAULT NULL,
  `address_country` varchar(200) DEFAULT NULL,
  `address_country_code` varchar(200) DEFAULT NULL,
  `address_city` varchar(200) DEFAULT NULL,
  `address_state` varchar(200) DEFAULT NULL,
  `address_zip` varchar(200) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_status` varchar(200) DEFAULT NULL,
  `payment_address_status` varchar(200) DEFAULT NULL,
  `payer_status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `billing_plans` */

DROP TABLE IF EXISTS `billing_plans`;

CREATE TABLE `billing_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planName` varchar(128) DEFAULT NULL,
  `planId` varchar(128) DEFAULT NULL,
  `planType` varchar(128) DEFAULT NULL,
  `planTimeBank` varchar(128) DEFAULT NULL,
  `planTimeType` varchar(128) DEFAULT NULL,
  `planTimeRefillCost` varchar(128) DEFAULT NULL,
  `planBandwidthUp` varchar(128) DEFAULT NULL,
  `planBandwidthDown` varchar(128) DEFAULT NULL,
  `planTrafficTotal` varchar(128) DEFAULT NULL,
  `planTrafficUp` varchar(128) DEFAULT NULL,
  `planTrafficDown` varchar(128) DEFAULT NULL,
  `planTrafficRefillCost` varchar(128) DEFAULT NULL,
  `planRecurring` varchar(128) DEFAULT NULL,
  `planRecurringPeriod` varchar(128) DEFAULT NULL,
  `planRecurringBillingSchedule` varchar(128) NOT NULL DEFAULT 'Fixed',
  `planCost` varchar(128) DEFAULT NULL,
  `planSetupCost` varchar(128) DEFAULT NULL,
  `planTax` varchar(128) DEFAULT NULL,
  `planCurrency` varchar(128) DEFAULT NULL,
  `planGroup` varchar(128) DEFAULT NULL,
  `planActive` varchar(32) NOT NULL DEFAULT 'yes',
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `planName` (`planName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `billing_plans_profiles` */

DROP TABLE IF EXISTS `billing_plans_profiles`;

CREATE TABLE `billing_plans_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(128) NOT NULL COMMENT 'the name of the plan',
  `profile_name` varchar(256) DEFAULT NULL COMMENT 'the profile/group name',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `billing_rates` */

DROP TABLE IF EXISTS `billing_rates`;

CREATE TABLE `billing_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rateName` varchar(128) NOT NULL DEFAULT '',
  `rateType` varchar(128) NOT NULL DEFAULT '',
  `rateCost` int(11) NOT NULL DEFAULT '0',
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rateName` (`rateName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(30) DEFAULT NULL,
  `Attribute` varchar(64) DEFAULT NULL,
  `Value` varchar(64) DEFAULT NULL,
  `Format` varchar(20) DEFAULT NULL,
  `Vendor` varchar(32) DEFAULT NULL,
  `RecommendedOP` varchar(32) DEFAULT NULL,
  `RecommendedTable` varchar(32) DEFAULT NULL,
  `RecommendedHelper` varchar(32) DEFAULT NULL,
  `RecommendedTooltip` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9718 DEFAULT CHARSET=latin1;

/*Table structure for table `hotspots` */

DROP TABLE IF EXISTS `hotspots`;

CREATE TABLE `hotspots` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `mac` varchar(200) DEFAULT NULL,
  `geocode` varchar(200) DEFAULT NULL,
  `owner` varchar(200) DEFAULT NULL,
  `email_owner` varchar(200) DEFAULT NULL,
  `manager` varchar(200) DEFAULT NULL,
  `email_manager` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `phone1` varchar(200) DEFAULT NULL,
  `phone2` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `companywebsite` varchar(200) DEFAULT NULL,
  `companyemail` varchar(200) DEFAULT NULL,
  `companycontact` varchar(200) DEFAULT NULL,
  `companyphone` varchar(200) DEFAULT NULL,
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `mac` (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT 'user id of the userbillinfo table',
  `batch_id` int(11) DEFAULT NULL COMMENT 'batch id of the batch_history table',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_id` int(11) NOT NULL DEFAULT '1' COMMENT 'the status of the invoice from invoice_status',
  `type_id` int(11) NOT NULL DEFAULT '1' COMMENT 'the type of the invoice from invoice_type',
  `notes` varchar(128) NOT NULL COMMENT 'general notes/description',
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `invoice_items` */

DROP TABLE IF EXISTS `invoice_items`;

CREATE TABLE `invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL COMMENT 'invoice id of the invoices table',
  `plan_id` int(11) DEFAULT NULL COMMENT 'the plan_id of the billing_plans table',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'the amount cost of an item',
  `tax_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'the tax amount for an item',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'the total amount',
  `notes` varchar(128) NOT NULL COMMENT 'general notes/description',
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `invoice_status` */

DROP TABLE IF EXISTS `invoice_status`;

CREATE TABLE `invoice_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL DEFAULT '' COMMENT 'status value',
  `notes` varchar(128) NOT NULL COMMENT 'general notes/description',
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `invoice_type` */

DROP TABLE IF EXISTS `invoice_type`;

CREATE TABLE `invoice_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL DEFAULT '' COMMENT 'type value',
  `notes` varchar(128) NOT NULL COMMENT 'general notes/description',
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `nas` */

DROP TABLE IF EXISTS `nas`;

CREATE TABLE `nas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nasname` varchar(128) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT 'other',
  `ports` int(11) DEFAULT NULL,
  `secret` varchar(60) NOT NULL DEFAULT 'secret',
  `server` varchar(64) DEFAULT NULL,
  `community` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT 'RADIUS Client',
  PRIMARY KEY (`id`),
  KEY `nasname` (`nasname`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `node` */

DROP TABLE IF EXISTS `node`;

CREATE TABLE `node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time of last checkin',
  `netid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `owner_name` varchar(50) NOT NULL COMMENT 'node owner''s name',
  `owner_email` varchar(50) NOT NULL COMMENT 'node owner''s email address',
  `owner_phone` varchar(25) NOT NULL COMMENT 'node owner''s phone number',
  `owner_address` varchar(100) NOT NULL COMMENT 'node owner''s address',
  `approval_status` varchar(1) NOT NULL COMMENT 'approval status: A (accepted), R (rejected), P (pending)',
  `ip` varchar(20) NOT NULL COMMENT 'ROBIN',
  `mac` varchar(20) NOT NULL COMMENT 'ROBIN',
  `uptime` varchar(100) NOT NULL COMMENT 'ROBIN',
  `robin` varchar(20) NOT NULL COMMENT 'ROBIN: robin version',
  `batman` varchar(20) NOT NULL COMMENT 'ROBIN: batman version',
  `memfree` varchar(20) NOT NULL COMMENT 'ROBIN',
  `nbs` mediumtext NOT NULL COMMENT 'ROBIN: neighbor list',
  `gateway` varchar(20) NOT NULL COMMENT 'ROBIN: nearest gateway',
  `gw-qual` varchar(20) NOT NULL COMMENT 'ROBIN: quality of nearest gateway',
  `routes` mediumtext NOT NULL COMMENT 'ROBIN: route to nearest gateway',
  `users` char(3) NOT NULL COMMENT 'ROBIN: current number of users',
  `kbdown` varchar(20) NOT NULL COMMENT 'ROBIN: downloaded kb',
  `kbup` varchar(20) NOT NULL COMMENT 'ROBIN: uploaded kb',
  `hops` varchar(3) NOT NULL COMMENT 'ROBIN: hops to gateway',
  `rank` varchar(3) NOT NULL COMMENT 'ROBIN: ???, not currently used for anything',
  `ssid` varchar(20) NOT NULL COMMENT 'ROBIN: ssid, not currently used for anything',
  `pssid` varchar(20) NOT NULL COMMENT 'ROBIN: pssid, not currently used for anything',
  `gateway_bit` tinyint(1) NOT NULL COMMENT 'ROBIN derivation: is this node a gateway?',
  `memlow` varchar(20) NOT NULL COMMENT 'ROBIN derivation: lowest reported memory on the node',
  `usershi` char(3) NOT NULL COMMENT 'ROBIN derivation: highest number of users',
  `cpu` float NOT NULL DEFAULT '0',
  `wan_iface` varchar(128) DEFAULT NULL,
  `wan_ip` varchar(128) DEFAULT NULL,
  `wan_mac` varchar(128) DEFAULT NULL,
  `wan_gateway` varchar(128) DEFAULT NULL,
  `wifi_iface` varchar(128) DEFAULT NULL,
  `wifi_ip` varchar(128) DEFAULT NULL,
  `wifi_mac` varchar(128) DEFAULT NULL,
  `wifi_ssid` varchar(128) DEFAULT NULL,
  `wifi_key` varchar(128) DEFAULT NULL,
  `wifi_channel` varchar(128) DEFAULT NULL,
  `lan_iface` varchar(128) DEFAULT NULL,
  `lan_mac` varchar(128) DEFAULT NULL,
  `lan_ip` varchar(128) DEFAULT NULL,
  `wan_bup` varchar(128) DEFAULT NULL,
  `wan_bdown` varchar(128) DEFAULT NULL,
  `firmware` varchar(128) DEFAULT NULL,
  `firmware_revision` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac` (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='node database';

/*Table structure for table `operators` */

DROP TABLE IF EXISTS `operators`;

CREATE TABLE `operators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `department` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `phone1` varchar(32) NOT NULL,
  `phone2` varchar(32) NOT NULL,
  `email1` varchar(32) NOT NULL,
  `email2` varchar(32) NOT NULL,
  `messenger1` varchar(32) NOT NULL,
  `messenger2` varchar(32) NOT NULL,
  `notes` varchar(128) NOT NULL,
  `lastlogin` datetime DEFAULT '0000-00-00 00:00:00',
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `operators_acl` */

DROP TABLE IF EXISTS `operators_acl`;

CREATE TABLE `operators_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL,
  `file` varchar(128) NOT NULL,
  `access` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=latin1;

/*Table structure for table `operators_acl_files` */

DROP TABLE IF EXISTS `operators_acl_files`;

CREATE TABLE `operators_acl_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(128) NOT NULL,
  `category` varchar(128) NOT NULL,
  `section` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL COMMENT 'invoice id of the invoices table',
  `amount` decimal(10,2) NOT NULL COMMENT 'the amount paid',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type_id` int(11) NOT NULL DEFAULT '1' COMMENT 'the type of the payment from payment_type',
  `notes` varchar(128) NOT NULL COMMENT 'general notes/description',
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `payment_type` */

DROP TABLE IF EXISTS `payment_type`;

CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(32) NOT NULL DEFAULT '' COMMENT 'type value',
  `notes` varchar(128) NOT NULL COMMENT 'general notes/description',
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `proxys` */

DROP TABLE IF EXISTS `proxys`;

CREATE TABLE `proxys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proxyname` varchar(128) DEFAULT NULL,
  `retry_delay` int(11) DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `dead_time` int(11) DEFAULT NULL,
  `default_fallback` int(11) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `radacct` */

DROP TABLE IF EXISTS `radacct`;

CREATE TABLE `radacct` (
  `radacctid` bigint(20) NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `realm` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nasipaddress` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nasportid` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nasporttype` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctupdatetime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctinterval` int(11) DEFAULT NULL,
  `acctsessiontime` int(10) unsigned DEFAULT NULL,
  `acctauthentic` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectinfo_start` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connectinfo_stop` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `callingstationid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `servicetype` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `framedprotocol` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `framedipaddress` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `framedipv6address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `framedipv6prefix` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `framedinterfaceid` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delegatedipv6prefix` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`radacctid`),
  UNIQUE KEY `acctuniqueid` (`acctuniqueid`),
  KEY `username` (`username`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `framedipv6address` (`framedipv6address`),
  KEY `framedipv6prefix` (`framedipv6prefix`),
  KEY `framedinterfaceid` (`framedinterfaceid`),
  KEY `delegatedipv6prefix` (`delegatedipv6prefix`),
  KEY `acctsessionid` (`acctsessionid`),
  KEY `acctsessiontime` (`acctsessiontime`),
  KEY `acctstarttime` (`acctstarttime`),
  KEY `acctinterval` (`acctinterval`),
  KEY `acctstoptime` (`acctstoptime`),
  KEY `nasipaddress` (`nasipaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=30481324 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `radcheck` */

DROP TABLE IF EXISTS `radcheck`;

CREATE TABLE `radcheck` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB AUTO_INCREMENT=149607 DEFAULT CHARSET=latin1;

/*Table structure for table `radgroupcheck` */

DROP TABLE IF EXISTS `radgroupcheck`;

CREATE TABLE `radgroupcheck` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '==',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `radgroupreply` */

DROP TABLE IF EXISTS `radgroupreply`;

CREATE TABLE `radgroupreply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=latin1;

/*Table structure for table `radpostauth` */

DROP TABLE IF EXISTS `radpostauth`;

CREATE TABLE `radpostauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reply` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `authdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `radreply` */

DROP TABLE IF EXISTS `radreply`;

CREATE TABLE `radreply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT '=',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB AUTO_INCREMENT=4646 DEFAULT CHARSET=latin1;

/*Table structure for table `radusergroup` */

DROP TABLE IF EXISTS `radusergroup`;

CREATE TABLE `radusergroup` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '1',
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `realms` */

DROP TABLE IF EXISTS `realms`;

CREATE TABLE `realms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `realmname` varchar(128) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `authhost` varchar(256) DEFAULT NULL,
  `accthost` varchar(256) DEFAULT NULL,
  `secret` varchar(128) DEFAULT NULL,
  `ldflag` varchar(64) DEFAULT NULL,
  `nostrip` int(11) DEFAULT NULL,
  `hints` int(11) DEFAULT NULL,
  `notrealm` int(11) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `userbillinfo` */

DROP TABLE IF EXISTS `userbillinfo`;

CREATE TABLE `userbillinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `planName` varchar(128) DEFAULT NULL,
  `hotspot_id` int(11) DEFAULT NULL,
  `hotspotlocation` varchar(32) DEFAULT NULL,
  `contactperson` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zip` varchar(200) DEFAULT NULL,
  `paymentmethod` varchar(200) DEFAULT NULL,
  `cash` varchar(200) DEFAULT NULL,
  `creditcardname` varchar(200) DEFAULT NULL,
  `creditcardnumber` varchar(200) DEFAULT NULL,
  `creditcardverification` varchar(200) DEFAULT NULL,
  `creditcardtype` varchar(200) DEFAULT NULL,
  `creditcardexp` varchar(200) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `changeuserbillinfo` varchar(128) DEFAULT NULL,
  `lead` varchar(200) DEFAULT NULL,
  `coupon` varchar(200) DEFAULT NULL,
  `ordertaker` varchar(200) DEFAULT NULL,
  `billstatus` varchar(200) DEFAULT NULL,
  `lastbill` date NOT NULL DEFAULT '0000-00-00',
  `nextbill` date NOT NULL DEFAULT '0000-00-00',
  `nextinvoicedue` int(11) DEFAULT NULL,
  `billdue` int(11) DEFAULT NULL,
  `postalinvoice` varchar(8) DEFAULT NULL,
  `faxinvoice` varchar(8) DEFAULT NULL,
  `emailinvoice` varchar(8) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `planname` (`planName`)
) ENGINE=MyISAM AUTO_INCREMENT=375 DEFAULT CHARSET=latin1;

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `firstname` varchar(200) DEFAULT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `workphone` varchar(200) DEFAULT NULL,
  `homephone` varchar(200) DEFAULT NULL,
  `mobilephone` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zip` varchar(200) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `changeuserinfo` varchar(128) DEFAULT NULL,
  `portalloginpassword` varchar(128) DEFAULT '',
  `enableportallogin` int(11) DEFAULT '0',
  `creationdate` datetime DEFAULT '0000-00-00 00:00:00',
  `creationby` varchar(128) DEFAULT NULL,
  `updatedate` datetime DEFAULT '0000-00-00 00:00:00',
  `updateby` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=375 DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
