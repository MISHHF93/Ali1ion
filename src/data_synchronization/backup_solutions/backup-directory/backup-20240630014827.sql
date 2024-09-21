-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: nao_ai_database
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

--
-- Table structure for table `nao_data`
--

DROP TABLE IF EXISTS `nao_data`;
/*!7860 SET @saved_cs_client     = @@character_set_client */;
/*!7860 SET character_set_client = utf8 */;
CREATE TABLE `nao_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!7860 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nao_data`
--

LOCK TABLES `nao_data` WRITE;
/*!7860 ALTER TABLE `nao_data` DISABLE KEYS */;
INSERT INTO `nao_data` VALUES 
(1,'example1','data1'),
(2,'example2','data2'),
(3,'example3','data3'),
(4,'example4','data4'),
(5,'example5','data5');
/*!7860 ALTER TABLE `nao_data` ENABLE KEYS */;
UNLOCK TABLES;
