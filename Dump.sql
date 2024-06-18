-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: course_project
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `depatments`
--

DROP TABLE IF EXISTS `depatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depatments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depatments`
--

LOCK TABLES `depatments` WRITE;
/*!40000 ALTER TABLE `depatments` DISABLE KEYS */;
INSERT INTO `depatments` VALUES (1,'Отдел администрации'),(2,'Отдел кадров'),(3,'Отдел продаж'),(4,'Отдел технической поддержки');
/*!40000 ALTER TABLE `depatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `details_employees`
--

DROP TABLE IF EXISTS `details_employees`;
/*!50001 DROP VIEW IF EXISTS `details_employees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `details_employees` AS SELECT 
 1 AS `id`,
 1 AS `firstname`,
 1 AS `secondname`,
 1 AS `patronymic`,
 1 AS `birthday`,
 1 AS `phone`,
 1 AS `department`,
 1 AS `job_title`,
 1 AS `salary_per_hour`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `secondname` varchar(255) NOT NULL,
  `patronymic` varchar(255) NOT NULL,
  `gender` enum('m','f') NOT NULL,
  `birthday` date NOT NULL,
  `residence_address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `employment_date` date NOT NULL,
  `job_title_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_employees_job_title1_idx` (`job_title_id`),
  CONSTRAINT `fk_employees_job_title1` FOREIGN KEY (`job_title_id`) REFERENCES `job_title` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Иван','Иванов','Иванович','m','1990-01-01','Улица Ленина, дом 1','89012345678','ivan@n0maci.ru','2024-04-01',16),(2,'Мария','Петрова','Сергеевна','f','1995-02-02','Улица Пушкина, дом 2','89023456789','maria@n0maci.ru','2024-04-01',6),(3,'Петр','Сидоров','Петрович','m','1988-03-03','Улица Гагарина, дом 3','89034567890','petr@n0maci.ru','2024-04-01',11),(4,'Анна','Иванова','Александровна','f','1993-04-04','Улица Маяковского, дом 4','89045678901','anna@n0maci.ru','2024-04-01',1),(5,'Алексей','Павлов','Алексеевич','m','1985-05-05','Улица Шевченко, дом 5','89056789012','alex@n0maci.ru','2024-04-01',10),(6,'Елена','Сергеева','Алексеевна','f','1990-06-06','Улица Толстого, дом 6','89067890123','elena@n0maci.ru','2024-04-01',15),(7,'Дмитрий','Михайлов','Владимирович','m','1986-07-07','Улица Горького, дом 7','89078901234','dmitry@n0maci.ru','2024-04-01',5),(8,'Алина','Андреева','Александровна','f','1991-08-08','Улица Ленина, дом 8','89089012345','alina@n0maci.ru','2024-04-01',16),(9,'Сергей','Владимиров','Васильевич','m','1987-09-09','Улица Гагарина, дом 9','89090123456','sergey@n0maci.ru','2024-04-01',2),(10,'Ольга','Сергеева','Сергеевна','f','1992-10-10','Улица Тургенева, дом 10','89001234567','olga@n0maci.ru','2024-04-01',7),(11,'Артем','Николаев','Алексеевич','m','1988-11-11','Улица Пушкина, дом 11','89012245678','artem@n0maci.ru','2024-04-01',14),(12,'Татьяна','Дмитриева','Дмитриевна','f','1993-12-12','Улица Маяковского, дом 12','89022456789','tatiana@n0maci.ru','2024-04-01',9),(13,'Игорь','Петров','Сергеевич','m','1985-01-13','Улица Шевченко, дом 13','89033567890','igor@n0maci.ru','2024-04-01',11),(14,'Евгения','Андреева','Васильевна','f','1990-02-14','Улица Толстого, дом 14','89044678901','evgenia@n0maci.ru','2024-04-01',10),(15,'Максим','Иванов','Михайлович','m','1986-03-15','Улица Горького, дом 15','89055789012','maxim@n0maci.ru','2024-04-01',4),(16,'Наталья','Петрова','Сергеевна','f','1991-04-16','Улица Ленина, дом 16','89066890123','natalia@n0maci.ru','2024-04-01',12),(17,'Андрей','Сергеев','Андреевич','m','1987-05-17','Улица Гагарина, дом 17','89077901234','andrey@n0maci.ru','2024-04-01',13),(18,'Светлана','Андреева','Игоревна','f','1992-06-18','Улица Тургенева, дом 18','89088012345','svetlana@n0maci.ru','2024-04-01',12),(19,'Александр','Максимов','Александрович','m','1988-07-19','Улица Пушкина, дом 19','89099123456','alexander@n0maci.ru','2024-04-01',8),(20,'Екатерина','Владимирова','Александровна','f','1993-08-20','Улица Маяковского, дом 20','89001134567','ekaterina@n0maci.ru','2024-04-01',8);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_title`
--

DROP TABLE IF EXISTS `job_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_title` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `salary_per_hour` decimal(10,2) DEFAULT NULL,
  `depatments_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_title_depatments1_idx` (`depatments_id`),
  CONSTRAINT `fk_job_title_depatments1` FOREIGN KEY (`depatments_id`) REFERENCES `depatments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_title`
--

LOCK TABLES `job_title` WRITE;
/*!40000 ALTER TABLE `job_title` DISABLE KEYS */;
INSERT INTO `job_title` VALUES (1,'Руководитель отдела',2000.00,1),(2,'Главный специалист отдела',1400.00,1),(3,'Специалист отдела',1000.00,1),(4,'Младший специалист отдела',600.00,1),(5,'Руководитель отдела',1500.00,2),(6,'Главный специалист отдела',1000.00,2),(7,'Специалист отдела',600.00,2),(8,'Младший специалист отдела',300.00,2),(9,'Руководитель отдела',1800.00,3),(10,'Главный специалист отдела',1400.00,3),(11,'Специалист отдела',1000.00,3),(12,'Младший специалист отдела',500.00,3),(13,'Руководитель отдела',1300.00,4),(14,'Главный специалист отдела',1000.00,4),(15,'Специалист отдела',700.00,4),(16,'Младший специалист отдела',400.00,4);
/*!40000 ALTER TABLE `job_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_documents`
--

DROP TABLE IF EXISTS `personal_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `passport` char(10) NOT NULL,
  `individual_tax_number` char(12) NOT NULL,
  `insurance_number` char(11) NOT NULL,
  `work_book_number` char(7) NOT NULL,
  `military_ticket` char(7) DEFAULT NULL,
  `employees_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `passport_UNIQUE` (`passport`),
  UNIQUE KEY `individual_tax_number_UNIQUE` (`individual_tax_number`),
  UNIQUE KEY `insurance_number_of_an_individual_personal_account_UNIQUE` (`insurance_number`),
  UNIQUE KEY `work_book_number_UNIQUE` (`work_book_number`),
  UNIQUE KEY `military_ticket_UNIQUE` (`military_ticket`),
  KEY `fk_personal_documents_employees1_idx` (`employees_id`),
  CONSTRAINT `fk_personal_documents_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_documents`
--

LOCK TABLES `personal_documents` WRITE;
/*!40000 ALTER TABLE `personal_documents` DISABLE KEYS */;
INSERT INTO `personal_documents` VALUES (1,'8602107836','770819195109','97519911163','3098532','9686341',1),(2,'9136106976','144556339007','6566043874','6621512',NULL,2),(3,'5699239676','461598738168','58958536384','8631662','6060593',3),(4,'4407981936','332852227700','30660531237','3858128',NULL,4),(5,'6066696956','393633113806','5343375547','8759099','5595407',5),(6,'1699739053','41816490004','4868224994','1712473',NULL,6),(7,'3463148235','398530932295','44745545915','2178322','5021677',7),(8,'5975871827','873448563304','80706842906','8372856',NULL,8),(9,'3936665592','125250117006','92561212895','4564759','1013802',9),(10,'1374733775','433056657940','58262869237','3832261',NULL,10),(11,'5037106205','83904184830','67295537347','3688747','3332416',11),(12,'5595842791','532775880690','51215466548','7981964',NULL,12),(13,'3122292787','294092832768','8788814850','1665571','8960980',13),(14,'9808188173','496702644982','48203479386','2157999',NULL,14),(15,'1365432461','596312407322','80668135011','3531646','7669525',15),(16,'7288136302','834164869581','43986258139','3432103',NULL,16),(17,'5296111046','100203698432','38468764552','6184243','5032885',17),(18,'6611698685','185853263686','3802408021','7959835',NULL,18),(19,'9964084029','384733635801','42059409565','5940912','9812311',19),(20,'1238818290','289183357456','49043096590','6757158',NULL,20);
/*!40000 ALTER TABLE `personal_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salary_date` date NOT NULL,
  `number_of_hours_worked` int NOT NULL,
  `final_salary` decimal(10,2) NOT NULL,
  `employees_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_salary_employees1_idx` (`employees_id`),
  CONSTRAINT `fk_salary_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_tracking`
--

DROP TABLE IF EXISTS `time_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_tracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` int NOT NULL,
  `employees_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_time_tracking_employees1_idx` (`employees_id`),
  CONSTRAINT `fk_time_tracking_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_tracking`
--

LOCK TABLES `time_tracking` WRITE;
/*!40000 ALTER TABLE `time_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `details_employees`
--

/*!50001 DROP VIEW IF EXISTS `details_employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `details_employees` AS select `employees`.`id` AS `id`,`employees`.`firstname` AS `firstname`,`employees`.`secondname` AS `secondname`,`employees`.`patronymic` AS `patronymic`,`employees`.`birthday` AS `birthday`,`employees`.`phone` AS `phone`,`depatments`.`title` AS `department`,`job_title`.`title` AS `job_title`,`job_title`.`salary_per_hour` AS `salary_per_hour` from ((`employees` join `job_title` on((`job_title`.`id` = `employees`.`job_title_id`))) join `depatments` on((`depatments`.`id` = `job_title`.`depatments_id`))) */;
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

-- Dump completed on 2024-06-18 19:53:18
