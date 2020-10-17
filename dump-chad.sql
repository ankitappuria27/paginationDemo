-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: chad
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ilance_buynow_orders`
--

DROP TABLE IF EXISTS `ilance_buynow_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilance_buynow_orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `parentid` int NOT NULL DEFAULT '0',
  `project_id` int NOT NULL DEFAULT '0',
  `buyer_id` int NOT NULL DEFAULT '0',
  `owner_id` int NOT NULL DEFAULT '0',
  `invoiceid` int NOT NULL DEFAULT '0',
  `attachid` int NOT NULL DEFAULT '0',
  `qty` int NOT NULL DEFAULT '1',
  `amount` double(17,2) NOT NULL DEFAULT '0.00',
  `salestax` double(10,2) NOT NULL DEFAULT '0.00',
  `salestaxstate` varchar(250) NOT NULL DEFAULT '',
  `salestaxrate` varchar(10) NOT NULL DEFAULT '0',
  `salestaxshipping` int NOT NULL DEFAULT '0',
  `escrowfee` double(10,2) NOT NULL DEFAULT '0.00',
  `escrowfeebuyer` double(10,2) NOT NULL DEFAULT '0.00',
  `fvf` double(10,2) NOT NULL DEFAULT '0.00',
  `fvfbuyer` double(10,2) NOT NULL DEFAULT '0.00',
  `isescrowfeepaid` int NOT NULL DEFAULT '0',
  `isescrowfeebuyerpaid` int NOT NULL DEFAULT '0',
  `isfvfpaid` int NOT NULL DEFAULT '0',
  `isfvfbuyerpaid` int NOT NULL DEFAULT '0',
  `escrowfeeinvoiceid` int NOT NULL DEFAULT '0',
  `escrowfeebuyerinvoiceid` int NOT NULL DEFAULT '0',
  `fvfinvoiceid` int NOT NULL DEFAULT '0',
  `fvfbuyerinvoiceid` int NOT NULL DEFAULT '0',
  `ship_required` int NOT NULL DEFAULT '1',
  `ship_location` mediumtext,
  `orderdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `canceldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `arrivedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paiddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `releasedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `winnermarkedaspaid` int NOT NULL DEFAULT '0',
  `winnermarkedaspaiddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `winnermarkedaspaidmethod` mediumtext,
  `buyerpaymethod` varchar(250) NOT NULL DEFAULT '',
  `buyershipcost` double(10,2) NOT NULL DEFAULT '0.00',
  `buyershipperid` int NOT NULL DEFAULT '0',
  `sellermarkedasshipped` int NOT NULL DEFAULT '0',
  `sellermarkedasshippeddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shiptracknumber` varchar(250) NOT NULL DEFAULT '',
  `buyerfeedback` int NOT NULL DEFAULT '0',
  `sellerfeedback` int NOT NULL DEFAULT '0',
  `status` enum('paid','cancelled','pending_delivery','delivered','fraud','offline','offline_delivered') NOT NULL DEFAULT 'paid',
  PRIMARY KEY (`orderid`),
  KEY `parentid` (`parentid`),
  KEY `project_id` (`project_id`),
  KEY `buyer_id` (`buyer_id`),
  KEY `owner_id` (`owner_id`),
  KEY `attachid` (`attachid`),
  KEY `invoiceid` (`invoiceid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilance_buynow_orders`
--

LOCK TABLES `ilance_buynow_orders` WRITE;
/*!40000 ALTER TABLE `ilance_buynow_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ilance_buynow_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilance_category`
--

DROP TABLE IF EXISTS `ilance_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilance_category` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL DEFAULT '',
  `description` mediumtext,
  PRIMARY KEY (`cid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilance_category`
--

LOCK TABLES `ilance_category` WRITE;
/*!40000 ALTER TABLE `ilance_category` DISABLE KEYS */;
INSERT INTO `ilance_category` VALUES (1,'Manufacturing','Manufacturing project for LTI'),(2,'Management','Management  of gooda'),(3,'Installation','Project for installation guide'),(4,'Finance','Finance management project'),(5,'Ecommerce','Seeling goods online');
/*!40000 ALTER TABLE `ilance_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilance_projects`
--

DROP TABLE IF EXISTS `ilance_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilance_projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL DEFAULT '0',
  `escrow_id` int NOT NULL DEFAULT '0',
  `cid` int NOT NULL DEFAULT '0',
  `description` mediumtext,
  `ishtml` enum('0','1') NOT NULL DEFAULT '0',
  `description_videourl` mediumtext,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_starts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gtc` int NOT NULL DEFAULT '0',
  `gtc_cancelled` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int NOT NULL DEFAULT '0',
  `visible` int NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '0',
  `project_title` varchar(250) NOT NULL DEFAULT '',
  `bids` int NOT NULL DEFAULT '0',
  `bidsdeclined` int NOT NULL DEFAULT '0',
  `bidsretracted` int NOT NULL DEFAULT '0',
  `bidsshortlisted` int NOT NULL DEFAULT '0',
  `budgetgroup` varchar(30) NOT NULL DEFAULT '',
  `additional_info` mediumtext,
  `status` enum('draft','open','closed','expired','delisted','wait_approval','approval_accepted','frozen','finished','archived') NOT NULL DEFAULT 'draft',
  `close_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `transfertype` enum('userid','email') NOT NULL DEFAULT 'userid',
  `transfer_to_userid` int NOT NULL DEFAULT '0',
  `transfer_from_userid` int NOT NULL DEFAULT '0',
  `transfer_to_email` varchar(50) NOT NULL DEFAULT '',
  `transfer_status` enum('','pending','accepted','rejected') NOT NULL DEFAULT '',
  `transfer_code` varchar(32) NOT NULL DEFAULT '',
  `project_details` enum('public','invite_only','realtime','unique','penny') NOT NULL DEFAULT 'public',
  `project_type` enum('reverse','forward') NOT NULL DEFAULT 'reverse',
  `project_state` enum('service','product') NOT NULL DEFAULT 'service',
  `bid_details` enum('open','sealed','blind','full') NOT NULL DEFAULT 'open',
  `filter_rating` enum('0','1') NOT NULL DEFAULT '0',
  `filter_country` enum('0','1') NOT NULL DEFAULT '0',
  `filter_state` enum('0','1') NOT NULL DEFAULT '0',
  `filter_city` enum('0','1') NOT NULL DEFAULT '0',
  `filter_zip` enum('0','1') NOT NULL DEFAULT '0',
  `filter_underage` enum('0','1') NOT NULL DEFAULT '0',
  `filter_businessnumber` enum('0','1') NOT NULL DEFAULT '0',
  `filter_bidtype` enum('0','1') NOT NULL DEFAULT '0',
  `filter_budget` enum('0','1') NOT NULL DEFAULT '0',
  `filter_escrow` int NOT NULL DEFAULT '0',
  `filter_gateway` int NOT NULL DEFAULT '0',
  `filter_ccgateway` int NOT NULL DEFAULT '0',
  `filter_offline` int NOT NULL DEFAULT '0',
  `filter_publicboard` enum('0','1') NOT NULL DEFAULT '0',
  `filtered_rating` enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  `filtered_country` varchar(50) NOT NULL DEFAULT '',
  `filtered_state` varchar(50) NOT NULL DEFAULT '',
  `filtered_city` varchar(20) NOT NULL DEFAULT '',
  `filtered_zip` varchar(10) NOT NULL DEFAULT '',
  `filter_bidlimit` int NOT NULL DEFAULT '0',
  `filtered_bidlimit` int NOT NULL DEFAULT '10',
  `filtered_bidtype` enum('entire','hourly','daily','weekly','monthly','lot','weight','item') NOT NULL DEFAULT 'entire',
  `filtered_bidtypecustom` varchar(250) NOT NULL DEFAULT '',
  `filtered_budgetid` int NOT NULL DEFAULT '0',
  `filtered_auctiontype` enum('regular','fixed','classified') NOT NULL DEFAULT 'regular',
  `classified_phone` varchar(32) NOT NULL DEFAULT '',
  `classified_price` double(17,2) NOT NULL DEFAULT '0.00',
  `urgent` int NOT NULL DEFAULT '0',
  `buynow` int NOT NULL DEFAULT '0',
  `buynow_price` double(17,2) NOT NULL DEFAULT '0.00',
  `buynow_qty` int NOT NULL DEFAULT '0',
  `buynow_qty_lot` int NOT NULL DEFAULT '0',
  `items_in_lot` mediumint unsigned NOT NULL DEFAULT '0',
  `buynow_purchases` int NOT NULL DEFAULT '0',
  `reserve` int NOT NULL DEFAULT '0',
  `reserve_price` double(17,2) NOT NULL DEFAULT '0.00',
  `featured` int NOT NULL DEFAULT '0',
  `featured_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `featured_searchresults` int NOT NULL DEFAULT '0',
  `highlite` int NOT NULL DEFAULT '0',
  `bold` int NOT NULL DEFAULT '0',
  `autorelist` int NOT NULL DEFAULT '0',
  `autorelist_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `startprice` double(17,2) NOT NULL DEFAULT '0.00',
  `retailprice` double(10,2) NOT NULL DEFAULT '0.00',
  `uniquebidcount` int NOT NULL DEFAULT '0',
  `paymethod` mediumtext,
  `paymethodcc` mediumtext,
  `paymethodoptions` mediumtext,
  `paymethodoptionsemail` mediumtext,
  `keywords` varchar(250) NOT NULL DEFAULT '',
  `currentprice` double(17,2) NOT NULL DEFAULT '0.00',
  `insertionfee` double(10,2) NOT NULL DEFAULT '0.00',
  `enhancementfee` double(10,2) NOT NULL DEFAULT '0.00',
  `fvf` double(10,2) NOT NULL DEFAULT '0.00',
  `isfvfpaid` int NOT NULL DEFAULT '0',
  `isifpaid` int NOT NULL DEFAULT '0',
  `isenhancementfeepaid` int NOT NULL DEFAULT '0',
  `ifinvoiceid` int NOT NULL DEFAULT '0',
  `enhancementfeeinvoiceid` int NOT NULL DEFAULT '0',
  `fvfinvoiceid` int NOT NULL DEFAULT '0',
  `returnaccepted` int NOT NULL DEFAULT '0',
  `returnwithin` enum('0','3','7','14','30','60') NOT NULL DEFAULT '0',
  `returngivenas` enum('none','exchange','credit','moneyback') NOT NULL DEFAULT 'none',
  `returnshippaidby` enum('none','buyer','seller') NOT NULL DEFAULT 'none',
  `returnpolicy` mediumtext,
  `buyerfeedback` int NOT NULL DEFAULT '0',
  `sellerfeedback` int NOT NULL DEFAULT '0',
  `hasimage` int NOT NULL DEFAULT '0',
  `hasimageslideshow` int NOT NULL DEFAULT '0',
  `hasdigitalfile` int NOT NULL DEFAULT '0',
  `haswinner` int NOT NULL DEFAULT '0',
  `hasbuynowwinner` int NOT NULL DEFAULT '0',
  `winner_user_id` int NOT NULL DEFAULT '0',
  `donation` int NOT NULL DEFAULT '0',
  `charityid` int NOT NULL DEFAULT '0',
  `donationpercentage` int NOT NULL DEFAULT '0',
  `donermarkedaspaid` int NOT NULL DEFAULT '0',
  `donermarkedaspaiddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `donationinvoiceid` int NOT NULL DEFAULT '0',
  `currencyid` int NOT NULL DEFAULT '0',
  `countryid` int NOT NULL DEFAULT '0',
  `country` varchar(250) NOT NULL DEFAULT '',
  `state` varchar(250) NOT NULL DEFAULT '',
  `city` varchar(250) NOT NULL DEFAULT '',
  `zipcode` varchar(50) NOT NULL DEFAULT '',
  `sku` varchar(250) NOT NULL DEFAULT '',
  `upc` varchar(250) NOT NULL DEFAULT '',
  `ean` varchar(250) NOT NULL DEFAULT '',
  `isbn10` varchar(250) NOT NULL DEFAULT '',
  `isbn13` varchar(250) NOT NULL DEFAULT '',
  `partnumber` varchar(250) NOT NULL DEFAULT '',
  `modelnumber` varchar(250) NOT NULL DEFAULT '',
  `salestaxstate` varchar(250) NOT NULL DEFAULT '',
  `salestaxrate` varchar(10) NOT NULL DEFAULT '0',
  `salestaxentirecountry` int NOT NULL DEFAULT '0',
  `salestaxshipping` int NOT NULL DEFAULT '0',
  `countdownresets` int NOT NULL DEFAULT '0',
  `bulkid` int NOT NULL DEFAULT '0',
  `updateid` int NOT NULL DEFAULT '1',
  `storeid` int NOT NULL DEFAULT '0',
  `itemcondition` mediumtext,
  `imageurl` mediumtext,
  `imageurl_attachid` int NOT NULL DEFAULT '0',
  `download_attachid` int NOT NULL DEFAULT '0',
  `itemstatus` int NOT NULL DEFAULT '1',
  `storecid` int NOT NULL DEFAULT '0',
  `tags` varchar(100) NOT NULL,
  `genre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `cid` (`cid`),
  KEY `project_title` (`project_title`),
  KEY `status` (`status`),
  KEY `project_details` (`project_details`),
  KEY `project_type` (`project_type`),
  KEY `project_state` (`project_state`),
  KEY `charityid` (`charityid`),
  KEY `countryid` (`countryid`),
  KEY `zipcode` (`zipcode`),
  KEY `sku` (`sku`),
  KEY `isbn10` (`isbn10`),
  KEY `isbn13` (`isbn13`),
  KEY `partnumber` (`partnumber`),
  KEY `modelnumber` (`modelnumber`),
  KEY `hasimage` (`hasimage`),
  KEY `hasimageslideshow` (`hasimageslideshow`),
  KEY `hasdigitalfile` (`hasdigitalfile`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilance_projects`
--

LOCK TABLES `ilance_projects` WRITE;
/*!40000 ALTER TABLE `ilance_projects` DISABLE KEYS */;
INSERT INTO `ilance_projects` VALUES (40,51515282,0,3,'DES','0',NULL,'2012-10-29 08:55:29','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',1,1,0,'Song Name',0,0,0,0,'',NULL,'draft','0000-00-00 00:00:00','userid',0,0,'','','','public','reverse','service','open','0','0','0','0','0','0','0','0','0',0,0,0,0,'0','1','','','','',0,10,'entire','',0,'regular','',0.00,0,0,15.00,0,0,0,0,0,14.00,0,'0000-00-00 00:00:00',0,0,0,0,'0000-00-00 00:00:00',0.00,0.00,0,NULL,NULL,NULL,NULL,'',0.00,0.00,0.00,0.00,0,0,0,0,0,0,0,'0','none','none',NULL,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,'','','','','','','','','','','','','0',0,0,0,0,1,0,NULL,NULL,0,0,1,0,'Laptop','male'),(41,11515348,0,3,'jkl','0',NULL,'2012-10-29 08:57:01','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',1,1,0,'kjl',0,0,0,0,'',NULL,'draft','0000-00-00 00:00:00','userid',0,0,'','','','public','reverse','service','open','0','0','0','0','0','0','0','0','0',0,0,0,0,'0','1','','','','',0,10,'entire','',0,'regular','',0.00,0,0,15.00,0,0,0,0,0,7.50,0,'0000-00-00 00:00:00',0,0,0,0,'0000-00-00 00:00:00',0.00,0.00,0,NULL,NULL,NULL,NULL,'',0.00,0.00,0.00,0.00,0,0,0,0,0,0,0,'0','none','none',NULL,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,'','','','','','','','','','','','','0',0,0,0,0,1,0,NULL,NULL,0,0,1,0,'Laptop','Female'),(42,86325138,0,3,'dfgdf','0',NULL,'2012-12-23 23:59:19','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',1,1,0,'gdfg',0,0,0,0,'',NULL,'draft','0000-00-00 00:00:00','userid',0,0,'','','','public','reverse','service','open','0','0','0','0','0','0','0','0','0',0,0,0,0,'0','1','','','','',0,10,'entire','',0,'regular','',0.00,0,0,12.00,0,0,0,0,0,12.00,0,'0000-00-00 00:00:00',0,0,0,0,'0000-00-00 00:00:00',0.00,0.00,0,NULL,NULL,NULL,NULL,'',0.00,0.00,0.00,0.00,0,0,0,0,0,0,0,'0','none','none',NULL,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,'','','','','','','','','','','','','0',0,0,0,0,1,0,NULL,NULL,0,0,1,0,'dfg','male'),(43,36325191,0,3,'','0',NULL,'2012-12-24 00:06:04','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',1,1,0,'',0,0,0,0,'',NULL,'draft','0000-00-00 00:00:00','userid',0,0,'','','','public','reverse','service','open','0','0','0','0','0','0','0','0','0',0,0,0,0,'0','1','','','','',0,10,'entire','',0,'regular','',0.00,0,0,0.00,0,0,0,0,0,0.00,0,'0000-00-00 00:00:00',0,0,0,0,'0000-00-00 00:00:00',0.00,0.00,0,NULL,NULL,NULL,NULL,'',0.00,0.00,0.00,0.00,0,0,0,0,0,0,0,'0','none','none',NULL,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,'','','','','','','','','','','','','0',0,0,0,0,1,0,NULL,NULL,0,0,1,0,'sad','male'),(44,26325585,0,3,'','0',NULL,'2012-12-24 00:11:18','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',1,1,0,'kjjkj',0,0,0,0,'',NULL,'draft','0000-00-00 00:00:00','userid',0,0,'','','','public','reverse','service','open','0','0','0','0','0','0','0','0','0',0,0,0,0,'0','1','','','','',0,10,'entire','',0,'regular','',0.00,0,0,0.00,0,0,0,0,0,0.00,0,'0000-00-00 00:00:00',0,0,0,0,'0000-00-00 00:00:00',0.00,0.00,0,NULL,NULL,NULL,NULL,'',0.00,0.00,0.00,0.00,0,0,0,0,0,0,0,'0','none','none',NULL,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,'','','','','','','','','','','','','0',0,0,0,0,1,0,NULL,NULL,0,0,1,0,'sdf','male'),(45,26325897,0,3,'sdfsdf','0',NULL,'2012-12-24 00:11:46','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',1,1,0,'',0,0,0,0,'',NULL,'draft','0000-00-00 00:00:00','userid',0,0,'','','','public','reverse','service','open','0','0','0','0','0','0','0','0','0',0,0,0,0,'0','1','','','','',0,10,'entire','',0,'regular','',0.00,0,0,0.00,0,0,0,0,0,0.00,0,'0000-00-00 00:00:00',0,0,0,0,'0000-00-00 00:00:00',0.00,0.00,0,NULL,NULL,NULL,NULL,'',0.00,0.00,0.00,0.00,0,0,0,0,0,0,0,'0','none','none',NULL,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,'','','','','','','','','','','','','0',0,0,0,0,1,0,NULL,NULL,0,0,1,0,'sdfdsf','male'),(46,56325919,0,3,'','0',NULL,'2012-12-24 00:12:09','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',1,1,0,'',0,0,0,0,'',NULL,'draft','0000-00-00 00:00:00','userid',0,0,'','','','public','reverse','service','open','0','0','0','0','0','0','0','0','0',0,0,0,0,'0','1','','','','',0,10,'entire','',0,'regular','',0.00,0,0,0.00,0,0,0,0,0,0.00,0,'0000-00-00 00:00:00',0,0,0,0,'0000-00-00 00:00:00',0.00,0.00,0,NULL,NULL,NULL,NULL,'',0.00,0.00,0.00,0.00,0,0,0,0,0,0,0,'0','none','none',NULL,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,'','','','','','','','','','','','','0',0,0,0,0,1,0,NULL,NULL,0,0,1,0,'sdf','male'),(47,36325956,0,3,'sdfsdf','0',NULL,'2012-12-24 00:13:17','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',1,1,0,'',0,0,0,0,'',NULL,'draft','0000-00-00 00:00:00','userid',0,0,'','','','public','reverse','service','open','0','0','0','0','0','0','0','0','0',0,0,0,0,'0','1','','','','',0,10,'entire','',0,'regular','',0.00,0,0,0.00,0,0,0,0,0,0.00,0,'0000-00-00 00:00:00',0,0,0,0,'0000-00-00 00:00:00',0.00,0.00,0,NULL,NULL,NULL,NULL,'',0.00,0.00,0.00,0.00,0,0,0,0,0,0,0,'0','none','none',NULL,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,'','','','','','','','','','','','','0',0,0,0,0,1,0,NULL,NULL,0,0,1,0,'sdfsdf','male'),(48,51515287,0,2,'DES','0',NULL,'2020-01-12 08:55:29','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',2,1,0,'project test ankita',0,0,0,0,'',NULL,'draft','0000-00-00 00:00:00','userid',0,0,'','','','public','reverse','service','open','0','0','0','0','0','0','0','0','0',0,0,0,0,'0','1','','','','',0,10,'entire','',0,'regular','',0.00,0,0,15.00,0,0,0,0,0,14.00,0,'0000-00-00 00:00:00',0,0,0,0,'0000-00-00 00:00:00',0.00,0.00,0,NULL,NULL,NULL,NULL,'',0.00,0.00,0.00,0.00,0,0,0,0,0,0,0,'0','none','none',NULL,0,0,0,0,0,0,0,0,0,0,0,0,'0000-00-00 00:00:00',0,0,0,'','','','','','','','','','','','','0',0,0,0,0,1,0,NULL,NULL,0,0,1,0,'Laptop','male');
/*!40000 ALTER TABLE `ilance_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilance_subscription_user`
--

DROP TABLE IF EXISTS `ilance_subscription_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilance_subscription_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subscriptionid` int NOT NULL DEFAULT '1',
  `user_id` int NOT NULL DEFAULT '-1',
  `paymethod` enum('account','bank','visa','amex','mc','disc','paypal','paypal_pro','check','stormpay','cashu','moneybookers') NOT NULL DEFAULT 'account',
  `startdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `renewdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `autopayment` int NOT NULL DEFAULT '1',
  `autorenewal` enum('0','1') NOT NULL DEFAULT '1',
  `active` enum('yes','no','cancelled') NOT NULL DEFAULT 'no',
  `cancelled` int NOT NULL DEFAULT '0',
  `migrateto` int NOT NULL DEFAULT '0',
  `migratelogic` enum('none','waived','unpaid','paid') NOT NULL DEFAULT 'none',
  `recurring` int NOT NULL DEFAULT '0',
  `invoiceid` int NOT NULL DEFAULT '0',
  `roleid` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `subscriptionid` (`subscriptionid`),
  KEY `user_id` (`user_id`),
  KEY `paymethod` (`paymethod`),
  KEY `active` (`active`),
  KEY `migratelogic` (`migratelogic`),
  KEY `invoiceid` (`invoiceid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilance_subscription_user`
--

LOCK TABLES `ilance_subscription_user` WRITE;
/*!40000 ALTER TABLE `ilance_subscription_user` DISABLE KEYS */;
INSERT INTO `ilance_subscription_user` VALUES (1,1,2,'account','2012-10-22 04:43:03','2013-10-23 04:43:03',1,'1','yes',0,0,'none',0,0,1),(2,1,3,'account','2012-10-22 04:45:20','2013-10-23 04:45:20',1,'1','yes',0,0,'none',0,2,1),(3,1,4,'account','2012-10-22 05:06:39','2013-10-23 05:06:39',1,'1','yes',0,0,'none',0,3,1),(4,1,5,'account','2012-10-22 05:09:09','2013-10-23 05:09:09',1,'1','yes',0,0,'none',0,4,1),(5,1,6,'account','2012-10-22 05:12:55','2013-10-23 05:12:56',1,'1','yes',0,0,'none',0,5,1),(6,1,7,'account','2012-10-22 05:13:44','2013-10-23 05:13:44',1,'1','yes',0,0,'none',0,6,1),(7,1,8,'account','2012-10-23 04:14:33','2013-10-24 04:14:34',1,'1','yes',0,0,'none',0,7,1);
/*!40000 ALTER TABLE `ilance_subscription_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilance_users`
--

DROP TABLE IF EXISTS `ilance_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilance_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(25) NOT NULL DEFAULT '',
  `iprestrict` int NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `salt` varchar(5) NOT NULL DEFAULT '',
  `secretquestion` varchar(200) NOT NULL DEFAULT '',
  `secretanswer` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL DEFAULT '',
  `address2` varchar(200) DEFAULT NULL,
  `city` varchar(100) NOT NULL DEFAULT '',
  `state` varchar(100) NOT NULL DEFAULT '',
  `zip_code` varchar(10) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `country` int NOT NULL DEFAULT '500',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subcategories` mediumtext,
  `status` enum('active','suspended','cancelled','unverified','banned','moderated') NOT NULL DEFAULT 'active',
  `serviceawards` int NOT NULL DEFAULT '0',
  `productawards` int NOT NULL DEFAULT '0',
  `servicesold` int NOT NULL DEFAULT '0',
  `productsold` int NOT NULL DEFAULT '0',
  `rating` double NOT NULL DEFAULT '0',
  `score` int NOT NULL DEFAULT '0',
  `feedback` double NOT NULL DEFAULT '0',
  `bidstoday` int NOT NULL DEFAULT '0',
  `bidsthismonth` int NOT NULL DEFAULT '0',
  `auctiondelists` int NOT NULL DEFAULT '0',
  `bidretracts` int NOT NULL DEFAULT '0',
  `lastseen` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dob` date NOT NULL DEFAULT '0000-00-00',
  `rid` varchar(10) NOT NULL DEFAULT '',
  `account_number` varchar(25) NOT NULL DEFAULT '',
  `available_balance` double(17,2) NOT NULL DEFAULT '0.00',
  `total_balance` double(17,2) NOT NULL DEFAULT '0.00',
  `income_reported` double(17,2) NOT NULL DEFAULT '0.00',
  `income_spent` double(17,2) NOT NULL DEFAULT '0.00',
  `startpage` varchar(250) NOT NULL DEFAULT 'main',
  `styleid` int NOT NULL,
  `project_distance` int NOT NULL DEFAULT '1',
  `currency_calculation` int NOT NULL DEFAULT '1',
  `languageid` int NOT NULL,
  `currencyid` int NOT NULL,
  `timezone` varchar(250) NOT NULL,
  `notifyservices` int NOT NULL,
  `notifyproducts` int NOT NULL,
  `notifyservicescats` mediumtext,
  `notifyproductscats` mediumtext,
  `lastemailservicecats` date NOT NULL DEFAULT '0000-00-00',
  `lastemailproductcats` date NOT NULL DEFAULT '0000-00-00',
  `displayprofile` int NOT NULL,
  `emailnotify` int NOT NULL,
  `displayfinancials` int NOT NULL,
  `vatnumber` varchar(250) NOT NULL,
  `regnumber` varchar(250) NOT NULL,
  `dnbnumber` varchar(250) NOT NULL,
  `companyname` varchar(100) NOT NULL,
  `usecompanyname` int NOT NULL,
  `timeonsite` int NOT NULL,
  `daysonsite` int NOT NULL,
  `isadmin` int NOT NULL DEFAULT '0',
  `permissions` mediumtext,
  `searchoptions` mediumtext,
  `rateperhour` double(10,2) NOT NULL DEFAULT '0.00',
  `profilevideourl` mediumtext,
  `profileintro` mediumtext,
  `gender` enum('','male','female') NOT NULL DEFAULT '',
  `freelancing` enum('','individual','business') NOT NULL DEFAULT '',
  `autopayment` int NOT NULL DEFAULT '1',
  `posthtml` int NOT NULL DEFAULT '0',
  `username_history` mediumtext,
  `password_lastchanged` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `role` int NOT NULL DEFAULT '0',
  `store` int NOT NULL DEFAULT '0',
  `store_pay` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `zip_code` (`zip_code`),
  KEY `country` (`country`),
  KEY `rating` (`rating`),
  KEY `city` (`city`),
  KEY `state` (`state`),
  KEY `status` (`status`),
  KEY `serviceawards` (`serviceawards`),
  KEY `score` (`score`),
  KEY `gender` (`gender`),
  KEY `freelancing` (`freelancing`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilance_users`
--

LOCK TABLES `ilance_users` WRITE;
/*!40000 ALTER TABLE `ilance_users` DISABLE KEYS */;
INSERT INTO `ilance_users` VALUES (1,'',0,'admin','85db96ea4df0cafc47254bdab484de3f','*YW%Z','','','prasad@ilancecustomization.com','','','',NULL,'','','','1-111-111-1111',500,'2012-10-16 16:36:07',NULL,'active',0,0,0,0,0,0,0,0,0,0,0,'2012-12-26 23:23:56','0000-00-00','','8706297133857',0.00,0.00,0.00,0.00,'main',1,1,0,1,1,'America/New_York',0,0,NULL,NULL,'0000-00-00','0000-00-00',0,1,0,'0','0','0','N/A',0,0,0,1,NULL,NULL,0.00,NULL,NULL,'','',1,1,NULL,'0000-00-00 00:00:00',0,0,0),(2,'127.0.0.1',0,'asas','698252e0eea968cc2294e7d0e6b04ca8','UQAYA','','','asas','','','','','','Ontario','','',330,'2012-10-22 04:43:03',NULL,'unverified',0,0,0,0,0,0,0,0,0,0,0,'2012-10-22 04:43:03','0000-00-00','QGZROE','IL2981986281934',0.00,0.00,0.00,0.00,'main',1,1,1,1,1,'America/Toronto',0,0,'','','0000-00-00','0000-00-00',1,1,0,'','','','',0,0,0,0,NULL,NULL,0.00,NULL,NULL,'','',1,0,NULL,'0000-00-00 00:00:00',0,0,0),(3,'127.0.0.1',0,'asasdf','948b6f01d27ab9003d76bccb6946305f','{@Wy&','','','asasdf','','','','','','Ontario','','',330,'2012-10-22 04:45:20',NULL,'unverified',0,0,0,0,0,0,0,0,0,0,0,'2012-10-22 04:45:20','0000-00-00','QCEOUJ','IL4602636374235',0.00,0.00,0.00,0.00,'main',1,1,1,1,1,'America/Toronto',0,0,'','','0000-00-00','0000-00-00',1,1,0,'','','','',0,0,0,0,NULL,NULL,0.00,NULL,NULL,'','',1,0,NULL,'0000-00-00 00:00:00',2,0,0),(4,'127.0.0.1',0,'prasad','a1fab5568bc5567f4107f589062520ef','57^pB','','','kprasadbe@gmail.com','','','','','','Ontario','','',330,'2012-10-22 05:06:39',NULL,'active',0,0,0,0,0,0,0,0,0,0,0,'2012-10-22 05:06:39','0000-00-00','MONTAG','IL9604385557097',0.00,0.00,0.00,0.00,'main',1,1,1,1,1,'America/Toronto',0,0,'','','0000-00-00','0000-00-00',1,1,0,'','','','',0,0,0,0,NULL,NULL,0.00,NULL,NULL,'','',1,0,NULL,'0000-00-00 00:00:00',2,0,0),(5,'127.0.0.1',0,'ravish','3ca821c65e00894d75e22303b6357a9e','{^JKv','','','kprasadbe@gmail.comd','','','','','','Ontario','','',330,'2012-10-22 05:09:09',NULL,'active',0,0,0,0,0,0,0,0,0,0,0,'2012-10-22 05:09:09','0000-00-00','APIDSG','IL9322186446382',0.00,0.00,0.00,0.00,'main',1,1,1,1,1,'America/Toronto',0,0,'','','0000-00-00','0000-00-00',1,1,0,'','','','',0,0,0,0,NULL,NULL,0.00,NULL,NULL,'','',1,0,NULL,'0000-00-00 00:00:00',2,0,0),(6,'127.0.0.1',0,'asasdfs','1dba9b8f5c237063a754fb323e17b56a','f?7DZ','','','prasan_1327040101_per@gmail.com','','','','','','Ontario','','',330,'2012-10-22 05:12:55',NULL,'active',0,0,0,0,0,0,0,0,0,0,0,'2012-10-22 05:12:55','0000-00-00','NRNFAJ','IL8859963475747',0.00,0.00,0.00,0.00,'main',1,1,1,1,1,'America/Toronto',0,0,'','','0000-00-00','0000-00-00',1,1,0,'','','','',0,0,0,0,NULL,NULL,0.00,NULL,NULL,'','',1,0,NULL,'0000-00-00 00:00:00',2,0,0),(7,'127.0.0.1',0,'prasadk','d44d35dfed03f1299d63aa59e9c3812d','}*8.;','','','prasad@keer.ana','','','','','','Ontario','','',330,'2012-10-22 05:13:44',NULL,'active',0,0,0,0,0,0,0,0,0,0,0,'2012-10-22 05:13:44','0000-00-00','DLPNQE','IL6968465832587',0.00,0.00,0.00,0.00,'main',1,1,1,1,1,'America/Toronto',0,0,'','','0000-00-00','0000-00-00',1,1,0,'','','','',0,0,0,0,NULL,NULL,0.00,NULL,NULL,'','',1,0,NULL,'0000-00-00 00:00:00',2,0,0),(8,'127.0.0.1',0,'prasads','ead94c50549fae56d5a5ad4146850104','Ny?aP','','','prasad@keer.anas','','','','','','Ontario','','',330,'2012-10-23 04:14:33',NULL,'active',0,0,0,0,0,0,0,0,0,0,0,'2012-10-23 04:14:33','0000-00-00','ZSEIOK','IL5081502786828',0.00,0.00,0.00,0.00,'main',1,1,1,1,1,'America/Toronto',0,0,'','','0000-00-00','0000-00-00',1,1,0,'','','','',0,0,0,0,NULL,NULL,0.00,NULL,NULL,'','',1,0,NULL,'0000-00-00 00:00:00',2,0,0);
/*!40000 ALTER TABLE `ilance_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-17 16:01:38
