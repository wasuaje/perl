-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dbPyRest
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.13.10.2

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
-- Current Database: `dbPyRest`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbPyRest` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbPyRest`;

--
-- Table structure for table `auth_cas`
--

DROP TABLE IF EXISTS `auth_cas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_cas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `renew` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  CONSTRAINT `auth_cas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_cas`
--

LOCK TABLES `auth_cas` WRITE;
/*!40000 ALTER TABLE `auth_cas` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_cas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_event`
--

DROP TABLE IF EXISTS `auth_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_stamp` datetime DEFAULT NULL,
  `client_ip` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  CONSTRAINT `auth_event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_event`
--

LOCK TABLES `auth_event` WRITE;
/*!40000 ALTER TABLE `auth_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_membership`
--

DROP TABLE IF EXISTS `auth_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  KEY `group_id__idx` (`group_id`),
  CONSTRAINT `auth_membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_membership_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_membership`
--

LOCK TABLES `auth_membership` WRITE;
/*!40000 ALTER TABLE `auth_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id__idx` (`group_id`),
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `registration_key` varchar(255) DEFAULT NULL,
  `reset_password_key` varchar(255) DEFAULT NULL,
  `registration_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'Duducoma','Popapomo','mamacesa@example.com','','Concluding this energy which two of the eyes. Girdled about. ','Wasted. It forms of unexhausted possibilities of damp meadow. in. ','Butterfly kallima inachis from water from the waves 1 of the. '),(2,'Dacosamo','Dasococe','madutadu@example.com','','Empire. he shows the greek meaning of the fox or feelings. ','Shore-pool. sec. All the habit of evolution going on up. ','Gr granules. from the length of neck and eventually to strike. '),(3,'Pamadamo','Sapocopo','somasaco@example.com','','1869 that they differ as we must be several more. . ','Iron-forming bacteria of this made a profound calm of the surroundings. ','Figures--bison reindeer and concise view of pithecanthropus the solar spectrum. . '),(4,'Sasasota','Cotoduce','posodusa@example.com','','Aesop prawn takes at each other growths on one which tackle. ','Ulna of man with the field. Had a bell is. ','Engrain capacities but it has instruments of the seven two very. '),(5,'Cocesoco','Potasopo','tasapopo@example.com','','Violates the past; it is independent lives at the man. ','Excessively minute in the use part with the finest gold has. ','Trundles about six meant the bat the surface or zoophyte. . '),(6,'Pomoceda','Motopopo','pomamosa@example.com','','Wires as walt whitman took longer than they are going on. ','Trilobite 90 days of the surface is as the constitution of. ','Jaws of teeth which circulate round about 9 inches below the. '),(7,'Tacoposo','Podacema','patadumo@example.com','','Protoplasm flowing through them insulators because of slits the spineless cactus. ','Distinctions except that walks slowly on a large number of migration.. ','Lethargic state of its typical districts. The energy disappears from. '),(8,'Dusosoce','Ducomama','papacedu@example.com','','286 transformation such time immemorial and sheep. The photograph. . ','Refinements are just a tube. New view of the project. ','Happened to do not very literal blood-relationship between shadow across the. '),(9,'Pamodada','Pacetata','tapopota@example.com','','Most of the stick it feeds on its partner s sons. ','Want. illustration: harvard college observatory. a common foraminifer polystomella showing. ','Heidelbergensis discovered in the earth it collects pollen from fossil horses. '),(10,'Tosasosa','Cepacomo','satotoso@example.com','','Terra firma and sponges jellyfish it often got the sake professor. ','Killdeer plover has to depress one of trekking to charge on. ','Lessen the stars the conclusion what the atoms and saltatory display. ');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_cliente`
--

DROP TABLE IF EXISTS `cf_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `direccion` longtext,
  `rif` varchar(255) DEFAULT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tlf` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  `juridico` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_cliente`
--

LOCK TABLES `cf_cliente` WRITE;
/*!40000 ALTER TABLE `cf_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cf_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_empresa`
--

DROP TABLE IF EXISTS `cf_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `rif` varchar(255) DEFAULT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tlf` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  `direccion` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_empresa`
--

LOCK TABLES `cf_empresa` WRITE;
/*!40000 ALTER TABLE `cf_empresa` DISABLE KEYS */;
INSERT INTO `cf_empresa` VALUES (1,'Restaurant 1','Restaurant 1','J-1234569-2','','resta@gmail.com','58412-3659899','','cf_empresa.ruta_foto.b764f92bb1f67f9d.69636f2d696e6475636f6d2e706e67.png','La Candelaria Esq. de Animas');
/*!40000 ALTER TABLE `cf_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_mesa`
--

DROP TABLE IF EXISTS `cf_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_mesa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_mesa`
--

LOCK TABLES `cf_mesa` WRITE;
/*!40000 ALTER TABLE `cf_mesa` DISABLE KEYS */;
INSERT INTO `cf_mesa` VALUES (1,'00','Cliente de Contado',''),(2,'01','Mesa 01',''),(3,'02','Mesa 02',''),(4,'03','Mesa 03',''),(5,'04','Mesa 04',''),(6,'05','Mesa 05','');
/*!40000 ALTER TABLE `cf_mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_proveedor`
--

DROP TABLE IF EXISTS `cf_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `direccion` longtext,
  `rif` varchar(255) DEFAULT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tlf` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_proveedor`
--

LOCK TABLES `cf_proveedor` WRITE;
/*!40000 ALTER TABLE `cf_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `cf_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_orden`
--

DROP TABLE IF EXISTS `fc_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `closed` char(1) DEFAULT NULL,
  `delivery` char(1) DEFAULT NULL,
  `delivered` char(1) DEFAULT NULL,
  `delivery_paid` char(1) DEFAULT NULL,
  `facturada` char(1) DEFAULT NULL,
  `num_fact` varchar(255) DEFAULT NULL,
  `fecha_fac` date DEFAULT NULL,
  `mesa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_orden`
--

LOCK TABLES `fc_orden` WRITE;
/*!40000 ALTER TABLE `fc_orden` DISABLE KEYS */;
INSERT INTO `fc_orden` VALUES (13,NULL,'2013-03-05',0,'F','F','F','F','F',NULL,NULL,1),(17,NULL,'2013-04-17',0,'F','F','F','F','F',NULL,NULL,2),(18,NULL,'2013-04-17',0,'F','F','F','F','F',NULL,NULL,3),(19,NULL,'2013-04-17',0,'F','F','F','F','F',NULL,NULL,4);
/*!40000 ALTER TABLE `fc_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_orden_det`
--

DROP TABLE IF EXISTS `fc_orden_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_orden_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT '0',
  `importe` float DEFAULT '0',
  `iva` float DEFAULT '0',
  `imp1` float DEFAULT '0',
  `imp2` float DEFAULT '0',
  `descuento` float DEFAULT '0',
  `total` float DEFAULT '0',
  `orden_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_orden_det`
--

LOCK TABLES `fc_orden_det` WRITE;
/*!40000 ALTER TABLE `fc_orden_det` DISABLE KEYS */;
INSERT INTO `fc_orden_det` VALUES (13,1,1,80,12,0,0,0,89.6,13),(26,13,1,14,12,0,0,0,15.68,13),(41,16,1,10,12,0,0,0,11.2,13),(42,15,1,14,12,0,0,0,15.68,13),(47,9,1,40,12,0,0,0,44.8,13),(51,2,1,60,12,0,0,0,67.2,17),(52,3,1,90,12,0,0,0,100.8,17),(53,5,1,30,12,0,0,0,33.6,18),(54,4,1,40,12,0,0,0,44.8,18),(55,12,1,35,12,0,0,0,39.2,19),(57,9,1,40,12,0,0,0,44.8,17),(58,7,1,50,12,0,0,0,56,17);
/*!40000 ALTER TABLE `fc_orden_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_categoria`
--

DROP TABLE IF EXISTS `in_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `in_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `show_in_menu` char(1) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_categoria`
--

LOCK TABLES `in_categoria` WRITE;
/*!40000 ALTER TABLE `in_categoria` DISABLE KEYS */;
INSERT INTO `in_categoria` VALUES (1,'01','Entradas','T','in_categoria.ruta_foto.83ef17064ea81c18.656e73616c616461732e6a7067.jpg'),(2,'02','Desayunos','T','in_categoria.ruta_foto.8e7d22a98bb4df19.6465736179756e6f2e6a706567.jpeg'),(3,'03','Almuerzos','T','in_categoria.ruta_foto.a012d0a7ab68f864.6361726e65732e6a706567.jpeg'),(4,'04','Licores','T','in_categoria.ruta_foto.b2fe9358bac2d0b0.6c69636f7265732e6a706567.jpeg'),(5,'05','Bebidas','T','in_categoria.ruta_foto.98d873102435a558.626562696461732e6a7067.jpg');
/*!40000 ALTER TABLE `in_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_producto`
--

DROP TABLE IF EXISTS `in_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `in_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `show_in_menu` char(1) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `imp2` float DEFAULT '0',
  `imp1` float DEFAULT '0',
  `iva` float DEFAULT '0',
  `descuento` float DEFAULT '0',
  `costo` float DEFAULT '0',
  `importe` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_producto`
--

LOCK TABLES `in_producto` WRITE;
/*!40000 ALTER TABLE `in_producto` DISABLE KEYS */;
INSERT INTO `in_producto` VALUES (1,'01','Ensalada Cesar','T','in_producto.ruta_foto.96470f0367149164.656e7472616461312e6a7067.jpg',1,0,0,12,0,0,80),(2,'02','Sopa','T','in_producto.ruta_foto.91a952c9c0d1965b.656e7472616461322e6a706567.jpeg',1,0,0,12,0,0,60),(3,'03','Tortilla Española','T','in_producto.ruta_foto.a1120636a01924a9.656e7472616461332e6a706567.jpeg',1,0,0,12,0,0,90),(4,'04','Huevos con pan','T','in_producto.ruta_foto.a536de1e9e4c42f4.6465736179756e6f322e6a706567.jpeg',2,0,0,12,0,0,40),(5,'05','Torta de jamon','T','in_producto.ruta_foto.a6f5a94858a49a55.6465736179756e6f332e6a706567.jpeg',2,0,0,12,0,0,30),(6,'06','Panquecas','T','in_producto.ruta_foto.8b13a71b00b1b6cd.6465736179756e6f312e6a7067.jpg',2,0,0,12,0,0,30),(7,'07','Shawarma','T','in_producto.ruta_foto.ac1c7441862c1835.616c6d7565727a6f312e6a7067.jpg',3,0,0,12,0,0,50),(8,'08','Carne Guisada','T','in_producto.ruta_foto.aae05b44b0851646.616c6d7565727a6f322e6a7067.jpg',3,0,0,12,0,0,70),(9,'09','Submarino','T','in_producto.ruta_foto.a424ea41cd8d0aba.616c6d7565727a6f332e6a7067.jpg',3,0,0,12,0,0,40),(10,'10','whisky','T','in_producto.ruta_foto.a393121e2144dffd.776869736b792e6a7067.jpg',4,0,0,12,0,0,55),(11,'11','Vino Tinto','T','in_producto.ruta_foto.99027ac42a7e1da4.76696e6f74696e746f2e6a7067.jpg',4,0,0,12,0,0,45),(12,'12','Vino Blanco','T','in_producto.ruta_foto.9a422bcc9b5aac51.76696e6f626c616e636f2e6a7067.jpg',4,0,0,12,0,0,35),(13,'13','Pepsi light','T','in_producto.ruta_foto.98d221226484a40f.676173656f7361342e6a7067.jpg',5,0,0,12,0,0,14),(14,'14','Coca Cola','T','in_producto.ruta_foto.8f746a6836bbe19c.676173656f7361322e6a7067.jpg',5,0,0,12,0,0,14),(15,'15','Sprite','T','in_producto.ruta_foto.b032c799ff03f011.676173656f7361332e6a7067.jpg',5,0,0,12,0,0,14),(16,'16','Agua mineral','T','in_producto.ruta_foto.aae4c25c3ef119b2.676173656f7361352e6a7067.jpg',5,0,0,12,0,0,10);
/*!40000 ALTER TABLE `in_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbflota`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbflota` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbflota`;

--
-- Table structure for table `authcas`
--

DROP TABLE IF EXISTS `authcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  CONSTRAINT `authcas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `authuser` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authcas`
--

LOCK TABLES `authcas` WRITE;
/*!40000 ALTER TABLE `authcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `authcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authevent`
--

DROP TABLE IF EXISTS `authevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_stamp` datetime DEFAULT NULL,
  `client_ip` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  CONSTRAINT `authevent_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `authuser` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authevent`
--

LOCK TABLES `authevent` WRITE;
/*!40000 ALTER TABLE `authevent` DISABLE KEYS */;
INSERT INTO `authevent` VALUES (1,'2011-12-06 18:39:54','127.0.0.1',NULL,'auth','Group 1 created'),(2,'2011-12-06 18:39:54','127.0.0.1',1,'auth','User 1 Registered'),(3,'2011-12-07 08:57:36','127.0.0.1',NULL,'auth','Group 2 created'),(4,'2011-12-07 08:57:36','127.0.0.1',2,'auth','User 2 Registered'),(5,'2011-12-07 08:57:54','127.0.0.1',2,'auth','User 2 Profile updated'),(6,'2011-12-07 08:58:01','127.0.0.1',2,'auth','User 2 Logged-out'),(7,'2011-12-07 09:22:03','127.0.0.1',1,'auth','User 1 Logged-in'),(8,'2011-12-07 09:22:10','127.0.0.1',1,'auth','User 1 Logged-out'),(9,'2011-12-07 09:22:19','127.0.0.1',2,'auth','User 2 Logged-in'),(10,'2011-12-07 09:33:40','127.0.0.1',2,'auth','User 2 Logged-out'),(11,'2011-12-07 10:04:54','127.0.0.1',3,'auth','User 3 Registered'),(12,'2012-01-31 15:06:40','127.0.0.1',1,'auth','User 1 Logged-in'),(13,'2012-01-31 15:06:54','127.0.0.1',1,'auth','User 1 Logged-out'),(14,'2012-01-31 15:07:17','127.0.0.1',1,'auth','User 1 Logged-in'),(15,'2012-01-31 15:07:31','127.0.0.1',1,'auth','User 1 Logged-out'),(16,'2012-01-31 15:11:39','127.0.0.1',1,'auth','User 1 Logged-in'),(17,'2012-01-31 15:11:47','127.0.0.1',1,'auth','User 1 Logged-out'),(18,'2012-01-31 15:12:25','127.0.0.1',2,'auth','User 2 Logged-in'),(19,'2012-02-02 15:13:19','127.0.0.1',2,'auth','User 2 Logged-out'),(20,'2012-02-02 15:13:31','127.0.0.1',2,'auth','User 2 Logged-in'),(21,'2012-02-02 15:25:16','127.0.0.1',2,'auth','User 2 Logged-out'),(22,'2012-02-02 15:25:24','127.0.0.1',2,'auth','User 2 Logged-in'),(23,'2012-02-02 15:25:41','127.0.0.1',2,'auth','User 2 Logged-out'),(24,'2012-02-02 15:25:46','127.0.0.1',1,'auth','User 1 Logged-in'),(25,'2012-02-02 15:26:21','127.0.0.1',1,'auth','User 1 Logged-out'),(26,'2012-02-02 15:26:29','127.0.0.1',2,'auth','User 2 Logged-in'),(27,'2012-04-18 12:27:28','127.0.0.1',1,'auth','User 1 Logged-in'),(28,'2012-04-18 12:30:01','127.0.0.1',1,'auth','User 1 Logged-out'),(29,'2012-04-18 12:30:06','127.0.0.1',2,'auth','User 2 Logged-in'),(30,'2012-04-18 13:56:52','10.3.0.130',2,'auth','User 2 Logged-in'),(31,'2012-04-18 14:36:53','10.1.125.41',2,'auth','User 2 Logged-in'),(32,'2012-05-17 11:09:00','127.0.0.1',2,'auth','User 2 Logged-in'),(33,'2012-05-17 15:28:18','127.0.0.1',2,'auth','User 2 Logged-in'),(34,'2012-10-17 17:18:24','127.0.0.1',1,'auth','User 1 Logged-in'),(35,'2012-10-17 17:18:37','127.0.0.1',1,'auth','User 1 Logged-out'),(36,'2012-10-17 17:18:44','127.0.0.1',2,'auth','User 2 Logged-in'),(37,'2013-01-30 12:10:42','127.0.0.1',2,'auth','User 2 Logged-in'),(38,'2013-01-31 17:36:48','127.0.0.1',2,'auth','User 2 Logged-in'),(39,'2013-01-31 17:37:04','127.0.0.1',2,'auth','User 2 Logged-out'),(40,'2013-01-31 17:37:09','127.0.0.1',1,'auth','User 1 Logged-in'),(41,'2013-02-01 15:29:39','127.0.0.1',2,'auth','User 2 Logged-in'),(42,'2013-02-07 11:43:27','127.0.0.1',2,'auth','User 2 Logged-in'),(43,'2013-02-19 17:30:07','127.0.0.1',2,'auth','User 2 Logged-in'),(44,'2013-02-26 12:38:43','127.0.0.1',2,'auth','User 2 Logged-in');
/*!40000 ALTER TABLE `authevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authgroup`
--

DROP TABLE IF EXISTS `authgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authgroup`
--

LOCK TABLES `authgroup` WRITE;
/*!40000 ALTER TABLE `authgroup` DISABLE KEYS */;
INSERT INTO `authgroup` VALUES (1,'Admin','Group uniquely assigned to user 1'),(2,'Operator','Group uniquely assigned to user 2'),(3,'Transcriptor','');
/*!40000 ALTER TABLE `authgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authmembership`
--

DROP TABLE IF EXISTS `authmembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmembership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  KEY `group_id__idx` (`group_id`),
  CONSTRAINT `authmembership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `authuser` (`id`) ON DELETE CASCADE,
  CONSTRAINT `authmembership_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `authgroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authmembership`
--

LOCK TABLES `authmembership` WRITE;
/*!40000 ALTER TABLE `authmembership` DISABLE KEYS */;
INSERT INTO `authmembership` VALUES (1,1,1),(2,2,2),(3,1,2);
/*!40000 ALTER TABLE `authmembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authpermission`
--

DROP TABLE IF EXISTS `authpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id__idx` (`group_id`),
  CONSTRAINT `authpermission_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `authgroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authpermission`
--

LOCK TABLES `authpermission` WRITE;
/*!40000 ALTER TABLE `authpermission` DISABLE KEYS */;
INSERT INTO `authpermission` VALUES (1,2,'config','',0),(2,1,'admin','',0),(3,1,'config','',0);
/*!40000 ALTER TABLE `authpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authuser`
--

DROP TABLE IF EXISTS `authuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `registration_key` varchar(255) DEFAULT NULL,
  `reset_password_key` varchar(255) DEFAULT NULL,
  `registration_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authuser`
--

LOCK TABLES `authuser` WRITE;
/*!40000 ALTER TABLE `authuser` DISABLE KEYS */;
INSERT INTO `authuser` VALUES (1,'wasuaje@hotmail.com','e733238022100f60b974b29efbeaef25','wuelfhis','asuaje','wasuaje','2011-12-06 18:39:54','2011-12-06 18:39:54','','',''),(2,'wasuaje@yahoo.com','e733238022100f60b974b29efbeaef25','Alexis','Asuaje','alexis','2011-12-07 08:57:36','2011-12-07 08:57:54','','',''),(3,'prueba@prueba.com','c229f16b1f7434e980dc72eb2f8e9219','prueba','prueba','prueba','2011-12-07 10:04:54','2011-12-07 10:04:54','','','');
/*!40000 ALTER TABLE `authuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_asignacion_tipo`
--

DROP TABLE IF EXISTS `cf_asignacion_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_asignacion_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_asignacion_tipo`
--

LOCK TABLES `cf_asignacion_tipo` WRITE;
/*!40000 ALTER TABLE `cf_asignacion_tipo` DISABLE KEYS */;
INSERT INTO `cf_asignacion_tipo` VALUES (1,'Asignacion temporal'),(2,'Asignacion permanente');
/*!40000 ALTER TABLE `cf_asignacion_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_aviso`
--

DROP TABLE IF EXISTS `cf_aviso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_aviso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(500) DEFAULT NULL,
  `kilometraje` int(11) DEFAULT NULL,
  `dias` int(11) DEFAULT NULL,
  `cf_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cf_alarmas_cf_item1` (`cf_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_aviso`
--

LOCK TABLES `cf_aviso` WRITE;
/*!40000 ALTER TABLE `cf_aviso` DISABLE KEYS */;
INSERT INTO `cf_aviso` VALUES (1,'Cambio de aceite por kilometraje',150000,91,1);
/*!40000 ALTER TABLE `cf_aviso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_cargo`
--

DROP TABLE IF EXISTS `cf_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_cargo`
--

LOCK TABLES `cf_cargo` WRITE;
/*!40000 ALTER TABLE `cf_cargo` DISABLE KEYS */;
INSERT INTO `cf_cargo` VALUES (4,'Chofer de Motos'),(3,'Chofer vehiculos livianos'),(5,'Chofer de camiones '),(6,'Chofer de autobus');
/*!40000 ALTER TABLE `cf_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_empresa`
--

DROP TABLE IF EXISTS `cf_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `rif` varchar(15) DEFAULT NULL,
  `nit` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tlf` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `ruta_foto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_empresa`
--

LOCK TABLES `cf_empresa` WRITE;
/*!40000 ALTER TABLE `cf_empresa` DISABLE KEYS */;
INSERT INTO `cf_empresa` VALUES (1,'Transporte Ejecutivo R.J.A','Transporte Ejecutivo R.J.A, C.A.','Calle el Manguito, Res. El Guamo, PB, APTO. 10. La Floresta, Coche. Caracas.','J-29550181-1','002556413','rja@hotmail.com','212-8563255','212-8635566','cf_empresa.ruta_foto.b80d747bd5be85e7.4d617a6461365f332e6a7067.jpg');
/*!40000 ALTER TABLE `cf_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_item`
--

DROP TABLE IF EXISTS `cf_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `cf_item_grupo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cf_item_cf_item_grupo1` (`cf_item_grupo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_item`
--

LOCK TABLES `cf_item` WRITE;
/*!40000 ALTER TABLE `cf_item` DISABLE KEYS */;
INSERT INTO `cf_item` VALUES (1,'Gasolina',1),(2,'Gas',1),(3,'Aceite de motor',2),(4,'Gasoil',1),(5,'Aceite de caja',2);
/*!40000 ALTER TABLE `cf_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_item_grupo`
--

DROP TABLE IF EXISTS `cf_item_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_item_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_item_grupo`
--

LOCK TABLES `cf_item_grupo` WRITE;
/*!40000 ALTER TABLE `cf_item_grupo` DISABLE KEYS */;
INSERT INTO `cf_item_grupo` VALUES (1,'Combustibles'),(2,'Aceites');
/*!40000 ALTER TABLE `cf_item_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_localidad`
--

DROP TABLE IF EXISTS `cf_localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_localidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_localidad`
--

LOCK TABLES `cf_localidad` WRITE;
/*!40000 ALTER TABLE `cf_localidad` DISABLE KEYS */;
INSERT INTO `cf_localidad` VALUES (1,'Oficina Central'),(2,'Ofc. Guatire');
/*!40000 ALTER TABLE `cf_localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_proveedor`
--

DROP TABLE IF EXISTS `cf_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `rif` varchar(15) DEFAULT NULL,
  `nit` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tlf` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `ruta_foto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_proveedor`
--

LOCK TABLES `cf_proveedor` WRITE;
/*!40000 ALTER TABLE `cf_proveedor` DISABLE KEYS */;
INSERT INTO `cf_proveedor` VALUES (1,'Ministerio del Poder Popular para la Educacion Universitaria','Ministerio del Poder Popular para la Educacion Universitaria','Av. universidad, esquina el Chorro, Torre Ministerial, piso 3.','G-200030240','','','','','cf_proveedor.ruta_foto.8dcc7af0ceb3b1d8.7475785f7468655f77617272696f725f312e706e67.png'),(2,'Empresa 01','Empresa 01','su direccione','j-12323-2','ad1212312','','','','');
/*!40000 ALTER TABLE `cf_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_solicitud_tipo`
--

DROP TABLE IF EXISTS `cf_solicitud_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_solicitud_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_solicitud_tipo`
--

LOCK TABLES `cf_solicitud_tipo` WRITE;
/*!40000 ALTER TABLE `cf_solicitud_tipo` DISABLE KEYS */;
INSERT INTO `cf_solicitud_tipo` VALUES (1,'Viajes'),(4,'Tranferenccia a localidad');
/*!40000 ALTER TABLE `cf_solicitud_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_tipo_combustible`
--

DROP TABLE IF EXISTS `cf_tipo_combustible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_tipo_combustible` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_tipo_combustible`
--

LOCK TABLES `cf_tipo_combustible` WRITE;
/*!40000 ALTER TABLE `cf_tipo_combustible` DISABLE KEYS */;
INSERT INTO `cf_tipo_combustible` VALUES (1,'Gas'),(2,'Gasolina'),(3,'Diesel');
/*!40000 ALTER TABLE `cf_tipo_combustible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_tipo_doc`
--

DROP TABLE IF EXISTS `cf_tipo_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_tipo_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_tipo_doc`
--

LOCK TABLES `cf_tipo_doc` WRITE;
/*!40000 ALTER TABLE `cf_tipo_doc` DISABLE KEYS */;
INSERT INTO `cf_tipo_doc` VALUES (1,'Cedula'),(2,'Licencia'),(3,'Seguro R.C.V');
/*!40000 ALTER TABLE `cf_tipo_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_vehiculo_marca`
--

DROP TABLE IF EXISTS `cf_vehiculo_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_vehiculo_marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_vehiculo_marca`
--

LOCK TABLES `cf_vehiculo_marca` WRITE;
/*!40000 ALTER TABLE `cf_vehiculo_marca` DISABLE KEYS */;
INSERT INTO `cf_vehiculo_marca` VALUES (1,'Acura'),(2,'Alfa Romeo'),(3,'AMC'),(4,'Aro'),(5,'Audi'),(6,'Autogago'),(7,'BMW'),(8,'Bobcat'),(9,'Buick'),(10,'Cadillac'),(11,'Caterpillar'),(12,'Chana'),(13,'Changhe'),(14,'Chery'),(16,'Chevrolet'),(17,'Chrysler'),(19,'Citroen'),(20,'Clark'),(21,'Corvette'),(22,'Dacia'),(23,'Daewoo'),(24,'Daihatsu'),(25,'Dodge'),(26,'Eagle'),(27,'Encava'),(28,'Excalibur'),(29,'Fami'),(30,'Ferrari'),(31,'Fiat'),(33,'Ford'),(34,'Freightliner'),(35,'Geely'),(36,'Geo'),(37,'GMC'),(38,'Great Dane'),(39,'Great Wall'),(40,'Guri'),(41,'Hafei'),(42,'Honda'),(43,'Hyundai'),(44,'Infiniti'),(45,'International'),(46,'Isuzu'),(47,'Iveco'),(48,'Jaguar'),(49,'Jeep'),(50,'John Deere'),(51,'Kenworth'),(52,'Kia'),(53,'Lada'),(54,'Lamborghini'),(55,'Land Rover'),(56,'Landwind'),(57,'Lexus'),(58,'Lincoln'),(59,'Lotus'),(60,'Mack'),(61,'Maserati'),(62,'Mazda'),(63,'Mercedes Benz'),(64,'Mercury'),(65,'MG'),(66,'Mini'),(67,'Mitsubishi'),(68,'Muveca'),(69,'Nissan'),(70,'Oldsmobile'),(71,'Opel'),(72,'Otros'),(73,'Packard'),(74,'Pegaso'),(75,'Peugeot'),(76,'Plymouth'),(77,'Pontiac'),(78,'Porsche'),(79,'Renault'),(80,'Rolls Royce'),(81,'Rover'),(82,'Saic Wuling'),(83,'Saturn'),(84,'Scania'),(85,'Scion'),(86,'Seat'),(87,'SG Automotive'),(88,'Skoda'),(89,'Smart'),(90,'Steyr Puch'),(91,'Subaru'),(92,'Suzuki'),(93,'Tata'),(94,'Tatra'),(95,'Titan'),(96,'Toyota'),(97,'Triumph'),(98,'Volkswagen'),(99,'Volvo'),(100,'Zhongxing'),(101,'Zotye'),(102,'Ebro'),(103,'Hummer'),(104,'Studebaker'),(105,'Austin'),(106,'Case'),(107,'Hyster'),(108,'Barber Greene'),(109,'Shuanghuan'),(110,'Tampo'),(115,'Kamaz'),(116,'Haima'),(121,'Jmc'),(122,'Foton'),(124,'Marcopolo'),(127,'Dfm'),(128,'Ssangyong'),(129,'Gonow'),(130,'Golden Dragon'),(131,'Pgo'),(132,'Venirauto'),(133,'Forland'),(134,'Byd'),(135,'Sunbeam'),(138,'Lifan'),(139,'Jac');
/*!40000 ALTER TABLE `cf_vehiculo_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_vehiculo_modelo`
--

DROP TABLE IF EXISTS `cf_vehiculo_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_vehiculo_modelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `cf_vehiculo_marca_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`cf_vehiculo_marca_id`),
  KEY `fk_cf_vehiculo_modelo_cf_vehiculo_marca1` (`cf_vehiculo_marca_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2639 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_vehiculo_modelo`
--

LOCK TABLES `cf_vehiculo_modelo` WRITE;
/*!40000 ALTER TABLE `cf_vehiculo_modelo` DISABLE KEYS */;
INSERT INTO `cf_vehiculo_modelo` VALUES (2574,'Vivio',91),(2573,'Rexton',128),(2572,'Actyon',128),(2571,'Forman',88),(2570,'Felicia',88),(2569,'Alhambra',86),(1744,'342 30',47),(1743,'341 30',47),(1742,'340 30',47),(1741,'339 30',47),(1740,'338 30',47),(1739,'337 30',47),(1738,'336 30',47),(1737,'335 30',47),(1736,'334 30',47),(1735,'333 30',47),(1734,'332 30',47),(1733,'331 30',47),(1732,'150 E',47),(1731,'135.17',47),(1730,'110.17',47),(1729,'4912',47),(1728,'720',47),(1727,'682',47),(1726,'643',47),(1725,'440',47),(1724,'330',47),(1723,'230',47),(1722,'100',47),(1721,'Trooper',46),(1720,'Stylus',46),(1719,'Rodeo',46),(1718,'Impulse',46),(1717,'Caribe',46),(1716,'Amigo',46),(1715,'Scout',45),(1714,'S-1900',45),(1713,'RD-190',45),(1712,'Mototrailla',45),(1711,'F-5070',45),(1710,'F-2674',45),(1709,'F-2574',45),(1708,'F-230D',45),(1707,'F-210D',45),(1706,'F-2050A',45),(1705,'F-2000D',45),(1704,'F1800',45),(1703,'D-604',45),(1702,'Cumms',45),(1701,'CF-600',45),(1700,'C-104',45),(1699,'C-101',45),(1697,'9200',45),(1696,'9000',45),(1695,'7600',45),(1694,'7400',45),(1693,'5070',45),(1692,'4900',45),(1691,'4300',45),(1690,'2554',45),(1689,'2050',45),(1688,'1954',45),(1687,'1854',45),(1686,'1853',45),(1685,'1850',45),(1684,'1803',45),(1683,'1800',45),(1682,'1754',45),(1681,'1750',45),(1680,'1703',45),(1679,'1700',45),(1678,'1603',45),(1677,'1600',45),(1676,'1500',45),(1675,'1310',45),(1674,'1300',45),(1673,'1200',45),(1672,'1010',45),(1671,'J30T',44),(1670,'FX45',44),(1669,'FX35',44),(1668,'Verna',43),(1667,'Veracruz',43),(1666,'Van',43),(1665,'Tucson',43),(1664,'Tiburon',43),(1663,'Sonata',43),(1662,'Scoupe',43),(1661,'Santa Fe',43),(1660,'Pick Up',43),(1659,'Matrix',43),(1658,'H-100',43),(1657,'Grandeur',43),(1656,'Getz',43),(1655,'Galloper',43),(1654,'Excel',43),(1653,'Elantra',43),(1652,'Coupé',43),(1651,'Azera',43),(1650,'Avante',43),(1649,'Atos',43),(1648,'Accent',43),(1647,'Vigor',42),(1646,'Stream',42),(1645,'S 2000',42),(1644,'Prelude',42),(1643,'Pilot',42),(1642,'Passport',42),(1641,'Odyssey',42),(1640,'Legend',42),(1638,'Fit',42),(1637,'CRX',42),(1636,'CRV',42),(1635,'Civic',42),(1634,'Acura',42),(1633,'Accord',42),(1632,'Integra',42),(1631,'Anio',41),(1630,'Minivan',41),(1629,'Xinyi Cargo',41),(1628,'Lobo',41),(1627,'LTS',40),(1626,'LS',40),(1625,'Sailor',39),(1624,'Safe',39),(1623,'Hover',39),(1622,'Deer',39),(1621,'Trailer',38),(1620,'Yukon',37),(1619,'7000',37),(1618,'Tracker',36),(1617,'HA',35),(1616,'MK',35),(1615,'CK',35),(1614,'M2',34),(1613,'FLD',34),(1612,'Columbia',34),(1611,'Zephyr',33),(1610,'Windstar',33),(1609,'Victoria',33),(1608,'Triton',33),(1607,'Tracer',33),(1606,'Town Car',33),(1605,'Thunderbird',33),(1604,'Tempo',33),(1603,'Taurus',33),(1602,'Super Duty',33),(1601,'Sport Wagon',33),(1600,'Sport Track',33),(1599,'Sierra',33),(1598,'Sherrod',33),(1597,'Saphiro',33),(1596,'Ranger',33),(1595,'Probe',33),(1594,'Pilot',33),(1593,'Pick-Up',33),(1592,'Orion',33),(1591,'Mustang',33),(1590,'Mercury',33),(1589,'Maverick',33),(1588,'M151',33),(1587,'LTD',33),(1586,'Laser',33),(1585,'Lariat',33),(1584,'Ka',33),(1583,'K707',33),(1582,'Grand Marquis',33),(1581,'Granada',33),(1580,'Galaxie',33),(1579,'Futura',33),(1578,'Fusion',33),(1577,'Focus',33),(1576,'Fiesta',33),(1575,'Festiva',33),(1574,'Falcon',33),(1573,'Fairmont',33),(1572,'Fairlane',33),(1571,'F-950',33),(1570,'F-750',33),(1569,'F-7000',33),(1568,'F-610',33),(1567,'F-6000',33),(1566,'F-600',33),(1565,'F-500',33),(1564,'F-353',33),(1563,'F-352',33),(1562,'F-351',33),(1561,'F-350',33),(1560,'F-250',33),(1559,'F-160',33),(1557,'F-150',33),(1556,'F-100',33),(1555,'F-8000',33),(1554,'Explorer Sport Trac',33),(1552,'Explorer Eddie Bauer',33),(1551,'Explorer',33),(1550,'Expedition',33),(1549,'Escort',33),(1548,'Escape',33),(1546,'EcoSport',33),(1545,'Econoline',33),(1544,'E-350',33),(1543,'Del Rey',33),(1542,'Crown Victoria',33),(1541,'Country Squire',33),(1540,'Cougar',33),(1539,'Cortina',33),(1538,'Corcel',33),(1537,'Contour',33),(1536,'Continental',33),(1535,'Conquistador',33),(1534,'Club Wagon',33),(1533,'Cava',33),(1532,'Cargo',33),(1531,'Bronco',33),(1530,'Andina',33),(1529,'Aerostar',33),(1528,'10',33),(1527,'Weekend',31),(1526,'Volteo',31),(1525,'Van',31),(1524,'Uno',31),(1523,'Tucán',31),(1522,'Tipo',31),(1521,'Tempra',31),(1520,'Tempo',31),(1519,'Super',31),(1518,'Strada',31),(1517,'Stilo',31),(1516,'Spazio',31),(1515,'Siena',31),(1514,'Selecta',31),(1513,'Ritmo',31),(1512,'Regata',31),(1511,'Punto',31),(1510,'Premio',31),(1509,'Panel',31),(1508,'Palio',31),(1507,'N-3',31),(1506,'Mirafiori',31),(1505,'Marea',31),(1504,'Idea',31),(1503,'Grande Punto',31),(1502,'Fiorino',31),(1501,'F100',31),(1500,'Ducato',31),(1499,'Coupé',31),(1498,'CM 150',31),(1497,'Brava',31),(1496,'Bertone',31),(1495,'Adventure',31),(1494,'2300',31),(1493,'1500',31),(1492,'1100',31),(1491,'600',31),(1490,'238',31),(1489,'147',31),(1488,'132',31),(1487,'131',31),(1486,'130',31),(1485,'128',31),(1484,'125',31),(1483,'124',31),(1482,'Modena',30),(1481,'348',30),(1480,'Maranello',30),(1479,'GT',30),(1478,'F355',30),(1477,'Cobra',29),(1750,'49.10 Daily',47),(1749,'440 E42',47),(1748,'40.12',47),(1747,'40.10',47),(1746,'344 30',47),(1745,'343 30',47),(2566,'Express',79),(2565,'Tornado',131),(2564,'Charge',131),(2563,'Vivacity',75),(2562,'Trekker',75),(2561,'Speedfight',75),(2560,'Elyseo',75),(2559,'Viaggio',124),(2558,'Paradiso',124),(2557,'Andare Class',124),(2556,'Fashion',56),(2555,'X3',56),(2554,'X6',56),(2553,'Glacial',53),(2552,'Aquarius',53),(2551,'Joice',52),(2550,'Enterprise',52),(2549,'Capital',52),(2548,'Besta',52),(2547,'6520',115),(2546,'6460',115),(2545,'Yumba',121),(2544,'Landwind',121),(2543,'JX',121),(2542,'Fashion',121),(2541,'Boomday',121),(2539,'CJ-3',49),(2537,'Grace',43),(2536,'County',43),(2535,'H2',103),(2533,'Elite',42),(2532,'Foresight',42),(2531,'Forza',42),(2530,'Helix',42),(2529,'HX',42),(2528,'Marvel',42),(2527,'Aero',42),(2526,'Freema',116),(2525,'Family',116),(2524,'Zhongyi',41),(2523,'Minyi',41),(2522,'Wingle',39),(2521,'Proteus',39),(2520,'Victor',129),(2519,'Troy',129),(2518,'Jetstar',129),(2517,'Image',129),(2516,'Coxswain',129),(2515,'Safari',130),(2514,'Orinoco',130),(2513,'Neveri',130),(2512,'Caroni',130),(2511,'Amazonas',130),(2510,'PU',35),(2509,'JL',35),(2507,'FC',35),(2506,'View',122),(2505,'Ollin',122),(2504,'Foton',122),(2503,'Guri',33),(2502,'B600',33),(2500,'Doblo',31),(2499,'Croma',31),(2498,'550',30),(2497,'456',30),(2496,'360',30),(2495,'Spider',30),(2494,'D-350',25),(2493,'Coronet',25),(2492,'Star',127),(2491,'Padrote',127),(2490,'Novilla',127),(2489,'Jinga',127),(2488,'Jinba',127),(2487,'Duolika',127),(2486,'Araya',127),(2485,'Delta',24),(2484,'Cuore',24),(2483,'Charade',24),(2482,'524',22),(2481,'1410',22),(2480,'1303',22),(2479,'Break',22),(2478,'Wayne Transette',16),(2477,'NHR',16),(2475,'Alto',16),(2474,'Flagcloud',14),(2473,'Windcloud',14),(2472,'760',7),(2471,'650',7),(2470,'545',7),(2469,'523',7),(2464,'Gaviota',6),(2463,'100',5),(2462,'Yuko',4),(2461,'Rhino',4),(2460,'Maxi',4),(2459,'Anaconda',4),(2468,'M6',7),(2467,'Orinoco',6),(2466,'Metrobus',6),(2465,'Leyland',6),(2454,'147',2),(2452,'T-32',95),(2451,'T-15',95),(2450,'Journey',25),(2449,'MR113',27),(2448,'7FCU35',96),(2447,'Retro Excavadora',11),(2446,'OM-150',95),(2445,'410B',50),(2444,'966',11),(2443,'CB 224C',11),(2442,'54',27),(2441,'Tractor de Oruga',11),(2440,'120G',11),(2439,'950',11),(2438,'Clásico',77),(2437,'112',53),(2436,'Geo Storm',16),(2435,'NT 900',27),(2434,'140G',11),(2433,'A 170',63),(2432,'FM658',67),(2431,'8FGCU30',96),(2430,'FM657',67),(2429,'F9000',33),(2427,'Geo Tracker',16),(2426,'RP16D',110),(2425,'CEO',109),(2424,'RX-75',108),(2423,'C615',107),(2422,'Retro Excavadora',106),(1470,'Stealth',25),(1469,'Spirit',25),(1468,'Ramcharger',25),(1467,'Ram',25),(1466,'Neon',25),(1465,'Intrepid',25),(1463,'Durango',25),(1462,'Desoto',25),(1461,'Dart',25),(1460,'Dakota',25),(1459,'D-600',25),(1458,'D-500',25),(1457,'D-300',25),(1456,'D-2500',25),(1455,'D-150',25),(1454,'D-100',25),(1453,'Charger',25),(1452,'Grand Caravan',25),(1451,'Caravan',25),(1450,'Caliber',25),(1449,'Brisa',25),(1448,'Aspen',25),(1447,'Hijet',24),(1446,'Ferosa',24),(1445,'Aplause',24),(1444,'Tico',23),(1443,'Tacuma',23),(1442,'Super Salon',23),(1441,'Racer',23),(1440,'Prince',23),(1439,'Nubira',23),(1438,'Musso',23),(1437,'Matiz',23),(1436,'Lublin',23),(1435,'Leganza',23),(1434,'Lanos',23),(1433,'Labo',23),(1432,'Espero',23),(1431,'Damas',23),(1430,'Cielo',23),(1429,'Chairman',23),(1428,'Super Nova',22),(1427,'Nova',22),(1426,'Z06',21),(1425,'C05',21),(1424,'LT1',21),(1423,'Lingenfelter',21),(1422,'Dps 30-1',20),(1421,'Xsara Picasso',19),(1420,'Xsara',19),(1419,'Pluriel',19),(1418,'Picasso',19),(1417,'C5',19),(1416,'C4',19),(1415,'C3',19),(1414,'C2',19),(1413,'Berlingo',19),(1411,'Voyager',17),(1410,'Visión',17),(1409,'Valiant',17),(1408,'Town Country',17),(1407,'Simca',17),(1406,'Sebring',17),(1405,'PT Cruiser',17),(1404,'Plymouth',17),(1403,'Newport',17),(1402,'New Yorker',17),(1401,'Neon',17),(1400,'Monaco',17),(1399,'Le Baron',17),(1398,'Fury',17),(1397,'Lemon',17),(1396,'Eagle Talon',17),(1395,'Coronet',17),(1394,'Belvedere',17),(1393,'Aspen',17),(1392,'300',17),(1391,'Z-24',16),(1390,'Wagon R',16),(1389,'Vitara',16),(1388,'Venture',16),(1387,'Trooper',16),(1386,'Trans Sport',16),(1385,'Trailblazer',16),(1384,'Tempest',16),(1383,'Tahoe',16),(1382,'Swift',16),(1381,'Super Carry',16),(1380,'Super Brigadier',16),(1379,'Sunfire',16),(1378,'Suburban',16),(1377,'Step',16),(1376,'SportVan',16),(1375,'Special',16),(1374,'Spark',16),(1373,'Skylark',16),(1372,'Silverado',16),(1371,'Samurai',16),(1370,'S-10',16),(1369,'Park Avenue',16),(1368,'Parisienne',16),(1367,'Optra',16),(1366,'NPR',16),(1365,'Nova',16),(1364,'NKR',16),(1363,'Monza',16),(1362,'Monte Carlo',16),(1361,'Montana',16),(1360,'Meriva',16),(1359,'Mark iii',16),(1358,'Malibú',16),(1357,'Luv',16),(1356,'Lumina',16),(1355,'Le Sabre',16),(1354,'Kodiak',16),(1353,'Jimny',16),(1352,'Intercar',16),(1351,'Impala',16),(1350,'HHR',16),(2476,'Condor',16),(1348,'Grand Vitara',16),(1347,'Grand Prix',16),(1346,'Grand Blazer',16),(1345,'GMC',16),(1344,'FVR',16),(1343,'Furgon',16),(1342,'F-B5',16),(1341,'Express',16),(1340,'Esteem',16),(1339,'Equinox',16),(1338,'Epica',16),(1337,'Durango',16),(1336,'Corvette',16),(1335,'Corsica',16),(1334,'Corsa',16),(1333,'Colorado',16),(1332,'Cheyenne',16),(1331,'Chevy',16),(1330,'Chevette',16),(1329,'Century',16),(1328,'Celebrity',16),(1326,'Cavalier',16),(1325,'Captiva',16),(1324,'Caprice',16),(1323,'Camaro',16),(1322,'C-750',16),(1321,'C-70',16),(1320,'C-60',16),(1319,'C-40',16),(1318,'C-3500',16),(1317,'C-350',16),(1316,'C-30',16),(1315,'C-250',16),(1314,'C-1500',16),(1313,'C-10803',16),(1312,'C-100',16),(1311,'C-10',16),(1310,'Blazer',16),(1309,'Biscayne',16),(1308,'Beumont',16),(1307,'Bel-Air',16),(1306,'Aveo',16),(1305,'Avalanche',16),(1304,'Astro',16),(1303,'Astra',16),(1302,'Apache',16),(1301,'Tiggo',14),(1300,'A520',14),(1299,'Cowin',14),(1298,'QQ',14),(1297,'Pick up',13),(1296,'Super Van',13),(1295,'Ideal',13),(1293,'Benny',12),(1292,'Super Van',12),(1291,'Pick up',12),(1290,'Showel',11),(1289,'Rokero',11),(1288,'Ballena',11),(1287,'Sts',10),(1286,'Seville',10),(1285,'Fleetwood',10),(1284,'Escalade',10),(1283,'El Dorado',10),(1282,'De Ville',10),(1281,'Carter',10),(1280,'Riviera',9),(1279,'Regal',9),(1278,'Park Avenue',9),(1277,'Le Sabre',9),(1276,'Century',9),(1275,'721',8),(1274,'Perkins',8),(1273,'D100',8),(1272,'Z4',7),(1271,'Z3',7),(1270,'X5',7),(1269,'X3',7),(1268,'M5',7),(1267,'M3',7),(1266,'850',7),(1265,'750',7),(1264,'745',7),(1263,'740',7),(1262,'735',7),(1261,'730',7),(1260,'728',7),(1259,'645',7),(1258,'635',7),(1257,'550',7),(1256,'540',7),(1255,'535',7),(1254,'530',7),(1253,'528',7),(1252,'525',7),(1251,'520',7),(1250,'335',7),(1249,'330',7),(1248,'328',7),(1247,'325',7),(1246,'323',7),(1245,'320',7),(1244,'318',7),(1243,'190',7),(1242,'130',7),(1241,'120',7),(1240,'116',7),(1239,'A475',6),(1238,'80',5),(1237,'TT',5),(1236,'S6',5),(1235,'S4',5),(1234,'S3',5),(1233,'S2',5),(1232,'Q7',5),(1231,'A90',5),(1230,'A32',5),(1229,'A8',5),(1228,'A6',5),(1227,'A5',5),(1226,'A4',5),(1225,'A3',5),(1224,'Allroad',5),(1223,'10.4',4),(1222,'10.1',4),(1221,'Sport Wagon',4),(1220,'Ranger',4),(1219,'Pick Up',4),(1218,'Daktari',4),(1217,'Bufalo',4),(1216,'Sup.-Minx',3),(1215,'Javelin',3),(1214,'Hunter',3),(1213,'Hornet',3),(1212,'Estate',3),(1211,'Commer',3),(1210,'Classic 660',3),(1209,'Arrow',3),(1208,'American 330',3),(1207,'Ambassador',3),(1206,'Alfetta',2),(1205,'166',2),(1204,'164',2),(1203,'156',2),(1202,'155',2),(1201,'146',2),(1200,'Spider',2),(1199,'GT',2),(1198,'NSX',1),(1197,'Legend',1),(1196,'Integra',1),(2280,'Indica',93),(2279,'Indigo',93),(2278,'Panel',92),(2277,'Super Carry',92),(2276,'Sidekick',92),(2275,'Grand Vitara',92),(2274,'Aerio',92),(2273,'WRX',91),(2272,'Turbo',91),(2271,'Outback',91),(2270,'Legacy',91),(2269,'Impreza',91),(2268,'Forester',91),(2266,'Steyer Puch',90),(2265,'Pinzgauer',90),(2264,'Fortwo Pulse',89),(2263,'Scout',88),(2262,'Roomster',88),(2261,'Superb',88),(2260,'Octavia',88),(2259,'Favorit',88),(2258,'Fabia',88),(2257,'Aurora',87),(2256,'Avila',87),(2255,'Kata',87),(2254,'Toledo',86),(2253,'Leon',86),(2252,'Ibiza',86),(2251,'Cordoba',86),(2250,'Altea',86),(2249,'TC',85),(2248,'D',84),(2247,'C',84),(2246,'Bus Chassis',84),(2245,'SL2',83),(2244,'Mini Van',82),(2243,'Panel Van',82),(2242,'6376 C',82),(2241,'Van',82),(2240,'Super Van',82),(2239,'Land Rover',81),(2238,'Super',81),(2237,'R-100',81),(2236,'Ranger Rover',81),(2235,'Range Sport Wagon',81),(2234,'Range Rover',81),(2233,'Silver Shadow',80),(2232,'Corniche',80),(2231,'Twingo',79),(2230,'Traffic',79),(2229,'Symbol',79),(2228,'Senna',79),(2227,'Scenic',79),(2226,'Rebel',79),(2225,'R-8',79),(2224,'R-5',79),(2222,'R-4',79),(2221,'R-30',79),(2220,'R-21',79),(2219,'R-19',79),(2218,'R-18',79),(2217,'R-16',79),(2216,'R-12',79),(2215,'R-11',79),(2214,'R-10',79),(2213,'Minimetro',79),(2211,'Megane',79),(2210,'Logan',79),(2209,'Laguna',79),(2208,'Kerax',79),(2207,'Kangoo',79),(2206,'Gala',79),(2205,'Fuego',79),(2204,'Ex Press',79),(2203,'Euro',79),(2202,'Energy',79),(2201,'Clio',79),(2200,'Targa',78),(2199,'Super 90',78),(2198,'Cayman',78),(2197,'Cayenne',78),(2196,'Carrera',78),(2195,'Boxster',78),(2194,'996',78),(2193,'993',78),(2192,'986',78),(2191,'968',78),(2190,'944',78),(2189,'930',78),(2188,'928',78),(2187,'924',78),(2186,'911',78),(2185,'Trans Sport',77),(2184,'Trans AM',77),(2183,'Sunfire',77),(2182,'Lumina',77),(2181,'Grand Prix',77),(2180,'Grand AM',77),(2179,'Firebird',77),(2178,'Bonneville',77),(2177,'Voyager',76),(2176,'Valiant',76),(2175,'Sueurean',76),(2174,'Grand Voyager',76),(2173,'Partner',75),(2172,'Expert',75),(2171,'607',75),(2170,'605',75),(2169,'504',75),(2168,'407',75),(2167,'406',75),(2166,'405',75),(2165,'360',75),(2164,'309',75),(2163,'307',75),(2162,'306',75),(2161,'300',75),(2160,'207',75),(2159,'206',75),(2158,'205',75),(2157,'5231',74),(2156,'5036',74),(2155,'3089',74),(2154,'2081',74),(2153,'1223',74),(2152,'1217',74),(2151,'1089',74),(1476,'Excalibur',28),(1475,'Mbird',27),(1474,'Bus',27),(1473,'Talon',26),(1472,'Viper',25),(1471,'Stratus',25),(2287,'Avensis',96),(2286,'Avalon',96),(2285,'Autana',96),(2284,'4Runner',96),(2283,'4500',96),(2282,'150',95),(2281,'815',94),(2011,'S 200',63),(2010,'Panel',63),(2009,'O 317',63),(2008,'O 309',63),(2007,'O 302',63),(2006,'ML 550',63),(2005,'ML 55',63),(2004,'ML 500',63),(2003,'ML 430',63),(2002,'ML 350',63),(2001,'ML 320',63),(2000,'ML 230',63),(1999,'ML 63',63),(1998,'MB 350',63),(1997,'MB 313',63),(1996,'MB 280',63),(1995,'MB 260',63),(1994,'MB 250',63),(1993,'MB 230',63),(1992,'MB 220',63),(1991,'MB 200',63),(1990,'MB 140',63),(1989,'MB 120',63),(1988,'MB 100',63),(1987,'Marcopolo',63),(1986,'LS 2624',63),(1985,'LS 1924',63),(1984,'LN',63),(1983,'LK1924',63),(1982,'L19245',63),(1981,'L1620',63),(1980,'L11135',63),(1979,'L11134',63),(1978,'GL 450',63),(1977,'G 300',63),(1976,'E 55 AMG',63),(1975,'E 500',63),(1974,'E 430',63),(1973,'E 420',63),(1972,'E 400',63),(1971,'E 350',63),(1970,'E 320',63),(1969,'E 300',63),(1968,'E 280',63),(1967,'E 240',63),(1966,'E 220',63),(1965,'E 200',63),(1964,'E 190',63),(1963,'CLS 350',63),(1962,'CLK 500',63),(1961,'CLK 430',63),(1960,'CLK 320',63),(1959,'CLK 300',63),(1958,'CE 320',63),(1957,'CE 300',63),(1956,'CE 280',63),(1955,'CE 250',63),(1954,'CE 230',63),(1953,'C 320',63),(1952,'C 300',63),(1951,'C 280',63),(1950,'C 240',63),(1949,'C 230',63),(1948,'C 220',63),(1947,'C 200',63),(1946,'C 180',63),(1945,'B 200',63),(1944,'Axor',63),(1943,'Atego',63),(1942,'A 200',63),(1941,'A 190',63),(1940,'A 160',63),(1939,'1720',63),(1938,'711',63),(1937,'560',63),(1936,'500',63),(1935,'450',63),(1934,'420',63),(1933,'400',63),(1932,'380',63),(1931,'350',63),(1930,'320',63),(1929,'317',63),(1928,'300',63),(1927,'280',63),(1926,'260',63),(1925,'250',63),(1924,'240',63),(1923,'230',63),(1922,'220',63),(1921,'200',63),(1920,'190',63),(1919,'180',63),(1918,'Protege',62),(1917,'Millenia',62),(1916,'T-45',62),(1915,'RX-8',62),(1914,'RX-7',62),(1913,'Pick-Up',62),(1912,'Navajo',62),(1911,'MX-6',62),(1910,'MX-3',62),(1909,'MPV',62),(1908,'MX-5',62),(1907,'Miata',62),(1906,'Demio',62),(1905,'CX-9',62),(1904,'CX-7',62),(1903,'BT-50',62),(1902,'B-4000',62),(1901,'B-2600',62),(1900,'B-2500',62),(1899,'B-2300',62),(1898,'B-2200',62),(1897,'Allegro',62),(1896,'929',62),(1895,'626',62),(1894,'323',62),(1893,'6',62),(1892,'5',62),(1891,'3',62),(1890,'228i',61),(1889,'Cambiocorsa',61),(1888,'MI 38',61),(1887,'3200',61),(1886,'Merak',61),(1885,'VM',60),(1884,'Vision',60),(1883,'Granite',60),(1882,'686',60),(1881,'685',60),(1880,'607',60),(1879,'315',60),(1878,'R 688',60),(1877,'R 686',60),(1876,'R 612',60),(1875,'R 611',60),(1874,'R 609',60),(1873,'R 607',60),(1871,'R 489',60),(1870,'R 400',60),(1869,'RD 688',60),(1868,'R 600',60),(1867,'MS 300',60),(1866,'MH 608',60),(1865,'DM 815',60),(1864,'DM 811',60),(1863,'DM 600',60),(1862,'Cl 400',60),(1861,'CH 613',60),(1860,'Espirit',59),(1859,'Town Car',58),(1858,'Signature',58),(1857,'Continental',58),(1856,'Capry',58),(1855,'SC 400',57),(1854,'SC 300',57),(1853,'SC',57),(1852,'RX 350',57),(1851,'RX 300',57),(1850,'RX',57),(1849,'LX 470',57),(1848,'LS 430',57),(1847,'LS 400',57),(1846,'LS 330',57),(1845,'LS 300',57),(1844,'IS 350',57),(1843,'IS 300',57),(1842,'GXL 470',57),(1841,'GS 400',57),(1840,'GS 300',57),(1839,'ES 350',57),(1838,'ES 300',57),(1837,'ES 250',57),(1836,'ES',57),(1835,'400',57),(1834,'300',57),(1833,'X9',56),(1832,'HSE',55),(1831,'Land Rover',55),(1830,'Range Rover',55),(1829,'Freelander',55),(1828,'Discovery',55),(1827,'Defender',55),(1826,'Countach',54),(1825,'Stawra',53),(1824,'Samara',53),(1823,'Ranchera',53),(1822,'Niva',53),(1821,'Matriuska',53),(1820,'21060',53),(1819,'21051',53),(1818,'2110',53),(1817,'2107',53),(1816,'2105',53),(1815,'1600',53),(1814,'1500',53),(1813,'1200',53),(1812,'Towner',52),(1811,'Sportage',52),(1810,'Spectra',52),(1809,'Sorento',52),(1808,'Shuma',52),(1807,'Sephia',52),(1806,'Sedona',52),(1805,'Río',52),(1804,'Pregio',52),(1803,'Picanto',52),(1802,'Optima',52),(1801,'Opirus',52),(1800,'Fedona',52),(1799,'Cerato',52),(1798,'Carnival',52),(1797,'Carens',52),(1796,'Kenworth',51),(1795,'310E',50),(1794,'Wrangler',49),(1793,'Willys',49),(1792,'WG-J100',49),(1791,'Wagoneer',49),(1789,'Pick Up',49),(1787,'J-4800',49),(1786,'J-4600',49),(1785,'J-3800',49),(1784,'J-3700',49),(1783,'J-3600',49),(1782,'J-2800',49),(1781,'Grand Wagoneer',49),(1780,'Grand Cherokee',49),(1779,'Compass',49),(1778,'Commander',49),(1777,'Comanche',49),(1776,'CJ-8',49),(1775,'CJ-7',49),(1774,'CJ-6',49),(1773,'CJ-5',49),(1772,'CJ-10',49),(1769,'Cherokee',49),(1768,'C104cd',49),(1767,'C101cd',49),(1766,'XJ6',48),(1765,'XJS',48),(1764,'Jander Plas',48),(1763,'S Type',48),(1762,'Mk',48),(1761,'Viking',47),(1760,'Turbo Daily',47),(1759,'Stralis',47),(1758,'Eurotrakker',47),(1757,'Eurotech',47),(1756,'Eurocargo',47),(1755,'E-135',47),(1754,'619',47),(1753,'60.12',47),(1752,'59.12',47),(1751,'49.12',47),(2636,'335 CI',7),(2288,'Burbuja',96),(2289,'Camry',96),(2290,'Celica',96),(2291,'Coaster',96),(2292,'Corolla',96),(2293,'Corona',96),(2294,'Cressida',96),(2295,'Crown',96),(2296,'Dyna',96),(2297,'FJ Cruiser',96),(2298,'FJ-40',96),(2299,'FJ-45',96),(2300,'FJ-55',96),(2301,'FJ-60',96),(2303,'Fortuner',96),(2304,'Hiace',96),(2305,'Highlander',96),(2306,'Hilux',96),(2307,'Land Cruiser',96),(2308,'Lexus',96),(2309,'Macho',96),(2310,'Merú',96),(2311,'MR 2',96),(2312,'Paseo',96),(2313,'Pick up',96),(2314,'Prado',96),(2315,'Previa',96),(2316,'R-19',96),(2317,'RAV4',96),(2318,'Samurai',96),(2319,'Scion',96),(2320,'Sequoia',96),(2321,'Sienna',96),(2322,'Sky',96),(2323,'Starlet',96),(2324,'Supra',96),(2325,'Tacoma',96),(2326,'Techo Duro',96),(2327,'Tercel',96),(2328,'Terios',96),(2329,'Tundra',96),(2330,'Van',96),(2331,'VX',96),(2332,'Yaris',96),(2333,'Tr4 A Irs',97),(2334,'1200',98),(2335,'1300',98),(2336,'1500',98),(2337,'1600',98),(2338,'1720',98),(2339,'9150',98),(2340,'17220',98),(2341,'18310',98),(2342,'31310',98),(2343,'Beetle',98),(2344,'Bora',98),(2345,'Brasilia',98),(2346,'Buggy',98),(2347,'Caddy',98),(2348,'kombi',98),(2349,'Crafter',98),(2350,'Crossfox',98),(2351,'Derby',98),(2352,'Escarabajo',98),(2353,'Fast Back',98),(2354,'Fox',98),(2355,'Gazelle',98),(2356,'Gol',98),(2357,'Golf',98),(2358,'Jetta',98),(2359,'Karmann',98),(2360,'Maxi-Taxi',98),(2361,'Multivan',98),(2362,'New Beetle',98),(2363,'Panel',98),(2364,'Parati',98),(2365,'Passat',98),(2366,'Polo',98),(2367,'Santana',98),(2368,'Saveiro',98),(2369,'SpaceFox',98),(2370,'Touareg',98),(2371,'Venezuela-Primero',98),(2372,'Vento',98),(2373,'Volvo',98),(2374,'Wetfalia',98),(2375,'460',99),(2376,'850',99),(2377,'940',99),(2378,'B12R',99),(2379,'FH12',99),(2380,'FM12',99),(2381,'Admiral',100),(2382,'Grand Tiger',100),(2383,'Nomad',101),(2384,'A35',105),(2385,'Beluga',55),(2386,'B350',33),(2387,'B750',33),(2388,'C200K',63),(2389,'C-50',16),(2392,'Custom',25),(2393,'Daily',47),(2394,'ENT',27),(2396,'FV-517',67),(2397,'F-151',33),(2398,'GK',35),(2399,'H-1',43),(2400,'H3',103),(2401,'Lt',21),(2402,'Motorhome',25),(2403,'M-2106',34),(2404,'Pick Up',16),(2405,'President',104),(2406,'Puma',78),(2407,'145',2),(2408,'190E',63),(2409,'300M',17),(2410,'350 SLC',63),(2411,'412D',63),(2412,'60/6D',102),(2413,'Pick Up',25),(2414,'350',16),(2415,'Durango',17),(2416,'Grand Caravan',17),(2417,'Ranchera',23),(2418,'Stratus',17),(2419,'Tempest',77),(2420,'Terios',24),(2421,'Van',25),(2012,'S 220',63),(2013,'S 230',63),(2014,'S 250',63),(2015,'S 280',63),(2016,'S 320',63),(2017,'S 350',63),(2018,'S 380',63),(2019,'S 420',63),(2020,'S 500',63),(2021,'S 55',63),(2022,'S 300',63),(2023,'S 400',63),(2024,'SE 220',63),(2025,'SE 280',63),(2026,'SE 300',63),(2027,'SE 350',63),(2028,'SE 500',63),(2029,'SEL 280',63),(2030,'SEL 450',63),(2031,'SEL 500',63),(2032,'SEL 560',63),(2033,'SL 230',63),(2034,'SL 300',63),(2035,'SL 320',63),(2036,'SL 350',63),(2037,'SL 500',63),(2038,'SL 600',63),(2040,'SLC 450',63),(2041,'SLK 200',63),(2042,'SLK 230',63),(2043,'SLK 320',63),(2044,'SLK 350',63),(2045,'Smart',63),(2046,'Sprinter',63),(2047,'Tiburon',63),(2048,'Toronto',63),(2049,'V 280',63),(2050,'Vaneo',63),(2051,'Villager',64),(2052,'Grand Marquis',64),(2053,'Cougar',64),(2054,'Tracer',64),(2055,'B',65),(2056,'MG 1600',65),(2057,'MGA',65),(2058,'Mini Cord',66),(2059,'Cooper',66),(2060,'V-Tec',66),(2061,'Jhon Cooper',66),(2062,'JC',66),(2063,'3000',67),(2064,'Altima',67),(2065,'Canter',67),(2066,'Colt',67),(2067,'Diamante',67),(2068,'Eclipse',67),(2069,'Endeavor',67),(2070,'Evolution',67),(2071,'Expo',67),(2072,'FH 217',67),(2073,'FH 215',67),(2074,'FK',67),(2075,'FM',67),(2076,'FV',67),(2077,'Galant',67),(2078,'Grandis',67),(2079,'L-3000',67),(2080,'L-200',67),(2081,'L-300',67),(2082,'Lancer',67),(2083,'MF',67),(2084,'Mirage',67),(2085,'Montero',67),(2087,'MS',67),(2088,'MX',67),(2089,'Outlander',67),(2090,'Panel',67),(2091,'Pick Up',67),(2092,'Sigma',67),(2093,'Signo',67),(2094,'Space Wagon',67),(2095,'Sport Wagon',67),(2096,'Star Wagon',67),(2097,'Van Exeed',67),(2098,'Wagon Van',67),(2099,'ZX',67),(2100,'JMC',68),(2101,'200',69),(2102,'240',69),(2103,'350',69),(2104,'300',69),(2105,'350Z',69),(2106,'AD Wagon',69),(2107,'AKL-60',69),(2108,'Almera',69),(2109,'Altima',69),(2110,'Armada',69),(2111,'Bluebird',69),(2112,'Frontier',69),(2113,'Infiniti',69),(2114,'J30',69),(2115,'Lucino',69),(2116,'Maxima',69),(2117,'Murano',69),(2118,'New Sentra',69),(2119,'Pathfinder',69),(2120,'Patrol',69),(2121,'Pick Up',69),(2123,'Primera',69),(2124,'Quest',69),(2125,'Sentra',69),(2126,'Tatsun',69),(2127,'Terrano',69),(2128,'Tiida',69),(2129,'V15',69),(2130,'X-Trail',69),(2131,'XCL',69),(2132,'Cutlas',70),(2133,'Ninety-Eight',70),(2134,'Tornado',70),(2135,'Oldsmobile',70),(2136,'Ascona',71),(2137,'Delivery',71),(2138,'Ascunol',71),(2139,'Kadett',71),(2140,'Manta',71),(2141,'Rekord',71),(2142,'Vectra',71),(2143,'Victor',71),(2144,'Viva',71),(2145,'1900',71),(2146,'Fabricante Nacional',72),(2147,'Caribbean',73),(2148,'Eurobus',74),(2149,'Superbus',74),(2150,'1080',74),(2603,'Kavak',96),(2604,'352c',7),(2605,'525i',7),(2606,'Sandero',79),(2612,'Pick Up',31),(2613,'Van',16),(2631,'Navigator',58),(2575,'Safari',93),(2576,'Landmark',100),(2577,'110',53),(2592,'Custom Deluxe',16),(2621,'620',138),(2622,'Super salon',69),(2582,'Forland',133),(2583,'MiniTruck',13),(2584,'Mini Van',13),(2585,'Flyer',134),(2586,'MiniTruck',82),(2589,'CC118',47),(2599,'Cinquecento',31),(2600,'Rural',33),(2597,'Alpine',135),(2598,'CLK 230 E',63),(2626,'M35',44),(2638,'SLK 55',63),(2587,'Roadster',78),(2590,'Bentley',80),(2593,'C63 Amg',63),(2607,'Van',33),(2608,'Panel',43),(2609,'2',62),(2620,'Valiant',25),(2630,'Perí',39),(2591,'Emotion',42),(2616,'520',138),(2619,'Intrepid',17),(2624,'Allegro',99),(2625,'Torino',99),(2627,'Hfc',139),(2634,'S5',5),(2594,'Centauro',132),(2595,'Turpial',132),(2602,'Fortaleza',33),(2611,'Giulietta',2),(2623,'Nitro',25),(2628,'Spyder',61),(2629,'LS5',21),(2635,'C500',63),(2637,'Cruze',16),(2588,'Brigadier',37),(2614,'Kata ',109),(2615,'Buick',16),(2617,'Ceo',100),(2618,'316 i ',7);
/*!40000 ALTER TABLE `cf_vehiculo_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_vehiculo_tipo`
--

DROP TABLE IF EXISTS `cf_vehiculo_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_vehiculo_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_vehiculo_tipo`
--

LOCK TABLES `cf_vehiculo_tipo` WRITE;
/*!40000 ALTER TABLE `cf_vehiculo_tipo` DISABLE KEYS */;
INSERT INTO `cf_vehiculo_tipo` VALUES (1,'Sedan'),(2,'Coupe'),(3,'Pick-up'),(4,'Camion 350');
/*!40000 ALTER TABLE `cf_vehiculo_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_viaje_tipo`
--

DROP TABLE IF EXISTS `cf_viaje_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_viaje_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `solo_ida` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_viaje_tipo`
--

LOCK TABLES `cf_viaje_tipo` WRITE;
/*!40000 ALTER TABLE `cf_viaje_tipo` DISABLE KEYS */;
INSERT INTO `cf_viaje_tipo` VALUES (30,'Ida y Vuelta',0),(29,'Solo Ida',1);
/*!40000 ALTER TABLE `cf_viaje_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_banco`
--

DROP TABLE IF EXISTS `fc_banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_banco`
--

LOCK TABLES `fc_banco` WRITE;
/*!40000 ALTER TABLE `fc_banco` DISABLE KEYS */;
INSERT INTO `fc_banco` VALUES (1,'100% BANCO, BANCO COMERCIAL, C.A'),(2,'BANCO ACTIVO, C.A. BANCO UNIVERSAL'),(3,'BANCO AGRICOLA DE VENEZUELA, C.A. BANCO UNIVE'),(4,'BANCO CARONI, C.A., BANCO UNIVERSAL'),(5,'BANCO DE LA GENTE EMPRENDEDORA,C.A.'),(6,'BANCO DE VENEZUELA, S.A.C.A., BANCO UNIVERSAL'),(7,'BANCO DEL CARIBE, C.A. BANCO UNIVERSAL'),(8,'BANCO DEL TESORO, C.A. BANCO UNIVERSAL'),(9,'BANCO EXTERIOR, C.A., BANCO UNIVERSAL'),(10,'BANCO GUAYANA, C.A.'),(11,'BANCO MERCANTIL, C.A.,BANCO UNIVERSAL'),(12,'BANCO NACIONAL DE CREDITO, C.A. BANCO UNIVERS'),(13,'BANCO OCCIDENTAL DE DESCUENTO, C.A'),(14,'BANCO PLAZA, C.A.'),(15,'BANCO PROVINCIAL, S.A.C.A., BANCO UNIVERSAL'),(16,'BANCRECER, S.A. BANCO DESARROLLO'),(17,'BANESCO, BANCO UNIVERSAL, S.A.C.A.'),(18,'BANPLUS BANCO COMERCIAL, C.A.'),(19,'BFC BANCO FONDO COMUN, C.A BANCO UNIVERSAL'),(20,'CITIBANK, N.A., BANCO UNIVERSAL'),(21,'COMERCIO EXTERIOR, C.A.'),(22,'CORP BANCA, C.A.'),(23,'DEL SUR BANCA UNIVERSAL'),(24,'INSTITUTO MUNICIPAL DE CREDITO POPULAR(I.M.C.'),(25,'MI BANCO, BANCO DE DESARROLLO'),(26,'SOFITASA BANCA UNIVERSAL'),(27,'VENEZOLANO CREDITO S.A., BANCO UNIVERSAL'),(28,'BANCAMIGA, BANCO DE DESARROLLO,C.A.'),(29,'BANCO BICENTENARIO BANCO UNIVERSAL, C.A.'),(30,'BANCO INDUSTRIAL DE VENEZUELA, C.A.  '),(31,'BANCO INTERNACIONAL DE DESARROLLO, C.A. BANCO'),(33,'Efectivo');
/*!40000 ALTER TABLE `fc_banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_cobro`
--

DROP TABLE IF EXISTS `fc_cobro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_cobro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `cf_proveedor_id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fc_cobro_cf_proveedor1` (`cf_proveedor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_cobro`
--

LOCK TABLES `fc_cobro` WRITE;
/*!40000 ALTER TABLE `fc_cobro` DISABLE KEYS */;
INSERT INTO `fc_cobro` VALUES (3,'2012-02-29',682.5,1,'factura 859');
/*!40000 ALTER TABLE `fc_cobro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_cobro_det`
--

DROP TABLE IF EXISTS `fc_cobro_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_cobro_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fc_cobro_id` int(11) NOT NULL,
  `fc_forma_pago_id` int(11) NOT NULL,
  `fc_banco_id` int(11) DEFAULT NULL,
  `fc_documento_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fc_cobro_det_fc_cobro1` (`fc_cobro_id`),
  KEY `fk_fc_cobro_det_fc_forma_pago1` (`fc_forma_pago_id`),
  KEY `fk_fc_cobro_det_fc_banco1` (`fc_banco_id`),
  KEY `fk_fc_cobro_det_fc_documento1` (`fc_documento_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_cobro_det`
--

LOCK TABLES `fc_cobro_det` WRITE;
/*!40000 ALTER TABLE `fc_cobro_det` DISABLE KEYS */;
INSERT INTO `fc_cobro_det` VALUES (8,'2012-02-29','123123213',682.5,'',3,2,4,85,NULL),(9,'2012-02-28','456548',720.25,'',3,1,4,85,NULL);
/*!40000 ALTER TABLE `fc_cobro_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_documento`
--

DROP TABLE IF EXISTS `fc_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correlativo` int(11) DEFAULT NULL,
  `fecha` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `contacto` varchar(45) DEFAULT NULL,
  `nota_superior` varchar(500) DEFAULT NULL,
  `nota_detalle` varchar(500) DEFAULT NULL,
  `fc_tipo_doc_id` int(11) NOT NULL,
  `referencia` int(11) DEFAULT NULL,
  `cf_proveedor_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fc_documento_fc_tipo_doc1` (`fc_tipo_doc_id`),
  KEY `fk_fc_documento_cf_proveedor1` (`cf_proveedor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_documento`
--

LOCK TABLES `fc_documento` WRITE;
/*!40000 ALTER TABLE `fc_documento` DISABLE KEYS */;
INSERT INTO `fc_documento` VALUES (84,1268,'2012-02-29','2012-02-29','Lic. HEredia','','',1,NULL,1,0),(85,859,'2012-02-29','2012-02-29','Lic. Heredia','','',2,NULL,1,NULL),(86,1269,'2012-04-10','2012-04-25','Juan P.e','','',1,NULL,1,0),(87,1270,'2012-05-21','2012-05-23','341','1424','s124',1,NULL,1,0),(90,862,'2012-05-21','2012-05-23','341','1424','s124',2,NULL,1,NULL),(89,861,'2012-04-10','2012-04-25','Juan P.e','','',2,NULL,1,NULL),(91,1271,'2012-05-29','2012-05-30','','','',1,NULL,1,0),(92,863,'2012-05-29','2012-05-30','','','',2,NULL,1,NULL);
/*!40000 ALTER TABLE `fc_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_documento_det`
--

DROP TABLE IF EXISTS `fc_documento_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_documento_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `cantidad` tinyint(4) DEFAULT NULL,
  `importe` float DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `recargo` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `nota` varchar(45) DEFAULT NULL,
  `fc_documento_id` int(11) NOT NULL,
  `fc_servicio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fc_documento_det_fc_documento1` (`fc_documento_id`),
  KEY `fk_fc_documento_det_fc_servicio1` (`fc_servicio_id`)
) ENGINE=MyISAM AUTO_INCREMENT=359 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_documento_det`
--

LOCK TABLES `fc_documento_det` WRITE;
/*!40000 ALTER TABLE `fc_documento_det` DISABLE KEYS */;
INSERT INTO `fc_documento_det` VALUES (351,'Horas de espera y/o Disposiciona razon de 90.0 Bsf c/u',1,90,0,0,90,'',85,2),(338,'One Way',1,50,NULL,NULL,50,NULL,85,5),(337,'Sabados - Domingos y Feriados',1,62.5,NULL,NULL,62.5,NULL,85,4),(336,'Destino Adicional',1,90,NULL,NULL,90,NULL,85,3),(333,'Servicio de transporte Caracas - Aeropuerto  vehiculo tipo Sedan',1,250,0,0,250,'',84,1),(334,'Servicio de transporte Caracas - Aeropuerto  vehiculo tipo Sedan',1,250,0,0,250,'',85,1),(335,'Horas de espera y/o Disposicion',2,90,NULL,NULL,180,NULL,85,2),(348,'Sabados - Domingos y Feriadosa razon de 250.0 x 25.0%',1,62.5,0,0,62.5,'',86,4),(350,'Horas de espera y/o Disposiciona razon de 90.0 Bsf c/u',4,90,0,0,360,'',86,2),(347,'Servicio de transporte: Caracas - Aeropuerto  en vehiculo tipo Sedan',1,250,0,0,250,'',86,1),(352,'Sabados - Domingos y Feriadosa razon de 250.0 x 25.0%',1,62.5,0,0,62.5,'',89,4),(353,'Horas de espera y/o Disposiciona razon de 90.0 Bsf c/u',4,90,0,0,360,'',89,2),(354,'Servicio de transporte: Caracas - Aeropuerto  en vehiculo tipo Sedan',1,250,0,0,250,'',89,1),(355,'Servicio de transporte: Caracas - Acarigua en vehiculo tipo Sedan',1,1260,0,0,1260,'',91,21),(356,'Destino Adicionala razon de 90.0 Bsf c/u',1,90,0,0,90,'',91,3),(357,'Servicio de transporte: Caracas - Acarigua en vehiculo tipo Sedan',1,1260,0,0,1260,'',92,21),(358,'Destino Adicionala razon de 90.0 Bsf c/u',1,90,0,0,90,'',92,3);
/*!40000 ALTER TABLE `fc_documento_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_forma_pago`
--

DROP TABLE IF EXISTS `fc_forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_forma_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_forma_pago`
--

LOCK TABLES `fc_forma_pago` WRITE;
/*!40000 ALTER TABLE `fc_forma_pago` DISABLE KEYS */;
INSERT INTO `fc_forma_pago` VALUES (1,'Efectivo'),(2,'Cheque'),(3,'Tarjeta de Debito'),(4,'Tarjeta de Credito'),(5,'Transferencia Bancaria');
/*!40000 ALTER TABLE `fc_forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_pago`
--

DROP TABLE IF EXISTS `fc_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `mt_persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fc_pago_mt_persona1` (`mt_persona_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_pago`
--

LOCK TABLES `fc_pago` WRITE;
/*!40000 ALTER TABLE `fc_pago` DISABLE KEYS */;
INSERT INTO `fc_pago` VALUES (5,'2012-03-01',1030.2,'viaje caracas acarigua',2);
/*!40000 ALTER TABLE `fc_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_pago_det`
--

DROP TABLE IF EXISTS `fc_pago_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_pago_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fc_forma_pago_id` int(11) NOT NULL,
  `fc_banco_id` int(11) DEFAULT NULL,
  `fc_pago_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fc_pago_det_fc_forma_pago1` (`fc_forma_pago_id`),
  KEY `fk_fc_pago_det_fc_banco1` (`fc_banco_id`),
  KEY `fk_fc_pago_det_fc_pago1` (`fc_pago_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_pago_det`
--

LOCK TABLES `fc_pago_det` WRITE;
/*!40000 ALTER TABLE `fc_pago_det` DISABLE KEYS */;
INSERT INTO `fc_pago_det` VALUES (1,'2012-03-01','3413',500,'efec 500',2,1,5),(2,'2012-03-01','1323',530,'23',1,33,5);
/*!40000 ALTER TABLE `fc_pago_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_pago_servicio`
--

DROP TABLE IF EXISTS `fc_pago_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_pago_servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` tinyint(4) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `importe` float DEFAULT NULL,
  `fc_pago_id` int(11) NOT NULL,
  `fc_servicio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fc_pago_servicio_fc_pago1` (`fc_pago_id`),
  KEY `fk_fc_pago_servicio_fc_servicio1` (`fc_servicio_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_pago_servicio`
--

LOCK TABLES `fc_pago_servicio` WRITE;
/*!40000 ALTER TABLE `fc_pago_servicio` DISABLE KEYS */;
INSERT INTO `fc_pago_servicio` VALUES (1,1,'v',3123,4,21),(2,1,'v',3123,4,21),(3,1,'v',3123,4,21),(7,1,'viaje caracas acarigua',280,5,21),(9,1,'carga',250,5,19);
/*!40000 ALTER TABLE `fc_pago_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_servicio`
--

DROP TABLE IF EXISTS `fc_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `tarifa_cobro` float DEFAULT NULL,
  `tarifa_chofer` float DEFAULT NULL,
  `porcentaje` float DEFAULT NULL,
  `porcentaje_chofer` float DEFAULT NULL,
  `distancia` int(11) DEFAULT NULL,
  `mt_ciudad_desde` int(11) DEFAULT NULL,
  `mt_ciudad_hasta` int(11) DEFAULT NULL,
  `cf_vehiculo_tipo_id` int(11) DEFAULT NULL,
  `is_viaje` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_mt_tarfia_mt_ciudad1` (`mt_ciudad_desde`),
  KEY `fk_mt_tarfia_mt_ciudad2` (`mt_ciudad_hasta`),
  KEY `fk_mt_tarifa_cf_vehiculo_tipo1` (`cf_vehiculo_tipo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_servicio`
--

LOCK TABLES `fc_servicio` WRITE;
/*!40000 ALTER TABLE `fc_servicio` DISABLE KEYS */;
INSERT INTO `fc_servicio` VALUES (1,NULL,'Caracas - Aeropuerto ',250,180,NULL,NULL,25,298,1027,1,1),(2,'HRD','Horas de espera y/o Disposicion',90,60,NULL,NULL,NULL,NULL,NULL,NULL,0),(3,'DEA','Destino Adicional',90,60,NULL,NULL,NULL,NULL,NULL,NULL,0),(4,'FER','Sabados - Domingos y Feriados',NULL,NULL,25,10,NULL,NULL,NULL,NULL,0),(5,'ONW','One Way',NULL,NULL,20,10,NULL,NULL,NULL,NULL,0),(19,'ENC','Encomiendas y carga',0,0,20,10,NULL,NULL,NULL,NULL,0),(21,NULL,'Caracas - Acarigua',1260,1000,NULL,NULL,NULL,298,662,1,1),(22,NULL,'Caracas - Bercelona',1150,950,NULL,NULL,NULL,298,30,1,1),(23,NULL,'Caracas - Barinas',1950,1700,NULL,NULL,NULL,298,155,1,1);
/*!40000 ALTER TABLE `fc_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_tipo_doc`
--

DROP TABLE IF EXISTS `fc_tipo_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_tipo_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `naturaleza` varchar(1) DEFAULT NULL,
  `correlativo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_tipo_doc`
--

LOCK TABLES `fc_tipo_doc` WRITE;
/*!40000 ALTER TABLE `fc_tipo_doc` DISABLE KEYS */;
INSERT INTO `fc_tipo_doc` VALUES (1,'Presupuesto','',1271),(2,'Factura','+',863),(3,'Nota de debito','+',12),(4,'Nota de Credito','-',15);
/*!40000 ALTER TABLE `fc_tipo_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_ciudad`
--

DROP TABLE IF EXISTS `mt_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_ciudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `mt_estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mt_ciudad_mt_estado1` (`mt_estado_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1028 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_ciudad`
--

LOCK TABLES `mt_ciudad` WRITE;
/*!40000 ALTER TABLE `mt_ciudad` DISABLE KEYS */;
INSERT INTO `mt_ciudad` VALUES (1025,NULL,'TÃ­a Juana',24),(1,'','Acanaña',1),(2,NULL,'CacurÃ­',1),(3,NULL,'Camani',1),(4,NULL,'Comunidad',1),(5,NULL,'Curimacare',1),(6,NULL,'Isla RatÃ³n',1),(7,NULL,'La Esmeralda',1),(8,NULL,'Laja Lisa',1),(9,NULL,'LimÃ³n de ParhueÃ±a',1),(10,NULL,'Macuruco',1),(11,NULL,'Maroa',1),(12,NULL,'Marueta',1),(13,NULL,'Mavaca',1),(14,NULL,'Munduapo',1),(15,NULL,'Pendare',1),(16,NULL,'Puerto Ayacucho',1),(17,NULL,'Samariapo',1),(18,NULL,'San Carlos de RÃ­o Negro',1),(19,NULL,'San Fernando de Atabapo',1),(20,NULL,'San Juan de Manapiare',1),(21,NULL,'San Pedro del Orinoco',1),(22,NULL,'Santa LucÃ­a',1),(23,NULL,'Solano',1),(24,NULL,'Toky-ShamanaÃ±a',1),(25,NULL,'Victorino',1),(26,NULL,'* OTRA',1),(27,NULL,'Anaco',2),(28,NULL,'Aragua de Barcelona',2),(29,NULL,'Atapirire',2),(30,NULL,'Barcelona',2),(31,NULL,'BergantÃ­n',2),(32,NULL,'Boca de ChÃ¡vez',2),(33,NULL,'Boca de Uchire',2),(34,NULL,'Boca del Pao',2),(35,NULL,'Caigua',2),(36,NULL,'Cantaura',2),(37,NULL,'Carapa',2),(38,NULL,'Clarines',2),(39,NULL,'El Carito',2),(40,NULL,'El Chaparro',2),(41,NULL,'El Hatillo',2),(42,NULL,'El Pao de Barcelona',2),(43,NULL,'El Pilar',2),(44,NULL,'El Tigre',2),(45,NULL,'Guanape',2),(46,NULL,'Guanta',2),(47,NULL,'JosÃ© Gregorio Monagas',2),(48,NULL,'LecherÃ­as',2),(49,NULL,'Mapire',2),(50,NULL,'MÃºcura',2),(51,NULL,'Mundo Nuevo',2),(52,NULL,'Naricual',2),(53,NULL,'Onoto',2),(54,NULL,'PariaguÃ¡n',2),(55,NULL,'Pertigalete',2),(56,NULL,'PÃ­ritu',2),(57,NULL,'Pozuelos',2),(58,NULL,'Pueblo Nuevo',2),(59,NULL,'Puerto La Cruz',2),(60,NULL,'Puerto PÃ­ritu',2),(61,NULL,'Sabana de Uchire',2),(62,NULL,'San Diego de Cabrutica',2),(63,NULL,'San Francisco',2),(64,NULL,'San JoaquÃ­n',2),(65,NULL,'San JosÃ© de Guanipa (El Tigrito)',2),(66,NULL,'San Mateo',2),(67,NULL,'San Miguel',2),(68,NULL,'San Pablo',2),(69,NULL,'Santa Ana',2),(70,NULL,'Santa BÃ¡rbara',2),(71,NULL,'Santa Clara',2),(72,NULL,'Santa Cruz de Orinoco',2),(73,NULL,'Santa InÃ©s',2),(74,NULL,'Santa Rosa',2),(75,NULL,'Soledad',2),(76,NULL,'Urica',2),(77,NULL,'Uverito',2),(78,NULL,'Valle de Guanape',2),(79,NULL,'Zuata',2),(80,NULL,'* OTRA',2),(81,NULL,'Achaguas',3),(82,NULL,'Apurito',3),(83,NULL,'Arichuna',3),(84,NULL,'Biruaca',3),(85,NULL,'Bruzual',3),(86,NULL,'El Amparo',3),(87,NULL,'El Nula',3),(88,NULL,'El Recreo',3),(89,NULL,'El SamÃ¡n de Apure',3),(90,NULL,'El Yagual',3),(91,NULL,'Elorza',3),(92,NULL,'Guachara',3),(93,NULL,'Guasdualito',3),(94,NULL,'Guasimal',3),(95,NULL,'La Estacada',3),(96,NULL,'La Trinidad de Orichuna',3),(97,NULL,'La Victoria',3),(98,NULL,'Mantecal',3),(99,NULL,'Palmarito',3),(100,NULL,'Puerto PÃ¡ez',3),(101,NULL,'Quintero',3),(102,NULL,'San Fernando de Apure',3),(103,NULL,'San Juan de Payara',3),(104,NULL,'San Miguel de Cunaviche',3),(105,NULL,'San Rafael de Atamaica',3),(106,NULL,'San Vicente',3),(107,NULL,'* OTRA',3),(108,NULL,'19 de Abril',4),(109,NULL,'Barbacoas',4),(110,NULL,'Bella Vista',4),(111,NULL,'Cagua',4),(112,NULL,'Camatagua',4),(113,NULL,'CaÃ±a de AzÃºcar',4),(114,NULL,'Carmen de Cura',4),(115,NULL,'ChoronÃ­',4),(116,NULL,'Chuao',4),(117,NULL,'El Consejo',4),(118,NULL,'El LimÃ³n',4),(119,NULL,'Francisco de Miranda',4),(120,NULL,'GÃ¼iripa',4),(121,NULL,'La Colonia Tovar',4),(122,NULL,'La Pica',4),(123,NULL,'La Victoria',4),(124,NULL,'Las Guacamayas',4),(125,NULL,'Las Mercedes',4),(126,NULL,'Las PeÃ±itas',4),(127,NULL,'Las TejerÃ­as',4),(128,NULL,'Los Bagres',4),(129,NULL,'Magdaleno',4),(130,NULL,'Maracay',4),(131,NULL,'Ocumare de la Costa',4),(132,NULL,'Ollas de Caramacate',4),(133,NULL,'Palo Negro',4),(134,NULL,'Pao de ZÃ¡rate',4),(135,NULL,'Paraparal',4),(136,NULL,'Rosario de Paya',4),(137,NULL,'San Casimiro',4),(138,NULL,'San Francisco de AsÃ­s',4),(139,NULL,'San Francisco de Cara',4),(140,NULL,'San JoaquÃ­n',4),(141,NULL,'San Mateo',4),(142,NULL,'San SebastiÃ¡n',4),(143,NULL,'Santa Cruz',4),(144,NULL,'Santa Rita',4),(145,NULL,'Taguay',4),(146,NULL,'Tiara',4),(147,NULL,'TocorÃ³n',4),(148,NULL,'Turmero',4),(149,NULL,'Valle MorÃ­n',4),(150,NULL,'Villa de Cura',4),(151,NULL,'Zuata',4),(152,NULL,'* OTRA',4),(153,NULL,'Altamira',5),(154,NULL,'Arismendi',5),(155,NULL,'Barinas',5),(156,NULL,'Barinitas',5),(157,NULL,'Barrancas',5),(158,NULL,'Bum-Bum',5),(159,NULL,'Calderas',5),(160,NULL,'Capitanejo',5),(161,NULL,'Chameta',5),(162,NULL,'Ciudad Bolivia',5),(163,NULL,'Ciudad de Nutrias',5),(164,NULL,'CurbatÃ­',5),(165,NULL,'Dolores',5),(166,NULL,'El CantÃ³n',5),(167,NULL,'El Corozo',5),(168,NULL,'El Real',5),(169,NULL,'El Regalo',5),(170,NULL,'Guadarrama',5),(171,NULL,'La Caramuca',5),(172,NULL,'La Luz',5),(173,NULL,'La Mula',5),(174,NULL,'La UniÃ³n',5),(175,NULL,'La Yuca',5),(176,NULL,'Libertad',5),(177,NULL,'Los Guasimitos',5),(178,NULL,'Maporal',5),(179,NULL,'Masparrito',5),(180,NULL,'Mijagual',5),(181,NULL,'Obispos',5),(182,NULL,'Pedraza La Vieja',5),(183,NULL,'Puerto de Nutrias',5),(184,NULL,'Puerto Vivas',5),(185,NULL,'Punta de Piedra',5),(186,NULL,'Quebrada Seca',5),(187,NULL,'Sabaneta',5),(188,NULL,'San Antonio',5),(189,NULL,'San Rafael de CanaguÃ¡',5),(190,NULL,'San Silvestre',5),(191,NULL,'Santa BÃ¡rbara',5),(192,NULL,'Santa Catalina',5),(193,NULL,'Santa Cruz de Guacas',5),(194,NULL,'Santa InÃ©s',5),(195,NULL,'Santa LucÃ­a',5),(196,NULL,'Santa Rosa',5),(197,NULL,'SocopÃ³',5),(198,NULL,'Torunos',5),(199,NULL,'Veguitas',5),(200,NULL,'* OTRA',5),(201,NULL,'AlmacÃ©n',6),(202,NULL,'Aripao',6),(203,NULL,'Caicara del Orinoco',6),(204,NULL,'Ciudad BolÃ­var',6),(205,NULL,'Ciudad Guayana',6),(206,NULL,'Ciudad Piar',6),(207,NULL,'El Callao',6),(208,NULL,'El Dorado',6),(209,NULL,'El Manteco',6),(210,NULL,'El Miamo',6),(211,NULL,'El Milagro',6),(212,NULL,'El Palmar',6),(213,NULL,'El Pao de El Hierro',6),(214,NULL,'El Rosario',6),(215,NULL,'Guarataro',6),(216,NULL,'Guasipati',6),(217,NULL,'IkabarÃº',6),(218,NULL,'La Carolina',6),(219,NULL,'La Paragua',6),(220,NULL,'La Urbana',6),(221,NULL,'Las Bonitas',6),(222,NULL,'Las Claritas',6),(223,NULL,'Las Majadas',6),(224,NULL,'Maripa',6),(225,NULL,'Moitaco',6),(226,NULL,'Morichalito',6),(227,NULL,'Pozo Verde',6),(228,NULL,'San Francisco',6),(229,NULL,'San JosÃ© de Bongo',6),(230,NULL,'Santa BÃ¡rbara de CenturiÃ³n',6),(231,NULL,'Santa Elena de UairÃ©n',6),(232,NULL,'Santa RosalÃ­a',6),(233,NULL,'Tumeremo',6),(234,NULL,'Upata',6),(235,NULL,'* OTRA',6),(236,NULL,'Bejuma',7),(237,NULL,'BelÃ©n',7),(238,NULL,'Borburata',7),(239,NULL,'Canoabo',7),(240,NULL,'Central Tacarigua',7),(241,NULL,'Chirgua',7),(242,NULL,'Guacara',7),(243,NULL,'GÃ¼igÃ¼e',7),(244,NULL,'Los Guayos',7),(245,NULL,'Los Naranjos',7),(246,NULL,'Mariara',7),(247,NULL,'Miranda',7),(248,NULL,'MontalbÃ¡n',7),(249,NULL,'MorÃ³n',7),(250,NULL,'Naguanagua',7),(251,NULL,'Patanemo',7),(252,NULL,'Puerto Cabello',7),(253,NULL,'San Diego',7),(254,NULL,'San JoaquÃ­n',7),(255,NULL,'Tocuyito',7),(256,NULL,'Urama',7),(257,NULL,'Valencia',7),(258,NULL,'Yagua',7),(259,NULL,'* OTRA',7),(260,NULL,'Apartaderos',8),(261,NULL,'Cojedes',8),(262,NULL,'El Amparo',8),(263,NULL,'El BaÃºl',8),(264,NULL,'El Pao',8),(265,NULL,'La Aguadita',8),(266,NULL,'La Sierra',8),(267,NULL,'Las Vegas',8),(268,NULL,'Libertad',8),(269,NULL,'Macapo',8),(270,NULL,'Manrique',8),(271,NULL,'San Carlos',8),(272,NULL,'Sucre',8),(273,NULL,'Tinaco',8),(274,NULL,'Tinaquillo',8),(275,NULL,'* OTRA',8),(276,NULL,'Araguabisi',9),(277,NULL,'Araguaimujo',9),(278,NULL,'Boca de Cuyubini',9),(279,NULL,'Capure',9),(280,NULL,'Carapal de Guara',9),(281,NULL,'Curiapo',9),(282,NULL,'El Triunfo',9),(283,NULL,'Hacienda del Medio',9),(284,NULL,'La Horqueta',9),(285,NULL,'Manoa',9),(286,NULL,'Moruca',9),(287,NULL,'Paloma',9),(288,NULL,'Pedernales',9),(289,NULL,'Piacoa',9),(290,NULL,'San Francisco de Guayo',9),(291,NULL,'San Rafael',9),(292,NULL,'Santa Catalina',9),(293,NULL,'Sierra Imataca',9),(294,NULL,'Tucupita',9),(295,NULL,'UrbanizaciÃ³n DelfÃ­n Mendoza',9),(296,NULL,'UrbanizaciÃ³n Leonardo RuÃ­z Pineda',9),(297,NULL,'* OTRA',9),(298,NULL,'Caracas',10),(299,NULL,'* OTRA',10),(300,NULL,'Acurigua',11),(301,NULL,'Adaure',11),(302,NULL,'AdÃ­cora',11),(303,NULL,'Agua Larga',11),(304,NULL,'Agua Linda',11),(305,NULL,'Aracua',11),(306,NULL,'Araurima',11),(307,NULL,'Baraived',11),(308,NULL,'Bariro',11),(309,NULL,'Boca de Aroa',11),(310,NULL,'Boca de Tocuyo',11),(311,NULL,'BorojÃ³',11),(312,NULL,'Buena Vista',11),(313,NULL,'Cabure',11),(314,NULL,'Capadare',11),(315,NULL,'CapatÃ¡rida',11),(316,NULL,'Casigua',11),(317,NULL,'Chichiriviche',11),(318,NULL,'Churuguara',11),(319,NULL,'Coro',11),(320,NULL,'Curimagua',11),(321,NULL,'Dabajuro',11),(322,NULL,'El Charal',11),(323,NULL,'El Hato',11),(324,NULL,'El Manantial (Agua Clara)',11),(325,NULL,'El Mene de San Lorenzo',11),(326,NULL,'El Moyepo',11),(327,NULL,'El PaujÃ­',11),(328,NULL,'El TupÃ­',11),(329,NULL,'El VÃ­nculo',11),(330,NULL,'Guaibacoa',11),(331,NULL,'Guajiro',11),(332,NULL,'Jacura',11),(333,NULL,'Jadacaquiva',11),(334,NULL,'Judibana',11),(335,NULL,'La CiÃ©naga',11),(336,NULL,'La Cruz de Taratara',11),(337,NULL,'La Negrita',11),(338,NULL,'La Pastora',11),(339,NULL,'La PeÃ±a',11),(340,NULL,'La Soledad',11),(341,NULL,'La Vela de Coro',11),(342,NULL,'Las Calderas',11),(343,NULL,'Las Vegas del Tuy',11),(344,NULL,'MapararÃ­',11),(345,NULL,'Mene de Mauroa',11),(346,NULL,'Mirimire',11),(347,NULL,'Mitare',11),(348,NULL,'Moruy',11),(349,NULL,'Palmasola',11),(350,NULL,'Pecaya',11),(351,NULL,'Pedregal',11),(352,NULL,'Piedra Grande',11),(353,NULL,'PÃ­ritu',11),(354,NULL,'Pueblo Cumarebo',11),(355,NULL,'Pueblo Nuevo',11),(356,NULL,'Pueblo Nuevo de la Sierra',11),(357,NULL,'Puerto Cumarebo',11),(358,NULL,'Punta CardÃ³n',11),(359,NULL,'Punto Fijo',11),(360,NULL,'Purureche',11),(361,NULL,'RÃ­o Seco',11),(362,NULL,'Sabaneta',11),(363,NULL,'San FÃ©lix',11),(364,NULL,'San JosÃ© de Bruzual',11),(365,NULL,'San JosÃ© de la Costa',11),(366,NULL,'San JosÃ© de Seque',11),(367,NULL,'San Juan Â de los Cayos',11),(368,NULL,'San Juan de los Cayos',11),(369,NULL,'San Luis',11),(370,NULL,'Santa Ana',11),(371,NULL,'Santa Ana de Coro',11),(372,NULL,'Santa Cruz de Bucaral',11),(373,NULL,'Santa Cruz de Los Taques',11),(374,NULL,'TocÃ³pero',11),(375,NULL,'Tocuyo de La Costa',11),(376,NULL,'Tucacas',11),(377,NULL,'Tupure',11),(378,NULL,'Urumaco',11),(379,NULL,'Yaracal',11),(380,NULL,'ZazÃ¡rida',11),(381,NULL,'* OTRA',11),(382,NULL,'Altagracia de Orituco',12),(383,NULL,'Altamira',12),(384,NULL,'Cabruta',12),(385,NULL,'Calabozo',12),(386,NULL,'CamaguÃ¡n',12),(387,NULL,'Cantagallo',12),(388,NULL,'Cazorla',12),(389,NULL,'Chaguaramas',12),(390,NULL,'El Calvario',12),(391,NULL,'El Rastro',12),(392,NULL,'El Socorro',12),(393,NULL,'El Sombrero',12),(394,NULL,'Espino',12),(395,NULL,'Guardatinajas',12),(396,NULL,'Guayabal',12),(397,NULL,'La UniÃ³n de Canuto',12),(398,NULL,'Las Mercedes',12),(399,NULL,'Lezama',12),(400,NULL,'Libertad de Orituco',12),(401,NULL,'Ortiz',12),(402,NULL,'Parapara',12),(403,NULL,'Paso Real de Macaira',12),(404,NULL,'Puerto Miranda',12),(405,NULL,'Sabana Grande de Orituco',12),(406,NULL,'San Francisco de Macaira',12),(407,NULL,'San Francisco de Tiznados',12),(408,NULL,'San JosÃ© de Guaribe',12),(409,NULL,'San JosÃ© de Tiznados',12),(410,NULL,'San JosÃ© de Unare',12),(411,NULL,'San Juan de Los Morros',12),(412,NULL,'San Rafael de Laya',12),(413,NULL,'San Rafael de Orituco',12),(414,NULL,'Santa MarÃ­a de Ipire',12),(415,NULL,'Santa Rita',12),(416,NULL,'Sosa',12),(417,NULL,'Tucupido',12),(418,NULL,'Uverito',12),(419,NULL,'Valle de La Pascua',12),(420,NULL,'Zaraza',12),(421,NULL,'* OTRA',12),(422,NULL,'Agua Negra',13),(423,NULL,'Agua Viva',13),(424,NULL,'Aguada Grande',13),(425,NULL,'Altagracia',13),(426,NULL,'AnzoÃ¡tegui',13),(427,NULL,'Aregue',13),(428,NULL,'Arenales',13),(429,NULL,'Atarigua',13),(430,NULL,'Baragua',13),(431,NULL,'Barbacoas',13),(432,NULL,'Barquisimeto',13),(433,NULL,'Bobare',13),(434,NULL,'Buena Vista',13),(435,NULL,'Burere',13),(436,NULL,'Cabudare',13),(437,NULL,'Carora',13),(438,NULL,'Cuara',13),(439,NULL,'Cubiro',13),(440,NULL,'Curarigua',13),(441,NULL,'Duaca',13),(442,NULL,'El Empedrado',13),(443,NULL,'El Eneal',13),(444,NULL,'El Hato',13),(445,NULL,'El JabÃ³n',13),(446,NULL,'El Paradero',13),(447,NULL,'El Tocuyo',13),(448,NULL,'GuaitÃ³',13),(449,NULL,'Guarico',13),(450,NULL,'Humocaro Alto',13),(451,NULL,'Humocaro Bajo',13),(452,NULL,'La Bucarita',13),(453,NULL,'La Ceiba',13),(454,NULL,'La Escalera',13),(455,NULL,'La Miel',13),(456,NULL,'La Pastora',13),(457,NULL,'Los Rastrojos',13),(458,NULL,'Manzanita',13),(459,NULL,'Palmarito',13),(460,NULL,'Parapara',13),(461,NULL,'Quebrada Arriba',13),(462,NULL,'QuÃ­bor',13),(463,NULL,'RÃ­o Claro',13),(464,NULL,'RÃ­o Tocuyo',13),(465,NULL,'San Francisco',13),(466,NULL,'San Miguel',13),(467,NULL,'San Pedro',13),(468,NULL,'Sanare',13),(469,NULL,'Santa InÃ©s',13),(470,NULL,'Sarare',13),(471,NULL,'Siquisique',13),(472,NULL,'Tintorero',13),(473,NULL,'Villanueva',13),(474,NULL,'* OTRA',13),(475,NULL,'Acequias',14),(476,NULL,'Arapuey',14),(477,NULL,'Aricagua',14),(478,NULL,'Bailadores',14),(479,NULL,'Cacute',14),(480,NULL,'Campo ElÃ­as',14),(481,NULL,'CanaguÃ¡',14),(482,NULL,'CaÃ±o Tigre',14),(483,NULL,'CapurÃ­',14),(484,NULL,'ChacantÃ¡',14),(485,NULL,'Chachopo',14),(486,NULL,'ChiguarÃ¡',14),(487,NULL,'Ejido',14),(488,NULL,'El Molino',14),(489,NULL,'El Morro',14),(490,NULL,'El Pinar',14),(491,NULL,'El Viento',14),(492,NULL,'El VigÃ­a',14),(493,NULL,'EstÃ¡nquez',14),(494,NULL,'Guaraque',14),(495,NULL,'Guayabones',14),(496,NULL,'JajÃ­',14),(497,NULL,'La Azulita',14),(498,NULL,'La Blanca (12 de Octubre)',14),(499,NULL,'La Mesa',14),(500,NULL,'La Palmita',14),(501,NULL,'La Playa',14),(502,NULL,'La Toma',14),(503,NULL,'La Trampa',14),(504,NULL,'La Venta',14),(505,NULL,'Lagunillas',14),(506,NULL,'Las Piedras',14),(507,NULL,'Las Virtudes',14),(508,NULL,'Los Naranjos',14),(509,NULL,'Los Nevados',14),(510,NULL,'MÃ©rida',14),(511,NULL,'Mesa BolÃ­var',14),(512,NULL,'Mesa de las Palmas',14),(513,NULL,'Mesa de Quintero',14),(514,NULL,'MucuchachÃ­',14),(515,NULL,'MucuchÃ­es',14),(516,NULL,'Mucujepe',14),(517,NULL,'MucurubÃ¡',14),(518,NULL,'Mucutuy',14),(519,NULL,'Nueva Bolivia',14),(520,NULL,'Palmarito',14),(521,NULL,'PiÃ±ango',14),(522,NULL,'Pueblo Llano',14),(523,NULL,'Pueblo Nuevo del Sur',14),(524,NULL,'RÃ­o Negro',14),(525,NULL,'San CristÃ³bal de Torondoy',14),(526,NULL,'San JosÃ©',14),(527,NULL,'San JosÃ© de Palmira',14),(528,NULL,'San Juan',14),(529,NULL,'San Rafael',14),(530,NULL,'San Rafael de AlcÃ¡zar',14),(531,NULL,'Santa Apolonia',14),(532,NULL,'Santa Cruz de Mora',14),(533,NULL,'Santa Elena de Arenales',14),(534,NULL,'Santa MarÃ­a de Caparo',14),(535,NULL,'Santo Domingo',14),(536,NULL,'Tabay',14),(537,NULL,'Timotes',14),(538,NULL,'Torondoy',14),(539,NULL,'Tovar',14),(540,NULL,'TucanÃ­',14),(541,NULL,'Zea',14),(542,NULL,'* OTRA',14),(543,NULL,'Altagracia de la MontaÃ±a',15),(544,NULL,'AragÃ¼ita',15),(545,NULL,'Araira',15),(546,NULL,'Capaya',15),(547,NULL,'Carrizal',15),(548,NULL,'Caucagua',15),(549,NULL,'CaucagÃ¼ita',15),(550,NULL,'Chacao',15),(551,NULL,'Charallave',15),(552,NULL,'CÃºa',15),(553,NULL,'Cumbo',15),(554,NULL,'CÃºpira',15),(555,NULL,'Curiepe',15),(556,NULL,'El CafÃ©',15),(557,NULL,'El Cafetal',15),(558,NULL,'El Cartanal',15),(559,NULL,'El Clavo',15),(560,NULL,'El Guapo',15),(561,NULL,'El Hatillo',15),(562,NULL,'El Jarillo',15),(563,NULL,'Fila de Mariches',15),(564,NULL,'Guarenas',15),(565,NULL,'Guatire',15),(566,NULL,'Higuerote',15),(567,NULL,'La Democracia',15),(568,NULL,'La Dolorita',15),(569,NULL,'Las Brisas',15),(570,NULL,'Las Minas de Baruta',15),(571,NULL,'Los Dos Caminos',15),(572,NULL,'Los Teques',15),(573,NULL,'Machurucuto',15),(574,NULL,'Mamporal',15),(575,NULL,'Marizapa',15),(576,NULL,'Nuestra SeÃ±ora del Rosario de Baruta',15),(577,NULL,'Nueva CÃºa',15),(578,NULL,'Ocumare del Tuy',15),(579,NULL,'Panaquire',15),(580,NULL,'Paparo',15),(581,NULL,'Paracotos',15),(582,NULL,'Petare',15),(583,NULL,'RÃ­o Chico',15),(584,NULL,'San Antonio de Los Altos',15),(585,NULL,'San Antonio de Yare',15),(586,NULL,'San Diego',15),(587,NULL,'San Fernando',15),(588,NULL,'San Francisco de Yare',15),(589,NULL,'San JosÃ© de Barlovento',15),(590,NULL,'San Pedro',15),(591,NULL,'Santa BÃ¡rbara',15),(592,NULL,'Santa LucÃ­a',15),(593,NULL,'Santa Teresa del Tuy',15),(594,NULL,'Tacarigua de La Laguna',15),(595,NULL,'Tacarigua de Mamporal',15),(596,NULL,'TÃ¡cata',15),(597,NULL,'Tapipa',15),(598,NULL,'* OTRA',15),(599,NULL,'Aguasay',16),(600,NULL,'Aparicio',16),(601,NULL,'Aragua',16),(602,NULL,'Areo',16),(603,NULL,'Barrancas',16),(604,NULL,'Cachipo',16),(605,NULL,'Caicara',16),(606,NULL,'Caripe',16),(607,NULL,'Caripito',16),(608,NULL,'Chaguaramal',16),(609,NULL,'Chaguaramas',16),(610,NULL,'El Corozo',16),(611,NULL,'El Furrial',16),(612,NULL,'El GuÃ¡charo',16),(613,NULL,'El Pinto',16),(614,NULL,'El Tejero',16),(615,NULL,'Guanaguana',16),(616,NULL,'JusepÃ­n',16),(617,NULL,'La Guanota',16),(618,NULL,'La Pica',16),(619,NULL,'La Toscana',16),(620,NULL,'Las Alhuacas',16),(621,NULL,'Los Barrancos de Fajardo',16),(622,NULL,'MaturÃ­n',16),(623,NULL,'Punta de Mata',16),(624,NULL,'Quiriquire',16),(625,NULL,'Sabana de Piedra',16),(626,NULL,'San AgustÃ­n',16),(627,NULL,'San Antonio',16),(628,NULL,'San FÃ©lix',16),(629,NULL,'San Francisco',16),(630,NULL,'San Vicente',16),(631,NULL,'Santa BÃ¡rbara',16),(632,NULL,'Tabasca',16),(633,NULL,'Taguaya',16),(634,NULL,'Temblador',16),(635,NULL,'TeresÃ©n',16),(636,NULL,'Uracoa',16),(637,NULL,'Viento Fresco',16),(638,NULL,'* OTRA',16),(639,NULL,'Altagracia',17),(640,NULL,'Boca del Pozo',17),(641,NULL,'Boca del RÃ­o',17),(642,NULL,'El Guamache',17),(643,NULL,'El Maco',17),(644,NULL,'El Pilar (Los Robles)',17),(645,NULL,'El Valle del EspÃ­ritu Santo',17),(646,NULL,'GÃ¼inima',17),(647,NULL,'Juangriego',17),(648,NULL,'La AsunciÃ³n',17),(649,NULL,'La Guardia',17),(650,NULL,'La Plaza de ParaguachÃ­',17),(651,NULL,'Los Millanes',17),(652,NULL,'Pampatar',17),(653,NULL,'Pedro GonzÃ¡lez',17),(654,NULL,'Porlamar',17),(655,NULL,'Punta de Piedras',17),(656,NULL,'San Juan Bautista',17),(657,NULL,'San Pedro de Coche',17),(658,NULL,'Santa Ana',17),(659,NULL,'Tacarigua',17),(660,NULL,'Villa Rosa',17),(661,NULL,'* OTRA',17),(662,NULL,'Acarigua',18),(663,NULL,'Agua Blanca',18),(664,NULL,'Araure',18),(665,NULL,'Biscucuy',18),(666,NULL,'Boconoito',18),(667,NULL,'CaÃ±o Delgadito',18),(668,NULL,'Colonia TurÃ©n',18),(669,NULL,'CÃ³rdoba',18),(670,NULL,'El Algarrobito',18),(671,NULL,'El PlayÃ³n',18),(672,NULL,'Guanare',18),(673,NULL,'Guanarito',18),(674,NULL,'La ApariciÃ³n',18),(675,NULL,'La ConcepciÃ³n',18),(676,NULL,'La EstaciÃ³n',18),(677,NULL,'La MisiÃ³n',18),(678,NULL,'Las Cruces',18),(679,NULL,'Mesa de Cavacas',18),(680,NULL,'MijagÃ¼ito',18),(681,NULL,'Morrones',18),(682,NULL,'Nueva Florida',18),(683,NULL,'Ospino',18),(684,NULL,'PapelÃ³n',18),(685,NULL,'ParaÃ­so de ChabasquÃ©n',18),(686,NULL,'Payara',18),(687,NULL,'PeÃ±a Blanca',18),(688,NULL,'Pimpinela',18),(689,NULL,'PÃ­ritu',18),(690,NULL,'Quebrada de la Virgen',18),(691,NULL,'RÃ­o Acarigua',18),(692,NULL,'San JosÃ© de la MontaÃ±a',18),(693,NULL,'San JosÃ© de Saguaz',18),(694,NULL,'San NicolÃ¡s',18),(695,NULL,'San Rafael de Onoto',18),(696,NULL,'San Rafael de Palo Alzado',18),(697,NULL,'Santa Cruz',18),(698,NULL,'Santa Fe',18),(699,NULL,'Trinidad de la Capilla',18),(700,NULL,'Uveral',18),(701,NULL,'Villa Bruzual',18),(702,NULL,'Villa Rosa',18),(703,NULL,'* OTRA',18),(704,NULL,'Araya',19),(705,NULL,'Arenas',19),(706,NULL,'Aricagua',19),(707,NULL,'CaigÃ¼ire',19),(708,NULL,'Campo Claro',19),(709,NULL,'Cariaco',19),(710,NULL,'CarÃºpano',19),(711,NULL,'Casanay',19),(712,NULL,'Catuaro',19),(713,NULL,'Chacopata',19),(714,NULL,'CumanÃ¡',19),(715,NULL,'Cumanacoa',19),(716,NULL,'El Morro de Puerto Santo',19),(717,NULL,'El Paujil',19),(718,NULL,'El Pilar',19),(719,NULL,'El RincÃ³n',19),(720,NULL,'GuaraÃºnos',19),(721,NULL,'GuariquÃ©n',19),(722,NULL,'Guayana',19),(723,NULL,'GÃ¼iria',19),(724,NULL,'Irapa',19),(725,NULL,'Las Piedras',19),(726,NULL,'Los Altos',19),(727,NULL,'Los Arroyos',19),(728,NULL,'Los Puertos de Santa Fe',19),(729,NULL,'Macuro',19),(730,NULL,'Manicuare',19),(731,NULL,'Marabal',19),(732,NULL,'MarigÃ¼itar',19),(733,NULL,'Playa Grande',19),(734,NULL,'Puerto Santo',19),(735,NULL,'RÃ­o Caribe',19),(736,NULL,'RÃ­o Casanay',19),(737,NULL,'Rio Salado',19),(738,NULL,'RÃ­o Seco',19),(739,NULL,'San Antonio de Irapa',19),(740,NULL,'San Antonio del Golfo',19),(741,NULL,'San JosÃ© de Aerocuar',19),(742,NULL,'San Juan',19),(743,NULL,'San Juan de Las Galdonas',19),(744,NULL,'San Juan de Unare',19),(745,NULL,'San Lorenzo',19),(746,NULL,'San Vicente',19),(747,NULL,'Santa Cruz',19),(748,NULL,'Santa MarÃ­a',19),(749,NULL,'Soro',19),(750,NULL,'Tunapuicito',19),(751,NULL,'Tunapuy',19),(752,NULL,'Villa Frontado (Muelle de Cariaco)',19),(753,NULL,'Villarroel (Quebrada Seca)',19),(754,NULL,'Yaguaraparo',19),(755,NULL,'Yoco',19),(756,NULL,'* OTRA',19),(757,NULL,'Abejales',20),(758,NULL,'Aguas Calientes',20),(759,NULL,'Boca de Grita',20),(760,NULL,'BoconÃ³',20),(761,NULL,'BorotÃ¡',20),(762,NULL,'BramÃ³n',20),(763,NULL,'Capacho Nuevo',20),(764,NULL,'Capacho Viejo',20),(765,NULL,'ColÃ³n',20),(766,NULL,'Coloncito',20),(767,NULL,'Cordero',20),(768,NULL,'Delicias',20),(769,NULL,'EL Cobre',20),(770,NULL,'El Milagro',20),(771,NULL,'El Pueblito',20),(772,NULL,'El Recreo',20),(773,NULL,'El Valle',20),(774,NULL,'Hato de la Virgen',20),(775,NULL,'HernÃ¡ndez',20),(776,NULL,'La Florida',20),(777,NULL,'La FrÃ­a',20),(778,NULL,'La FundaciÃ³n',20),(779,NULL,'La Grita',20),(780,NULL,'La Palmita',20),(781,NULL,'La Tendida',20),(782,NULL,'Laguna de GarcÃ­a',20),(783,NULL,'Las Dantas',20),(784,NULL,'Las Mesas',20),(785,NULL,'Lobatera',20),(786,NULL,'Macanillo',20),(787,NULL,'Mesa del Tigre',20),(788,NULL,'Michelena',20),(789,NULL,'Orope',20),(790,NULL,'Palmira',20),(791,NULL,'Palo Gordo',20),(792,NULL,'Palotal',20),(793,NULL,'Patio Redondo',20),(794,NULL,'Peribeca',20),(795,NULL,'Pregonero',20),(796,NULL,'Pueblo Hondo',20),(797,NULL,'Puerto Nuevo',20),(798,NULL,'Puerto Teteo',20),(799,NULL,'Queniquea',20),(800,NULL,'RÃ­o Chiquito',20),(801,NULL,'Rubio',20),(802,NULL,'Sabana Grande',20),(803,NULL,'San Antonio del TÃ¡chira',20),(804,NULL,'San CristÃ³bal',20),(805,NULL,'San FÃ©lix',20),(806,NULL,'San JoaquÃ­n de Navay',20),(807,NULL,'San JosÃ© de BolÃ­var',20),(808,NULL,'San Josecito',20),(809,NULL,'San Lorenzo',20),(810,NULL,'San Pablo',20),(811,NULL,'San Pedro del RÃ­o',20),(812,NULL,'San Rafael del PiÃ±al',20),(813,NULL,'San SimÃ³n',20),(814,NULL,'San Vicente de la Revancha',20),(815,NULL,'Santa Ana',20),(816,NULL,'Seboruco',20),(817,NULL,'TÃ¡riba',20),(818,NULL,'Umuquena',20),(819,NULL,'UreÃ±a',20),(820,NULL,'* OTRA',20),(821,NULL,'Agua Caliente',21),(822,NULL,'Agua Santa',21),(823,NULL,'Altamira de CaÃºs',21),(824,NULL,'Araguaney',21),(825,NULL,'Batatal',21),(826,NULL,'Betijoque',21),(827,NULL,'BoconÃ³',21),(828,NULL,'Bolivia',21),(829,NULL,'Buena Vista',21),(830,NULL,'Burbusay',21),(831,NULL,'CabimbÃº',21),(832,NULL,'Campo Alegre',21),(833,NULL,'Campo ElÃ­as',21),(834,NULL,'Carache',21),(835,NULL,'Carvajal',21),(836,NULL,'Casa de Tabla',21),(837,NULL,'ChejendÃ©',21),(838,NULL,'ChiquinquirÃ¡',21),(839,NULL,'Cuicas',21),(840,NULL,'El Alto',21),(841,NULL,'El BaÃ±o',21),(842,NULL,'El Carmen',21),(843,NULL,'El Cenizo',21),(844,NULL,'El Dividive',21),(845,NULL,'El Gallo',21),(846,NULL,'El JagÃ¼ito',21),(847,NULL,'El Paradero',21),(848,NULL,'El ParaÃ­so',21),(849,NULL,'El Zapatero',21),(850,NULL,'Escuque',21),(851,NULL,'Flor de Patria',21),(852,NULL,'Granados',21),(853,NULL,'Guaramacal',21),(854,NULL,'IsnotÃº',21),(855,NULL,'JajÃ³',21),(856,NULL,'Jalisco',21),(857,NULL,'Juan Ignacio Montilla',21),(858,NULL,'JunÃ­n',21),(859,NULL,'La Beatriz',21),(860,NULL,'La Ceiba',21),(861,NULL,'La ConcepciÃ³n',21),(862,NULL,'La Cuchilla',21),(863,NULL,'La Mata',21),(864,NULL,'La Mesa de Esnujaque',21),(865,NULL,'La Placita',21),(866,NULL,'La Plazuela',21),(867,NULL,'La Puerta',21),(868,NULL,'La Quebrada',21),(869,NULL,'Las Llanadas',21),(870,NULL,'Las Mesetas',21),(871,NULL,'Las Mesitas',21),(872,NULL,'Las Quebradas',21),(873,NULL,'Las Rurales',21),(874,NULL,'Los Caprichos',21),(875,NULL,'Los Cedros',21),(876,NULL,'Matriz',21),(877,NULL,'Mendoza',21),(878,NULL,'Mercedes DÃ­az',21),(879,NULL,'Minas',21),(880,NULL,'MitÃ³n',21),(881,NULL,'Monay',21),(882,NULL,'Monte Carmelo',21),(883,NULL,'Mosquey',21),(884,NULL,'MotatÃ¡n',21),(885,NULL,'Niquitao',21),(886,NULL,'PampÃ¡n',21),(887,NULL,'Pampanito',21),(888,NULL,'Sabana de Mendoza',21),(889,NULL,'Sabana Grande',21),(890,NULL,'Sabana Libre',21),(891,NULL,'San Jacinto',21),(892,NULL,'San LÃ¡zaro',21),(893,NULL,'San Luis',21),(894,NULL,'San Miguel',21),(895,NULL,'San Rafael',21),(896,NULL,'Santa Ana',21),(897,NULL,'Santa Apolonia',21),(898,NULL,'Santa Isabel',21),(899,NULL,'Santa Rosa',21),(900,NULL,'Santiago',21),(901,NULL,'Torococo',21),(902,NULL,'TostÃ³s',21),(903,NULL,'Tres de Febrero',21),(904,NULL,'Tres Esquinas',21),(905,NULL,'Trujillo',21),(906,NULL,'TuÃ±ame',21),(907,NULL,'Valera',21),(908,NULL,'Valerita',21),(909,NULL,'Valmore RodrÃ­guez',21),(910,NULL,'Vega de Guaramacal',21),(911,NULL,'Zona Rica',21),(912,NULL,'* OTRA',21),(913,NULL,'Caraballeda',22),(914,NULL,'Carayaca',22),(915,NULL,'Catia La Mar',22),(916,NULL,'El Junko',22),(917,NULL,'La Guaira',22),(918,NULL,'La Sabana',22),(919,NULL,'Macuto',22),(920,NULL,'MaiquetÃ­a',22),(921,NULL,'NaiguatÃ¡',22),(922,NULL,'* OTRA',22),(923,NULL,'Albarico',23),(924,NULL,'Aroa',23),(925,NULL,'Boraure',23),(926,NULL,'Cambural',23),(927,NULL,'Campo ElÃ­as',23),(928,NULL,'Casimiro VÃ¡squez',23),(929,NULL,'Chivacoa',23),(930,NULL,'Cocorote',23),(931,NULL,'Farriar',23),(932,NULL,'Guama',23),(933,NULL,'Independencia',23),(934,NULL,'MarÃ­n',23),(935,NULL,'Nirgua',23),(936,NULL,'Sabana de Parra',23),(937,NULL,'Salom',23),(938,NULL,'San Felipe',23),(939,NULL,'San Pablo',23),(940,NULL,'Temerla',23),(941,NULL,'Urachiche',23),(942,NULL,'Yaritagua',23),(943,NULL,'Yumare',23),(944,NULL,'* OTRA',23),(945,NULL,'Bachaquero',24),(946,NULL,'Barranquitas',24),(947,NULL,'Bobures',24),(948,NULL,'Cabimas',24),(949,NULL,'CachirÃ­',24),(950,NULL,'Caja Seca',24),(951,NULL,'Campo Lara',24),(952,NULL,'Carrasquero',24),(953,NULL,'Casigua El Cubo',24),(954,NULL,'Ceuta',24),(955,NULL,'Ciudad Â Ojeda',24),(956,NULL,'Ciudad Ojeda',24),(957,NULL,'Cojoro',24),(958,NULL,'ConcepciÃ³n',24),(959,NULL,'Concha',24),(960,NULL,'Cuatro Esquinas',24),(961,NULL,'El Bajo',24),(962,NULL,'El Batey',24),(963,NULL,'El Carmelo',24),(964,NULL,'El Consejo de Ciruma',24),(965,NULL,'El Corozo',24),(966,NULL,'El Cruce',24),(967,NULL,'El GuanÃ¡bano',24),(968,NULL,'El Guayabo',24),(969,NULL,'El Mecocal',24),(970,NULL,'El Mene',24),(971,NULL,'El Molinete',24),(972,NULL,'El Moralito',24),(973,NULL,'El Silencio',24),(974,NULL,'El Tigre',24),(975,NULL,'El Toro',24),(976,NULL,'El Venado',24),(977,NULL,'Encontrados',24),(978,NULL,'Gibraltar',24),(979,NULL,'Jobo Alto (KilÃ³metro 25)',24),(980,NULL,'KilÃ³metro 48 (Santo Domingo)',24),(981,NULL,'La ConcepciÃ³n',24),(982,NULL,'La Ensenada',24),(983,NULL,'La Paz',24),(984,NULL,'La Sierrita',24),(985,NULL,'La Villa del Rosario',24),(986,NULL,'Lagunillas',24),(987,NULL,'Las Parcelas',24),(988,NULL,'Las Piedras',24),(989,NULL,'Los Cortijos',24),(990,NULL,'Los Naranjos',24),(991,NULL,'Los Puertos de Altagracia',24),(992,NULL,'Machiques',24),(993,NULL,'Maracaibo',24),(994,NULL,'Mene Grande',24),(995,NULL,'Palito Blanco',24),(996,NULL,'Palmarejo',24),(997,NULL,'Paraguaipoa',24),(998,NULL,'Picapica',24),(999,NULL,'Potreritos',24),(1000,NULL,'Pueblo Nuevo',24),(1001,NULL,'Pueblo Nuevo El Chivo',24),(1002,NULL,'Punta Gorda',24),(1003,NULL,'Quisiro',24),(1004,NULL,'RÃ­o Negro',24),(1005,NULL,'Sabana de la Plata',24),(1006,NULL,'Sabaneta de Palmas',24),(1007,NULL,'San Antonio',24),(1008,NULL,'San Carlos',24),(1009,NULL,'San Carlos del Zulia',24),(1010,NULL,'San Francisco',24),(1011,NULL,'San Ignacio',24),(1012,NULL,'San Isidro',24),(1013,NULL,'San JosÃ©',24),(1014,NULL,'San Rafael de El MojÃ¡n',24),(1015,NULL,'San Timoteo',24),(1016,NULL,'Santa BÃ¡rbara',24),(1017,NULL,'Santa Cruz de Mara',24),(1018,NULL,'Santa Cruz del Zulia',24),(1019,NULL,'Santa MarÃ­a',24),(1020,NULL,'Santa Rita',24),(1021,NULL,'Sierra Maestra',24),(1022,NULL,'Sinamaica',24),(1023,NULL,'Sur AmÃ©rica',24),(1024,NULL,'Tamare',24),(1026,NULL,'* OTRA',24),(1027,'','Aeropuerto',22);
/*!40000 ALTER TABLE `mt_ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_doc_persona`
--

DROP TABLE IF EXISTS `mt_doc_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_doc_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_emision` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `cf_tipo_doc_id` int(11) NOT NULL,
  `mt_persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mt_documento_cf_tipo_doc1` (`cf_tipo_doc_id`),
  KEY `fk_mt_documento_mt_persona1` (`mt_persona_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_doc_persona`
--

LOCK TABLES `mt_doc_persona` WRITE;
/*!40000 ALTER TABLE `mt_doc_persona` DISABLE KEYS */;
INSERT INTO `mt_doc_persona` VALUES (1,'2011-09-01','2011-09-14','4343434',2,2);
/*!40000 ALTER TABLE `mt_doc_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_doc_vehiculo`
--

DROP TABLE IF EXISTS `mt_doc_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_doc_vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_emision` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `cf_tipo_doc_id` int(11) NOT NULL,
  `mt_vehiculo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mt_documento_cf_tipo_doc1` (`cf_tipo_doc_id`),
  KEY `fk_mt_doc_vehiculo_mt_vehiculo1` (`mt_vehiculo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_doc_vehiculo`
--

LOCK TABLES `mt_doc_vehiculo` WRITE;
/*!40000 ALTER TABLE `mt_doc_vehiculo` DISABLE KEYS */;
INSERT INTO `mt_doc_vehiculo` VALUES (1,'2011-09-29','2011-09-06','78676767',3,3);
/*!40000 ALTER TABLE `mt_doc_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_estado`
--

DROP TABLE IF EXISTS `mt_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_estado`
--

LOCK TABLES `mt_estado` WRITE;
/*!40000 ALTER TABLE `mt_estado` DISABLE KEYS */;
INSERT INTO `mt_estado` VALUES (1,NULL,'Amazonas'),(2,NULL,'AnzoÃ¡tegui'),(3,NULL,'Apure'),(4,NULL,'Aragua'),(5,NULL,'Barinas'),(6,NULL,'BolÃ­var'),(7,NULL,'Carabobo'),(8,NULL,'Cojedes'),(9,NULL,'Delta Amacuro'),(10,NULL,'Distrito Capital'),(11,NULL,'FalcÃ³n'),(12,NULL,'GuÃ¡rico'),(13,NULL,'Lara'),(14,NULL,'MÃ©rida'),(15,NULL,'Miranda'),(16,NULL,'Monagas'),(17,NULL,'Nueva Esparta'),(18,NULL,'Portuguesa'),(19,NULL,'Sucre'),(20,NULL,'TÃ¡chira'),(21,NULL,'Trujillo'),(22,NULL,'Vargas'),(23,NULL,'Yaracuy'),(24,NULL,'Zulia');
/*!40000 ALTER TABLE `mt_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_kilometraje`
--

DROP TABLE IF EXISTS `mt_kilometraje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_kilometraje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `kilometraje` int(11) DEFAULT NULL,
  `mt_vehiculo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mt_kilometraje_mt_vehiculo1` (`mt_vehiculo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_kilometraje`
--

LOCK TABLES `mt_kilometraje` WRITE;
/*!40000 ALTER TABLE `mt_kilometraje` DISABLE KEYS */;
INSERT INTO `mt_kilometraje` VALUES (1,'2011-09-15',123333,1);
/*!40000 ALTER TABLE `mt_kilometraje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_persona`
--

DROP TABLE IF EXISTS `mt_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `ruta_foto` varchar(500) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `cf_cargo_id` int(11) NOT NULL,
  `tlf_hab` varchar(45) DEFAULT NULL,
  `tlf_cel` varchar(45) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mt_persona_cf_cargo1` (`cf_cargo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_persona`
--

LOCK TABLES `mt_persona` WRITE;
/*!40000 ALTER TABLE `mt_persona` DISABLE KEYS */;
INSERT INTO `mt_persona` VALUES (2,'12761074','wuelfhis','asuaje p','mt_persona.ruta_foto.bd1bf358a29b03d5.31343433325f313238353735383734333537305f313231383138303436305f3835373437325f353431373331385f6e2e6a7067.jpg','M','wasuaje','www4214',6,'02128618175','04129331022','catia -caracas -vzla','wasuaje@hotmail.com'),(3,'14260023','wilgem','asuaje','mt_persona.ruta_foto.931b8e1320d7a05b.494d4730303232362e6a7067.jpg','M','wpaos','asas',5,NULL,NULL,NULL,NULL),(4,'14404708','Jelika','Albarran','mt_persona.ruta_foto.8e91b494e0262dcf.494d4730303230332e6a7067.jpg','F','','',4,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mt_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_vehiculo`
--

DROP TABLE IF EXISTS `mt_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `serial_motor` varchar(45) DEFAULT NULL,
  `serial_caja` varchar(45) DEFAULT NULL,
  `serial_carroceria` varchar(45) DEFAULT NULL,
  `nro_ejes` tinyint(4) DEFAULT NULL,
  `nro_ruedas` tinyint(4) DEFAULT NULL,
  `kilometraje` int(11) DEFAULT NULL,
  `ruta_foto` varchar(500) DEFAULT NULL,
  `cf_vehiculo_modelo_id` int(11) NOT NULL,
  `cf_vehiculo_tipo_id` int(11) NOT NULL,
  `cf_tipo_combustible_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mt_vehiculo_cf_vehiculo_modelo1` (`cf_vehiculo_modelo_id`),
  KEY `fk_mt_vehiculo_cf_vehiculo_tipo1` (`cf_vehiculo_tipo_id`),
  KEY `fk_mt_vehiculo_cf_tipo_combustible1` (`cf_tipo_combustible_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_vehiculo`
--

LOCK TABLES `mt_vehiculo` WRITE;
/*!40000 ALTER TABLE `mt_vehiculo` DISABLE KEYS */;
INSERT INTO `mt_vehiculo` VALUES (3,'AA629IP','Rojo','565468a','asdasd45645','a645asd5dsa64',2,4,NULL,'mt_vehiculo.ruta_foto.b976922c73b67205.313330313134313736315f3130383031373832355f342d70616c696f2d666972652d31303530302d792d63756f7461732d6e6f2d65732d706c616e2d64652d61686f72726f2d4175746f732e6a7067.jpg',1508,1,2);
/*!40000 ALTER TABLE `mt_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mv_asignacion`
--

DROP TABLE IF EXISTS `mv_asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mv_asignacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) DEFAULT NULL,
  `fecha_proceso` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `mt_vehiculo_id` int(11) NOT NULL,
  `mt_persona_id` int(11) NOT NULL,
  `mv_viaje_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mv_asignacion_mt_vehiculo1` (`mt_vehiculo_id`),
  KEY `fk_mv_asignacion_mt_persona1` (`mt_persona_id`),
  KEY `fk_mv_asignacion_mv_viaje1` (`mv_viaje_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mv_asignacion`
--

LOCK TABLES `mv_asignacion` WRITE;
/*!40000 ALTER TABLE `mv_asignacion` DISABLE KEYS */;
INSERT INTO `mv_asignacion` VALUES (1,'Asuaje P caracas guarenas','2011-09-16',NULL,3,2,3);
/*!40000 ALTER TABLE `mv_asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mv_gasto`
--

DROP TABLE IF EXISTS `mv_gasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mv_gasto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `fecha_gasto` date DEFAULT NULL,
  `kilometraje` int(11) DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `impuesto` float DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `recargo` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `mv_asignacion_id` int(11) NOT NULL,
  `cf_proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mv_gasto_mv_asignacion1` (`mv_asignacion_id`),
  KEY `fk_mv_gasto_cf_proveedor1` (`cf_proveedor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mv_gasto`
--

LOCK TABLES `mv_gasto` WRITE;
/*!40000 ALTER TABLE `mv_gasto` DISABLE KEYS */;
INSERT INTO `mv_gasto` VALUES (1,'gasto programado ','2011-09-30','2011-09-22',123234,'00069875',50,0,100,1250,1,1);
/*!40000 ALTER TABLE `mv_gasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mv_gasto_det`
--

DROP TABLE IF EXISTS `mv_gasto_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mv_gasto_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` float NOT NULL DEFAULT '0',
  `unitario` float NOT NULL DEFAULT '0',
  `total` float NOT NULL DEFAULT '0',
  `mv_gasto_id` int(11) NOT NULL,
  `cf_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mv_gasto_det_mv_gasto1` (`mv_gasto_id`),
  KEY `fk_mv_gasto_det_cf_item1` (`cf_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mv_gasto_det`
--

LOCK TABLES `mv_gasto_det` WRITE;
/*!40000 ALTER TABLE `mv_gasto_det` DISABLE KEYS */;
INSERT INTO `mv_gasto_det` VALUES (1,123,2,246,1,1);
/*!40000 ALTER TABLE `mv_gasto_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mv_viaje`
--

DROP TABLE IF EXISTS `mv_viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mv_viaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) NOT NULL,
  `fecha_solicitud` date DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `nro_pasajeros` tinyint(4) DEFAULT NULL,
  `horas_espera` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `mt_ciudad_desde` int(11) NOT NULL,
  `mt_ciudad_hasta` int(11) NOT NULL,
  `cf_proveedor_id` int(11) NOT NULL,
  `cf_vehiculo_tipo_id` int(11) NOT NULL,
  `cf_viaje_tipo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mv_viaje_mt_ciudad1` (`mt_ciudad_desde`),
  KEY `fk_mv_viaje_mt_ciudad2` (`mt_ciudad_hasta`),
  KEY `fk_mv_viaje_cf_proveedor1` (`cf_proveedor_id`),
  KEY `fk_mv_viaje_cf_vehiculo_tipo1` (`cf_vehiculo_tipo_id`),
  KEY `fk_mv_viaje_cf_viaje_tipo1` (`cf_viaje_tipo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mv_viaje`
--

LOCK TABLES `mv_viaje` WRITE;
/*!40000 ALTER TABLE `mv_viaje` DISABLE KEYS */;
INSERT INTO `mv_viaje` VALUES (5,'Sr. Jose al aeropuerto','2012-02-29','2012-02-29','2012-02-29',NULL,NULL,0,298,1027,1,1,29);
/*!40000 ALTER TABLE `mv_viaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `dbpylab`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dbpylab` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbpylab`;

--
-- Table structure for table `auth_cas`
--

DROP TABLE IF EXISTS `auth_cas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_cas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `renew` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  CONSTRAINT `auth_cas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_cas`
--

LOCK TABLES `auth_cas` WRITE;
/*!40000 ALTER TABLE `auth_cas` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_cas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_event`
--

DROP TABLE IF EXISTS `auth_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_stamp` datetime DEFAULT NULL,
  `client_ip` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  CONSTRAINT `auth_event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_event`
--

LOCK TABLES `auth_event` WRITE;
/*!40000 ALTER TABLE `auth_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_membership`
--

DROP TABLE IF EXISTS `auth_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id__idx` (`user_id`),
  KEY `group_id__idx` (`group_id`),
  CONSTRAINT `auth_membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_membership_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_membership`
--

LOCK TABLES `auth_membership` WRITE;
/*!40000 ALTER TABLE `auth_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id__idx` (`group_id`),
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `registration_key` varchar(255) DEFAULT NULL,
  `reset_password_key` varchar(255) DEFAULT NULL,
  `registration_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_cliente`
--

DROP TABLE IF EXISTS `cf_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `direccion` longtext,
  `rif` varchar(255) DEFAULT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tlf` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `juridico` char(1) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_cliente`
--

LOCK TABLES `cf_cliente` WRITE;
/*!40000 ALTER TABLE `cf_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cf_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_empresa`
--

DROP TABLE IF EXISTS `cf_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `direccion` longtext,
  `rif` varchar(255) DEFAULT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tlf` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `master` char(1) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_empresa`
--

LOCK TABLES `cf_empresa` WRITE;
/*!40000 ALTER TABLE `cf_empresa` DISABLE KEYS */;
INSERT INTO `cf_empresa` VALUES (1,'MyLaboratorio','MyLaboratorio,C.A','CAlle A, entre b y C CAracas','j-12334344-2','','MyLaboratorio@gmail.com','','','T','cf_empresa.ruta_foto.a6a94a712e42bb02.5472696c62795f5475782e706e67.png');
/*!40000 ALTER TABLE `cf_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_examen`
--

DROP TABLE IF EXISTS `cf_examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_examen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  `precio_esp2` float DEFAULT NULL,
  `precio_esp1` float DEFAULT NULL,
  `precio_emp` float DEFAULT NULL,
  `precio_seg` float DEFAULT NULL,
  `precio_fin` float DEFAULT NULL,
  `examen_id` int(11) DEFAULT NULL,
  `es_perfil` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_examen`
--

LOCK TABLES `cf_examen` WRITE;
/*!40000 ALTER TABLE `cf_examen` DISABLE KEYS */;
INSERT INTO `cf_examen` VALUES (12,'01','Examen de Orina',NULL,10,20,20,30,40,NULL,NULL),(20,'H-01','Examen de Heces (Coprologia)',NULL,10,20,20,30,40,NULL,NULL),(22,'Z-01','Z teconolod',NULL,10,20,20,30,40,NULL,NULL),(26,'A-01','Otro Exman',NULL,8,9,11,13,12,NULL,NULL),(27,'Z-01','bilirubina',NULL,1,2,3,4,5,NULL,NULL),(29,'p20','Perfil 20',NULL,97,98,100,102,150,NULL,'1'),(31,'PH','Perfil Hormonal',NULL,140,150,170,180,200,NULL,'T'),(32,'PT','Perfil Tiroides',NULL,110,120,130,140,150,NULL,'T'),(51,'OP','Otro Perfil Bueno',NULL,11,120,130,140,150,NULL,'T'),(53,'H-01','Examen de Heces (Coprologia)',NULL,NULL,NULL,NULL,NULL,NULL,51,NULL),(56,'01','Examen de Orina',NULL,NULL,NULL,NULL,NULL,NULL,51,NULL);
/*!40000 ALTER TABLE `cf_examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_examen_det`
--

DROP TABLE IF EXISTS `cf_examen_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_examen_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `inferior` varchar(255) DEFAULT NULL,
  `superior` varchar(255) DEFAULT NULL,
  `unidad` varchar(255) DEFAULT NULL,
  `examen_id` varchar(255) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_examen_det`
--

LOCK TABLES `cf_examen_det` WRITE;
/*!40000 ALTER TABLE `cf_examen_det` DISABLE KEYS */;
INSERT INTO `cf_examen_det` VALUES (3,'02','prueba','50','60','mg/dl','22',NULL),(4,'08','det 02','23','46','dl','29',NULL),(5,'h01','color','','','','20',NULL),(6,'h02','olor','','','','20',NULL),(7,'h03','ph','','','','20',NULL),(8,'01','olor','','','','12',NULL),(9,'02','aspecto','','','','12',NULL),(10,'03','ph','','','','12',NULL),(11,'01','bilirrubina','2','7','mg','27',NULL);
/*!40000 ALTER TABLE `cf_examen_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_examen_tip`
--

DROP TABLE IF EXISTS `cf_examen_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_examen_tip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_examen_tip`
--

LOCK TABLES `cf_examen_tip` WRITE;
/*!40000 ALTER TABLE `cf_examen_tip` DISABLE KEYS */;
/*!40000 ALTER TABLE `cf_examen_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_parametro`
--

DROP TABLE IF EXISTS `cf_parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_parametro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parametro` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_parametro`
--

LOCK TABLES `cf_parametro` WRITE;
/*!40000 ALTER TABLE `cf_parametro` DISABLE KEYS */;
INSERT INTO `cf_parametro` VALUES (1,'rutarpt','/home/manduca');
/*!40000 ALTER TABLE `cf_parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cf_proveedor`
--

DROP TABLE IF EXISTS `cf_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cf_proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `direccion` longtext,
  `rif` varchar(255) DEFAULT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tlf` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `ruta_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cf_proveedor`
--

LOCK TABLES `cf_proveedor` WRITE;
/*!40000 ALTER TABLE `cf_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `cf_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_orden`
--

DROP TABLE IF EXISTS `fc_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `procesada` char(1) DEFAULT NULL,
  `facturada` char(1) DEFAULT NULL,
  `entregada` char(1) DEFAULT NULL,
  `pagada` char(1) DEFAULT NULL,
  `fecha_pag` date DEFAULT NULL,
  `num_fact` varchar(255) DEFAULT NULL,
  `fecha_fac` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_orden`
--

LOCK TABLES `fc_orden` WRITE;
/*!40000 ALTER TABLE `fc_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `fc_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_orden_det`
--

DROP TABLE IF EXISTS `fc_orden_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_orden_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `importe` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `imp1` float DEFAULT NULL,
  `imp2` float DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `examen_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_orden_det`
--

LOCK TABLES `fc_orden_det` WRITE;
/*!40000 ALTER TABLE `fc_orden_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `fc_orden_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_perfil`
--

DROP TABLE IF EXISTS `fc_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `examen_id` int(11) DEFAULT NULL,
  `examen_det_id` int(11) DEFAULT NULL,
  `precio_fin` float DEFAULT NULL,
  `precio_emp` float DEFAULT NULL,
  `precio_seg` float DEFAULT NULL,
  `precio_esp1` float DEFAULT NULL,
  `precio_esp2` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_perfil`
--

LOCK TABLES `fc_perfil` WRITE;
/*!40000 ALTER TABLE `fc_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `fc_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_precio_detalle`
--

DROP TABLE IF EXISTS `fc_precio_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_precio_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `examen_det_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_precio_detalle`
--

LOCK TABLES `fc_precio_detalle` WRITE;
/*!40000 ALTER TABLE `fc_precio_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `fc_precio_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fc_precio_examen`
--

DROP TABLE IF EXISTS `fc_precio_examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fc_precio_examen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `examen_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fc_precio_examen`
--

LOCK TABLES `fc_precio_examen` WRITE;
/*!40000 ALTER TABLE `fc_precio_examen` DISABLE KEYS */;
/*!40000 ALTER TABLE `fc_precio_examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `op_result`
--

DROP TABLE IF EXISTS `op_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `op_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden_id` int(11) DEFAULT NULL,
  `fecha_res` date DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `op_result`
--

LOCK TABLES `op_result` WRITE;
/*!40000 ALTER TABLE `op_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `op_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `op_result_det`
--

DROP TABLE IF EXISTS `op_result_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `op_result_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_id` int(11) DEFAULT NULL,
  `examen_det_id` int(11) DEFAULT NULL,
  `resultado` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `op_result_det`
--

LOCK TABLES `op_result_det` WRITE;
/*!40000 ALTER TABLE `op_result_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `op_result_det` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-13 15:47:39
