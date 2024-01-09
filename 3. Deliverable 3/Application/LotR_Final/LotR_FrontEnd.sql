DROP SCHEMA IF EXISTS `lotr`;
CREATE DATABASE  IF NOT EXISTS `lotr`;
USE `lotr`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lotr
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (5,'test','test','asdadd');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifacts`
--

DROP TABLE IF EXISTS `artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artifacts` (
  `Name` varchar(30) NOT NULL,
  `Age_Created` varchar(15) DEFAULT NULL,
  `Age_Destroyed` varchar(15) DEFAULT NULL,
  `Creator` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `fk_Artifacts_Notable_Characters1_idx` (`Creator`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_Artifacts_Notable_Characters1` FOREIGN KEY (`Creator`) REFERENCES `notable_characters` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifacts`
--

LOCK TABLES `artifacts` WRITE;
/*!40000 ALTER TABLE `artifacts` DISABLE KEYS */;
INSERT INTO `artifacts` VALUES ('Andúril',NULL,NULL,'Telchar'),('Angrist','FA','FA466','Telchar'),('Dragon-helm of Dor-lómin','FA260',NULL,'Telchar'),('Narsil','FA','SA3441','Telchar'),('Phial of Galadriel',NULL,NULL,NULL),('Sting','FA',NULL,NULL),('The One Ring','SA1600','TA3019/03/25','Sauron');
/*!40000 ALTER TABLE `artifacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `Title` varchar(60) NOT NULL,
  `Editor` varchar(30) NOT NULL,
  `Illustrator` varchar(30) NOT NULL,
  `Date_Published` date NOT NULL,
  `Publisher` varchar(30) NOT NULL,
  `Pages` int NOT NULL,
  `Genre` varchar(30) NOT NULL,
  PRIMARY KEY (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('Beren and Lúthien','Christopher Tolkien','Alan Lee','2017-06-01','Harper Collins',297,'Fantasy'),('The Adventures of Tom Bombadil','John Ronald Reuel Tolkien','Pauline Baynes','1962-06-06','George Allen & Unwin',304,'Poetry'),('The Children of Húrin','Christopher Tolkien','Alan Lee','2007-04-16','Harper Collins',320,'Fantasy'),('The Fall of Gondolin','Christopher Tolkien','Alan Lee','2018-08-30','Harper Collins',304,'Fantasy'),('The Fellowship of the Ring','John Ronald Reuel Tolkien','John Ronald Reuel Tolkien','1954-07-29','George Allen & Unwin',423,'Fantasy'),('The Hobbit','John Ronald Reuel Tolkien','John Ronald Reuel Tolkien','1937-09-21','George Allen & Unwin',310,'Fantasy'),('The Return of the King','John Ronald Reuel Tolkien','John Ronald Reuel Tolkien','1955-10-20','George Allen & Unwin',416,'Fantasy'),('The Road Goes Ever On','Donald Swann','John Ronald Reuel Tolkien','1967-10-31','George Allen & Unwin',96,'Sheet Music'),('The Silmarillion','Christopher Tolkien','Christopher Tolkien','1977-09-15','George Allen & Unwin',365,'Fantasy'),('The Two Towers','John Ronald Reuel Tolkien','John Ronald Reuel Tolkien','1954-11-11','George Allen & Unwin',352,'Fantasy'),('Unfinished Tales','Christopher Tolkien','John Ronald Reuel Tolkien','1980-10-02','George Allen & Unwin',472,'Fantasy');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_has_artifact`
--

DROP TABLE IF EXISTS `character_has_artifact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_has_artifact` (
  `Character` varchar(30) NOT NULL,
  `Artifact` varchar(30) NOT NULL,
  `Age_Acquired` varchar(15) NOT NULL,
  `Age_Lost` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Character`,`Artifact`,`Age_Acquired`),
  KEY `fk_Notable Characters_has_Artefacts_Artefacts1_idx` (`Artifact`),
  KEY `fk_Notable Characters_has_Artefacts_Notable Characters1_idx` (`Character`),
  CONSTRAINT `fk_Notable Characters_has_Artefacts_Artefacts1` FOREIGN KEY (`Artifact`) REFERENCES `artifacts` (`Name`),
  CONSTRAINT `fk_Notable Characters_has_Artefacts_Notable Characters1` FOREIGN KEY (`Character`) REFERENCES `notable_characters` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_has_artifact`
--

LOCK TABLES `character_has_artifact` WRITE;
/*!40000 ALTER TABLE `character_has_artifact` DISABLE KEYS */;
INSERT INTO `character_has_artifact` VALUES ('Aragorn II','Andúril','TA3018/12/25',NULL),('Beren','Angrist','FA465','FA466'),('Bilbo Baggins','Sting','TA2941/May','TA3018/12/25'),('Bilbo Baggins','The One Ring','TA2941','TA3001/09/22'),('Deagol','The One Ring','TA2463','TA2463'),('Elendil','Narsil','SA3430','SA3441'),('Frodo Baggins','Phial of Galadriel','TA3019/02/16','TA3019/03/18'),('Frodo Baggins','Sting','TA3018/12/25','TA3019/03/20'),('Frodo Baggins','The One Ring','TA3001/09/22','TA3018/04/13'),('Frodo Baggins','The One Ring','TA3018/04/13','TA3018/09/27'),('Frodo Baggins','The One Ring','TA3018/09/27','TA3019/03/18'),('Frodo Baggins','The One Ring','TA3019/03/20','TA3019/03/25'),('Gollum','The One Ring','TA2463','TA2941'),('Isildur','Narsil','SA3441','SA3441'),('Isildur','The One Ring','SA3441','TA2/10/04'),('Olórin','The One Ring','TA3018/04/13 ','TA3018/04/13'),('Samwise Gamgee','Phial of Galadriel','TA3019/03/18',NULL),('Samwise Gamgee','Sting','TA3019/03/20',NULL),('Samwise Gamgee','The One Ring','TA3019/03/18','TA3019/03/20'),('Sauron','The One Ring','SA1600','SA3441'),('Tom Bombadil','The One Ring','TA3018/09/27','TA3018/09/27');
/*!40000 ALTER TABLE `character_has_artifact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_in_event`
--

DROP TABLE IF EXISTS `character_in_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_in_event` (
  `Character` varchar(30) NOT NULL,
  `Event` varchar(45) NOT NULL,
  PRIMARY KEY (`Character`,`Event`),
  KEY `fk_Notable Characters_has_Events_Events1_idx` (`Event`),
  KEY `fk_Notable Characters_has_Events_Notable Characters1_idx` (`Character`),
  CONSTRAINT `fk_Notable Characters_has_Events_Events1` FOREIGN KEY (`Event`) REFERENCES `events` (`Name`),
  CONSTRAINT `fk_Notable Characters_has_Events_Notable Characters1` FOREIGN KEY (`Character`) REFERENCES `notable_characters` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_in_event`
--

LOCK TABLES `character_in_event` WRITE;
/*!40000 ALTER TABLE `character_in_event` DISABLE KEYS */;
INSERT INTO `character_in_event` VALUES ('Aragorn II','Battle of the Morannon'),('Aragorn II','Battle of the Pelennor Fields'),('Denethor II','Battle of the Pelennor Fields'),('Eru Ilúvatar','Destruction of Númenor'),('Faramir','Battle of the Pelennor Fields'),('Fëanor','Creation of Silmarils'),('Finwë','Destruction of Two Trees'),('Gimli','Battle of the Morannon'),('Gimli','Battle of the Pelennor Fields'),('Legolas','Battle of the Morannon'),('Legolas','Battle of the Pelennor Fields'),('Meriadoc Brandybuck','Battle of Isengard'),('Meriadoc Brandybuck','Battle of the Morannon'),('Meriadoc Brandybuck','Battle of the Pelennor Fields'),('Morgoth','Destruction of Two Trees'),('Olórin','Battle of the Morannon'),('Peregrin Took','Battle of Isengard'),('Peregrin Took','Battle of the Morannon'),('Peregrin Took','Battle of the Pelennor Fields'),('Sauron','Battle of the Morannon'),('Théoden','Battle of the Pelennor Fields'),('Treebeard','Battle of Isengard'),('Witch-King','Battle of the Pelennor Fields');
/*!40000 ALTER TABLE `character_in_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_in_group`
--

DROP TABLE IF EXISTS `character_in_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_in_group` (
  `Character` varchar(30) NOT NULL,
  `Group` varchar(30) NOT NULL,
  PRIMARY KEY (`Character`,`Group`),
  KEY `fk_Notable Characters_has_Groups_Groups1_idx` (`Group`),
  KEY `fk_Notable Characters_has_Groups_Notable Characters1_idx` (`Character`),
  CONSTRAINT `fk_Notable Characters_has_Groups_Groups1` FOREIGN KEY (`Group`) REFERENCES `groups` (`Name`),
  CONSTRAINT `fk_Notable Characters_has_Groups_Notable Characters1` FOREIGN KEY (`Character`) REFERENCES `notable_characters` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_in_group`
--

LOCK TABLES `character_in_group` WRITE;
/*!40000 ALTER TABLE `character_in_group` DISABLE KEYS */;
INSERT INTO `character_in_group` VALUES ('Aragorn II','Fellowship of the Ring'),('Boromir','Fellowship of the Ring'),('Frodo Baggins','Fellowship of the Ring'),('Gimli','Fellowship of the Ring'),('Legolas','Fellowship of the Ring'),('Meriadoc Brandybuck','Fellowship of the Ring'),('Olórin','Fellowship of the Ring'),('Peregrin Took','Fellowship of the Ring'),('Samwise Gamgee','Fellowship of the Ring'),('Olórin','Istari'),('Anárion','Last Alliance of Elves and Men'),('Elendil','Last Alliance of Elves and Men'),('Isildur','Last Alliance of Elves and Men'),('Oropher','Last Alliance of Elves and Men'),('Thranduil','Last Alliance of Elves and Men'),('Olórin','Maiar'),('Olórin','White Council');
/*!40000 ALTER TABLE `character_in_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters_languages`
--

DROP TABLE IF EXISTS `characters_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters_languages` (
  `Character` varchar(30) NOT NULL,
  `Language` enum('Black Speech','Quenya','Telerin','Sindarin','Avarin','Vinyamar','Vanyarin','Nandorin','Eldarin','Adûnaic','Taliska','Valarin','Khuzdul','Westron','Rohanese','Hobbitish','Stoorish','Iglishmêk','Dunlendish','Haladin','Old Entish','Orkish','Doriathrin','Silvan') NOT NULL,
  PRIMARY KEY (`Character`,`Language`),
  KEY `fk_Notable_Characters_has_Languages_Notable_Characters1_idx` (`Character`),
  CONSTRAINT `fk_Notable_Characters_has_Languages_Notable_Characters1` FOREIGN KEY (`Character`) REFERENCES `notable_characters` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters_languages`
--

LOCK TABLES `characters_languages` WRITE;
/*!40000 ALTER TABLE `characters_languages` DISABLE KEYS */;
INSERT INTO `characters_languages` VALUES ('Adamanta Chubb','Westron'),('Aldamir','Westron'),('Aldor','Westron'),('Aldor','Rohanese'),('Amandil','Quenya'),('Amandil','Sindarin'),('Amandil','Adûnaic'),('Amlaith','Sindarin'),('Amlaith','Westron'),('Anairë','Quenya'),('Anardil','Sindarin'),('Anardil','Westron'),('Anárion','Quenya'),('Anárion','Sindarin'),('Anárion','Adûnaic'),('Arador','Sindarin'),('Arador','Westron'),('Araglas','Sindarin'),('Araglas','Westron'),('Aragorn I','Sindarin'),('Aragorn I','Westron'),('Aragorn II','Quenya'),('Aragorn II','Sindarin'),('Aragorn II','Westron'),('Aragost','Sindarin'),('Aragost','Westron'),('Arahad I','Sindarin'),('Arahad I','Westron'),('Arahad II','Sindarin'),('Arahad II','Westron'),('Arahael','Sindarin'),('Arahael','Westron'),('Aranarth','Sindarin'),('Aranarth','Westron'),('Arantar','Sindarin'),('Aranuir','Sindarin'),('Aranuir','Westron'),('Araphant','Sindarin'),('Araphant','Westron'),('Araphor','Sindarin'),('Araphor','Westron'),('Arassuil','Sindarin'),('Arassuil','Westron'),('Arathorn I','Sindarin'),('Arathorn I','Westron'),('Arathorn II','Sindarin'),('Arathorn II','Westron'),('Araval','Sindarin'),('Araval','Westron'),('Aravir','Sindarin'),('Aravir','Westron'),('Aravorn','Sindarin'),('Aravorn','Westron'),('Arciryas','Westron'),('Argeleb I','Sindarin'),('Argeleb I','Westron'),('Argeleb II','Sindarin'),('Argeleb II','Westron'),('Argonui','Sindarin'),('Argonui','Westron'),('Artamir','Westron'),('Arvedui','Sindarin'),('Arvedui','Westron'),('Arvegil','Sindarin'),('Arvegil','Westron'),('Arveleg I','Sindarin'),('Arveleg I','Westron'),('Arveleg II','Sindarin'),('Arveleg II','Westron'),('Atanatar I','Sindarin'),('Atanatar I','Westron'),('Atanatar II','Sindarin'),('Atanatar II','Westron'),('Aulë','Valarin'),('Barahir','Sindarin'),('Baran','Sindarin'),('Beleg','Sindarin'),('Beleg','Westron'),('Belegund','Sindarin'),('Bell Goodchild','Westron'),('Belladonna Took','Westron'),('Bëor the Old','Sindarin'),('Beren','Sindarin'),('Bilbo Baggins','Sindarin'),('Bilbo Baggins','Westron'),('Borin','Khuzdul'),('Boromir','Westron'),('Boromir of Ladros','Sindarin'),('Boron','Sindarin'),('Brego','Westron'),('Brego','Rohanese'),('Bregolas','Sindarin'),('Bregor','Sindarin'),('Brytta','Westron'),('Brytta','Rohanese'),('Bungo Baggins','Westron'),('Calimehtar','Westron'),('Calimehtar the King','Westron'),('Calmacil','Westron'),('Celeborn','Sindarin'),('Celebrindor','Sindarin'),('Celebrindor','Westron'),('Celepharn','Sindarin'),('Celepharn','Westron'),('Cemendur','Sindarin'),('Cemendur','Westron'),('Ciryandil','Westron'),('Déagol','Westron'),('Denethor II','Westron'),('Déor','Westron'),('Déor','Rohanese'),('Dior','Doriathrin'),('Dírhael','Sindarin'),('Dírhael','Westron'),('Dora Baggins','Westron'),('Dudo Baggins','Westron'),('Durin I','Khuzdul'),('Eärendil','Sindarin'),('Eärendil','Westron'),('Eärendil the Mariner','Quenya'),('Eärendur','Sindarin'),('Eärendur','Westron'),('Eärnil I','Westron'),('Eärwen','Telerin'),('Elatan','Quenya'),('Eldacar of Arnor','Sindarin'),('Eldacar of Arnor','Westron'),('Eldacar of Gondor','Westron'),('Elendil','Quenya'),('Elendil','Sindarin'),('Elendil','Adûnaic'),('Elendur','Sindarin'),('Elendur','Westron'),('Elenwë','Vanyarin'),('Elmo','Sindarin'),('Elrond','Quenya'),('Elros','Quenya'),('Elwing','Quenya'),('Emeldir','Sindarin'),('Eorl','Westron'),('Eorl','Rohanese'),('Estë','Valarin'),('Faramir','Westron'),('Faramir of Gondor','Westron'),('Farin','Khuzdul'),('Fengel','Westron'),('Fengel','Rohanese'),('Finarfin','Quenya'),('Fingolfin','Quenya'),('Finwë','Quenya'),('Fíriel','Westron'),('Folca','Westron'),('Folca','Rohanese'),('Folcwine','Westron'),('Folcwine','Rohanese'),('Fosco Baggins','Westron'),('Fréa','Westron'),('Fréa','Rohanese'),('Fréaláf','Westron'),('Fréaláf','Rohanese'),('Fréawine','Westron'),('Fréawine','Rohanese'),('Frodo Baggins','Sindarin'),('Frodo Baggins','Westron'),('Galadhon','Sindarin'),('Galadriel','Quenya'),('Galathil','Sindarin'),('Gerontius Took','Westron'),('Gilraen','Sindarin'),('Gilraen','Westron'),('Gimli','Khuzdul'),('Gimli','Westron'),('Glóin','Khuzdul'),('Goldwine','Westron'),('Goldwine','Rohanese'),('Gollum','Westron'),('Gorbadoc Brandybuck','Westron'),('Gram','Westron'),('Gram','Rohanese'),('Gróin','Khuzdul'),('Haldir','Westron'),('Haldir','Silvan'),('Hamfast Gamgee','Westron'),('Helm Hammerhand','Westron'),('Helm Hammerhand','Rohanese'),('Hild','Westron'),('Hild','Rohanese'),('Huor','Sindarin'),('Húrin','Westron'),('Hyarmendacil I','Westron'),('Hyarmendacil II','Westron'),('Idril','Vinyamar'),('Indis','Quenya'),('Irmo','Valarin'),('Isildur','Quenya'),('Isildur','Sindarin'),('Isildur','Adûnaic'),('Isilmë','Quenya'),('Ivorwen','Westron'),('Laura Grubb','Westron'),('Legolas','Sindarin'),('Legolas','Westron'),('Lúthien','Sindarin'),('Mallor','Sindarin'),('Mallor','Westron'),('Malvegil','Sindarin'),('Malvegil','Westron'),('Mandos','Valarin'),('Manwë','Valarin'),('Melian','Sindarin'),('Meneldil','Sindarin'),('Meriadoc Brandybuck','Westron'),('Minardil','Westron'),('Minastan','Westron'),('Mirabella Took','Westron'),('Morgoth','Valarin'),('Morwen','Westron'),('Morwen','Rohanese'),('Mungo Baggins','Westron'),('Náin II','Khuzdul'),('Narmacil I','Westron'),('Narmacil II','Westron'),('Nessa','Valarin'),('Nienna','Valarin'),('Nimloth','Sindarin'),('Númendil','Sindarin'),('Óin','Khuzdul'),('Olórin','Quenya'),('Olórin','Telerin'),('Olórin','Sindarin'),('Olórin','Valarin'),('Olórin','Westron'),('Olórin','Hobbitish'),('Olórin','Doriathrin'),('Olwë','Eldarin'),('Ondoher','Westron'),('Ornendil','Westron'),('Oromë','Valarin'),('Oropher','Sindarin'),('Oropher','Westron'),('Oropher','Silvan'),('Ostoher','Westron'),('Peregrin Took','Westron'),('Primula Brandybuck','Westron'),('Rían','Sindarin'),('Rómendacil I','Westron'),('Rómendacil II','Westron'),('Ruby Bolger','Westron'),('Samwise Gamgee','Westron'),('Sauron','Black Speech'),('Sauron','Valarin'),('Silmariën','Quenya'),('Siriondil','Westron'),('Tar-Amandil','Quenya'),('Tar-Elendil','Quenya'),('Tar-Meneldur','Quenya'),('Tarannon Falastur','Westron'),('Tarcil','Sindarin'),('Tarcil','Westron'),('Tarciryan','Westron'),('Tarondor of Arnor','Sindarin'),('Tarondor of Arnor','Westron'),('Tarondor of Gondor','Westron'),('Telemnar','Westron'),('Telumehtar','Westron'),('Thengel','Westron'),('Thengel','Rohanese'),('Théoden','Westron'),('Théoden','Rohanese'),('Thingol','Sindarin'),('Thranduil','Sindarin'),('Thranduil','Westron'),('Thranduil','Silvan'),('Tom Bombadil','Westron'),('Treebeard','Westron'),('Treebeard','Old Entish'),('Tulkas','Valarin'),('Tuor','Sindarin'),('Turambar','Westron'),('Turgon','Vinyamar'),('Ulmo','Valarin'),('Vairë','Valarin'),('Valacar','Westron'),('Valandil','Quenya'),('Valandil of Arnor','Sindarin'),('Valandil of Arnor','Westron'),('Valandur','Sindarin'),('Valandur','Westron'),('Vána','Valarin'),('Vardamir','Quenya'),('Vidugavia','Westron'),('Vidumavi','Westron'),('Walda','Westron'),('Walda','Rohanese'),('Witch-King','Black Speech'),('Yavanna','Valarin');
/*!40000 ALTER TABLE `characters_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `Name` varchar(45) NOT NULL,
  `Age_Started` varchar(15) NOT NULL,
  `Age_Finished` varchar(15) NOT NULL,
  `Location` varchar(30) NOT NULL,
  `Event_in_Movie` varchar(60) DEFAULT NULL,
  `Event_in_Book` varchar(60) NOT NULL,
  PRIMARY KEY (`Name`),
  KEY `fk_Events_Major Towns - Locations1_idx` (`Location`),
  KEY `fk_Events_Movies1_idx` (`Event_in_Movie`),
  KEY `fk_Events_Books1_idx` (`Event_in_Book`),
  CONSTRAINT `fk_Events_Books1` FOREIGN KEY (`Event_in_Book`) REFERENCES `books` (`Title`),
  CONSTRAINT `fk_Events_Major Towns - Locations1` FOREIGN KEY (`Location`) REFERENCES `major_towns_locations` (`Name`),
  CONSTRAINT `fk_Events_Movies1` FOREIGN KEY (`Event_in_Movie`) REFERENCES `movies` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES ('Battle of Isengard','TA3019/03/03','TA3019/03/03','Isengard','The Lord of the Rings: The Two Towers','The Two Towers'),('Battle of the Morannon','TA3019/03/25','TA3019/03/25','Black Gate','The Lord of the Rings: The Return of the King','The Return of the King'),('Battle of the Pelennor Fields','TA3019/03/15','TA3019/03/15','Pelennor Fields','The Lord of the Rings: The Return of the King','The Return of the King'),('Creation of Silmarils','YT1449','YT1450','Tirion',NULL,'The Silmarillion'),('Creation of the One Ring','SA1600','SA1600','Cracks of Doom','The Lord of the Rings: The Fellowship of the Ring','The Fellowship of the Ring'),('Destruction of Two Trees','YT1495','YT1495','Two Trees',NULL,'The Silmarillion'),('Disaster of the Morannon','TA1944','TA1944','Ithilien',NULL,'Unfinished Tales'),('Fall of Fornost','TA1974','TA1974','Fornost','','The Fellowship of the Ring'),('First Battle of the Fords of Isen','TA3019/02/25','TA3019/02/25','Isen','The Lord of the Rings: The Two Towers','Unfinished Tales'),('Great Plague','TA1635','TA1637','Rhûn',NULL,'Unfinished Tales'),('Second Battle of the Fords of Isen','TA3019/03/02','TA3019/03/02','Isen',NULL,'Unfinished Tales'),('Siege of Barad-dûr','SA3434','SA3441','Barad-dûr','The Lord of the Rings: The Fellowship of the Ring','The Fellowship of the Ring'),('War of Wrath','FA545','FA587','Angband',NULL,'The Silmarillion');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `Name` varchar(30) NOT NULL,
  `Age_of_Creation` varchar(15) DEFAULT NULL,
  `Age_of_Dissolution` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES ('Army of the West','TA3019/03/16','TA3019/03/25'),('Corsairs of Umbar',NULL,NULL),('Dunedain',NULL,NULL),('Fellowship of the Ring','TA3018/12/18','TA3019/08/22'),('Gondolindrim',NULL,NULL),('Grey Company',NULL,NULL),('Istari','Timeless Halls',NULL),('King\'s Men','SA2221','SA3319'),('Last Alliance of Elves and Men','SA3430','SA3441'),('Maiar','Timeless Halls',NULL),('Thorin and Company','TA2941','TA2941'),('Three Hunters','TA3019/02/26','TA3019/03/05'),('Valar','Timeless Halls',NULL),('White Council','SA1701','TA2953');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `houses` (
  `Name` enum('Isildur','Anárion','Elendil','Fingolfin','Finwë','Thingol','Húrin','Bëor','Haleth','Dol Amroth','Valandil','Feanor','Elros','Finarfin','Eorl','Durin') NOT NULL,
  `Founder` varchar(30) NOT NULL,
  PRIMARY KEY (`Name`),
  KEY `fk_Houses_Notable_Characters1_idx` (`Founder`),
  CONSTRAINT `fk_Houses_Notable_Characters1` FOREIGN KEY (`Founder`) REFERENCES `notable_characters` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houses`
--

LOCK TABLES `houses` WRITE;
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
INSERT INTO `houses` VALUES ('Anárion','Anárion'),('Bëor','Bëor the Old'),('Durin','Durin I'),('Elendil','Elendil'),('Elros','Elros'),('Eorl','Eorl'),('Finarfin','Finarfin'),('Fingolfin','Fingolfin'),('Finwë','Finwë'),('Húrin','Húrin'),('Isildur','Isildur'),('Valandil','Valandil');
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major_towns_locations`
--

DROP TABLE IF EXISTS `major_towns_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major_towns_locations` (
  `Name` varchar(30) NOT NULL,
  `Region` varchar(30) NOT NULL,
  PRIMARY KEY (`Name`),
  KEY `fk_Major_Towns_Locations_Regions1_idx` (`Region`),
  CONSTRAINT `fk_Major_Towns_Locations_Regions1` FOREIGN KEY (`Region`) REFERENCES `regions` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major_towns_locations`
--

LOCK TABLES `major_towns_locations` WRITE;
/*!40000 ALTER TABLE `major_towns_locations` DISABLE KEYS */;
INSERT INTO `major_towns_locations` VALUES ('Almaida','Andustar'),('Andúnië','Andustar'),('Eldalondë','Andustar'),('Nísimaldar','Andustar'),('Oromet','Andustar'),('Adurant','Beleriand'),('Aros','Beleriand'),('Ascar','Beleriand'),('Brilthor','Beleriand'),('Brithon','Beleriand'),('Celebros','Beleriand'),('Celon','Beleriand'),('Doriath','Beleriand'),('Dorthonion','Beleriand'),('Dry River','Beleriand'),('Duilwen','Beleriand'),('Eithel Sirion','Beleriand'),('Esgalduin','Beleriand'),('Falas','Beleriand'),('Gelion','Beleriand'),('Ginglith','Beleriand'),('Glithui','Beleriand'),('Gondolin','Beleriand'),('Greater Gelion','Beleriand'),('Legolin','Beleriand'),('Lithir','Beleriand'),('Little Gelion','Beleriand'),('Luthany','Beleriand'),('Malduin','Beleriand'),('Mindeb','Beleriand'),('Narog','Beleriand'),('Nen Lalaith','Beleriand'),('Nenning','Beleriand'),('Ringwil','Beleriand'),('Rivil','Beleriand'),('Rivils Well','Beleriand'),('Shadowy Spring','Beleriand'),('Sirion','Beleriand'),('Taeglin','Beleriand'),('Thalos','Beleriand'),('Thorn Sir','Beleriand'),('Cuiviénen','Easter Lands'),('East Sea','Easter Lands'),('Hildórien','Easter Lands'),('Land of the Sun','Easter Lands'),('Last Desert','Easter Lands'),('Orocarni','Easter Lands'),('Rhûn','Easter Lands'),('Sea of Helcar','Easter Lands'),('Sea of Rhûn','Easter Lands'),('Sea of Ringil','Easter Lands'),('Walls of the Sun','Easter Lands'),('Wild Wood','Easter Lands'),('Yellow Mountain ','Easter Lands'),('Alqualondë','Eldamar'),('Bay of Eldamar','Eldamar'),('Calacirian','Eldamar'),('Faerie','Eldamar'),('Formenos','Eldamar'),('Great Square','Eldamar'),('Mindon Eldaliéva','Eldamar'),('Tirion','Eldamar'),('Túna','Eldamar'),('White House of Erendis','Emerië'),('Angband','Ered Engrin'),('Utumno','Ered Engrin'),('Annúminas','Eriador'),('Arnor','Eriador'),('Arthedain','Eriador'),('Bag End','Eriador'),('Barrow-downs','Eriador'),('Bree','Eriador'),('Bywater','Eriador'),('Cardolan','Eriador'),('Fornost Erain','Eriador'),('Hobbiton','Eriador'),('The Prancing Pony','Eriador'),('The Shire','Eriador'),('North Cape','Forostar'),('Ondosto','Forostar'),('Sorontil','Forostar'),('Tompollë','Forostar'),('Andrast','Gondor'),('Anfalas','Gondor'),('Anórien','Gondor'),('Argonath','Gondor'),('Bay of Belfalas','Gondor'),('Belfalas','Gondor'),('Blackroot Vale','Gondor'),('Cair Andros','Gondor'),('Calembel','Gondor'),('Calenardhon','Gondor'),('Calenhir','Gondor'),('Celos','Gondor'),('Ciril','Gondor'),('Cobas Haven','Gondor'),('Cross-roads','Gondor'),('Crossings of Erui','Gondor'),('Crossings of Poros','Gondor'),('Cûl Bîn','Gondor'),('Cûl Veleg','Gondor'),('Dol Amroth','Gondor'),('Dol Tarlang','Gondor'),('Dor-en-Ernil','Gondor'),('Drúadan Forest','Gondor'),('Drúwaith Iaur','Gondor'),('Edhellond','Gondor'),('Emyn Arnen','Gondor'),('Emyn Muil','Gondor'),('Erech','Gondor'),('Erui','Gondor'),('Ethir Anduin','Gondor'),('Ethring','Gondor'),('Field of Cormallen','Gondor'),('Gilrain','Gondor'),('Great West Road','Gondor'),('Grey Wood','Gondor'),('Harad Road','Gondor'),('Harondor','Gondor'),('Hill of Guard','Gondor'),('Imloth Melui','Gondor'),('Ithilien','Gondor'),('Lamedon','Gondor'),('Lebennin','Gondor'),('Lefnui','Gondor'),('Linhir','Gondor'),('Lossarnach','Gondor'),('Minas Morgul','Gondor'),('Minas Tirith','Gondor'),('Mindolluin','Gondor'),('Morgul-road','Gondor'),('Morgulduin','Gondor'),('Mornan','Gondor'),('Morthond','Gondor'),('Mounds of Mundburg','Gondor'),('Mouths of Entwash','Gondor'),('Nen Hithoel','Gondor'),('Nindalf','Gondor'),('North Ithilien','Gondor'),('North Stair','Gondor'),('North-South Road','Gondor'),('Osgiliath','Gondor'),('Pelargir','Gondor'),('Pelennor Fields','Gondor'),('Pinnath Gelin','Gondor'),('Rauros-Falls','Gondor'),('Ringló','Gondor'),('Ringló Vale','Gondor'),('Serni','Gondor'),('Sirith','Gondor'),('South Ithilien','Gondor'),('South Road','Gondor'),('Stone of Erech','Gondor'),('Tol Brandir','Gondor'),('Umbar','Gondor'),('Hyarnustar','Hyarnustar'),('Nindamos','Hyarrostar'),('Blue Mountains','Lindon'),('Forlindon','Lindon'),('Forlond','Lindon'),('Grey Havens','Lindon'),('Gulf of Lune','Lindon'),('Harlindon','Lindon'),('Lhûn','Lindon'),('Little Lune','Lindon'),('Doors of Durin','Misty Mountains'),('Isengard','Misty Mountains'),('Moria','Misty Mountains'),('Arandor','Mittalmar'),('Armenelos','Mittalmar'),('Hallow of Eru','Mittalmar'),('Rómenna','Mittalmar'),('Barad-dûr','Mordor'),('Black Gate','Mordor'),('Black Pits','Mordor'),('Carach Angren','Mordor'),('Cracks of Doom','Mordor'),('Morgul Pass','Mordor'),('Morgul Vale','Mordor'),('Mount Doom','Mordor'),('Nurn','Mordor'),('Plateau of Gorgoroth','Mordor'),('Sea of Núrnen','Mordor'),('Shelob Lair','Mordor'),('Tower of Cirith Ungol','Mordor'),('Orrostar','Orrostar'),('Brown Lands','Rhovanion'),('Caras Galadhon','Rhovanion'),('Carrock','Rhovanion'),('Dagorlad','Rhovanion'),('Dale','Rhovanion'),('Dead Marshes','Rhovanion'),('Dol Guldur','Rhovanion'),('Dorwinion','Rhovanion'),('East Bight','Rhovanion'),('Elvenking Halls','Rhovanion'),('Enchanted River','Rhovanion'),('Field of Celebrant','Rhovanion'),('Gladden Fields','Rhovanion'),('Grey Mountains','Rhovanion'),('Hall of Beorn','Rhovanion'),('Iron Hills','Rhovanion'),('Lake-town','Rhovanion'),('Lonely Mountain','Rhovanion'),('Lothlórien','Rhovanion'),('Mirkwood','Rhovanion'),('Undeeps','Rhovanion'),('Withered Heath','Rhovanion'),('Adorn','Rohan'),('Aldburg','Rohan'),('Barrowfield','Rohan'),('Dunharrow','Rohan'),('Eastemnet','Rohan'),('Eastfold','Rohan'),('Edoras','Rohan'),('Enedwaith','Rohan'),('Entwash','Rohan'),('Fenmarch','Rohan'),('Folde','Rohan'),('Gap of Rohan','Rohan'),('Glittering Caves','Rohan'),('Hornburg','Rohan'),('Isen','Rohan'),('Mering Stream','Rohan'),('Snowbourn','Rohan'),('The Wold','Rohan'),('Tomb of Elendil','Rohan'),('West-march','Rohan'),('Westemnet','Rohan'),('Westfold','Rohan'),('Desert of Lostladen','Southern Lands'),('Far Harad','Southern Lands'),('Harad','Southern Lands'),('Khand','Southern Lands'),('Nargil Pass','Southern Lands'),('Near Harad','Southern Lands'),('White pillar','Southern Lands'),('Afros','Tol Eressëa'),('Alalminórë','Tol Eressëa'),('Avallónë','Tol Eressëa'),('Celbaros','Tol Eressëa'),('Estirin','Tol Eressëa'),('Gruir','Tol Eressëa'),('Íverin','Tol Eressëa'),('Tower of Avallónë','Tol Eressëa'),('Ezellohar','Valinor'),('Fôs Almir','Valinor'),('Halls of Aulë','Valinor'),('Halls of Mandos','Valinor'),('Halls of Nienna','Valinor'),('Híri','Valinor'),('Pastures of Yavanna','Valinor'),('Two Trees','Valinor'),('Valimar','Valinor'),('Woods of Oromë','Valinor'),('Amon Anwar','White Mountains'),('Amon Dîn','White Mountains'),('Calenhad','White Mountains'),('Eilenach','White Mountains'),('Erelas','White Mountains'),('Hill of Erech','White Mountains'),('Min-Rimmon','White Mountains'),('Nardol','White Mountains'),('Paths of the Dead','White Mountains');
/*!40000 ALTER TABLE `major_towns_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `Title` varchar(60) NOT NULL,
  `Director` varchar(30) NOT NULL,
  `Screenwriter` varchar(30) NOT NULL,
  `Date_Released` date NOT NULL,
  `Runtime` int NOT NULL,
  `Book_Adapting` varchar(60) NOT NULL,
  PRIMARY KEY (`Title`),
  KEY `fk_Movies_Books1_idx` (`Book_Adapting`),
  CONSTRAINT `fk_Movies_Books1` FOREIGN KEY (`Book_Adapting`) REFERENCES `books` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES ('Skazochnoe puteshestvie mistera Bilbo Begginsa, Khobbita','Vladimir Latyshev','Tatyana Yakovleva','1985-06-06',66,'The Hobbit'),('The Hobbit','Jules Bass','Romeo Muller','1977-11-27',90,'The Hobbit'),('The Hobbit: An Unexpected Journey','Peter Jackson','Philippa Boyens','2012-12-13',182,'The Hobbit'),('The Hobbit: The Battle of the Five Armies','Peter Jackson','Philippa Boyens','2014-12-18',164,'THe Hobbit'),('The Hobbit: The Desolation of Smaug','Peter Jackson','Philippa Boyens','2013-12-12',186,'The Hobbit'),('The Lord of the Rings','Ralph Bakshi','Chris Conkling','1978-11-15',132,'The Fellowship of the Ring'),('The Lord of the Rings: The Fellowship of the Ring','Peter Jackson','Fran Walsh','2001-12-19',208,'The Fellowship of the Ring'),('The Lord of the Rings: The Return of the King','Peter Jackson','Fran Walsh','2003-12-17',252,'The Return of the King'),('The Lord of the Rings: The Two Towers','Peter Jackson','Fran Walsh','2002-12-18',223,'The Two Towers'),('The Return of the King','Jules Bass','Romeo Muller','1980-05-11',98,'The Return of the King');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notable_characters`
--

DROP TABLE IF EXISTS `notable_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notable_characters` (
  `Name` varchar(30) NOT NULL,
  `Mother` varchar(30) DEFAULT NULL,
  `Father` varchar(30) DEFAULT NULL,
  `Age_of_Birth` varchar(15) DEFAULT NULL,
  `Age_of_Death` varchar(15) DEFAULT NULL,
  `Race` enum('Men','Elves','Half-Elves','Dwarves','Orcs','Goblins','Trolls','Hobbits','Dragons','Ainur','Werewolves','Eagles','Ents','God') NOT NULL,
  `House` enum('Isildur','Anárion','Elendil','Fingolfin','Finwë','Thingol','Húrin','Bëor','Haleth','Dol Amroth','Valandil','Feanor','Elros','Finarfin','Eorl','Durin') DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `fk_Notable Characters_Notable Characters2_idx` (`Mother`),
  KEY `fk_Notable Characters_Notable Characters1_idx` (`Father`),
  KEY `fk_Notable_Characters_Races1_idx` (`Race`),
  KEY `fk_Notable_Characters_Houses1_idx` (`House`),
  CONSTRAINT `fk_Notable Characters_Notable Characters1` FOREIGN KEY (`Father`) REFERENCES `notable_characters` (`Name`),
  CONSTRAINT `fk_Notable Characters_Notable Characters2` FOREIGN KEY (`Mother`) REFERENCES `notable_characters` (`Name`),
  CONSTRAINT `fk_Notable_Characters_Houses1` FOREIGN KEY (`House`) REFERENCES `houses` (`Name`),
  CONSTRAINT `fk_Notable_Characters_Races1` FOREIGN KEY (`Race`) REFERENCES `races` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notable_characters`
--

LOCK TABLES `notable_characters` WRITE;
/*!40000 ALTER TABLE `notable_characters` DISABLE KEYS */;
INSERT INTO `notable_characters` VALUES ('Adamanta Chubb',NULL,NULL,'TA2790','TA2862','Hobbits',NULL),('Aldamir',NULL,'Eldacar  of Arnor','TA1330','TA1540','Men','Anárion'),('Aldor',NULL,'Brego','TA2544','TA2645','Men','Eorl'),('Amandil',NULL,'Númendil',NULL,NULL,'Men','Valandil'),('Amlaith',NULL,'Eärendur','TA726','TA946','Men','Isildur'),('Anairë',NULL,NULL,NULL,NULL,'Elves','Fingolfin'),('Anardil',NULL,'Eärendil','TA136','TA411','Men','Anárion'),('Anárion',NULL,'Elendil','SA3219','SA3440','Men','Elendil'),('Arador',NULL,'Argonui','TA2012','TA2930','Men','Isildur'),('Araglas',NULL,'Aragorn I','TA2296','TA2455','Men','Isildur'),('Aragorn I',NULL,'Aravir','TA2227','TA2327','Men','Isildur'),('Aragorn II','Gilraen','Arathorn II','TA2931/03/01','FoA120/03/01','Men','Isildur'),('Aragost',NULL,'Arahad I','TA2431','TA2588','Men','Isildur'),('Arahad I',NULL,'Araglas','TA2356','TA2523','Men','Isildur'),('Arahad II',NULL,'Aravorn','TA2563','TA2719','Men','Isildur'),('Arahael',NULL,'Aranarth','TA2012','TA2177','Men','Isildur'),('Aranarth','Fíriel','Arvedui','TA1938','TA2106','Men','Isildur'),('Aranuir',NULL,'Arahael','TA2084','TA2247','Men','Isildur'),('Araphant',NULL,'Araval','TA1789','TA1964','Men','Isildur'),('Araphor',NULL,'Arveleg I','TA1391','TA1589','Men','Isildur'),('Arassuil',NULL,'Arahad II','TA2628','TA2784','Men','Isildur'),('Arathorn I',NULL,'Arassuil','TA2693','TA2848','Men','Isildur'),('Arathorn II',NULL,'Arador','TA2873','TA2933','Men','Isildur'),('Araval',NULL,'Arveleg II','TA1711','TA1891','Men','Isildur'),('Aravir',NULL,'Aranuir','TA2156','TA2319','Men','Isildur'),('Aravorn',NULL,'Aragost','TA2497','TA2654','Men','Isildur'),('Arciryas',NULL,'Telumehtar','TA1684','TA1856','Men','Anárion'),('Argeleb I',NULL,'Malvegil','TA1226','TA1356','Men','Isildur'),('Argeleb II',NULL,'Araphor','TA1473','TA1670','Men','Isildur'),('Argonui',NULL,'Arathorn I','TA2757','TA2912','Men','Isildur'),('Artamir',NULL,'Ondoher',NULL,'ΤΑ1944','Men','Anárion'),('Arvedui',NULL,'Araphant','TA1864','TA1974','Men','Isildur'),('Arvegil',NULL,'Argeleb II','TA1553','TA1743','Men','Isildur'),('Arveleg I',NULL,'Argeleb I','TA1309','TA1409','Men','Isildur'),('Arveleg II',NULL,'Arvegil','TA1633','TA1813','Men','Isildur'),('Atanatar I',NULL,'Turambar','TA480','TA748','Men','Anárion'),('Atanatar II',NULL,'Hyarmendacil I','TA977','TA1226','Men','Anárion'),('Aulë',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Barahir',NULL,'Bregor','FA400','FA460','Men','Bëor'),('Baran',NULL,'Bëor the Old','FA289','FA380','Men','Bëor'),('Beleg',NULL,'Amlaith','TA811','TA1029','Men','Isildur'),('Belegund',NULL,'Bregolas','FA422','FA460','Men','Bëor'),('Bell Goodchild',NULL,NULL,'TA2926',NULL,'Hobbits',NULL),('Belladonna Took','Adamanta Chubb','Gerontius Took','TA2852','TA2934','Hobbits',NULL),('Bëor the Old',NULL,NULL,'FA262','FA355','Men',NULL),('Beren','Emeldir','Barahir','FA432','FA503','Men','Bëor'),('Bilbo Baggins','Belladonna Took','Bungo Baggins','TA2890/09/22',NULL,'Hobbits',NULL),('Borin',NULL,'Náin II','TA2450','TA2711','Dwarves','Durin'),('Boromir',NULL,'Denethor II','TA2978','TA3019/02/26','Men','Húrin'),('Boromir of Ladros',NULL,'Boron','FA338','FA432','Men','Bëor'),('Boron',NULL,'Baran','FA315','FA408','Men','Bëor'),('Brego',NULL,'Eorl','TA2512','TA2570','Men','Eorl'),('Bregolas',NULL,'Bregor','FA393','FA455','Men','Bëor'),('Bregor',NULL,'Boromir of Ladros','FA359','FA448','Men','Bëor'),('Brytta',NULL,'Fréaláf','TA2752','TA2842','Men','Eorl'),('Bungo Baggins','Laura Grubb','Mungo Baggins','TA2846','TA2926','Hobbits',NULL),('Calimehtar',NULL,'Calmacil',NULL,NULL,'Men','Anárion'),('Calimehtar the King',NULL,'Narmacil II','TA1736','TA1936','Men','Anárion'),('Calmacil',NULL,'Atanatar II','TA1058','TA1304','Men','Anárion'),('Celeborn',NULL,'Galadhon',NULL,NULL,'Elves',NULL),('Celebrindor',NULL,'Celepharn','TA1062','TA1272','Men','Isildur'),('Celepharn',NULL,'Mallor','TA979','TA1191','Men','Isildur'),('Cemendur',NULL,'Meneldil','SA3399','TA238','Men','Anárion'),('Ciryandil',NULL,'Eärnil I','TA820','TA1015','Men','Anárion'),('Déagol',NULL,NULL,NULL,'TA2463','Hobbits',NULL),('Denethor II',NULL,NULL,'TA2930','TA3019/03/15','Men','Húrin'),('Déor',NULL,'Goldwine','TA2644','TA2718','Men','Eorl'),('Dior','Lúthien','Beren','FA470','FA506','Men','Bëor'),('Dírhael',NULL,NULL,NULL,NULL,'Men','Isildur'),('Dora Baggins','Ruby Bolger','Fosco Baggins','TA2902','TA3006','Hobbits',NULL),('Drogo Baggins','Ruby Bolger','Fosco Baggins','TA2908','TA2980','Hobbits',NULL),('Dudo Baggins','Ruby Bolger','Fosco Baggins','TA2911','TA3009','Hobbits',NULL),('Durin I',NULL,NULL,'YT1132-1150',NULL,'Dwarves',NULL),('Eärendil',NULL,'Cemendur','TA48','TA324','Men','Anárion'),('Eärendil the Mariner','Tuor','Idril','FA503',NULL,'Half-Elves',NULL),('Eärendur',NULL,'Elendur','TA640','TA861','Men','Isildur'),('Eärnil I',NULL,'Tarciryan','TA736','TA936','Men','Anárion'),('Eärwen',NULL,'Olwë',NULL,NULL,'Elves',NULL),('Elatan',NULL,NULL,NULL,NULL,'Men',NULL),('Eldacar of Arnor','Vidumavi','Valacar','TA1255','TA1490','Men','Anárion'),('Eldacar of Gondor',NULL,'Valandil of Arnor','TA87','TA339','Men','Isildur'),('Elendil',NULL,'Amandil','SA3119','SA3441','Men','Valandil'),('Elendur',NULL,'Valandur','TA552','TA777','Men','Isildur'),('Elenwë',NULL,NULL,NULL,'YT1500','Elves',NULL),('Elmo',NULL,NULL,'YT1105-1150',NULL,'Elves',NULL),('Elrond','Elwing','Eärendil the Mariner','FA532','SA442','Half-Elves',NULL),('Elros','Elwing','Eärendil the Mariner','FA532','SA442','Half-Elves',NULL),('Elwing','Nimloth','Dior','FA503',NULL,'Half-Elves',NULL),('Emeldir',NULL,NULL,'FA406',NULL,'Men','Bëor'),('Eorl',NULL,NULL,'TA2485','TA2545','Men',NULL),('Eru Ilúvatar',NULL,NULL,NULL,NULL,'God',NULL),('Estë',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Faramir',NULL,'Denethor II','TA2983','FoA82','Men','Húrin'),('Faramir of Gondor',NULL,'Ondoher','TA1896','ΤΑ1944','Men','Anárion'),('Farin',NULL,'Borin','TA2560','TA2803','Dwarves','Durin'),('Fengel',NULL,'Folcwine','TA2830','TA2903','Men','Eorl'),('Finarfin','Indis','Finwë','YT1230',NULL,'Elves','Finwë'),('Fingolfin','Indis','Finwë','YT1190','FA456','Elves','Finwë'),('Finwë',NULL,NULL,'YT1050-1102','YT1495','Elves',NULL),('Fíriel',NULL,'Ondoher','TA1896',NULL,'Men','Anárion'),('Folca',NULL,'Walda','TA2780','TA2851','Men','Eorl'),('Folcwine',NULL,'Folca','TA2804','TA2864','Men','Eorl'),('Fosco Baggins',NULL,NULL,'TA2864','TA2960','Hobbits',NULL),('Fréa',NULL,'Aldor','TA2570','TA2659','Men','Eorl'),('Fréaláf','Hild',NULL,'TA2726','TA2798','Men','Eorl'),('Fréawine',NULL,'Fréa','TA2594','TA2680','Men','Eorl'),('Frodo Baggins','Primula Brandybuck','Drogo Baggins','TA2968/09/11',NULL,'Hobbits',NULL),('Galadhon',NULL,'Elmo',NULL,NULL,'Elves',NULL),('Galadriel','Eärwen','Finarfin','YT1362',NULL,'Elves','Finarfin'),('Galathil',NULL,'Galadhon',NULL,NULL,'Elves',NULL),('Gerontius Took',NULL,NULL,'TA2790','TA2920','Hobbits',NULL),('Gilraen','Ivorwen','Dírhael','TA2907','TA3007','Men','Isildur'),('Gimli',NULL,'Glóin','TA2879',NULL,'Dwarves','Durin'),('Glóin',NULL,'Gróin','TA2783','FoA15','Dwarves','Durin'),('Goldwine',NULL,'Fréawine','TA2619','TA2699','Men','Eorl'),('Gollum',NULL,NULL,'TA2430','TA3019/03/25','Hobbits',NULL),('Gorbadoc Brandybuck',NULL,NULL,'TA2860','TA2963','Hobbits',NULL),('Gram',NULL,'Déor','TA2688','TA2741','Men','Eorl'),('Gróin',NULL,'Farin','TA2671','TA2923','Dwarves','Durin'),('Haldir',NULL,NULL,NULL,NULL,'Elves',NULL),('Hamfast Gamgee',NULL,'Hobson Gamgee','TA2926','FoA7','Hobbits',NULL),('Helm Hammerhand',NULL,'Gram','TA2691','TA2759','Men','Eorl'),('Hild',NULL,'Gram',NULL,NULL,'Men','Eorl'),('Huor',NULL,NULL,'FA444','FA472','Men',NULL),('Húrin',NULL,NULL,NULL,NULL,'Men',NULL),('Hyarmendacil I',NULL,'Ciryandil','TA889','TA1149','Men','Anárion'),('Hyarmendacil II',NULL,'Aldamir','TA1391','TA1621','Men','Anárion'),('Idril','Elenwë','Turgon','YT1479',NULL,'Elves','Fingolfin'),('Indis',NULL,NULL,NULL,NULL,'Elves',NULL),('Irmo',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Isildur',NULL,'Elendil','SA3209','TA2','Men','Elendil'),('Isilmë',NULL,'Tar-Elendil','SA532',NULL,'Men','Elros'),('Ivorwen',NULL,NULL,NULL,NULL,'Men','Isildur'),('Laura Grubb',NULL,NULL,'TA2814','TA2916','Hobbits',NULL),('Legolas',NULL,'Thranduil',NULL,NULL,'Elves',NULL),('Lúthien','Melian','Thingol','YT1050-1102','FA503','Elves',NULL),('Mallor',NULL,'Beleg','TA895','TA1110','Men','Isildur'),('Malvegil',NULL,'Celebrindor','TA1144','TA1349','Men','Isildur'),('Mandos',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Manwë',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Melian',NULL,'Thingol','YT1050-1102','FA503','Elves',NULL),('Meneldil',NULL,'Anárion','SA3318','TA158','Men','Anárion'),('Meriadoc Brandybuck',NULL,NULL,'TA2982',NULL,'Hobbits',NULL),('Minardil',NULL,'Hyarmendacil II','TA1454','TA1634','Men','Anárion'),('Minastan',NULL,'Minardil',NULL,NULL,'Men','Anárion'),('Mirabella Took',NULL,NULL,'TA2860','TA2960','Hobbits',NULL),('Morgoth',NULL,NULL,'Timeless Halls','FA590','Ainur',NULL),('Morwen',NULL,NULL,'TA2922',NULL,'Men',NULL),('Mungo Baggins',NULL,NULL,'TA2807','TA2900','Hobbits',NULL),('Náin II',NULL,'Óin','TA2338','TA2585','Dwarves','Durin'),('Narmacil I',NULL,'Atanatar II','TA1049','TA1294','Men','Anárion'),('Narmacil II',NULL,'Telumehtar','TA1684','TA1856','Men','Anárion'),('Nessa',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Nienna',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Nimloth',NULL,'Galathil','FA506',NULL,'Elves',NULL),('Númendil',NULL,NULL,NULL,NULL,'Men','Valandil'),('Óin',NULL,NULL,'TA2238','TA2488','Dwarves','Durin'),('Olórin',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Olwë',NULL,NULL,'YT1050-1102',NULL,'Elves',NULL),('Ondoher',NULL,'Calimehtar the King','ΤΑ1787','ΤΑ1944','Men','Anárion'),('Ornendil',NULL,'Eldacar  of Arnor',NULL,'TA1437','Men','Anárion'),('Oromë',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Oropher',NULL,NULL,NULL,'SA3434','Elves',NULL),('Ostoher',NULL,'Anardil','TA222','TA492','Men','Anárion'),('Peregrin Took',NULL,NULL,'TA2990',NULL,'Hobbits',NULL),('Primula Brandybuck','Mirabella Took','Gorbadoc Brandybuck','TA2920','TA2980','Hobbits',NULL),('Rían',NULL,'Belegund','FA450','FA472','Men','Bëor'),('Rómendacil I',NULL,'Ostoher','TA310','TA541','Men','Anárion'),('Rómendacil II',NULL,'Calmacil','TA1126','TA1366','Men','Anárion'),('Ruby Bolger',NULL,NULL,'TA2864',NULL,'Hobbits',NULL),('Samwise Gamgee','Bell Goodchild','Hamfast Gamgee','TA2980/04/06',NULL,'Hobbits',NULL),('Sauron',NULL,NULL,'Timeless Halls','TA3019/03/25','Ainur',NULL),('Silmariën',NULL,'Tar-Elendil','SA521',NULL,'Men','Elros'),('Siriondil',NULL,'Atanatar I','TA570','TA830','Men','Anárion'),('Tar-Amandil',NULL,'Vardamir','SA192','SA603','Men','Elros'),('Tar-Elendil',NULL,'Tar-Amandil','SA350','SA751','Men','Elros'),('Tar-Meneldur',NULL,'Tar-Elendil','SA543','SA942','Men','Elros'),('Tarannon Falastur',NULL,'Siriondil','TA654','TA913','Men','Anárion'),('Tarcil',NULL,'Eldacar of Gondor','TA280','TA515','Men','Isildur'),('Tarciryan',NULL,'Siriondil',NULL,NULL,'Men','Anárion'),('Tarondor of Arnor',NULL,'Tarcil','TA372','TA602','Men','Isildur'),('Tarondor of Gondor',NULL,'Minastan','TA1577','TA1598','Men','Anárion'),('Telemnar',NULL,'Minardil','TA1516','TA1636','Men','Anárion'),('Telumehtar',NULL,'Tarondor of Gondor','TA1632','TA1850','Men','Anárion'),('Thengel',NULL,'Fengel','TA2905','TA2980','Men','Eorl'),('Théoden','Morwen','Thengel','TA2948','TA3019/03/15','Men','Eorl'),('Thingol',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Thranduil',NULL,'Oropher',NULL,NULL,'Elves',NULL),('Tom Bombadil',NULL,NULL,NULL,NULL,'God',NULL),('Treebeard',NULL,NULL,NULL,NULL,'Ents',NULL),('Tulkas',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Tuor','Rían','Huor','FA472',NULL,'Men',NULL),('Turambar',NULL,'Rómendacil I','TA397','TA667','Men','Anárion'),('Turgon','Anairë','Fingolfin','YT1300','FA510','Elves','Fingolfin'),('Ulmo',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Vairë',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Valacar',NULL,'Rómendacil II','TA1194','TA1432','Men','Anárion'),('Valandil','Silmariën','Elatan','SA630',NULL,'Men',NULL),('Valandil of Arnor',NULL,'Isildur','SA3430','TA249','Men','Isildur'),('Valandur',NULL,'Tarondor of Arnor','TA462','TA652','Men','Isildur'),('Vána',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL),('Vardamir',NULL,'Elros','SA61','SA471','Men','Elros'),('Vidugavia',NULL,NULL,NULL,NULL,'Men','Anárion'),('Vidumavi',NULL,'Vidugavia',NULL,'TA1332','Men','Anárion'),('Walda',NULL,'Brytta','TA2780','TA2851','Men','Eorl'),('Witch-King',NULL,NULL,NULL,'TA3019/03/15','Men',NULL),('Yavanna',NULL,NULL,'Timeless Halls',NULL,'Ainur',NULL);
/*!40000 ALTER TABLE `notable_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `races` (
  `Name` enum('Men','Elves','Half-Elves','Dwarves','Orcs','Goblins','Trolls','Hobbits','Dragons','Ainur','Werewolves','Eagles','Ents','God') NOT NULL,
  `Creator` varchar(30) NOT NULL,
  `Lifespan` varchar(30) NOT NULL,
  `Average_Height` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `fk_Races_Notable Characters_idx` (`Creator`),
  CONSTRAINT `fk_Races_Notable Characters` FOREIGN KEY (`Creator`) REFERENCES `notable_characters` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `races`
--

LOCK TABLES `races` WRITE;
/*!40000 ALTER TABLE `races` DISABLE KEYS */;
INSERT INTO `races` VALUES ('Men','Eru Ilúvatar','160','1.75'),('Elves','Eru Ilúvatar','Immortal','2.10'),('Half-Elves','Eru Ilúvatar','Immortal','1.90'),('Dwarves','Aulë the Smith','300','1.22'),('Orcs','Morgoth','280','1.54'),('Goblins','Morgoth','150','0.97'),('Trolls','Morgoth','Unknown','3.20'),('Hobbits','Eru Ilúvatar','100','0.92'),('Dragons','Morgoth','Long','Massive'),('Ainur','Eru Ilúvatar','Immortal',NULL),('Werewolves','Sauron','Unkown','2.30'),('Eagles','Manwë','Long','Giant'),('Ents','Eru Ilúvatar','Long','5'),('God','Eru Ilúvatar','Immortal',NULL);
/*!40000 ALTER TABLE `races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `Name` varchar(30) NOT NULL,
  `Continent` enum('Middle-Earth','Aman','Númenor') NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES ('Andustar','Númenor'),('Beleriand','Middle-Earth'),('Eastern Lands','Middle-Earth'),('Eldamar','Aman'),('Ered Engrin','Middle-Earth'),('Eriador','Middle-Earth'),('Forostar','Númenor'),('Gondor','Middle-Earth'),('Hyarnustar','Númenor'),('Hyarrostar','Númenor'),('Lindon','Middle-Earth'),('Misty Mountains','Middle-Earth'),('Mittalmar','Númenor'),('Mordor','Middle-Earth'),('Orrostar','Númenor'),('Rhovanion','Middle-Earth'),('Rohan','Middle-Earth'),('Southern Lands','Middle-Earth'),('Tol Eressëa','Aman'),('Valinor','Aman'),('White Mountains','Middle-Earth');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view1`
--

DROP TABLE IF EXISTS `view1`;
/*!50001 DROP VIEW IF EXISTS `view1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view1` AS SELECT 
 1 AS `Name`,
 1 AS `Race`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view2`
--

DROP TABLE IF EXISTS `view2`;
/*!50001 DROP VIEW IF EXISTS `view2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view2` AS SELECT 
 1 AS `Name`,
 1 AS `Race`,
 1 AS `Age of Birth`,
 1 AS `Age of Death`,
 1 AS `Artifact`,
 1 AS `Age Created`,
 1 AS `Age Destroyed`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view1`
--

/*!50001 DROP VIEW IF EXISTS `view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view1` AS select `character_in_group`.`Character` AS `Name`,`notable_characters`.`Race` AS `Race` from (`notable_characters` join `character_in_group` on((`notable_characters`.`Name` = `character_in_group`.`Character`))) where (`character_in_group`.`Group` = 'Fellowship of the Ring') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view2`
--

/*!50001 DROP VIEW IF EXISTS `view2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view2` AS select `notable_characters`.`Name` AS `Name`,`notable_characters`.`Race` AS `Race`,`notable_characters`.`Age_of_Birth` AS `Age of Birth`,`notable_characters`.`Age_of_Death` AS `Age of Death`,`artifacts`.`Name` AS `Artifact`,`artifacts`.`Age_Created` AS `Age Created`,`artifacts`.`Age_Destroyed` AS `Age Destroyed` from (`artifacts` join `notable_characters` on((`artifacts`.`Creator` = `notable_characters`.`Name`))) where (`artifacts`.`Name` = 'The One Ring') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-07 12:41:08
