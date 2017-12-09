CREATE DATABASE  IF NOT EXISTS `extracurriculardb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `extracurriculardb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: extracurriculardb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `pos_Title` varchar(45) DEFAULT NULL,
  `hourly_rate` varchar(20) DEFAULT NULL,
  `adminID` int(11) NOT NULL,
  PRIMARY KEY (`adminID`),
  KEY `fk_Admin_Person1_idx` (`adminID`),
  CONSTRAINT `fk_Admin_Person1` FOREIGN KEY (`adminID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('Advisor','$70846.84',2),('Department Head','$71197.77',5),('Department Head','$6244.58',6),('Department Head','$51880.07',9),('Department Head','$40174.09',26),('Department Head','$67685.97',29),('Teacher Asst','$58074.05',30),('Advisor','$62818.98',35),('Janitor','$6950.40',41),('Advisor','$19025.92',42),('Janitor','$70141.01',43),('Department Head','$71334.33',47),('Department Head','$12061.05',50),('Janitor','$56104.96',56),('Janitor','$65937.82',64),('Teacher Asst','$76084.41',65),('Janitor','$8856.07',73),('Janitor','$23841.52',80),('Department Head','$6533.33',81),('Advisor','$32064.07',82),('Teacher Asst','$33545.04',83),('Advisor','$30633.09',89),('Department Head','$27986.93',91),('Advisor','$65722.53',93),('Teacher Asst','$20245.16',95);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendence`
--

DROP TABLE IF EXISTS `attendence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendence` (
  `personID` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  PRIMARY KEY (`personID`,`eventID`),
  KEY `fk_Attendence_Person_Signup1_idx` (`personID`,`eventID`),
  CONSTRAINT `fk_Attendence_Person_Signup1` FOREIGN KEY (`personID`, `eventID`) REFERENCES `person_signup` (`personID`, `eventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendence`
--

LOCK TABLES `attendence` WRITE;
/*!40000 ALTER TABLE `attendence` DISABLE KEYS */;
INSERT INTO `attendence` VALUES (1,4),(2,2),(3,5),(4,4),(5,1),(6,1),(7,4),(8,4),(9,3),(10,2),(11,5),(12,1),(13,3),(14,3),(15,1),(16,5),(17,2),(18,1),(19,2),(20,5),(21,3),(22,1),(23,5),(24,2),(25,1),(26,4),(27,4),(28,3),(29,1),(30,5),(31,3),(32,5),(33,1),(34,5),(35,1),(36,2),(37,4),(38,2),(39,4),(40,5),(51,2),(52,2),(53,4),(54,2),(55,5),(56,3),(57,3),(58,5),(59,3),(60,3),(71,2),(72,3),(73,5),(74,4),(75,3),(76,5),(77,5),(78,5),(79,5),(80,2),(81,2),(82,4),(83,5),(84,2),(85,5),(86,5),(87,3),(88,1),(89,5),(90,5),(91,3),(92,5),(93,3),(94,2),(95,2),(96,4),(97,1),(98,5),(99,3),(100,3);
/*!40000 ALTER TABLE `attendence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_ID` int(11) NOT NULL,
  `dept_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dept_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Music'),(3,'History'),(6,'Math'),(9,'Computer Science'),(10,'English');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `eventID` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_Cost` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `location_Description` varchar(45) DEFAULT NULL,
  `event_Description` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `date/time` varchar(45) DEFAULT NULL,
  `sponsorID` int(11) NOT NULL,
  PRIMARY KEY (`eventID`),
  KEY `fk_Event_Person1_idx` (`sponsorID`),
  CONSTRAINT `fk_Event_Person1` FOREIGN KEY (`sponsorID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,10,234,'Union','Meet Up',' UNV Event','04/08/2017',67),(2,11,182,'Epic','Seminar','CS Event','01/18/2017',6),(3,13,126,'Woodward','Seminar',' MTH Event','01/24/2018',11),(4,10,155,'Union','Career Fair',' HST Event','04/25/2017',32),(5,10,216,'Belk','Meet Up',' UNV Event','09/18/2017',21);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_eval`
--

DROP TABLE IF EXISTS `event_eval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_eval` (
  `useful` int(11) DEFAULT NULL,
  `recommend` int(11) DEFAULT NULL,
  `relative_to_major` int(11) DEFAULT NULL,
  `personID` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  PRIMARY KEY (`personID`,`eventID`),
  KEY `fk_Event_Eval_Attendence1_idx` (`personID`,`eventID`),
  CONSTRAINT `fk_Event_Eval_Attendence1` FOREIGN KEY (`personID`, `eventID`) REFERENCES `attendence` (`personID`, `eventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_eval`
--

LOCK TABLES `event_eval` WRITE;
/*!40000 ALTER TABLE `event_eval` DISABLE KEYS */;
INSERT INTO `event_eval` VALUES (3,4,5,1,4),(4,3,4,2,2),(4,4,2,3,5),(5,4,3,4,4),(1,2,5,5,1),(3,2,2,6,1),(4,2,1,7,4),(2,2,3,8,4),(1,3,4,9,3),(2,5,4,10,2),(1,3,2,11,5),(5,5,5,12,1),(1,4,1,13,3),(2,1,5,14,3),(2,5,5,15,1),(5,3,5,16,5),(5,1,5,17,2),(5,1,5,18,1),(2,1,1,19,2),(2,5,4,20,5),(3,4,4,21,3),(2,4,3,22,1),(2,1,1,23,5),(1,4,3,24,2),(2,1,4,25,1),(4,1,2,26,4),(5,4,5,27,4),(4,1,4,28,3),(2,4,5,29,1),(1,4,3,30,5),(3,4,5,31,3),(5,2,4,32,5),(5,3,3,33,1),(3,5,4,34,5),(2,3,5,35,1),(3,4,2,36,2),(3,5,1,37,4),(1,1,5,38,2),(4,4,3,39,4),(3,1,4,40,5),(5,2,1,51,2),(1,2,4,52,2),(1,4,5,53,4),(3,3,5,54,2),(2,5,5,55,5),(3,5,3,56,3),(1,5,5,57,3),(5,4,4,58,5),(4,1,5,59,3),(4,3,1,60,3),(3,5,5,71,2),(5,1,3,72,3),(1,5,4,73,5),(5,2,4,74,4),(2,2,4,75,3),(3,4,3,76,5),(2,4,4,77,5),(4,5,1,78,5),(4,5,3,79,5),(2,5,5,80,2),(4,4,3,81,2),(3,3,1,82,4),(1,2,2,83,5),(1,2,5,84,2),(2,2,5,85,5),(5,1,2,86,5),(1,4,4,87,3),(4,4,2,88,1),(4,1,1,89,5),(5,5,1,90,5),(4,3,3,91,3),(5,1,2,92,5),(2,5,4,93,3),(3,5,1,94,2),(4,2,3,95,2),(2,1,2,96,4),(5,3,5,97,1),(5,1,5,98,5),(5,4,3,99,3),(5,3,3,100,3);
/*!40000 ALTER TABLE `event_eval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `hire_date` varchar(20) DEFAULT NULL,
  `highest_Degree` varchar(45) DEFAULT NULL,
  `facultyID` int(11) NOT NULL,
  PRIMARY KEY (`facultyID`),
  KEY `fk_Faculty_Person1_idx` (`facultyID`),
  CONSTRAINT `fk_Faculty_Person1` FOREIGN KEY (`facultyID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('05-19-18','Doctorate',1),('12-02-17','Masters',10),('07-05-17','Doctorate',11),('05-20-18','Masters',12),('12-01-17','Masters',14),('12-20-16','Masters',15),('06-05-17','Masters',16),('04-28-17','Doctorate',18),('03-09-17','Doctorate',19),('10-13-18','Doctorate',21),('05-19-17','Doctorate',23),('08-12-18','Masters',24),('12-16-16','Masters',25),('10-04-18','Masters',33),('02-12-17','Masters',36),('05-14-17','Doctorate',37),('03-14-17','Masters',49),('02-01-17','Masters',52),('12-27-16','Doctorate',54),('03-30-17','Doctorate',57),('04-16-17','Masters',58),('04-12-18','Masters',60),('11-17-17','Doctorate',61),('04-12-17','Doctorate',63),('12-06-17','Doctorate',69),('10-04-17','Masters',70),('10-26-17','Doctorate',72),('01-12-18','Masters',74),('06-20-17','Doctorate',76),('12-19-16','Masters',78),('09-06-18','Masters',84),('04-11-18','Masters',85),('11-04-17','Doctorate',86),('03-30-17','Masters',92),('06-19-17','Doctorate',94),('07-20-18','Doctorate',97),('09-16-17','Masters',100);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `PersonID` int(11) NOT NULL,
  `fName` varchar(45) DEFAULT NULL,
  `mName` varchar(45) DEFAULT NULL,
  `lName` varchar(45) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `dept_ID` int(11) NOT NULL,
  `type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`PersonID`),
  KEY `fk_Person_Department1_idx` (`dept_ID`),
  CONSTRAINT `fk_Person_Department1` FOREIGN KEY (`dept_ID`) REFERENCES `department` (`dept_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Amal','Amaya','Sanders','1122 Non, St.','Miraj','MH','5648',6,'F'),(2,'Nicholas','Eliana','Michael','Ap #782-2141 Nulla. Rd.','Warminster','WI','208387',6,'A'),(3,'Brady','Ciaran','Fletcher','147-9135 Quam, St.','Te Puke','NI','99517',3,'S'),(4,'Stephen','Phoebe','Lambert','Ap #825-9212 Non, Av.','Masterton','North Island','249602',1,'S'),(5,'September','Molly','Solis','4988 Scelerisque St.','Shaki','Oyo','1602',3,'A'),(6,'Skyler','Julie','Bright','3109 Lobortis St.','Donosti','Euskadi','108411',10,'A'),(7,'Graham','Ginger','Mcgee','P.O. Box 266, 3698 Mus. Street','Berlin','BE','4393',3,'S'),(8,'Darius','Robin','Ayers','Ap #718-5636 Lacus. Rd.','Saltcoats','AY','10317',10,'S'),(9,'Kirestin','Isaiah','Pope','876-7681 Nec St.','Kungälv','Västra Götalands län','5748',6,'A'),(10,'Odysseus','Sawyer','Alvarez','Ap #677-9143 Eget Road','Jundiaí','SP','313453',3,'F'),(11,'Imogene','Rigel','Edwards','P.O. Box 306, 2747 Sit Rd.','Alajuela','Alajuela','660420',1,'F'),(12,'Haviva','Mark','Watts','P.O. Box 544, 9104 Orci, St.','Bauchi','Bauchi','L4V 6V7',10,'F'),(13,'Shad','Lacota','Norton','Ap #770-743 Euismod Ave','Carson City','NV','1225 DS',1,'S'),(14,'Axel','Joelle','Dejesus','554-6384 Primis Rd.','Rutland','VT','10125',6,'F'),(15,'Quinlan','Chancellor','Blankenship','Ap #682-3543 Fermentum Av.','Glovertown','Newfoundland and Labrador','22642',10,'F'),(16,'Nehru','Daniel','Ortega','Ap #720-1320 Arcu Road','Creil','Picardie','589951',1,'F'),(17,'Ima','Carol','Salas','3362 Auctor Rd.','San Rafael','San José','53905',10,'S'),(18,'Berk','Brynne','Espinoza','7597 Leo. Street','Vienna','Vienna','55496-322',1,'F'),(19,'Sopoline','Amethyst','Ayala','510-568 Mauris. Street','Quesada','Alajuela','17260',10,'F'),(20,'Noel','Teagan','Estes','Ap #301-6823 Nisi St.','Tierra Amarilla','III','10050',3,'S'),(21,'Uriel','Melodie','Harrington','487-7871 Non, St.','Çeşme','İzm','2650',1,'F'),(22,'Megan','Tanek','Fulton','P.O. Box 543, 1810 Metus Rd.','Diksmuide','WV','103276',3,'S'),(23,'Luke','Maggie','Bentley','8235 Augue Avenue','Guarapuava','PR','14605',6,'F'),(24,'Althea','Iris','Wood','P.O. Box 897, 6533 Dolor Avenue','Mersin','Mersin','22248',10,'F'),(25,'Adena','Amber','Ryan','P.O. Box 826, 5566 Euismod Rd.','Belfast','U','782856',3,'F'),(26,'Suki','Camille','Guzman','P.O. Box 862, 496 Adipiscing Av.','Sokoto','SO','7805',6,'A'),(27,'Nero','Dominique','Rodgers','4471 Nascetur Avenue','Moradabad','UP','63885',1,'S'),(28,'Patricia','Josephine','Finley','2988 Inceptos St.','Leiden','Z.','07273',3,'S'),(29,'Erasmus','Reed','Leonard','P.O. Box 541, 1985 Montes, Rd.','Peñalolén','RM','88445',10,'A'),(30,'September','Lamar','Watkins','P.O. Box 201, 9403 Quam. Av.','Waitakere','North Island','60118',10,'A'),(31,'Beverly','Morgan','Fitzpatrick','147 Interdum Street','Ipswich','Queensland','31115',3,'S'),(32,'India','Paula','Edwards','Ap #841-1680 Non Road','Macklin','SK','49062',1,'S'),(33,'Isabella','Colorado','Lucas','Ap #575-5255 Et Av.','Colchane','Tarapacá','26473-003',1,'F'),(34,'Noel','Wynter','Weber','582-3748 Dapibus Avenue','Athens','Georgia','6856',10,'S'),(35,'Stewart','Jonah','Price','385-4792 Lobortis, Street','São José','Santa Catarina','972030',1,'A'),(36,'Daniel','Branden','Alexander','Ap #898-5551 Quam Avenue','Orléans','Centre','76046',9,'F'),(37,'Maggy','Slade','Mathews','477-1574 Mus. St.','Mont-Sainte-Genevive','HE','667298',1,'F'),(38,'Elvis','Athena','Ballard','6959 Magna Ave','Secunderabad','AP','20912',10,'S'),(39,'Xerxes','Lacey','Parrish','420-2002 Sed Rd.','Gatineau','QC','92328',1,'S'),(40,'Heather','Armando','Warner','P.O. Box 797, 6797 Aliquam Rd.','Berlin','Berlin','482149',3,'S'),(41,'Scarlet','Norman','Padilla','2882 Nec Av.','Vancouver','WA','386037',9,'A'),(42,'Susan','Isabella','Greer','Ap #240-443 Amet, Rd.','Traralgon','VIC','178512',6,'A'),(43,'Hillary','Maisie','Hansen','Ap #130-4783 Malesuada St.','Sint-Denijs-Westrem','OV','6219 FA',6,'A'),(44,'Leonard','Nevada','Bullock','188-9663 Justo. Street','Meridian','ID','H1G 2K6',6,'S'),(45,'Hayley','Hamish','Petty','4216 Nunc Rd.','Terneuzen','Zl','ZQ0 1FR',3,'S'),(46,'Odysseus','Noah','Oneil','828-1291 Eu St.','Dutse','Jigawa','162331',3,'S'),(47,'Hall','Tyrone','Berg','Ap #877-1219 Ultrices. Rd.','Woodstock','Ontario','M1Y 9T0',1,'A'),(48,'Ryan','Irene','Wiggins','P.O. Box 946, 7108 Feugiat St.','Stonewall','MB','782343',10,'S'),(49,'Ruby','Aimee','Neal','5050 Dui Rd.','Utrecht','Utrecht','77246',6,'F'),(50,'Gail','Lesley','Steele','604-8675 Parturient Av.','Leeuwarden','Fr','86182',6,'A'),(51,'Justin','Cairo','Coffey','P.O. Box 125, 479 Aliquam Avenue','Częstochowa','Sląskie','N6C 5L0',9,'S'),(52,'Drake','Jarrod','Grant','3487 Ut Avenue','Pathankot','Punjab','42827',10,'F'),(53,'Fuller','Brandon','Hodge','313-2118 Suspendisse Av.','Cwmbran','Monmouthshire','37-814',3,'S'),(54,'Nehru','Medge','Petty','681-6678 Lectus Avenue','Diyarbakır','Diy','124951',10,'F'),(55,'Xantha','Linus','Mcclure','P.O. Box 854, 7791 Nisl Avenue','Oklahoma City','OK','68789',6,'S'),(56,'Geoffrey','Dalton','Stokes','8719 Tempor, Rd.','Vienna','Wie','09-982',9,'A'),(57,'Iris','Jorden','Nieves','5010 Ipsum Street','Kidwelly','Carmarthenshire','4390',6,'F'),(58,'Debra','Kuame','Mccray','P.O. Box 584, 2020 Aliquet Road','Medemblik','N.','61397',3,'F'),(59,'Camilla','Vielka','Petty','104-6654 Consectetuer Street','Murcia','MU','73792',1,'S'),(60,'Grace','Stella','Mcneil','Ap #536-9180 Fermentum St.','Bhagalpur','Bihar','13915',6,'F'),(61,'Mira','Mark','Bradshaw','9135 Donec Av.','Fort Collins','CO','1793 FX',9,'F'),(62,'Steven','MacKenzie','Contreras','134-5372 Sapien Avenue','Lo Espejo','RM','17-841',6,'S'),(63,'Plato','Stephanie','Garza','125-1891 Dui, St.','Konya','Kon','17013',9,'F'),(64,'Laith','Nissim','Erickson','Ap #668-5845 Ut, Rd.','Grosseto','TOS','8757',1,'A'),(65,'Howard','Martin','Winters','8270 Aliquet St.','Ottignies','Waals-Brabant','45379',1,'A'),(66,'Sophia','Autumn','Swanson','8563 Blandit Road','Bremen','Bremen','1897 HH',10,'S'),(67,'Robin','Malcolm','Ware','P.O. Box 127, 5301 Pede, St.','Vienna','Wie','01953',9,'S'),(68,'Selma','Odysseus','Hart','Ap #111-4438 Nibh St.','Lidingo','Stockholms län','7212 XT',1,'S'),(69,'Callum','Lavinia','Hutchinson','Ap #215-7458 Sem. Road','Bismil','Diyarbakır','06628',10,'F'),(70,'Arsenio','Jordan','Guerrero','Ap #531-5954 Blandit Avenue','Vienna','Vienna','68059',1,'F'),(71,'Isabella','Anika','Estes','P.O. Box 852, 7325 Ut Rd.','Antofagasta','II','71417',6,'S'),(72,'Ryder','Philip','Nelson','P.O. Box 556, 3817 Vestibulum St.','Malahide','Ontario','9318',3,'F'),(73,'Robin','Quynn','Aguirre','Ap #498-1193 Aenean Avenue','Dublin','L','72400-022',10,'A'),(74,'Harding','Eagan','Weber','Ap #872-7521 Consequat, Avenue','Almelo','Overijssel','0111 DE',9,'F'),(75,'Ivy','Shannon','Newman','Ap #198-3566 Phasellus Street','Te Puke','North Island','K2 0CN',6,'S'),(76,'Irene','Dean','Richmond','P.O. Box 872, 2443 A, Av.','Richmond','BC','7351 WQ',1,'F'),(77,'Nell','Skyler','Diaz','640-2985 Sem Avenue','Santa Luzia','Minas Gerais','961958',10,'S'),(78,'Madison','Meredith','Cooke','3333 Eget, Ave','Lansing','Michigan','21014',10,'F'),(79,'Dara','Tatum','Bray','P.O. Box 249, 5679 Purus Rd.','Dublin','L','70630',6,'S'),(80,'Camden','Jade','Good','Ap #547-4938 Libero. Avenue','Belfast','Ulster','37749-683',6,'A'),(81,'Isaiah','Peter','Castillo','P.O. Box 558, 5970 Egestas Road','Salem','OR','D9P 9GK',1,'A'),(82,'Haley','Wyoming','Black','Ap #503-5570 Non Road','GozŽe','HE','10609',3,'A'),(83,'Teagan','Eve','Wilder','P.O. Box 332, 2050 Tortor. Ave','Croydon','Surrey','87048',10,'A'),(84,'Gabriel','Allistair','Mccray','Ap #143-2358 Diam. Rd.','Dublin','Leinster','71661',3,'F'),(85,'Ferris','Igor','Atkinson','6536 Scelerisque St.','Lagos','LA','714991',1,'F'),(86,'Zena','Victor','Roman','430-7709 Senectus Street','Vienna','Vienna','21503',3,'F'),(87,'Sarah','Sigourney','Glass','Ap #757-1338 Tempor Avenue','Pınarbaşı','Kayseri','43203',9,'S'),(88,'Priscilla','Mira','Beasley','442-5089 Pede. Road','Arles','PR','32356',10,'S'),(89,'Nichole','Cameron','Hopkins','P.O. Box 738, 8223 Cras Rd.','Okene','KO','61659',9,'A'),(90,'MacKensie','Quamar','Little','5748 A Street','Vienna','Wie','82246',9,'S'),(91,'Violet','Hanae','Gentry','386-284 Odio St.','Gorzów Wielkopolski','Lubuskie','18325',3,'A'),(92,'Kirby','Colby','Hester','P.O. Box 896, 2575 Proin Avenue','Contulmo','Biobío','94719',10,'F'),(93,'Xanthus','Channing','Moss','P.O. Box 427, 9367 In St.','Sokoto','SO','67-837',6,'A'),(94,'Raymond','Callum','Fleming','377-2742 Non Rd.','Melbourne','Victoria','02849',10,'F'),(95,'Jennifer','Rana','Delgado','785-6096 Risus. Rd.','Helmond','Noord Brabant','24285',10,'A'),(96,'Carlos','Unity','Madden','760-6887 Egestas. St.','Hamilton','Ontario','96796',3,'S'),(97,'Phelan','Neve','Anderson','P.O. Box 627, 1140 Et Rd.','Veere','Zeeland','4116',1,'F'),(98,'Trevor','Athena','Dickerson','Ap #575-8526 Sit Avenue','Sale','VIC','TZ79 2XX',1,'S'),(99,'Marsden','Lara','Heath','140-3483 Sapien, St.','Okene','Kogi','48931',1,'S'),(100,'Virginia','Garrett','Lancaster','2722 Ut Road','Borlänge','Dalarnas län','67235',3,'F');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_signup`
--

DROP TABLE IF EXISTS `person_signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_signup` (
  `registration_Date` varchar(20) DEFAULT NULL,
  `personID` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  PRIMARY KEY (`personID`,`eventID`),
  KEY `fk_Person_Signup_Person1_idx` (`personID`),
  KEY `fk_Person_Signup_Event1_idx` (`eventID`),
  CONSTRAINT `fk_Person_Signup_Event1` FOREIGN KEY (`eventID`) REFERENCES `event` (`eventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_Signup_Person1` FOREIGN KEY (`personID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_signup`
--

LOCK TABLES `person_signup` WRITE;
/*!40000 ALTER TABLE `person_signup` DISABLE KEYS */;
INSERT INTO `person_signup` VALUES ('11/26/2017',1,4),('10/24/2017',2,2),('01/17/2018',3,5),('02/01/2018',4,4),('12/06/2017',5,1),('01/08/2018',6,1),('11/08/2017',7,4),('10/24/2017',8,4),('12/28/2017',9,3),('10/17/2017',10,2),('12/06/2017',11,5),('12/03/2017',12,1),('10/10/2017',13,3),('11/02/2017',14,3),('11/08/2017',15,1),('12/05/2017',16,5),('12/05/2017',17,2),('10/12/2017',18,1),('01/26/2018',19,2),('01/06/2018',20,5),('10/15/2017',21,3),('12/12/2017',22,1),('01/27/2018',23,5),('11/06/2017',24,2),('10/11/2017',25,1),('01/03/2018',26,4),('12/10/2017',27,4),('10/11/2017',28,3),('11/24/2017',29,1),('11/07/2017',30,5),('11/13/2017',31,3),('10/07/2017',32,5),('10/28/2017',33,1),('12/03/2017',34,5),('12/11/2017',35,1),('10/20/2017',36,2),('10/21/2017',37,4),('01/12/2018',38,2),('11/29/2017',39,4),('10/14/2017',40,5),('11/22/2017',41,1),('01/04/2018',42,3),('12/29/2017',43,5),('01/27/2018',44,4),('11/04/2017',45,4),('10/30/2017',46,1),('10/15/2017',47,4),('12/28/2017',48,4),('11/13/2017',49,5),('11/30/2017',50,4),('11/23/2017',51,2),('11/14/2017',52,2),('01/21/2018',53,4),('11/03/2017',54,2),('10/25/2017',55,5),('01/28/2018',56,3),('10/08/2017',57,3),('12/29/2017',58,5),('01/26/2018',59,3),('12/18/2017',60,3),('10/25/2017',61,4),('12/13/2017',62,5),('02/08/2018',63,2),('10/11/2017',64,4),('10/08/2017',65,1),('10/18/2017',66,2),('12/22/2017',67,2),('12/06/2017',68,2),('01/27/2018',69,2),('02/02/2018',70,5),('01/10/2018',71,2),('11/13/2017',72,3),('01/26/2018',73,5),('10/26/2017',74,4),('12/30/2017',75,3),('10/03/2017',76,5),('12/01/2017',77,5),('11/23/2017',78,5),('11/30/2017',79,5),('01/09/2018',80,2),('10/01/2017',81,2),('10/11/2017',82,4),('12/29/2017',83,5),('01/16/2018',84,2),('01/29/2018',85,5),('11/29/2017',86,5),('01/05/2018',87,3),('11/21/2017',88,1),('11/05/2017',89,5),('10/26/2017',90,5),('01/15/2018',91,3),('10/16/2017',92,5),('11/02/2017',93,3),('10/09/2017',94,2),('01/15/2018',95,2),('11/06/2017',96,4),('01/29/2018',97,1),('11/02/2017',98,5),('11/11/2017',99,3),('10/20/2017',100,3);
/*!40000 ALTER TABLE `person_signup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `major_Name` varchar(45) DEFAULT NULL,
  `GPA` varchar(10) DEFAULT NULL,
  `grad_year` int(11) DEFAULT NULL,
  `honors_YorN` varchar(1) DEFAULT NULL,
  `studentID` int(11) NOT NULL,
  `advisorID` int(11) NOT NULL,
  PRIMARY KEY (`studentID`),
  KEY `fk_Student_Person_idx` (`studentID`),
  KEY `fk_Student_Faculty1_idx` (`advisorID`),
  CONSTRAINT `fk_Student_Faculty1` FOREIGN KEY (`advisorID`) REFERENCES `faculty` (`facultyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_Person` FOREIGN KEY (`studentID`) REFERENCES `person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('Music','3.95',2017,'N',3,97),('Math','1.31',2019,'Y',4,94),('History','1.93',2021,'Y',7,85),('History','1.29',2017,'N',8,84),('English','2.66',2019,'Y',13,76),('Music','1.02',2020,'N',17,74),('English','1.32',2020,'Y',20,72),('Music','1.33',2021,'N',22,70),('Computer Science','0.19',2017,'N',27,63),('Music','1.97',2020,'N',28,61),('Music','3.53',2021,'Y',31,57),('English','2.76',2020,'N',32,54),('Music','3.49',2019,'N',34,52),('History','2.07',2018,'N',38,37),('Computer Science','2.74',2017,'N',39,36),('Computer Science','1.55',2019,'N',40,37),('Computer Science','0.20',2017,'N',44,49),('Computer Science','2.91',2018,'Y',45,33),('Music','0.89',2017,'Y',46,58),('Computer Science','0.99',2019,'Y',48,60),('History','0.52',2019,'N',51,69),('Computer Science','2.88',2017,'Y',53,25),('Computer Science','0.75',2018,'Y',55,24),('Math','2.79',2019,'Y',59,23),('English','0.95',2017,'Y',62,21),('Music','2.06',2020,'Y',66,19),('Math','1.06',2020,'N',67,18),('Music','1.64',2018,'N',68,16),('Math','3.40',2019,'Y',71,15),('Computer Science','2.56',2018,'Y',75,14),('Music','2.39',2018,'Y',77,12),('Music','0.90',2017,'N',79,11),('English','0.14',2020,'N',87,10),('Music','0.17',2020,'Y',88,78),('Math','2.05',2021,'N',90,86),('English','1.03',2021,'Y',96,92),('Math','3.46',2020,'N',98,100),('Computer Science','2.94',2018,'N',99,1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-04  9:04:20
