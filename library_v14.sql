CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `isbn` varchar(45) NOT NULL,
  `copies` int DEFAULT NULL,
  `bTitle` varchar(256) NOT NULL,
  `author` varchar(45) DEFAULT NULL,
  `publisher` varchar(45) DEFAULT NULL,
  `tags` varchar(256) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `index_books` (`bTitle`,`tags`,`author`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('0007203543',NULL,'The fellowship of the ring','J.R.R. Tolkien','HarperCollins','Skönlitteratur, Fantasy, Sagan om ringen','H13R4'),('1292061189',NULL,'Database systems : a practical approach to design, implementation, and management','Thomas M. Connolly, Carolyn E. Begg','Pearson Education Limited','Database management, Databases','H3R3'),('9780141036144',NULL,'1984','George Orwell','Penguin Books Ltd.','Skönlitteratur, Klassisk Science Fiction','H10R4'),('9780261102361',NULL,'The Two Towers','J.R.R. Tolkien','HarperCollins','Skönlitteratur, Fantasy, Lord of the rings, Sagan om ringen','H13R3'),('9780261102378',NULL,'The Return of the King','J.R.R. Tolkien','HarperCollins','Skönlitteratur, Fantasy, Lord of the rings, Sagan om ringen','H13R4'),('9780316389709',NULL,'Sword of destiny','Andrzej Sapkowski','Orbit','Monster, Magi, Trollkarlar, Wizards, Magic, Monsters, Romaner, Fantasy','H22R2'),('9780470146354',NULL,'Software testing: Testing across the entire software development life cycle','Gerald D. Everett, Raymond McLeod, Jr.','IEEE Press','Computer software Testing, Development','H3R3'),('9780575081567',NULL,'Necronomicon','H.P. Lovecraft','Gollancz','Skönlitteratur, Science Fiction','H12R2'),('9781473231061',NULL,'The last wish : introducing The Witcher','Andrzej Sapkowski','Orion','Monster, Magi, Trollkarlar, Wizards, Magic, Monsters, Romaner, Fantasy','H22R1'),('9781484200292',NULL,'Beginning Python : from novice to professional','Magnus Lie Hetland','Apress, cop.','Python, Programming, Programmering','H3R1'),('9781847493507',NULL,'Frankenstein','Mary Shelley','Alma Classics','Skönlitteratur, Klassiker','H12R1'),('9789144085876',NULL,'Java : steg för steg','Jan Skansholm','Studentlitteratur','Java, Programming, Programmering','H3R1'),('9789144122991',NULL,'Interaktionsdesign och UX : om att skapa en god användarupplevelse','Mattias Arvola','Studentlitteratur AB','Studentlitteratur','H1R1'),('9789176216132',NULL,'Musse Piggs klubbhus rave','Lukas Simoni','Lukas Böcker AB','Party','H27R2');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copies`
--

DROP TABLE IF EXISTS `copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copies` (
  `barcode` varchar(45) NOT NULL,
  `returned` varchar(20) NOT NULL,
  `cType` varchar(5) NOT NULL DEFAULT 'S',
  `isbn` varchar(45) DEFAULT NULL,
  `artNr` int DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`barcode`),
  KEY `cType_key_idx` (`cType`),
  KEY `isbn_idx` (`isbn`),
  KEY `artNr_key_idx` (`artNr`),
  CONSTRAINT `Copies_artNr` FOREIGN KEY (`artNr`) REFERENCES `dvds` (`artNr`) ON UPDATE CASCADE,
  CONSTRAINT `Copies_cType` FOREIGN KEY (`cType`) REFERENCES `copiestype` (`cType`) ON UPDATE CASCADE,
  CONSTRAINT `Copies_isbn` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copies`
--

LOCK TABLES `copies` WRITE;
/*!40000 ALTER TABLE `copies` DISABLE KEYS */;
INSERT INTO `copies` VALUES ('013977688343','False','C','9789144085876',NULL,'Java : steg för steg'),('042485884032','False','B','9780316389709',NULL,'Sword of destiny'),('104404333203','False','B','9780261102378',NULL,'The Return of the King'),('124729992801','False','C','9789144085876',NULL,'Java : steg för steg'),('141913766158','False','B','9780316389709',NULL,'Sword of destiny'),('143098552715','True','B','9780316389709',NULL,'Sword of destiny'),('149750129228','True','B','0007203543',NULL,'The fellowship of the ring'),('152271880536 ','False','D',NULL,45783,'Gattaca'),('158473628457','True','B','9789176216132',NULL,'Kalle Anka: jul i Ankeborg'),('207450928456','True','B','9780316389709',NULL,'Sword of destiny'),('225686888654','False','D',NULL,54587,'Saving Private Ryan'),('232826775952','False','D',NULL,12350,'Scarface'),('235646785435','False','D',NULL,46741,'Frozen'),('242046069968','True','B','9781473231061',NULL,'The last wish : introducing The Witcher'),('245667656888','True','D',NULL,46678,'Whiplash'),('257125194593','False','D',NULL,78905,'Inglorious Basterds'),('271771300922 ','True','C','1292061189',NULL,'Database systems : a practical approach to design, implementation, and management'),('281265719751','False','C','9780470146354',NULL,'Software testing: Testing across the entire software development life cycle'),('311778925049 ','False','D',NULL,66621,'The Wolf of Wall Street'),('344645351735','True','C','9780470146354',NULL,'Software testing: Testing across the entire software development life cycle'),('356757886546','False','D',NULL,46741,'Frozen'),('357917008916 ','False','B','9789144122991',NULL,'Interaktionsdesign och UX : om att skapa en god användarupplevelse'),('363867226818 ','True','B','9780261102378',NULL,'The Return of the King'),('407925093112','True','C','9780470146354',NULL,'Software testing: Testing across the entire software development life cycle'),('435676888542','True','D',NULL,84532,'Slumdog Millionaire'),('456671214126 ','False','B','9780141036144',NULL,'1984'),('463300874263','True','C','9789144085876',NULL,'Java : steg för steg'),('467644573223','True','D',NULL,45624,'Skyfall'),('467667854667','True','D',NULL,56987,'Good Will Hunting'),('467743245643','True','D',NULL,47954,'Pulp Fiction'),('467757886433','False','D',NULL,57890,'Rocky'),('479429387356 ','False','B','9780141036144',NULL,'1984'),('509675435553','False','D',NULL,84532,'Slumdog Millionaire'),('563336632244','False','D',NULL,45623,'Top Gun'),('567824567965','False','D',NULL,45623,'Top Gun'),('567853678322','True','D',NULL,87612,'Toy Story 2'),('568576546754','False','D',NULL,42567,'The Godfather'),('574061926644 ','False','D',NULL,54578,'A Goofy Movie'),('578555754366','True','D',NULL,46698,'The Shawshank Redemption'),('583150464108','False','C','9781484200292',NULL,'Beginning Python : from novice to professional'),('592841713438','True','R','9780470146354',NULL,'Software testing: Testing across the entire software development life cycle'),('614524553088','False','B','9789144122991',NULL,'Interaktionsdesign och UX : om att skapa en god användarupplevelse'),('625907941566','True','D',NULL,76580,'Avatar'),('657647334565','False','C','9780470146354',NULL,'Software testing: Testing across the entire software development life cycle'),('676643344675','False','D',NULL,67534,'Jurassic Park'),('678533456432','True','D',NULL,78452,'Schindlers List'),('693834321395','False','C','9780470146354',NULL,'Software testing: Testing across the entire software development life cycle'),('700766783307 ','False','D',NULL,43790,'American Psycho'),('748392817263','False','B','9781473231061',NULL,'The last wish : introducing The Witcher'),('753791977285','False','B','9781473231061',NULL,'The last wish : introducing The Witcher'),('755773567433','False','D',NULL,85621,'Toy Story'),('766767543345','False','D',NULL,46698,'The Shawshank Redemption'),('767978453418 ','True','D',NULL,76580,'Avatar'),('774904592239 ','True','B','9780470146354',NULL,'Software testing: Testing across the entire software development life cycle'),('786397589234','True','B','9781847493507',NULL,'Frankenstein'),('852607653199','True','C','9781484200292',NULL,'Beginning Python : from novice to professional'),('865745734453','True','D',NULL,56821,'Fight Club'),('903629571173','False','C','9781484200292',NULL,'Beginning Python : from novice to professional'),('966499398543','False','B','9780575081567',NULL,'Necronomicon'),('976664535674','True','D',NULL,85621,'Toy Story');
/*!40000 ALTER TABLE `copies` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `copies_BEFORE_INSERT_title` BEFORE INSERT ON `copies` FOR EACH ROW BEGIN
	DECLARE v_title VARCHAR(254);
    DECLARE v_BorD INT;
    
    SET v_BorD = (SELECT copies.artNr FROM copies
    WHERE barcode = NEW.barcode);
    IF(v_BorD IS NULL)THEN SET v_BorD = 0;
    END IF;
    
    IF(v_BorD = 0)
    THEN
		SELECT books.bTitle INTO v_title FROM books
        JOIN copies
		WHERE copies.isbn = books.isbn AND barcode = NEW.barcode;
	ELSE
		SELECT dvds.dTitle INTO v_title FROM dvds
        JOIN copies
        WHERE copies.artNr = dvds.artNr AND barcode = NEW.barcode;
	END IF;
    
	SET NEW.title = v_title;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `copies_BEFORE_UPDATE_title` BEFORE UPDATE ON `copies` FOR EACH ROW BEGIN
	DECLARE v_title VARCHAR(254);
    DECLARE v_BorD INT;
    
    SET v_BorD = (SELECT copies.artNr FROM copies
    WHERE barcode = NEW.barcode);
    IF(v_BorD IS NULL)THEN SET v_BorD = 0;
    END IF;
    
    IF(v_BorD = 0)
    THEN
		SELECT books.bTitle INTO v_title FROM books
        JOIN copies
		WHERE copies.isbn = books.isbn AND barcode = NEW.barcode;
	ELSE
		SELECT dvds.dTitle INTO v_title FROM dvds
        JOIN copies
        WHERE copies.artNr = dvds.artNr AND barcode = NEW.barcode;
	END IF;
    
	SET NEW.title = v_title;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `copiestype`
--

DROP TABLE IF EXISTS `copiestype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `copiestype` (
  `cType` varchar(5) NOT NULL,
  `desc` varchar(45) NOT NULL,
  PRIMARY KEY (`cType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copiestype`
--

LOCK TABLES `copiestype` WRITE;
/*!40000 ALTER TABLE `copiestype` DISABLE KEYS */;
INSERT INTO `copiestype` VALUES ('B','Book'),('C','Course'),('D','DVD'),('R','Reference');
/*!40000 ALTER TABLE `copiestype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvds`
--

DROP TABLE IF EXISTS `dvds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dvds` (
  `artNr` int NOT NULL AUTO_INCREMENT,
  `copies` int DEFAULT NULL,
  `dTitle` varchar(45) NOT NULL,
  `director` varchar(45) NOT NULL,
  `tags` varchar(256) NOT NULL,
  `location` varchar(45) NOT NULL,
  `PG` int NOT NULL,
  PRIMARY KEY (`artNr`),
  KEY `index_dvds` (`dTitle`,`tags`,`director`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87613 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvds`
--

LOCK TABLES `dvds` WRITE;
/*!40000 ALTER TABLE `dvds` DISABLE KEYS */;
INSERT INTO `dvds` VALUES (12350,NULL,'Scarface','Brian De Palma','Crime','H18R6',16),(13377,NULL,'Forrest Gump','Robert Zemeckis','Comedy','H13R8',13),(32690,NULL,'The Shining','Stanley Kubrick','Horror','H13R5',16),(35621,NULL,'Alien','Ridley Scott','Horror','H13R5',16),(42567,NULL,'The Godfather','Francis Ford Coppola','Crime','H14R7',13),(43790,NULL,'American Psycho','Mary Harron','Black Comedy','H12R1',16),(45623,2,'Top Gun','Joseph Kosinski','Action','H13R9',13),(45624,NULL,'Skyfall','Sam Mendes','Action','H12R1',13),(45783,NULL,'Gattaca','Andrew Niccol','Sci-Fi','H19R7',13),(46678,NULL,'Whiplash','Damien Chazelle','Drama','H17R6',16),(46698,2,'The Shawshank Redemption','Frank Darabont','Crime','H17R7',16),(46741,2,'Frozen','Chris Buck','Animated','H13R8',3),(47954,NULL,'Pulp Fiction','Quentin Tarantino','Drama','H10R4',16),(54578,NULL,'A Goofy Movie','Kevin Lima','Animated','H14R7',6),(54587,NULL,'Saving Private Ryan','Steven Spielberg','War','H8R6',16),(56821,NULL,'Fight Club','David Fincher','Thriller','H11R1',16),(56987,NULL,'Good Will Hunting','Gus Van Sant','Drama','H10R7',13),(57890,NULL,'Rocky','John G. Avildsen','Drama','H14R6',13),(66621,NULL,'The Wolf of Wall Street','Martin Scorsese','Biographical','H14R3',16),(67534,NULL,'Jurassic Park','Steven Spielberg','Adventure','H16R5',13),(69420,NULL,'The Dark Knight','Christopher Nolan','Action','H13R5',13),(76580,NULL,'Avatar','James Cameron','Sci-Fi','H12R3',13),(78452,NULL,'Schindlers List','Steven Spielberg','War','H12R5',16),(78456,NULL,'Halloween','John Carpenter','Horror','H14R1',16),(78905,NULL,'Inglorious Basterds','Quentin Tarantino','Action','H12R7',16),(84532,2,'Slumdog Millionaire','Danny Boyle','Drama','H15R5',13),(85621,2,'Toy Story','John Lasseter','Family','H11R5',3),(87612,NULL,'Toy Story 2','John Lasseter','Family','H11R6',3);
/*!40000 ALTER TABLE `dvds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `empID` int NOT NULL AUTO_INCREMENT,
  `fName` varchar(45) NOT NULL,
  `lName` varchar(45) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phoneNr` varchar(20) NOT NULL,
  `uType` varchar(5) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  PRIMARY KEY (`empID`),
  KEY `uType_key_idx` (`uType`),
  CONSTRAINT `Employee_uType` FOREIGN KEY (`uType`) REFERENCES `usertype` (`uType`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Johan','Tryggvesson','Tryggve@bibliotek.se','026-5845444','L','123abc'),(2,'Leontina','Hallin','leontina.hallin@bibliotek.se','0174-3092149','L','321abc'),(3,'Ann-Louise','Seger','ann-louise.seger@bibliotek.se','0910-6778927','M','abc123'),(7,'Per-Anders','Åstrand','per-anders.astrand@bibliotek.se','036-5768427','L','abc321'),(8,'Liselotte','Liljedahl','liselotte.liljedahl@bibliotek.se','042-6611355','M','davvearg');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine`
--

DROP TABLE IF EXISTS `fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine` (
  `fineID` int NOT NULL AUTO_INCREMENT,
  `sum` int NOT NULL,
  `resolved` varchar(20) NOT NULL,
  `loanNr` int NOT NULL,
  `empID` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`fineID`),
  KEY `loanNr_key_idx` (`loanNr`),
  KEY `empID_key_idx` (`empID`),
  KEY `username_key_idx` (`username`),
  KEY `index_resloved` (`resolved`) USING BTREE,
  CONSTRAINT `Fine_empID` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON UPDATE CASCADE,
  CONSTRAINT `Fine_loanNr` FOREIGN KEY (`loanNr`) REFERENCES `loans` (`loanNr`) ON UPDATE CASCADE,
  CONSTRAINT `Fine_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine`
--

LOCK TABLES `fine` WRITE;
/*!40000 ALTER TABLE `fine` DISABLE KEYS */;
INSERT INTO `fine` VALUES (1,250,'True',5,7,'IQ9000Scientist','jönnson@ltu.se'),(2,250,'True',9,2,'LärarIngejör','johansson@ltu.se'),(3,500,'False',13,7,'LärarIngejör','johansson@ltu.se'),(4,250,'True',20,8,'JökenSwe','Jocke@ltu.se'),(5,500,'True',28,3,'IQ9000Scientist','jönnson@ltu.se');
/*!40000 ALTER TABLE `fine` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fine_BEFORE_INSERT` BEFORE INSERT ON `fine` FOR EACH ROW BEGIN
	SET NEW.email = (SELECT users.email FROM users WHERE users.username = NEW.username);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fine_BEFORE_UPDATE` BEFORE UPDATE ON `fine` FOR EACH ROW BEGIN
	SET NEW.email = (SELECT users.email FROM users WHERE users.username = NEW.username);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `loanNr` int NOT NULL AUTO_INCREMENT,
  `borrowedDate` date NOT NULL,
  `lastReturnDate` date DEFAULT NULL,
  `returnedDate` date DEFAULT NULL,
  `barcode` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`loanNr`),
  KEY `barcode_key_idx` (`barcode`),
  KEY `username_key_idx` (`username`),
  CONSTRAINT `Loans_barcode` FOREIGN KEY (`barcode`) REFERENCES `copies` (`barcode`) ON UPDATE CASCADE,
  CONSTRAINT `Loans_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,'2021-02-01','2021-04-01','2021-04-01','149750129228','ragnvald10','ragnvald.helgesson@mailinater.com'),(2,'2021-01-29','2021-02-28','2021-02-28','344645351735','Willeboii','lydahl@ltu.se'),(3,'2021-01-03','2021-02-03','2021-02-03','463300874263','JökenSwe','Jocke@ltu.se'),(4,'2021-01-03','2021-02-03','2021-02-03','852607653199','JökenSwe','Jocke@ltu.se'),(5,'2021-01-13','2021-03-13','2021-03-13','242046069968','IQ9000Scientist','jönnson@ltu.se'),(6,'2022-02-01','2022-04-01',NULL,'966499398543','runa71','runa.kallgren@ltu.se'),(7,'2021-08-29','2021-10-29','2021-10-29','786397589234','runa71','runa.kallgren@ltu.se'),(8,'2021-10-05','2021-11-05','2021-11-05','407925093112','ragnvald10','ragnvald.helgesson@mailinater.com'),(9,'2021-10-22','2021-12-22','2021-12-22','363867226818','LärarIngejör','johansson@ltu.se'),(10,'2021-09-30','2021-10-30','2021-10-30','271771300922','Willeboii','lydahl@ltu.se'),(11,'2021-09-29','2021-11-29','2021-11-29','143098552715','IQ9000Scientist','jönnson@ltu.se'),(12,'2021-09-29','2021-11-29','2021-11-29','141913766158','IQ9000Scientist','jönnson@ltu.se'),(13,'2021-04-29','2021-06-29','2021-06-29','141913766158','LärarIngejör','johansson@ltu.se'),(16,'2022-02-15','2022-03-01',NULL,'232826775952','IQ9000Scientist','jönnson@ltu.se'),(18,'2021-02-01','2021-04-01','2021-04-01','149750129228','ragnvald10','ragnvald.helgesson@mailinater.com'),(19,'2021-01-29','2021-02-28','2021-02-28','344645351735','Willeboii','lydahl@ltu.se'),(20,'2021-01-03','2021-02-03','2021-02-03','463300874263','JökenSwe','Jocke@ltu.se'),(21,'2021-01-03','2021-02-03','2021-02-03','852607653199','JökenSwe','Jocke@ltu.se'),(22,'2021-01-13','2021-03-13','2021-03-13','242046069968','IQ9000Scientist','jönnson@ltu.se'),(23,'2022-02-01','2022-04-01',NULL,'966499398543','runa71','runa.kallgren@ltu.se'),(24,'2021-08-29','2021-10-29','2021-10-29','786397589234','runa71','runa.kallgren@ltu.se'),(25,'2021-10-05','2021-11-05','2021-11-05','407925093112','ragnvald10','ragnvald.helgesson@mailinater.com'),(26,'2021-10-22','2021-12-22','2021-12-22','363867226818','LärarIngejör','johansson@ltu.se'),(27,'2021-09-30','2021-10-30','2021-10-30','271771300922','Willeboii','lydahl@ltu.se'),(28,'2021-09-29','2021-11-29','2021-11-29','143098552715','IQ9000Scientist','jönnson@ltu.se'),(29,'2021-09-29','2021-11-29','2021-11-29','141913766158','IQ9000Scientist','jönnson@ltu.se'),(30,'2021-04-29','2021-06-29','2021-06-29','141913766158','LärarIngejör','johansson@ltu.se'),(38,'2022-02-15','2022-03-01',NULL,'232826775952','IQ9000Scientist','jönnson@ltu.se'),(43,'2022-02-07','2022-02-21',NULL,'152271880536','JökenSwe','Jocke@ltu.se'),(44,'2022-02-15','2022-03-01',NULL,'232826775952','IQ9000Scientist','jönnson@ltu.se'),(45,'2022-02-27','2022-03-13',NULL,'257125194593','runa71','runa.kallgren@ltu.se'),(46,'2022-01-01','2022-03-01',NULL,'479429387356','IQ9000Scientist','jönnson@ltu.se'),(49,'2022-02-07','2022-03-07',NULL,'013977688343','runa71','runa.kallgren@ltu.se'),(52,'2022-02-07','2022-04-07',NULL,'141913766158','runa71','runa.kallgren@ltu.se'),(61,'2022-05-20','2022-06-20',NULL,'357917008916','Willeboii','lydahl@ltu.se');
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `loans_BEFORE_INSERT` BEFORE INSERT ON `loans` FOR EACH ROW BEGIN
	DECLARE v_checker INT;
    DECLARE v_usertype VARCHAR(5);
    DECLARE v_type VARCHAR(5);
    DECLARE v_barcode VARCHAR(12);
    DECLARE v_loanNr INT;
    DECLARE v_returned VARCHAR(20);
    
	SET v_checker = (SELECT COUNT(loanNr) FROM loans WHERE username = NEW.username AND returnedDate IS NULL);
    SET v_usertype = (SELECT uType FROM users WHERE username = NEW.username);    
    IF(v_usertype = "P")
    THEN
		IF(v_checker > 2)
        THEN
			SIGNAL SQLSTATE "45000"
				SET MESSAGE_TEXT = "You can't loan more books.";
		END IF;
	END IF;
    IF(v_usertype = "S")
    THEN
		IF(v_checker > 5)
        THEN
			SIGNAL SQLSTATE "45000"
				SET MESSAGE_TEXT = "You can't loan more books.";
		END IF;
	END IF;
    IF(v_usertype = "E")
    THEN
		IF(v_checker > 10)
        THEN
			SIGNAL SQLSTATE "45000"
				SET MESSAGE_TEXT = "You can't loan more books.";
		END IF;
	END IF;
    IF(v_usertype = "R")
    THEN
		IF(v_checker > 20)
        THEN
			SIGNAL SQLSTATE "45000"
				SET MESSAGE_TEXT = "You can't loan more books.";
		END IF;
	END IF;	
    

    SET v_barcode = NEW.barcode;
    SELECT cType INTO v_type FROM copies WHERE copies.barcode = v_barcode;

    IF(v_type = "B")
    THEN
		SET NEW.lastReturnDate = (SELECT DATE_ADD(NEW.borrowedDate, INTERVAL 1 MONTH));
	END IF;
	IF(v_type = "C")
    THEN
		SET NEW.lastReturnDate = (SELECT DATE_ADD(NEW.borrowedDate, INTERVAL 14 DAY));
	END IF;
	IF(v_type = "D")
    THEN
		SET NEW.lastReturnDate = (SELECT DATE_ADD(NEW.borrowedDate, INTERVAL 7 DAY));
	END IF;
    IF(v_type = "R" OR v_type = "T")
    THEN
		SIGNAL SQLSTATE "45000"
				SET MESSAGE_TEXT = "You can't loan this item.";
    END IF;   
    
    SET NEW.email = (SELECT users.email FROM users WHERE users.username = NEW.username);
    
	SET v_loanNr = NEW.loanNr;
    CALL spLoanBookreg(v_barcode, v_loanNr);
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `loans_BEFORE_UPDATE_CHECKER` BEFORE UPDATE ON `loans` FOR EACH ROW BEGIN
	DECLARE v_checker INT;
    DECLARE v_usertype VARCHAR(5);
    DECLARE v_type VARCHAR(5);
    DECLARE v_barcode VARCHAR(12);
    DECLARE v_loanNr INT;
    DECLARE v_returned VARCHAR(20);
    
	SET v_checker = (SELECT COUNT(loanNr) FROM loans WHERE username = NEW.username AND returnedDate IS NULL);
    SET v_usertype = (SELECT uType FROM users WHERE username = NEW.username);    
    IF(v_usertype = "P")
    THEN
		IF(v_checker > 2)
        THEN
			SIGNAL SQLSTATE "45000"
				SET MESSAGE_TEXT = "You can't loan more books.";
		END IF;
	END IF;
    IF(v_usertype = "S")
    THEN
		IF(v_checker > 5)
        THEN
			SIGNAL SQLSTATE "45000"
				SET MESSAGE_TEXT = "You can't loan more books.";
		END IF;
	END IF;
    IF(v_usertype = "E")
    THEN
		IF(v_checker > 10)
        THEN
			SIGNAL SQLSTATE "45000"
				SET MESSAGE_TEXT = "You can't loan more books.";
		END IF;
	END IF;
    IF(v_usertype = "R")
    THEN
		IF(v_checker > 20)
        THEN
			SIGNAL SQLSTATE "45000"
				SET MESSAGE_TEXT = "You can't loan more books.";
		END IF;
	END IF;	
    

    SET v_barcode = NEW.barcode;
    SELECT cType INTO v_type FROM copies WHERE copies.barcode = v_barcode;

    IF(v_type = "B")
    THEN
		SET NEW.lastReturnDate = (SELECT DATE_ADD(NEW.borrowedDate, INTERVAL 1 MONTH));
	END IF;
	IF(v_type = "C")
    THEN
		SET NEW.lastReturnDate = (SELECT DATE_ADD(NEW.borrowedDate, INTERVAL 14 DAY));
	END IF;
	IF(v_type = "D")
    THEN
		SET NEW.lastReturnDate = (SELECT DATE_ADD(NEW.borrowedDate, INTERVAL 7 DAY));
	END IF;
    IF(v_type = "R" OR v_type = "T")
    THEN
		SIGNAL SQLSTATE "45000"
				SET MESSAGE_TEXT = "You can't loan this item.";
    END IF;   
    
    SET NEW.email = (SELECT users.email FROM users WHERE users.username = NEW.username);
    
	SET v_loanNr = NEW.loanNr;
    CALL spLoanBookreg(v_barcode, v_loanNr);
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notifID` int NOT NULL AUTO_INCREMENT,
  `loanNr` int NOT NULL,
  `empID` int NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`notifID`),
  KEY `loanNr_key_idx` (`loanNr`),
  KEY `empID_key_idx` (`empID`),
  KEY `username_key_idx` (`username`),
  CONSTRAINT `Notification_empID` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON UPDATE CASCADE,
  CONSTRAINT `Notification_loanNr` FOREIGN KEY (`loanNr`) REFERENCES `loans` (`loanNr`) ON UPDATE CASCADE,
  CONSTRAINT `Notification_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,5,7,'IQ9000Scientist'),(2,9,2,'LärarIngejör'),(3,13,7,'LärarIngejör'),(4,20,8,'JökenSwe'),(5,28,3,'IQ9000Scientist');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `resNr` int NOT NULL AUTO_INCREMENT,
  `queueNr` int NOT NULL,
  `barcode` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`resNr`),
  KEY `barcode_key_idx` (`barcode`),
  KEY `username_key_idx` (`username`),
  CONSTRAINT `Reservations_barcode` FOREIGN KEY (`barcode`) REFERENCES `copies` (`barcode`) ON UPDATE CASCADE,
  CONSTRAINT `Reservations_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1269 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (111,1,'042485884032','ragnvald10'),(243,1,'257125194593','LärarIngejör'),(745,1,'013977688343','IQ9000Scientist'),(978,2,'903629571173','JökenSwe'),(1268,1,'903629571173','Willeboii');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `fName` varchar(45) NOT NULL,
  `lName` varchar(45) NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `uType` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`username`),
  KEY `uType_key_idx` (`uType`),
  CONSTRAINT `Users_uType` FOREIGN KEY (`uType`) REFERENCES `usertype` (`uType`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('David','Hägg','davhag@live.se','Davve2002','simpsons','S'),('Lukas','Simoni','hej@live.se','diabeteskungen','gangstafool','S'),('Valter','Jönnson','jönnson@ltu.se','IQ9000Scientist','ftp','R'),('Jocke','Edstrand','Jocke@ltu.se','JökenSwe','qwerty','S'),('Karl','Johansson','johansson@ltu.se','LärarIngejör','katy','P'),('Ragnvald','Helgesson','ragnvald.helgesson@mailinater.com','ragnvald10','loppis','S'),('Runa','Källgren','runa.kallgren@ltu.se','runa71','yahoo','R'),('Sigurt','Ivarsson','sigiva@hotmail.se','SigIva','pollen','P'),('William','Lydahl','lydahl@ltu.se','Willeboii','hej','S');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertype` (
  `uType` varchar(5) NOT NULL,
  `desc` varchar(45) NOT NULL,
  PRIMARY KEY (`uType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES ('E','Employee'),('L','Librarian'),('M','Manager'),('P','Public'),('R','Researcher'),('S','Student');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'library'
--

--
-- Dumping routines for database 'library'
--
/*!50003 DROP PROCEDURE IF EXISTS `spAddBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAddBook`(
IN v_id VARCHAR(45),
IN v_bTitle VARCHAR(12),
IN v_author VARCHAR(45),
IN v_publisher VARCHAR(45),
IN v_tags VARCHAR(256),
in v_location VARCHAR(45)
)
BEGIN
INSERT INTO books (isbn, bTitle, author, publisher, tags, location) VALUES(v_id, v_bTitle, v_author, v_publisher, v_tags, v_location);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAddCopy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAddCopy`(
IN v_id VARCHAR(45),
IN v_barcode VARCHAR(12),
IN v_cType VARCHAR(1)
)
BEGIN
	IF(CHAR_LENGTH(v_id) = 5)
    THEN
		SET v_id = (CAST(v_id AS UNSIGNED));
        INSERT INTO copies (barcode, returned, cType, artNr)
        VALUES (v_barcode, "True", v_cType, v_id);
	ELSE
		INSERT INTO copies (barcode, returned, cType, isbn)
        VALUES (v_barcode, "True", v_cType, v_id);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spAddDVD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAddDVD`(
IN v_id VARCHAR(45),
IN v_title VARCHAR(45),
IN v_director VARCHAR(45),
IN v_tags VARCHAR(256),
IN v_location VARCHAR(45),
IN v_PG VARCHAR(45)
)
BEGIN
INSERT INTO dvds (artNr, dTitle, director, tags, location, actors, ageLimit, countryOfOrigin) VALUES(v_id, v_title, v_director, v_tags, v_location, v_PG);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCheckCopyExist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCheckCopyExist`(
IN v_barcode VARCHAR(45)
)
BEGIN
	SELECT barcode FROM copies WHERE v_barcode = copies.barcode;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCheckEmployeePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCheckEmployeePassword`(
IN v_email VARCHAR(40),
IN v_pwd VARCHAR(40)
)
BEGIN
SELECT employee.pwd FROM library.employee
    WHERE employee.email = v_email AND employee.pwd = v_pwd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCheckMissing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCheckMissing`(
IN v_barcode VARCHAR(45)
)
BEGIN
	IF EXISTS(SELECT barcode FROM loans WHERE barcode = v_barcode AND returnedDate IS NULL)
    THEN
		SELECT 1 AS result;
	ELSE 
		SELECT 2 AS result;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCheckPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCheckPassword`(
IN v_username VARCHAR(40),
IN v_pwd VARCHAR(40)
)
BEGIN
SELECT users.pwd FROM library.users 
	WHERE users.username = v_username AND users.pwd = v_pwd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteCopy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteCopy`(
IN v_barcode VARCHAR(45)
)
BEGIN
	DELETE FROM copies WHERE barcode = v_barcode;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteItem`(
IN v_id VARCHAR(45)
)
BEGIN
	IF(LENGTH(v_id) = 5)
    THEN
		DELETE FROM dvds WHERE artNr = v_id;
	ELSE
		DELETE FROM books WHERE isbn = v_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spEditBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spEditBook`(
IN v_isbn VARCHAR(45),
IN v_bTitle VARCHAR(145),
IN v_author VARCHAR(45),
IN v_publisher VARCHAR(45),
IN v_tags VARCHAR(45),
IN v_location VARCHAR(45)
)
BEGIN
	UPDATE books SET books.bTitle = v_bTitle, books.author = v_author, books.publisher = v_publisher, books.tags = v_tags, books.location = v_location WHERE books.isbn = v_isbn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spEditDVD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spEditDVD`(
IN v_artNr VARCHAR(45),
IN v_dTitle VARCHAR(45),
IN v_director VARCHAR(45),
IN v_tags VARCHAR(45),
IN v_location VARCHAR(45),
IN v_PG VARCHAR(45)
)
BEGIN
	UPDATE dvds SET dvds.dTitle = v_dTitle, dvds.director = v_director, dvds.tags = v_tags, dvds.location = v_location, dvds.PG = v_PG WHERE dvds.artNr = v_artNr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spFindBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindBook`(
IN v_search VARCHAR(256)
)
    READS SQL DATA
BEGIN
	SELECT DISTINCT * FROM library.books 
    WHERE books.bTitle LIKE CONCAT('%',v_search,'%')
    OR books.author LIKE CONCAT('%',v_search,'%')
	OR books.publisher LIKE CONCAT('%',v_search,'%')
	OR books.isbn LIKE CONCAT('%',v_search,'%')
    OR books.tags LIKE CONCAT('%',v_search,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spFindBookorDVD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindBookorDVD`(
IN v_titleORtags VARCHAR(256)
)
    READS SQL DATA
BEGIN
	IF EXISTS(SELECT * FROM library.books WHERE books.bTitle LIKE CONCAT('%',v_titleORtags,'%') OR books.tags LIKE CONCAT('%',v_titleORtags,'%'))
	THEN
		SELECT DISTINCT * FROM library.books WHERE books.bTitle LIKE CONCAT('%',v_titleORtags,'%') OR books.tags LIKE CONCAT('%',v_titleORtags,'%');
	ELSE
    SELECT DISTINCT * FROM library.dvds WHERE dvds.dTitle LIKE CONCAT('%',v_titleORtags,'%') OR dvds.tags LIKE CONCAT('%',v_titleORtags,'%');
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spFindDVD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindDVD`(
IN v_search VARCHAR(256)
)
    READS SQL DATA
BEGIN
    SELECT DISTINCT dvds.copies, dvds.dTitle, dvds.director, dvds.tags, dvds.artNr FROM library.dvds 
    WHERE dvds.dTitle LIKE CONCAT('%',v_search,'%')
    OR dvds.director LIKE CONCAT('%',v_search,'%')
    OR dvds.artNr LIKE CONCAT('%',v_search,'%')
    OR dvds.tags LIKE CONCAT('%',v_search,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spFindEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindEmployee`(IN v_search VARCHAR(256))
BEGIN
SELECT DISTINCT * FROM library.employee
    WHERE employee.email LIKE CONCAT('%',v_search,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spFindEmployeePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindEmployeePassword`(IN v_search VARCHAR(256))
BEGIN
SELECT DISTINCT * FROM library.employee
    WHERE employee.pwd LIKE CONCAT('%',v_search,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spFindFullName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindFullName`(
IN v_usrn VARCHAR(45)
)
BEGIN
SELECT CONCAT(fName, " ", lName) AS entirename FROM users WHERE username = v_usrn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spFindPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindPassword`(IN v_search VARCHAR(256))
BEGIN
SELECT DISTINCT * FROM library.employee
    WHERE employee.pwd LIKE CONCAT('%',v_search,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spFindUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindUser`(IN v_search VARCHAR(256))
BEGIN
SELECT DISTINCT * FROM library.users
    WHERE users.username LIKE CONCAT('%',v_search,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spFindUserPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindUserPassword`(IN v_search VARCHAR(256))
BEGIN
SELECT DISTINCT * FROM library.user
    WHERE user.username LIKE CONCAT('%',v_search,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetBookDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetBookDetails`(
IN v_isbn VARCHAR(45)
)
BEGIN
    SELECT * FROM books WHERE books.isbn = v_isbn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spLoanbookreg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spLoanbookreg`(
IN v_barcode VARCHAR(12),
IN v_loanNr INT
)
BEGIN
	DECLARE v_returnedDate DATE;
    SELECT loans.returnedDate INTO v_returnedDate FROM loans WHERE loanNr = v_loanNr; 
    
	IF(v_returnedDate IS NOT NULL)
    THEN
		IF EXISTS(SELECT loans.returnedDate FROM loans WHERE barcode = v_barcode AND loans.returnedDate IS NULL)
		THEN
			UPDATE copies SET returned = "False" WHERE barcode = v_barcode;
		ELSE
			UPDATE copies SET returned = "True" WHERE barcode = v_barcode;			
		END IF;
	ELSE
		UPDATE copies SET returned = "False" WHERE barcode = v_barcode;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spRegisterLoan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spRegisterLoan`(
IN v_barcode VARCHAR(12),
IN v_username VARCHAR(45)
)
BEGIN
    DECLARE v_todaysDate DATE;
    SET v_todaysDate = (SELECT CURDATE());

    INSERT INTO loans (borrowedDate, barcode, username) VALUES (v_todaysDate, v_barcode, v_username);
    SELECT copies.title, loans.barcode, loans.borrowedDate, loans.lastReturnDate, loans.email FROM loans JOIN copies ON copies.barcode = loans.barcode WHERE v_barcode = loans.barcode AND v_username = loans.username AND v_todaysDate = borrowedDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spRegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spRegisterUser`(
in v_fName VARCHAR(45),
in v_lName VARCHAR(45),
in v_email  VARCHAR(254),
IN v_username VARCHAR(45),
IN v_password VARCHAR(45),
in v_utype  VARCHAR(5)
)
BEGIN
INSERT INTO library.users (fName, lName, email, username, pwd, uType)
Values (v_fName, v_lName, v_email, v_username, v_password, v_utype);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spReserveItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spReserveItem`(
IN v_username VARCHAR(45),
IN v_item VARCHAR(45)
)
BEGIN
	DECLARE v_column INT;
    DECLARE v_qNr INT;
    
	IF(CHAR_LENGTH(v_item) = 5)
    THEN
		SET v_item = (CAST(v_item AS UNSIGNED));
        SET v_column = 1;
	ELSE
		SET v_column = 2;
	END IF;
 
    IF(v_column = 1)
    THEN
		IF ((SELECT MAX(queueNr) FROM reservations WHERE artNr = v_item) >=1)
		THEN
			SET v_qNr = ((SELECT MAX(queueNr) FROM reservations WHERE artNr = v_item) + 1);
		ELSE 
			SET v_qNr = 1;
		END IF;
        INSERT INTO reservations (queueNr, collected, username, artNr) VALUES (v_qNr, "False", v_username, v_item);
	ELSE 
		IF ((SELECT MAX(queueNr) FROM reservations WHERE isbn = v_item) >=1)
		THEN
			SET v_qNr = ((SELECT MAX(queueNr) FROM reservations WHERE isbn = v_item) + 1);
		ELSE 
			SET v_qNr = 1;
		END IF;
        INSERT INTO reservations (queueNr, collected, username, isbn) VALUES (v_qNr, "False", v_username, v_item);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spReturnItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spReturnItem`(
IN v_barcode VARCHAR(45)
)
BEGIN
	DECLARE v_todaysDate DATE;
    DECLARE v_usrName VARCHAR(45);
    DECLARE v_nrOfQueues INT;
    DECLARE v_queueNr INT;
    DECLARE v_itemNr VARCHAR(45);
    SET v_todaysDate = (SELECT CURDATE());
    SET v_queueNr = 2;
    
    IF EXISTS(SELECT isbn FROM copies WHERE v_barcode = copies.barcode)
	THEN
		SET v_itemNr = (SELECT isbn FROM copies WHERE v_barcode = copies.barcode);
        
        IF EXISTS(SELECT * FROM reservations WHERE isbn = v_itemNr AND queueNr IS NOT NULL)
		THEN
			SELECT username FROM reservations WHERE queueNr = 1 AND isbn = v_itemNr;
			UPDATE reservations SET queueNr = NULL WHERE queueNr = 1 AND isbn = v_itemNr;
			SET v_nrOfQueues = (SELECT MAX(queueNr) FROM reservations WHERE isbn = v_itemNr AND queueNr IS NOT NULL);
        
			WHILE v_queueNr <= v_nrOfQueues DO
				UPDATE reservations SET queueNr = (v_queueNr - 1) WHERE isbn = v_itemNr AND queueNr = v_queueNr;
				SET v_queueNr = v_queueNr + 1;
			END WHILE;
	
		END IF;
	ELSE
		SET v_itemNr = (SELECT artNr FROM copies WHERE v_barcode = copies.barcode);
        SET v_itemNr = (CAST(v_itemNr AS UNSIGNED));
        
        IF EXISTS(SELECT * FROM reservations WHERE artNr = v_barcode AND queueNr IS NOT NULL)
		THEN
			SELECT username FROM reservations WHERE queueNr = 1 AND artNr = v_itemNr;
			UPDATE reservations SET queueNr = NULL WHERE queueNr = 1 AND artNr = v_itemNr;
			SET v_nrOfQueues = (SELECT MAX(queueNr) FROM reservations WHERE artNr = v_itemNr AND queueNr IS NOT NULL);
        
			TRUNCATE TABLE reservations;
			START TRANSACTION;
        
			WHILE v_queueNr <= v_nrOfQueues DO
				UPDATE reservations SET queueNr = (v_queueNr - 1) WHERE artNr = v_itemNr AND queueNr = v_queueNr;
				SET v_queueNr = v_queueNr + 1;
			END WHILE;
        
		END IF;
	END IF;
    
    UPDATE loans SET returnedDate = v_todaysdate WHERE barcode = v_barcode;
    SELECT title FROM copies WHERE barcode = v_barcode;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-20 20:37:20
