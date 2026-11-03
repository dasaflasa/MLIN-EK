-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pekarna
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `izdelek`
--

DROP TABLE IF EXISTS `izdelek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `izdelek` (
  `id_izdelek` int(10) NOT NULL,
  `naziv` varchar(20) DEFAULT NULL,
  `opis` varchar(255) DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `zaloga` tinyint(3) DEFAULT NULL,
  `KATEGORIJA_id_kategorije` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_izdelek`),
  KEY `KATEGORIJA_id_kategorije` (`KATEGORIJA_id_kategorije`),
  CONSTRAINT `izdelek_ibfk_1` FOREIGN KEY (`KATEGORIJA_id_kategorije`) REFERENCES `kategorija` (`id_kategorije`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izdelek`
--

LOCK TABLES `izdelek` WRITE;
/*!40000 ALTER TABLE `izdelek` DISABLE KEYS */;
/*!40000 ALTER TABLE `izdelek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorija`
--

DROP TABLE IF EXISTS `kategorija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategorija` (
  `id_kategorije` int(10) NOT NULL,
  `naziv` varchar(20) DEFAULT NULL,
  `opis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_kategorije`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorija`
--

LOCK TABLES `kategorija` WRITE;
/*!40000 ALTER TABLE `kategorija` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategorija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narocilo`
--

DROP TABLE IF EXISTS `narocilo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `narocilo` (
  `id_narocilo` int(10) NOT NULL,
  `datum` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `skupna_cena` decimal(10,2) DEFAULT NULL,
  `UPORABNIK_id_uporabnika` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_narocilo`),
  KEY `UPORABNIK_id_uporabnika` (`UPORABNIK_id_uporabnika`),
  CONSTRAINT `narocilo_ibfk_1` FOREIGN KEY (`UPORABNIK_id_uporabnika`) REFERENCES `uporabnik` (`id_uporabnika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narocilo`
--

LOCK TABLES `narocilo` WRITE;
/*!40000 ALTER TABLE `narocilo` DISABLE KEYS */;
/*!40000 ALTER TABLE `narocilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placilo`
--

DROP TABLE IF EXISTS `placilo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `placilo` (
  `id_placilo` int(10) NOT NULL,
  `datum_placila` date DEFAULT NULL,
  `znesek` decimal(10,2) DEFAULT NULL,
  `nacin_placila` varchar(10) DEFAULT NULL,
  `NAROCILO_id_narocilo` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_placilo`),
  KEY `NAROCILO_id_narocilo` (`NAROCILO_id_narocilo`),
  CONSTRAINT `placilo_ibfk_1` FOREIGN KEY (`NAROCILO_id_narocilo`) REFERENCES `narocilo` (`id_narocilo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placilo`
--

LOCK TABLES `placilo` WRITE;
/*!40000 ALTER TABLE `placilo` DISABLE KEYS */;
/*!40000 ALTER TABLE `placilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postavka_narocila`
--

DROP TABLE IF EXISTS `postavka_narocila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postavka_narocila` (
  `id_postavka` int(10) NOT NULL,
  `kolicina` tinyint(3) DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `NAROCILO_id_narocilo` int(10) DEFAULT NULL,
  `IZDELEK_id_izdelek` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_postavka`),
  KEY `NAROCILO_id_narocilo` (`NAROCILO_id_narocilo`),
  KEY `IZDELEK_id_izdelek` (`IZDELEK_id_izdelek`),
  CONSTRAINT `postavka_narocila_ibfk_1` FOREIGN KEY (`NAROCILO_id_narocilo`) REFERENCES `narocilo` (`id_narocilo`),
  CONSTRAINT `postavka_narocila_ibfk_2` FOREIGN KEY (`IZDELEK_id_izdelek`) REFERENCES `izdelek` (`id_izdelek`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postavka_narocila`
--

LOCK TABLES `postavka_narocila` WRITE;
/*!40000 ALTER TABLE `postavka_narocila` DISABLE KEYS */;
/*!40000 ALTER TABLE `postavka_narocila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uporabnik`
--

DROP TABLE IF EXISTS `uporabnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uporabnik` (
  `id_uporabnika` int(10) NOT NULL,
  `ime` varchar(20) DEFAULT NULL,
  `priimek` varchar(30) DEFAULT NULL,
  `e-mail` varchar(50) DEFAULT NULL,
  `geslo` varchar(255) DEFAULT NULL,
  `telefon` int(9) DEFAULT NULL,
  `naslov` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_uporabnika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uporabnik`
--

LOCK TABLES `uporabnik` WRITE;
/*!40000 ALTER TABLE `uporabnik` DISABLE KEYS */;
/*!40000 ALTER TABLE `uporabnik` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-03 13:42:26
