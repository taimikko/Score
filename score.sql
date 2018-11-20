-- MySQL dump 10.14  Distrib 5.5.47-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: score
-- ------------------------------------------------------
-- Server version	5.5.47-MariaDB-1~wheezy

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `score`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `score` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci */;

USE `score`;

--
-- Table structure for table `Persistent_Logins`
--

DROP TABLE IF EXISTS `Persistent_Logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Persistent_Logins` (
  `username` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `series` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persistent_Logins`
--

LOCK TABLES `Persistent_Logins` WRITE;
/*!40000 ALTER TABLE `Persistent_Logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `Persistent_Logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jasen_tyyppi`
--

DROP TABLE IF EXISTS `jasen_tyyppi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jasen_tyyppi` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tyyppi` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `kuvaus` varchar(200) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jasen_tyyppi`
--

LOCK TABLES `jasen_tyyppi` WRITE;
/*!40000 ALTER TABLE `jasen_tyyppi` DISABLE KEYS */;
INSERT INTO `jasen_tyyppi` VALUES (1,'tuntematon','Jäsenyyden tyyppi ei ole tiedossa'),(2,'jäsen','Jäsenet alle 50v'),(3,'seniori','Jäsenet 50v ja yli'),(4,'ulkojäsen','Jäsenellä ei ole pelioikeutta'),(5,'kunniajäsen',''),(6,'entinen jäsen',''),(9,'pro','Seuran pro');
/*!40000 ALTER TABLE `jasen_tyyppi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kayttaja`
--

DROP TABLE IF EXISTS `kayttaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kayttaja` (
  `kayttaja_id` int(11) NOT NULL AUTO_INCREMENT,
  `kayttajatunnus` varchar(36) COLLATE utf8_swedish_ci NOT NULL,
  `encryted_password` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `enabled` bit(1) NOT NULL DEFAULT b'0',
  `seura_id` int(11) NOT NULL,
  `jasennumero` int(11) NOT NULL,
  `etunimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `sukunimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `sukup` int(1) DEFAULT NULL,
  `jasen_tyyppi` int(11) NOT NULL,
  PRIMARY KEY (`kayttaja_id`),
  UNIQUE KEY `kayttaja_uk1` (`kayttajatunnus`),
  UNIQUE KEY `kayttaja_uk2` (`seura_id`,`jasennumero`),
  KEY `key_jasen_tyyppi` (`jasen_tyyppi`),
  CONSTRAINT `key_jasen_tyyppi` FOREIGN KEY (`jasen_tyyppi`) REFERENCES `jasen_tyyppi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kayttaja`
--

LOCK TABLES `kayttaja` WRITE;
/*!40000 ALTER TABLE `kayttaja` DISABLE KEYS */;
INSERT INTO `kayttaja` VALUES (1,'pro','$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu','',78,1,'Pekka','Pro',1,2),(4,'s','$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu','',78,3007,'S','Saarinen',1,1),(7,'m','$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu','',78,4,'Manager','Manager',1,1),(8,'dbadmin1','$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu','',78,9,'Admin','admin',1,2),(14,'msa','$2a$10$OSt/z4L9cysp9GQ.LeMKsOyjCFeJRIzZtu0xGQL51qIXqQCPXSVIC','',78,2566,'Mikko','Saarinen',1,3),(36,'pro2','$2a$10$FbNytBqC.OQwdDPEbZ56FO/JXLGwaNw7GsAJ.3v1q8Q.lojFQr5MK','',78,2,'Paula','Pro',1,1),(37,'b','$2a$10$ONVPzbpNzS5NWOx8cXKv3Or9lmg.ZG.tWchGGJ4h1LXzhrQzjNYGq','',78,9990,'b','Virtanen',1,2),(51,'z','$2a$10$0hyiUVjPyl2H50vBCkU2eujrkZ8d87LnmPdfPHVZxazHh/NfCCN5a','',78,7777,'z','z',1,1),(53,'zorro','$2a$10$/I888ottm9fPLQPy7HqRB.LSXNp5vqMSW4Uyc0GNZpI7j9kJpj9ca','',78,77,'zorro','zorro',3,2),(56,'jp','$2a$10$KShP3Qo8/OewgpT8o3xZfuxisURYdkUbcic9W53xcsQtZ4ddxosuq','',78,9874,'Jukka-pekka-Veli-matti','Pitkänimi-yhdyssana-Virtanen von Herzen',1,1),(57,'st','$2a$10$esPp3/Tef4NCVHGFxRLa5O3VaTCZki4OmA55ggIdlyA43sl5QMbe2','',78,9873,'Sisko-Tuulikki-Avo-meri','Pitkänimi-yhdyssana-Virtanen von Herzen',2,2),(72,'admin','$2a$10$cBFAF5LSUOL3gi/aljKJYOM4Nyw1Pm9Txpalx.J6kfM2eF.9JV7Fe','',66,1,'Admin','Admin',1,2),(81,'a','$2a$10$yUmHcGmEHfBZMo2iUwMhr.7NUo/Cl1jPBrL0KVWDJsU662J.ZltJC','',999,1,'Aku','Ankka',3,3),(82,'i','$2a$10$y4fPYw0zcREChNKzk6taReOrkPcJzlcS76h9lddnxH/G..G9Z26Du','',999,2,'Iines','Ankka',3,2),(84,'q','$2a$10$ueFeHP4HX8utm8SpZHG8buw1kHHPI4y84o8tPfqKjWPTMuYLFiahy','',999,3,'quo','vadis',3,3),(85,'v','$2a$10$M2xR7mL.3avQmlKeghA5A.ud4VsTdP3KER//VlYraBvP8JAf0VdH6','',82,1,'veikko','vaasalainen',3,3),(86,'w','$2a$10$mhISLtw2vfM/aSP.o/Dm7eqYZhJh20tSLopp4cXs.Zj7l1Y99oH92','',82,2,'Wihtori','vaasasta',3,3);
/*!40000 ALTER TABLE `kayttaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kayttaja_rooli`
--

DROP TABLE IF EXISTS `kayttaja_rooli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kayttaja_rooli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kayttaja_id` int(11) NOT NULL,
  `rooli_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kayttaja_rooli_uk` (`kayttaja_id`,`rooli_id`),
  KEY `kayttaja_rooli_fk2` (`rooli_id`),
  CONSTRAINT `kayttaja_rooli_fk1` FOREIGN KEY (`kayttaja_id`) REFERENCES `kayttaja` (`kayttaja_id`) ON DELETE CASCADE,
  CONSTRAINT `kayttaja_rooli_fk2` FOREIGN KEY (`rooli_id`) REFERENCES `rooli` (`rooli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kayttaja_rooli`
--

LOCK TABLES `kayttaja_rooli` WRITE;
/*!40000 ALTER TABLE `kayttaja_rooli` DISABLE KEYS */;
INSERT INTO `kayttaja_rooli` VALUES (174,1,3),(4,4,3),(6,7,2),(11,7,3),(184,8,1),(185,8,2),(186,8,3),(182,14,3),(34,36,3),(178,37,3),(130,51,3),(189,53,3),(172,56,3),(173,57,3),(162,72,1),(163,72,3),(175,81,3),(181,82,3),(188,84,3),(190,85,3),(192,86,3);
/*!40000 ALTER TABLE `kayttaja_rooli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kentta`
--

DROP TABLE IF EXISTS `kentta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kentta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seura_id` int(11) NOT NULL DEFAULT '0',
  `kentan_lyhenne` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `kentan_nimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key_seura_id` (`seura_id`),
  CONSTRAINT `key_seura_id` FOREIGN KEY (`seura_id`) REFERENCES `seura` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kentta`
--

LOCK TABLES `kentta` WRITE;
/*!40000 ALTER TABLE `kentta` DISABLE KEYS */;
INSERT INTO `kentta` VALUES (1,1,'AGC','Anola Golf Club'),(2,2,'SCG','Santa Claus Golf'),(3,3,'AulG','Aulanko Golf'),(4,4,'AG','Aura Golf'),(5,5,'BG','Botnia Golf'),(6,6,'EGs','Espoon Golfseura'),(7,7,'ERG','Espoo Ringside Golf'),(8,8,'EPG','Etelä-Pohjanmaan Golf'),(9,9,'G-P','Golf-Porrassalmi'),(10,10,'GT','Golf Talma'),(11,11,'G-V','Golf-Virrat'),(12,12,'GG','Gumböle Golf'),(13,13,'HG','Hangon Golf'),(14,14,'HkGk','Hartolan Golfklubi'),(15,15,'HeGk','Helsingin Golfklubi'),(16,16,'HkG','Hiekkaharju Golf'),(18,18,'HyG','Hyvinkään Golf'),(19,19,'IkG','Ikaalisten Golf'),(20,20,'ImG','Imatran Golf'),(22,22,'Jy-G','Jyväs-Golf'),(23,23,'JGs','Järviseudun Golfseura'),(24,24,'KajG','Kajaanin Golf'),(25,25,'KalG','Kalajokilaakson Golf'),(26,26,'KarG','Karelia Golf'),(27,27,'KartG','Kartanogolf'),(28,28,'KatiG','Katinkulta Golf'),(29,29,'KeriG','Kerigolf'),(30,30,'KokG','Kokkolan Golf'),(32,32,'KosG','Koski-Golf'),(33,33,'KurG','Kurk Golf'),(35,35,'KyG','Kymen Golf'),(36,36,'LahG','Lahden Golf'),(37,37,'LPG','Laukaan Peurunkagolf'),(39,39,'LoG','Loimijoki Golf'),(40,40,'KGK','Kemin Golf Klubi'),(41,41,'MGC','Master Golf Club'),(42,42,'MLG','Meri-Lapin Golfklubi'),(43,43,'MTG','Meri-Teijo Golf'),(44,44,'MeG','Messilä Golf'),(45,45,'MiG','Mikkelin Golf'),(46,46,'NeG','Nevas Golf'),(47,47,'TaG','Tahko Golf'),(48,48,'NCGC','Nordcenter Golf & Country Club'),(49,49,'NGk','Nurmijärven Golfklubi'),(50,50,'OGk','Oulun Golfkerho'),(51,51,'OGs','Outokummun Golfseura'),(52,52,'PaG','Paltamo Golf'),(53,53,'PelG','Peltola Golf'),(54,54,'PeG','Peuramaa Golf'),(55,55,'PicG','Pickala Golf'),(56,56,'PieG','Pielis-Golf'),(57,57,'JG-PG','Jakobstads Golf - Pietarsaaren Golf'),(58,58,'PirG','Pirkanmaan Golf'),(59,59,'PGk','Porin Golfkerho'),(60,60,'TarG','TarinaGolf'),(61,61,'RaG','Raahentienoon Golf'),(62,62,'KanG','Kankaisten Golf'),(63,63,'RaG','Rauma Golf'),(64,64,'MuG','Muurame Golf'),(65,65,'PoG','Porvoo Golf'),(66,66,'Rock','NRG Rock'),(67,67,'KuG','Kuusamo Golf'),(68,68,'RuG','Ruukkigolf'),(69,69,'SaG','Salo Golf'),(70,70,'SGk','Sarfvik Golfklubi ry'),(71,71,'RanG','Rantasalmi Golf'),(72,72,'SGR','Sea Golf Rönnäs'),(73,73,'HG&C','Harjattula Golf & Country Club'),(74,74,'ArGC','Archipelagia Golf Club'),(75,75,'StLGC','St. Lake Golf Club'),(76,76,'StLG','St. Laurence Golf'),(77,77,'SHG','Suur-Helsingin Golf'),(78,78,'TG','Tammer-Golf'),(79,79,'TawG','Tawast Golf'),(80,80,'TuGk','Tuusulan Golfklubi'),(81,81,'UGK','Uudenkaupungin GK'),(83,83,'järvi','LGV Järvenranta'),(84,84,'KG','Keimola Golf'),(86,86,'VGs','Vierumän Golfseura'),(87,87,'ViG','Viipurin Golf'),(88,88,'VirG','Virvik Golf'),(89,89,'WGC','Wiurila Golf & Country Club'),(90,90,'Y-SG','Ylä-Savon Golfseura'),(91,91,'YG','Yyteri Golf'),(92,92,'ÅGk','Ålands Golfklubb'),(93,93,'ÄG','Ähtärin Golf'),(95,95,'NSG','Nivalan Seudun Golf'),(96,96,'ViGC','Vihti Golf Club'),(98,98,'KKG','Kotojärven Kartanogolf'),(99,99,'VGH','Vuosaari Golf Helsinki'),(100,100,'HiG','Hiisi-Golf'),(101,101,'NakG','Nakkila Golf'),(102,102,'KuoG','Kuortane Golf'),(103,103,'HG&A','Härmä Golf & Academy'),(104,104,'GPi','Golf Pirkkala'),(105,105,'IiG','Iitti Golf'),(106,106,'EeG','Eerikkala Golf'),(107,107,'KuGC','Kullo Golf Club'),(108,108,'KytG','Kytäjä Golf'),(109,109,'HatG','Hattula Golf'),(110,110,'HSGC','Hill Side Golf & Country Club'),(111,111,'HirG','Hirsala Golf'),(112,112,'LamG','Lampila Golf'),(113,113,'RevG','Revontuli Golf'),(114,114,'ReGC','Remson Golf Club'),(115,115,'KV','Kanavagolf Vääksy'),(116,116,'LiG','Linna Golf'),(117,117,'AuG','Aurinko Golf'),(118,118,'HGM','Hirvihaara Golf Mäntsälä'),(119,119,'VäG','Värö Golf - Väyrin Golf'),(120,120,'PuuG','PuulaGolf'),(122,122,'LeG','Levi Golf'),(123,123,'HIFK','Paloheinä Golf / HIFK Golf '),(124,124,'VirG','Virpiniemi Golf'),(125,125,'AlG','Alastaro Golf'),(126,126,'LeG','Lepaa Golf'),(127,127,'KGCN','Kultaranta Golf Club Naantali ry'),(128,128,'TiG','Tiirin Golf'),(129,129,'EkeG','Eke Golf ry'),(130,130,'KaG','Kaakon Golf'),(131,131,'OulG','Oulujokilaakson Golf'),(132,132,'HCGS','Holiday Club Golf Saimaa'),(134,134,'TapG','Tapiola Golf'),(136,136,'HimG','Himos-Patalahti Golf'),(138,138,'VGp','Vantaan Golfpuisto'),(139,139,'EcG','Eckerö Golf'),(140,140,'LöG','Löfkulla Golf'),(141,141,'LGs','Leppävirran Golfseura'),(183,83,'pelto','LGV Pirunpelto'),(266,66,'River','NRG River'),(282,82,'K+S','VG Keltainen+Sininen'),(283,82,'K+V','VG Keltainen+Valkoinen'),(284,82,'K','VG Keltainen'),(285,82,'S+V','VG Sininen+Valkoinen'),(286,82,'S+K','VG Sininen+Keltainen'),(287,82,'S','VG Sininen'),(288,82,'V+K','VG Valkoinen+Keltainen'),(289,82,'V+S','VG Valkoinen+Sininen'),(290,82,'V','VG Valkoinen'),(500,999,'Edu','Eduix testikenttä');
/*!40000 ALTER TABLE `kentta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kierros`
--

DROP TABLE IF EXISTS `kierros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kierros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pvm` date NOT NULL DEFAULT '2000-01-01',
  `seura_id` int(11) NOT NULL DEFAULT '0',
  `jasennumero` int(11) NOT NULL DEFAULT '0',
  `kentta_id` int(11) DEFAULT '0',
  `tasoitus` decimal(4,1) NOT NULL,
  `tii_id` int(11) NOT NULL DEFAULT '0',
  `pelitasoitus` int(3) DEFAULT NULL,
  `cba` decimal(3,1) DEFAULT '0.0',
  `h1` int(3) DEFAULT NULL,
  `h2` int(3) DEFAULT NULL,
  `h3` int(3) DEFAULT NULL,
  `h4` int(3) DEFAULT NULL,
  `h5` int(3) DEFAULT NULL,
  `h6` int(3) DEFAULT NULL,
  `h7` int(3) DEFAULT NULL,
  `h8` int(3) DEFAULT NULL,
  `h9` int(3) DEFAULT NULL,
  `h_out` int(3) DEFAULT NULL,
  `h10` int(3) DEFAULT NULL,
  `h11` int(3) DEFAULT NULL,
  `h12` int(3) DEFAULT NULL,
  `h13` int(3) DEFAULT NULL,
  `h14` int(3) DEFAULT NULL,
  `h15` int(3) DEFAULT NULL,
  `h16` int(3) DEFAULT NULL,
  `h17` int(3) DEFAULT NULL,
  `h18` int(3) DEFAULT NULL,
  `h_in` int(3) DEFAULT NULL,
  `yhteensa` int(3) DEFAULT NULL,
  `merkitsija` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `lisatieto` varchar(200) COLLATE utf8_swedish_ci DEFAULT NULL,
  `p1` int(1) DEFAULT NULL,
  `p2` int(1) DEFAULT NULL,
  `p3` int(1) DEFAULT NULL,
  `p4` int(1) DEFAULT NULL,
  `p5` int(1) DEFAULT NULL,
  `p6` int(1) DEFAULT NULL,
  `p7` int(1) DEFAULT NULL,
  `p8` int(1) DEFAULT NULL,
  `p9` int(1) DEFAULT NULL,
  `p_out` int(2) DEFAULT NULL,
  `p10` int(1) DEFAULT NULL,
  `p11` int(1) DEFAULT NULL,
  `p12` int(1) DEFAULT NULL,
  `p13` int(1) DEFAULT NULL,
  `p14` int(1) DEFAULT NULL,
  `p15` int(1) DEFAULT NULL,
  `p16` int(1) DEFAULT NULL,
  `p17` int(1) DEFAULT NULL,
  `p18` int(1) DEFAULT NULL,
  `p_in` int(2) DEFAULT NULL,
  `p_yht` int(3) DEFAULT NULL,
  `tasoituskierros` int(1) DEFAULT NULL,
  `uusi_tasoitus` decimal(4,1) DEFAULT NULL,
  `pelattu` int(1) DEFAULT NULL,
  `etunimi` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `sukunimi` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kierros_uk1` (`seura_id`,`jasennumero`,`pvm`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kierros`
--

LOCK TABLES `kierros` WRITE;
/*!40000 ALTER TABLE `kierros` DISABLE KEYS */;
INSERT INTO `kierros` VALUES (55,'2018-10-01',78,2566,500,14.0,123,11,0.0,7,7,7,7,7,7,7,7,7,63,3,3,3,3,3,3,3,3,3,27,90,'uusi90','uusi90',1,0,0,0,0,1,0,0,0,2,4,3,5,3,2,4,4,2,4,31,33,1,10.5,2,'Mikko','Saarinen'),(73,'2017-05-15',78,2566,78,15.8,30,16,0.0,6,6,6,6,6,6,6,6,6,54,6,5,5,5,5,5,6,6,6,49,103,'6','pisteet 21',2,1,1,1,1,2,0,1,0,9,1,1,3,2,0,2,2,0,1,12,21,0,0.0,3,'Mikko','Saarinen'),(88,'2018-10-30',78,9873,78,50.0,32,48,0.0,8,8,8,8,8,8,8,8,8,72,0,0,0,0,0,0,0,0,0,0,72,'','testi',2,1,1,0,1,2,0,1,0,8,0,0,0,0,0,0,0,0,0,0,8,1,50.0,1,'Sisko-Tuulikki-Avo-meri','Pitkänimi-yhdyssana-Virtanen'),(94,'2018-10-09',999,2,282,54.0,53,51,0.0,9,9,9,9,9,9,9,9,9,81,0,0,0,0,0,0,0,0,0,0,81,'','iines',1,0,0,0,0,1,0,0,0,2,0,0,0,0,0,0,0,0,0,0,2,0,NULL,1,'Iines','Ankka'),(102,'2018-11-05',66,1,66,50.0,15,61,0.0,67,7,6,7,6,7,6,7,6,119,0,0,0,0,0,0,0,0,0,0,119,'','67',0,0,1,0,1,0,1,0,1,4,0,0,0,0,0,0,0,0,0,0,4,0,0.0,1,'Admin','Admin'),(108,'2018-10-08',999,1,500,50.0,123,51,0.0,7,7,7,7,7,7,7,7,7,63,0,0,0,0,0,0,0,0,0,0,63,'','uusi7',3,2,2,2,2,3,1,2,1,18,0,0,0,0,0,0,0,0,0,0,18,0,NULL,1,'Admin','Admin'),(109,'2018-08-06',999,1,78,50.0,30,54,0.0,9,8,7,8,9,8,7,8,9,73,0,0,0,0,0,0,0,0,0,0,73,'','',1,1,2,1,0,2,2,1,0,10,0,0,0,0,0,0,0,0,0,0,10,0,0.0,1,'Aku','Ankka'),(130,'2018-11-06',78,9,500,22.1,123,20,0.0,6,6,6,6,6,6,6,6,6,54,0,0,0,0,0,0,0,0,0,0,54,'','',2,1,1,1,2,2,1,1,0,11,0,0,0,0,0,0,0,0,0,0,11,0,0.0,3,'Admin','Admin'),(133,'2018-11-06',78,7777,500,12.0,123,9,0.0,4,5,6,3,4,5,6,5,4,42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,42,'','',3,2,1,4,3,2,1,2,3,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,21,0,NULL,1,'z','z'),(134,'2018-11-05',78,2566,78,17.6,30,18,0.0,7,6,7,7,7,5,7,6,3,55,4,4,4,4,4,4,4,4,4,36,91,'','testing...',1,1,0,0,0,3,0,1,3,9,3,2,4,3,2,3,4,2,3,26,35,1,12.5,1,'Mikko','Saarinen'),(135,'2018-11-09',78,77,500,44.1,121,48,0.0,6,6,6,6,6,6,6,6,6,54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,54,'','',4,3,3,2,3,4,2,3,1,25,0,0,0,0,0,0,0,0,0,0,25,0,NULL,3,'zorro','zorro'),(142,'2018-05-08',999,3,500,54.0,121,59,0.0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,7,7,7,7,7,7,7,7,7,63,63,'','',0,0,0,0,0,0,0,0,0,0,2,1,3,2,1,3,3,1,3,19,19,0,NULL,2,'quo','vadis'),(144,'2018-03-20',999,3,78,54.0,32,52,0.0,8,8,8,8,8,8,8,8,5,69,8,8,8,8,8,8,8,8,8,72,141,'','',2,1,1,1,1,2,0,1,3,12,1,0,2,1,0,1,2,0,1,8,20,1,0.0,3,'quo','vadis'),(146,'2018-09-04',999,3,500,54.0,121,59,0.0,6,6,6,6,6,6,6,6,6,54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,54,'','',5,3,4,3,4,4,3,3,2,31,0,0,0,0,0,0,0,0,0,0,31,0,NULL,1,'quo','vadis'),(147,'2017-09-05',999,3,500,54.0,123,55,0.0,9,8,9,8,9,8,9,8,9,77,8,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,94,'','',1,1,0,1,1,2,0,1,0,7,1,0,0,0,0,0,0,0,0,1,8,1,NULL,1,'quo','vadis'),(148,'2018-09-03',82,1,282,54.0,44,60,0.0,6,6,6,6,6,6,6,6,7,55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,55,'','',5,3,2,3,4,4,4,2,2,29,0,0,0,0,0,0,0,0,0,0,29,1,NULL,1,'Veikko','Vaasasta'),(149,'2018-11-12',82,2,282,50.0,52,52,0.0,6,6,6,6,6,6,6,6,6,54,0,0,0,0,0,0,0,0,0,0,54,'','',4,3,2,3,3,4,3,2,2,26,0,0,0,0,0,0,0,0,0,0,26,1,0.0,1,'Wihtori','Vaasasta'),(150,'2018-09-03',999,3,266,54.0,23,61,0.0,7,7,7,7,7,7,4,7,7,60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,60,'','',1,3,2,2,4,3,4,2,4,25,0,0,0,0,0,0,0,0,0,0,25,0,NULL,1,'quo','vadis'),(152,'2018-09-04',78,2566,500,14.0,121,15,0.0,6,5,5,5,5,5,5,5,3,44,5,5,7,4,4,5,6,4,5,45,89,'','',2,2,2,2,2,3,1,2,3,19,2,1,1,3,1,2,2,1,2,15,34,1,14.0,3,'Mikko','Saarinen'),(153,'2018-11-16',999,3,500,33.7,123,33,0.0,6,6,6,6,6,6,6,12,8,62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,62,'','',3,2,2,2,2,3,1,0,0,15,0,0,0,0,0,0,0,0,0,0,15,1,33.8,3,'quo','vadis'),(154,'2018-11-06',78,2566,78,14.0,30,14,0.0,6,7,5,6,5,6,5,6,5,51,6,5,6,4,5,4,5,6,7,48,99,'65','',2,0,2,1,2,2,1,1,0,11,1,1,2,3,0,3,3,0,0,13,24,0,NULL,3,'Mikko','Saarinen'),(155,'2018-08-07',78,9990,78,45.0,30,48,0.0,7,7,7,7,7,7,7,7,7,63,7,7,7,7,7,7,7,7,7,63,126,'','',3,2,2,1,2,3,1,2,0,16,2,1,3,1,0,2,3,0,2,14,30,1,45.0,3,'b','Virtanen');
/*!40000 ALTER TABLE `kierros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koe`
--

DROP TABLE IF EXISTS `koe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koe` (
  `pvm` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nro` int(11) NOT NULL DEFAULT '0',
  `sukunimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `data` decimal(4,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koe`
--

LOCK TABLES `koe` WRITE;
/*!40000 ALTER TABLE `koe` DISABLE KEYS */;
INSERT INTO `koe` VALUES ('2018-09-19 11:43:23',1,'Pro',-2.0),('2018-09-19 12:01:32',10000,'Aloittelija',52.0),('2018-09-19 12:01:32',2,'Pro',0.0),('2018-09-19 12:01:32',2566,'Saarinen',13.0),('2018-09-19 12:01:32',3007,'Saarinen',18.0),('2018-09-20 07:03:12',1,'Pro',-2.0),('2018-09-20 07:03:12',10000,'Aloittelija',52.0),('2018-09-20 07:03:12',2,'Pro',0.0),('2018-09-20 07:03:12',2566,'Saarinen',13.0),('2018-09-20 07:03:12',3007,'Saarinen',18.0),('2018-09-20 10:53:23',3,'JÃ¤rvenpÃ¤Ã¤',0.0),('2018-10-02 10:43:38',4,'Manager',0.0),('2018-10-02 11:13:44',0,'DbAdmin1',0.0),('2018-10-05 12:05:17',2566,'Saarinen',13.1),('2018-10-05 12:07:25',2566,'Saarinen',13.2);
/*!40000 ALTER TABLE `koe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelaaja`
--

DROP TABLE IF EXISTS `pelaaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelaaja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pvm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seura_id` int(11) NOT NULL DEFAULT '0',
  `jasennumero` int(11) NOT NULL DEFAULT '0',
  `tasoitus` decimal(4,1) NOT NULL,
  `tasoitus_voimassa` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pelaaja_idx` (`pvm`,`seura_id`,`jasennumero`),
  KEY `seura_jasen_idx` (`seura_id`,`jasennumero`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelaaja`
--

LOCK TABLES `pelaaja` WRITE;
/*!40000 ALTER TABLE `pelaaja` DISABLE KEYS */;
INSERT INTO `pelaaja` VALUES (3,'2018-09-19 12:01:32',78,2,0.0,1),(4,'2018-09-19 12:01:32',78,2566,13.0,0),(5,'2018-09-19 12:01:32',78,3007,18.0,1),(6,'2018-09-20 07:03:12',78,1,-2.0,1),(8,'2018-09-20 07:03:12',78,2,0.0,1),(9,'2018-09-20 07:03:12',78,2566,13.0,0),(10,'2018-09-20 07:03:12',78,3007,18.0,1),(14,'2018-10-02 10:43:38',78,4,0.0,0),(16,'2018-10-05 12:05:17',78,2566,13.1,0),(17,'2018-10-05 12:07:25',78,2566,13.2,0),(18,'2018-10-11 07:44:21',78,2566,4.0,0),(19,'2018-10-11 07:46:15',78,2566,3.0,0),(20,'2018-10-11 07:48:12',78,9,1.0,0),(21,'2018-10-11 08:45:06',78,2566,21.0,0),(22,'2018-10-11 09:16:39',78,2566,21.0,0),(23,'2018-10-11 10:43:07',78,2566,14.0,1),(26,'2018-10-11 13:16:18',78,2,2.0,1),(27,'2018-10-11 13:34:43',78,9990,45.0,1),(28,'2018-10-11 13:38:19',78,4,0.0,0),(41,'2018-10-15 06:54:40',78,7777,7.0,1),(45,'2018-10-25 07:27:53',78,77,53.0,1),(47,'2018-10-25 07:42:09',78,77,50.0,1),(49,'2018-10-25 08:09:48',78,77,48.0,1),(51,'2018-10-25 08:12:22',78,77,47.0,0),(52,'2018-10-30 08:06:08',78,9874,50.0,1),(61,'2018-10-31 06:31:02',66,1,50.0,1),(68,'2018-11-02 10:07:19',999,1,54.0,1),(69,'2018-11-02 10:08:52',999,2,54.0,1),(71,'2018-11-12 07:42:14',78,9,2.0,0),(72,'2018-11-12 08:00:07',78,9,1.1,1),(74,'2018-11-12 08:06:51',999,3,54.0,1),(75,'2018-11-12 12:19:03',82,1,54.0,1),(76,'2018-11-12 12:19:34',82,1,36.0,1),(77,'2018-11-12 12:21:31',82,2,54.0,1),(78,'2018-11-12 12:21:44',82,2,50.0,1),(80,'2018-11-13 09:31:38',82,2,6.3,1),(83,'2018-11-13 10:46:19',78,9873,50.0,1);
/*!40000 ALTER TABLE `pelaaja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooli`
--

DROP TABLE IF EXISTS `rooli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooli` (
  `rooli_id` int(11) NOT NULL,
  `rooli_nimi` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`rooli_id`),
  UNIQUE KEY `rooli_uk` (`rooli_nimi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooli`
--

LOCK TABLES `rooli` WRITE;
/*!40000 ALTER TABLE `rooli` DISABLE KEYS */;
INSERT INTO `rooli` VALUES (1,'ROLE_ADMIN'),(3,'ROLE_PELAAJA'),(2,'ROLE_SEURA_MANAGER');
/*!40000 ALTER TABLE `rooli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seura`
--

DROP TABLE IF EXISTS `seura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lyhenne` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `nimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seura`
--

LOCK TABLES `seura` WRITE;
/*!40000 ALTER TABLE `seura` DISABLE KEYS */;
INSERT INTO `seura` VALUES (1,'AGC','Anola Golf Club'),(2,'SCG','Santa Claus Golf'),(3,'AulG','Aulanko Golf'),(4,'AG','Aura Golf'),(5,'BG','Botnia Golf'),(6,'EGs','Espoon Golfseura'),(7,'ERG','Espoo Ringside Golf'),(8,'EPG','Etelä-Pohjanmaan Golf'),(9,'G-P','Golf-Porrassalmi'),(10,'GT','Golf Talma'),(11,'G-V','Golf-Virrat'),(12,'GG','Gumböle Golf'),(13,'HG','Hangon Golf'),(14,'HkGk','Hartolan Golfklubi'),(15,'HeGk','Helsingin Golfklubi'),(16,'HkG','Hiekkaharju Golf'),(18,'HyG','Hyvinkään Golf'),(19,'IkG','Ikaalisten Golf'),(20,'ImG','Imatran Golf'),(22,'Jy-G','Jyväs-Golf'),(23,'JGs','Järviseudun Golfseura'),(24,'KajG','Kajaanin Golf'),(25,'KalG','Kalajokilaakson Golf'),(26,'KarG','Karelia Golf'),(27,'KartG','Kartanogolf'),(28,'KatiG','Katinkulta Golf'),(29,'KeriG','Kerigolf'),(30,'KokG','Kokkolan Golf'),(32,'KosG','Koski-Golf'),(33,'KurG','Kurk Golf'),(35,'KyG','Kymen Golf'),(36,'LahG','Lahden Golf'),(37,'LPG','Laukaan Peurunkagolf'),(39,'LoG','Loimijoki Golf'),(40,'KGK','Kemin Golf Klubi'),(41,'MGC','Master Golf Club'),(42,'MLG','Meri-Lapin Golfklubi'),(43,'MTG','Meri-Teijo Golf'),(44,'MeG','Messilä Golf'),(45,'MiG','Mikkelin Golf'),(46,'NeG','Nevas Golf'),(47,'TaG','Tahko Golf'),(48,'NCGC','Nordcenter Golf & Country Club'),(49,'NGk','Nurmijärven Golfklubi'),(50,'OGk','Oulun Golfkerho'),(51,'OGs','Outokummun Golfseura'),(52,'PaG','Paltamo Golf'),(53,'PelG','Peltola Golf'),(54,'PeG','Peuramaa Golf'),(55,'PicG','Pickala Golf'),(56,'PieG','Pielis-Golf'),(57,'JG-PG','Jakobstads Golf - Pietarsaaren Golf'),(58,'PirG','Pirkanmaan Golf'),(59,'PGk','Porin Golfkerho'),(60,'TarG','TarinaGolf'),(61,'RaG','Raahentienoon Golf'),(62,'KanG','Kankaisten Golf'),(63,'RaG','Rauma Golf'),(64,'MuG','Muurame Golf'),(65,'PoG','Porvoo Golf'),(66,'NRG','Nokia River Golf'),(67,'KuG','Kuusamo Golf'),(68,'RuG','Ruukkigolf'),(69,'SaG','Salo Golf'),(70,'SGk','Sarfvik Golfklubi ry'),(71,'RanG','Rantasalmi Golf'),(72,'SGR','Sea Golf Rönnäs'),(73,'HG&C','Harjattula Golf & Country Club'),(74,'ArGC','Archipelagia Golf Club'),(75,'StLGC','St. Lake Golf Club'),(76,'StLG','St. Laurence Golf'),(77,'SHG','Suur-Helsingin Golf'),(78,'TG','Tammer-Golf'),(79,'TawG','Tawast Golf'),(80,'TuGk','Tuusulan Golfklubi'),(81,'UGK','Uudenkaupungin GK'),(82,'VG','Vaasan Golf'),(83,'LGV','Lakeside Golf Vammala'),(84,'KG','Keimola Golf'),(86,'VGs','Vierumäen Golfseura'),(87,'ViG','Viipurin Golf'),(88,'VirG','Virvik Golf'),(89,'WGC','Wiurila Golf & Country Club'),(90,'Y-SG','Ylä-Savon Golfseura'),(91,'YG','Yyteri Golf'),(92,'ÅGk','Ålands Golfklubb'),(93,'ÄG','Ähtärin Golf'),(95,'NSG','Nivalan Seudun Golf'),(96,'ViGC','Vihti Golf Club'),(98,'KKG','Kotojärven Kartanogolf'),(99,'VGH','Vuosaari Golf Helsinki'),(100,'HiG','Hiisi-Golf'),(101,'NakG','Nakkila Golf'),(102,'KuoG','Kuortane Golf'),(103,'HG&A','Härmä Golf & Academy'),(104,'GPi','Golf Pirkkala'),(105,'IiG','Iitti Golf'),(106,'EeG','Eerikkala Golf'),(107,'KuGC','Kullo Golf Club'),(108,'KytG','Kytäjä Golf'),(109,'HatG','Hattula Golf'),(110,'HSGC','Hill Side Golf & Country Club'),(111,'HirG','Hirsala Golf'),(112,'LamG','Lampila Golf'),(113,'RevG','Revontuli Golf'),(114,'ReGC','Remson Golf Club'),(115,'KV','Kanavagolf Vääksy'),(116,'LiG','Linna Golf'),(117,'AuG','Aurinko Golf'),(118,'HGM','Hirvihaara Golf Mäntsälä'),(119,'VöG','Vörå Golf - Vöyrin Golf'),(120,'PuuG','PuulaGolf'),(122,'LeG','Levi Golf'),(123,'HIFK','Paloheinä Golf / HIFK Golf '),(124,'VirG','Virpiniemi Golf'),(125,'AlG','Alastaro Golf'),(126,'LeG','Lepaa Golf'),(127,'KGCN','Kultaranta Golf Club Naantali ry'),(128,'TiG','Tiirin Golf'),(129,'EkeG','Eke Golf ry'),(130,'KaG','Kaakon Golf'),(131,'OulG','Oulujokilaakson Golf'),(132,'HCGS','Holiday Club Golf Saimaa'),(134,'TapG','Tapiola Golf'),(136,'HimG','Himos-Patalahti Golf'),(138,'VGp','Vantaan Golfpuisto'),(139,'EcG','Eckerö Golf'),(140,'LöG','Löfkulla Golf'),(141,'LGs','Leppävirran Golfseura'),(999,'Edu','Eduixin testiseura'),(1000,'UTS','Uusi testiseura');
/*!40000 ALTER TABLE `seura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tii`
--

DROP TABLE IF EXISTS `tii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tii` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kentta_id` int(11) NOT NULL DEFAULT '0',
  `tii_id` int(2) NOT NULL DEFAULT '0',
  `tii_nimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `tii_lyhenne` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `slope` int(3) NOT NULL,
  `cr` decimal(5,1) NOT NULL,
  `slope_n` int(3) NOT NULL,
  `cr_n` decimal(5,1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kentta_tii_sukup` (`kentta_id`,`tii_id`),
  KEY `idx_kentta_tii` (`kentta_id`,`tii_id`),
  CONSTRAINT `key_kentta_id` FOREIGN KEY (`kentta_id`) REFERENCES `kentta` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tii`
--

LOCK TABLES `tii` WRITE;
/*!40000 ALTER TABLE `tii` DISABLE KEYS */;
INSERT INTO `tii` VALUES (1,83,1,'Valkoinen','Val',127,70.5,0,0.0),(2,83,2,'Keltainen','Kel',125,69.4,131,75.4),(3,83,3,'Sininen','Sin',120,66.9,124,72.4),(4,83,4,'Punainen','Pun',117,65.3,120,70.4),(8,183,1,'Valkoinen','Val',135,73.1,0,0.0),(9,183,2,'Keltainen','Kel',131,71.6,134,77.4),(10,183,3,'Sininen','Sin',127,69.3,128,74.6),(11,183,4,'Punainen','Pun',123,67.5,123,72.4),(15,66,1,'63','63',134,74.0,0,0.0),(16,66,2,'58','58',129,71.0,137,76.0),(17,66,3,'54','54',126,69.0,132,73.0),(18,66,4,'48','48',122,66.0,127,70.0),(22,266,1,'59','59',132,72.0,0,0.0),(23,266,2,'56','56',130,71.0,137,76.0),(24,266,3,'53','53',127,69.0,133,74.0),(25,266,4,'48','48',123,67.0,128,71.0),(29,78,1,'Valkoinen','Val',128,72.3,0,0.0),(30,78,2,'Keltainen','Kel',125,70.7,131,76.7),(31,78,3,'Sininen','Sin',121,68.9,126,74.5),(32,78,4,'Punainen','Pun',119,68.0,124,73.3),(36,104,1,'Valkoinen','Val',136,72.8,0,0.0),(37,104,2,'Keltainen','Kel',132,71.0,137,76.8),(38,104,3,'Sininen','Sin',128,69.1,132,74.5),(39,104,4,'Punainen','Pun',125,67.3,127,72.3),(43,284,1,'Valkoinen','Val',130,72.0,0,0.0),(44,284,2,'Keltainen','Kel',126,70.0,135,75.0),(45,284,3,'Sininen','Sin',125,68.0,133,74.0),(46,284,4,'Punainen','Pun',120,65.0,127,70.0),(50,282,1,'Valkoinen','Val',131,73.0,0,0.0),(51,282,2,'Keltainen','Kel',128,70.0,135,76.0),(52,282,3,'Sininen','Sin',125,69.0,132,74.0),(53,282,4,'Punainen','Pun',121,66.0,127,71.0),(57,283,1,'Valkoinen','Val',132,72.0,0,0.0),(58,283,2,'Keltainen','Kel',129,70.0,137,76.0),(59,283,3,'Sininen','Sin',126,69.0,133,74.0),(60,283,4,'Punainen','Pun',121,66.0,127,71.0),(64,287,1,'Valkoinen','Val',133,73.0,0,0.0),(65,287,2,'Keltainen','Kel',129,71.0,134,76.0),(66,287,3,'Sininen','Sin',125,69.0,130,73.0),(67,287,4,'Punainen','Pun',123,68.0,128,72.0),(71,286,1,'Valkoinen','Val',131,73.0,0,0.0),(72,286,2,'Keltainen','Kel',128,70.0,135,76.0),(73,286,3,'Sininen','Sin',125,69.0,132,74.0),(74,286,4,'Punainen','Pun',121,66.0,127,71.0),(78,285,1,'Valkoinen','Val',133,73.0,0,0.0),(79,285,2,'Keltainen','Kel',130,71.0,136,76.0),(80,285,3,'Sininen','Sin',127,69.0,132,74.0),(81,285,4,'Punainen','Pun',124,67.0,128,72.0),(85,290,1,'Valkoinen','Val',134,72.0,0,0.0),(86,290,2,'Keltainen','Kel',131,71.0,138,77.0),(87,290,3,'Sininen','Sin',128,69.0,134,74.0),(88,290,4,'Punainen','Pun',124,67.0,129,71.0),(92,288,1,'Valkoinen','Val',132,72.0,0,0.0),(93,288,2,'Keltainen','Kel',129,70.0,137,76.0),(94,288,3,'Sininen','Sin',126,69.0,133,74.0),(95,288,4,'Punainen','Pun',121,66.0,127,71.0),(99,289,1,'Valkoinen','Val',133,73.0,0,0.0),(100,289,2,'Keltainen','Kel',130,71.0,136,76.0),(101,289,3,'Sininen','Sin',127,69.0,132,74.0),(102,289,4,'Punainen','Pun',124,67.0,128,72.0),(120,500,1,'Edu62','62',130,75.0,0,0.0),(121,500,2,'Edu54','58',125,72.0,130,78.0),(122,500,3,'Edu50','54',120,70.0,125,75.0),(123,500,4,'Edu45','50',125,68.0,120,72.0);
/*!40000 ALTER TABLE `tii` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vayla`
--

DROP TABLE IF EXISTS `vayla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vayla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kentta_id` int(11) NOT NULL DEFAULT '0',
  `numero` int(2) NOT NULL DEFAULT '0',
  `nimi` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `par` int(1) NOT NULL DEFAULT '0',
  `pit1` int(3) NOT NULL DEFAULT '0',
  `pit2` int(3) NOT NULL DEFAULT '0',
  `pit3` int(3) NOT NULL DEFAULT '0',
  `pit4` int(3) NOT NULL DEFAULT '0',
  `hcp` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kentta_vayla` (`kentta_id`,`numero`),
  CONSTRAINT `key_kentta_id2` FOREIGN KEY (`kentta_id`) REFERENCES `kentta` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vayla`
--

LOCK TABLES `vayla` WRITE;
/*!40000 ALTER TABLE `vayla` DISABLE KEYS */;
INSERT INTO `vayla` VALUES (379,83,1,'',4,323,307,295,288,12),(380,83,2,'',3,120,120,109,97,18),(381,83,3,'',4,331,326,307,254,8),(382,83,4,'',4,330,330,311,305,10),(383,83,5,'',3,196,150,134,110,6),(384,83,6,'',5,542,523,425,423,2),(385,83,7,'',4,309,307,281,256,16),(386,83,8,'',4,334,306,295,259,14),(387,83,9,'',4,382,355,304,304,4),(388,83,10,'',5,456,453,393,393,11),(389,83,11,'',5,466,450,435,397,17),(390,83,12,'',3,143,143,126,126,13),(391,83,13,'',5,472,468,453,436,3),(392,83,14,'',4,308,303,265,227,7),(393,83,15,'',3,153,150,129,129,15),(394,83,16,'',4,328,321,295,235,1),(395,83,17,'',3,146,137,110,110,9),(396,83,18,'',4,377,373,350,340,5),(397,183,1,'',4,293,267,244,236,15),(398,183,2,'',5,485,463,452,414,7),(399,183,3,'',3,153,146,137,128,13),(400,183,4,'',4,348,325,318,261,11),(401,183,5,'',4,325,314,301,276,9),(402,183,6,'',5,537,488,407,399,1),(403,183,7,'',4,370,338,331,302,3),(404,183,8,'',3,162,154,140,123,17),(405,183,9,'',4,340,334,323,312,5),(406,183,10,'',5,484,476,468,386,14),(407,183,11,'',4,359,350,303,297,6),(408,183,12,'',3,177,160,142,129,8),(409,183,13,'',4,338,317,307,277,16),(410,183,14,'',4,303,295,281,271,12),(411,183,15,'',3,131,131,123,90,18),(412,183,16,'',5,496,485,405,399,10),(413,183,17,'',4,391,355,347,299,2),(414,183,18,'',4,363,355,330,320,4),(415,66,1,'',4,325,320,275,275,14),(416,66,2,'',4,390,370,320,320,10),(417,66,3,'',3,165,150,120,100,16),(418,66,4,'',4,340,310,290,215,12),(419,66,5,'',5,515,485,445,405,2),(420,66,6,'',4,295,270,265,240,18),(421,66,7,'',4,380,360,350,295,4),(422,66,8,'',3,215,185,155,125,8),(423,66,9,'',5,480,445,395,355,6),(424,66,10,'',4,340,310,305,260,17),(425,66,11,'',3,175,150,135,105,11),(426,66,12,'',4,370,335,295,265,7),(427,66,13,'',4,450,395,385,340,1),(428,66,14,'',3,165,155,130,110,15),(429,66,15,'',5,465,450,425,410,9),(430,66,16,'',4,380,355,325,305,5),(431,66,17,'',5,515,465,460,410,3),(432,66,18,'',4,375,325,315,270,13),(433,266,1,'',3,130,120,115,110,17),(434,266,2,'',4,390,380,370,340,3),(435,266,3,'',4,370,360,315,285,9),(436,266,4,'',4,305,305,265,245,13),(437,266,5,'',5,500,445,405,375,5),(438,266,6,'',4,355,325,295,275,1),(439,266,7,'',3,190,180,175,145,11),(440,266,8,'',4,335,330,325,250,15),(441,266,9,'',5,425,425,400,390,7),(442,266,10,'',4,345,335,330,300,14),(443,266,11,'',4,370,345,335,280,2),(444,266,12,'',5,425,410,385,335,8),(445,266,13,'',4,235,230,220,215,18),(446,266,14,'',3,200,200,170,170,10),(447,266,15,'',5,440,425,410,390,4),(448,266,16,'',3,180,160,140,130,16),(449,266,17,'',4,345,335,320,280,12),(450,266,18,'',4,370,340,330,280,6),(451,78,1,'',5,435,428,420,401,5),(452,78,2,'',4,338,331,315,311,9),(453,78,3,'',4,344,319,300,287,3),(454,78,4,'',4,357,327,300,287,13),(455,78,5,'',4,404,371,350,346,1),(456,78,6,'',5,457,443,416,350,7),(457,78,7,'',4,318,308,261,241,17),(458,78,8,'',4,358,345,301,293,11),(459,78,9,'',3,137,130,110,99,15),(460,78,10,'',4,340,310,280,268,10),(461,78,11,'',3,198,192,174,161,8),(462,78,12,'',5,514,499,475,460,6),(463,78,13,'',4,321,301,290,270,14),(464,78,14,'',3,149,145,135,130,18),(465,78,15,'',4,345,330,317,277,4),(466,78,16,'',5,464,419,400,382,12),(467,78,17,'',3,179,155,151,148,16),(468,78,18,'',4,400,381,359,344,2),(469,104,1,'',4,343,328,313,296,5),(470,104,2,'',3,137,127,117,102,16),(471,104,3,'',4,311,301,258,254,13),(472,104,4,'',4,310,297,284,268,12),(473,104,5,'',3,122,111,101,90,15),(474,104,6,'',4,340,323,313,290,6),(475,104,7,'',5,479,456,447,416,9),(476,104,8,'',3,139,113,103,88,18),(477,104,9,'',4,430,395,379,330,2),(478,104,10,'',4,408,369,335,321,7),(479,104,11,'',5,513,482,473,415,8),(480,104,12,'',5,472,462,386,377,4),(481,104,13,'',4,337,308,282,274,10),(482,104,14,'',4,314,305,291,282,14),(483,104,15,'',3,170,150,141,127,11),(484,104,16,'',4,268,243,234,220,17),(485,104,17,'',4,415,399,372,351,1),(486,104,18,'',5,515,505,470,425,3),(487,282,1,'',5,465,435,430,385,4),(488,282,2,'',4,340,305,305,250,16),(489,282,3,'',3,165,130,130,105,10),(490,282,4,'',4,325,285,285,255,14),(491,282,5,'',4,365,345,330,285,2),(492,282,6,'',5,470,460,415,380,12),(493,282,7,'',4,400,360,345,305,6),(494,282,8,'',3,190,175,160,135,8),(495,282,9,'',4,290,270,250,205,18),(496,282,10,'',4,350,332,310,302,7),(497,282,11,'',4,415,331,323,280,13),(498,282,12,'',3,160,140,125,120,15),(499,282,13,'',4,360,350,300,295,5),(500,282,14,'',5,427,417,398,383,1),(501,282,15,'',3,109,103,97,90,17),(502,282,16,'',4,262,251,226,218,9),(503,282,17,'',5,436,426,367,362,3),(504,282,18,'',4,370,340,330,300,11),(505,283,1,'',5,465,435,430,385,4),(506,283,2,'',4,340,305,305,250,16),(507,283,3,'',3,165,130,130,105,10),(508,283,4,'',4,325,285,285,255,14),(509,283,5,'',4,365,345,330,285,2),(510,283,6,'',5,470,460,415,380,12),(511,283,7,'',4,400,360,345,305,6),(512,283,8,'',3,190,175,160,135,8),(513,283,9,'',4,290,270,250,205,18),(514,283,10,'',4,300,280,280,240,13),(515,283,11,'',4,350,335,295,265,9),(516,283,12,'',4,365,340,325,300,5),(517,283,13,'',3,102,96,90,85,15),(518,283,14,'',4,351,332,325,305,11),(519,283,15,'',4,377,365,320,266,1),(520,283,16,'',3,160,140,135,125,17),(521,283,17,'',5,490,465,430,395,3),(522,283,18,'',5,500,495,430,425,7),(523,286,1,'',4,350,332,310,302,8),(524,286,2,'',4,415,331,323,280,14),(525,286,3,'',3,160,140,125,120,16),(526,286,4,'',4,360,350,300,295,6),(527,286,5,'',5,427,417,398,383,2),(528,286,6,'',3,109,103,97,90,18),(529,286,7,'',4,262,251,226,218,10),(530,286,8,'',5,436,426,367,362,4),(531,286,9,'',4,370,340,330,300,12),(532,286,10,'',5,465,435,430,385,3),(533,286,11,'',4,340,305,305,250,15),(534,286,12,'',3,165,130,130,105,9),(535,286,13,'',4,325,285,285,255,13),(536,286,14,'',4,365,345,330,285,1),(537,286,15,'',5,470,460,415,380,11),(538,286,16,'',4,400,360,345,305,5),(539,286,17,'',3,190,175,160,135,7),(540,286,18,'',4,290,270,250,205,17),(541,285,1,'',4,350,332,310,302,8),(542,285,2,'',4,415,331,323,280,14),(543,285,3,'',3,160,140,125,120,16),(544,285,4,'',4,360,350,300,295,6),(545,285,5,'',5,427,417,398,383,2),(546,285,6,'',3,109,103,97,90,18),(547,285,7,'',4,262,251,226,218,10),(548,285,8,'',5,436,426,367,362,4),(549,285,9,'',4,370,340,330,300,12),(550,285,10,'',4,300,280,280,240,13),(551,285,11,'',4,350,335,295,265,9),(552,285,12,'',4,365,340,325,300,5),(553,285,13,'',3,102,96,90,85,15),(554,285,14,'',4,351,332,325,305,11),(555,285,15,'',4,377,365,320,266,1),(556,285,16,'',3,160,140,135,125,17),(557,285,17,'',5,490,465,430,395,3),(558,285,18,'',5,500,495,430,425,7),(559,288,1,'',4,300,280,280,240,14),(560,288,2,'',4,350,335,295,265,10),(561,288,3,'',4,365,340,325,300,6),(562,288,4,'',3,102,96,90,85,16),(563,288,5,'',4,351,332,325,305,12),(564,288,6,'',4,377,365,320,266,2),(565,288,7,'',3,160,140,135,125,18),(566,288,8,'',5,490,465,430,395,4),(567,288,9,'',5,500,495,430,425,8),(568,288,10,'',5,465,435,430,385,3),(569,288,11,'',4,340,305,305,250,15),(570,288,12,'',3,165,130,130,105,9),(571,288,13,'',4,325,285,285,255,13),(572,288,14,'',4,365,345,330,285,1),(573,288,15,'',5,470,460,415,380,11),(574,288,16,'',4,400,360,345,305,5),(575,288,17,'',3,190,175,160,135,7),(576,288,18,'',4,290,270,250,205,17),(577,289,1,'',4,300,280,280,240,14),(578,289,2,'',4,350,335,295,265,10),(579,289,3,'',4,365,340,325,300,6),(580,289,4,'',3,102,96,90,85,16),(581,289,5,'',4,351,332,325,305,12),(582,289,6,'',4,377,365,320,266,2),(583,289,7,'',3,160,140,135,125,18),(584,289,8,'',5,490,465,430,395,4),(585,289,9,'',5,500,495,430,425,8),(586,289,10,'',4,350,332,310,302,7),(587,289,11,'',4,415,331,323,280,13),(588,289,12,'',3,160,140,125,120,15),(589,289,13,'',4,360,350,300,295,5),(590,289,14,'',5,427,417,398,383,1),(591,289,15,'',3,109,103,97,90,17),(592,289,16,'',4,262,251,226,218,9),(593,289,17,'',5,436,426,367,362,3),(594,289,18,'',4,370,340,330,300,11),(595,284,1,'',5,465,435,430,385,4),(596,284,2,'',4,340,305,305,250,16),(597,284,3,'',3,165,130,130,105,10),(598,284,4,'',4,325,285,285,255,14),(599,284,5,'',4,365,345,330,285,2),(600,284,6,'',5,470,460,415,380,12),(601,284,7,'',4,400,360,345,305,6),(602,284,8,'',3,190,175,160,135,8),(603,284,9,'',4,290,270,250,205,18),(604,284,10,'',5,465,435,430,385,3),(605,284,11,'',4,340,305,305,250,15),(606,284,12,'',3,165,130,130,105,9),(607,284,13,'',4,325,285,285,255,13),(608,284,14,'',4,365,345,330,285,1),(609,284,15,'',5,470,460,415,380,11),(610,284,16,'',4,400,360,345,305,5),(611,284,17,'',3,190,175,160,135,7),(612,284,18,'',4,290,270,250,205,17),(613,287,1,'',4,350,332,310,302,8),(614,287,2,'',4,415,331,323,280,14),(615,287,3,'',3,160,140,125,120,16),(616,287,4,'',4,360,350,300,295,6),(617,287,5,'',5,427,417,398,383,2),(618,287,6,'',3,109,103,97,90,18),(619,287,7,'',4,262,251,226,218,10),(620,287,8,'',5,436,426,367,362,4),(621,287,9,'',4,370,340,330,300,12),(622,287,10,'',4,350,332,310,302,7),(623,287,11,'',4,415,331,323,280,13),(624,287,12,'',3,160,140,125,120,15),(625,287,13,'',4,360,350,300,295,5),(626,287,14,'',5,427,417,398,383,1),(627,287,15,'',3,109,103,97,90,17),(628,287,16,'',4,262,251,226,218,9),(629,287,17,'',5,436,426,367,362,3),(630,287,18,'',4,370,340,330,300,11),(631,290,1,'',4,300,280,280,240,14),(632,290,2,'',4,350,335,295,265,10),(633,290,3,'',4,365,340,325,300,6),(634,290,4,'',3,102,96,90,85,16),(635,290,5,'',4,351,332,325,305,12),(636,290,6,'',4,377,365,320,266,2),(637,290,7,'',3,160,140,135,125,18),(638,290,8,'',5,490,465,430,395,4),(639,290,9,'',5,500,495,430,425,8),(640,290,10,'',4,300,280,280,240,13),(641,290,11,'',4,350,335,295,265,9),(642,290,12,'',4,365,340,325,300,5),(643,290,13,'',3,102,96,90,85,15),(644,290,14,'',4,351,332,325,305,11),(645,290,15,'',4,377,365,320,266,1),(646,290,16,'',3,160,140,135,125,17),(647,290,17,'',5,490,465,430,395,3),(648,290,18,'',5,500,495,430,425,7),(649,500,1,'ykkönen',5,435,428,420,401,5),(650,500,2,'kakkonen',4,338,331,315,311,9),(651,500,3,'',4,344,319,300,287,3),(652,500,4,'nelosväylä',4,357,327,300,287,13),(653,500,5,'',4,404,371,350,346,1),(654,500,6,'',5,457,443,416,350,7),(655,500,7,'',4,318,308,261,241,17),(656,500,8,'',4,358,345,301,293,11),(657,500,9,'',3,137,130,110,99,15),(658,500,10,'kymppi',4,340,310,280,268,10),(659,500,11,'',3,198,192,174,161,8),(660,500,12,'',5,514,499,475,460,6),(661,500,13,'',4,321,301,290,270,14),(662,500,14,'',3,149,145,135,130,18),(663,500,15,'',4,345,330,317,277,4),(664,500,16,'',5,464,419,400,382,12),(665,500,17,'',3,179,155,151,148,16),(666,500,18,'',4,400,381,359,344,2);
/*!40000 ALTER TABLE `vayla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yhteystiedot`
--

DROP TABLE IF EXISTS `yhteystiedot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yhteystiedot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kentta_id` int(11) DEFAULT '0',
  `seura_id` int(11) DEFAULT '0',
  `pelaaja_id` int(11) DEFAULT '0',
  `otsikko` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `nimi` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `osoite` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `puhelin` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `www` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `lisatieto` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yhteystiedot`
--

LOCK TABLES `yhteystiedot` WRITE;
/*!40000 ALTER TABLE `yhteystiedot` DISABLE KEYS */;
INSERT INTO `yhteystiedot` VALUES (1,NULL,78,NULL,'Seura: Tammer-Golf','','Tenniskatu 25, 33560 Tampere','0504419420','toimisto@tammer-golf.fi','http://www.tammer-golf.fi','Auki - KesÃ¤greenit'),(2,78,NULL,NULL,'KenttÃ¤: Tammer-Golf','','Tenniskatu 25, 33560 Tampere','0504419420','toimisto@tammer-golf.fi','http://www.tammer-golf.fi','Auki - KesÃ¤greenit'),(3,78,78,3,'Pro: Tammer-Golf','Kari JÃ¤rvenpÃ¤Ã¤','Tenniskatu 25, 33560 Tampere','+35850 517 5558','kari@futuregolf.fi','futuregolf.fi','PGA pro, Future Golf Oy'),(4,83,83,NULL,'Lakeside Golf','JÃ¤rvenranta','Sastamalantie 1901, 38100 Sastamala ','(03) 5129 500','toimisto@lakesidegolf.fi','https://lakesidegolf.fi/',''),(5,183,NULL,NULL,'Lakeside Golf','Pirunpelto','Sastamalantie 1901, 38100 Sastamala ','(03) 5129 500','toimisto@lakesidegolf.fi','https://lakesidegolf.fi/',''),(6,66,66,NULL,'Nokian River Golf','Rock','Alastalontie 33, 37120 Nokia','(03) 340 0234','toimisto@nrg.fi','http://nokiarivergolf.fi/',''),(7,266,NULL,NULL,'Nokian River Golf','River','Alastalontie 33, 37120 Nokia','(03) 340 0234','toimisto@nrg.fi','http://nokiarivergolf.fi/',''),(8,104,104,NULL,'Golf Pirkkala','GPi','Vaittintie 95, 33960 Pirkkala','0102926900 (0.16â‚¬/min + pvm/mpm)','caddiemaster@golfpirkkala.fi','http://www.golfpirkkala.fi',''),(9,999,999,NULL,'Eduix Golf Company','Edu','Finlaysoninkuja 21 A, 33210 Tampere','040 517 48 99','info@eduix.fi','http://www.eduix.fi','3. kerros');
/*!40000 ALTER TABLE `yhteystiedot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-19 11:29:18
