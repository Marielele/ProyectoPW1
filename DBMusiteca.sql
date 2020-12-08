-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dbmusitecapw
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `idAdministrador` int NOT NULL AUTO_INCREMENT,
  `Noticia_Aprobada` varchar(45) DEFAULT NULL,
  `Noticia_Rechazada` varchar(45) DEFAULT NULL,
  `Suspender_temporalmente` varchar(45) DEFAULT NULL,
  `Suspender_permanentemente` varchar(45) DEFAULT NULL,
  `Rechazar_Noticia` varchar(45) DEFAULT NULL,
  `Aprobar_Noticia` varchar(45) DEFAULT NULL,
  `Borrar_comentario` varchar(45) DEFAULT NULL,
  `ID_ Noticia` int NOT NULL,
  `ID_User` int NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  KEY `fkeyid_Noticia_idx` (`ID_ Noticia`),
  KEY `fk_iduser_idx` (`ID_User`),
  CONSTRAINT `fk_iduser` FOREIGN KEY (`ID_User`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `foreingkey_idnoticia` FOREIGN KEY (`ID_ Noticia`) REFERENCES `noticia` (`idNoticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creador`
--

DROP TABLE IF EXISTS `creador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creador` (
  `idCreador` int NOT NULL AUTO_INCREMENT,
  `Noticia_aprobada` varchar(45) NOT NULL,
  `Noticia_rechazada` varchar(45) NOT NULL,
  `id_Noticia` int NOT NULL,
  `ID_User` int NOT NULL,
  PRIMARY KEY (`idCreador`),
  KEY `fkey_idNoticia_idx` (`id_Noticia`),
  KEY `fk_id_user_idx` (`ID_User`),
  CONSTRAINT `fk_id_user` FOREIGN KEY (`ID_User`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `fkey_idNoticia` FOREIGN KEY (`id_Noticia`) REFERENCES `noticia` (`idNoticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creador`
--

LOCK TABLES `creador` WRITE;
/*!40000 ALTER TABLE `creador` DISABLE KEYS */;
/*!40000 ALTER TABLE `creador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editor`
--

DROP TABLE IF EXISTS `editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editor` (
  `idEditor` int NOT NULL AUTO_INCREMENT,
  `Aprobar_noticia` varchar(45) NOT NULL,
  `Rechazar_noticia` varchar(45) NOT NULL,
  `id_Noticia` int NOT NULL,
  `ID_User` int NOT NULL,
  PRIMARY KEY (`idEditor`),
  KEY `fkid_noticia_idx` (`id_Noticia`),
  KEY `fkid_user_idx` (`ID_User`),
  CONSTRAINT `fkid_noticia` FOREIGN KEY (`id_Noticia`) REFERENCES `noticia` (`idNoticia`),
  CONSTRAINT `fkid_user` FOREIGN KEY (`ID_User`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editor`
--

LOCK TABLES `editor` WRITE;
/*!40000 ALTER TABLE `editor` DISABLE KEYS */;
/*!40000 ALTER TABLE `editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderador`
--

DROP TABLE IF EXISTS `moderador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderador` (
  `idModerador` int NOT NULL AUTO_INCREMENT,
  `Suspender_permanentemente` varchar(45) DEFAULT NULL,
  `Suspender_temporalmente` varchar(45) DEFAULT NULL,
  `Borrar_comentario` varchar(45) DEFAULT NULL,
  `ID_Usuario_registrado` int NOT NULL,
  `ID_ Usuario_anónimo` int NOT NULL,
  `ID_ Noticia` int NOT NULL,
  `ID_User` int NOT NULL,
  PRIMARY KEY (`idModerador`),
  KEY `fkey_id_Noticia_idx` (`ID_ Noticia`),
  KEY `fk_id_Usuario_registrado_idx` (`ID_Usuario_registrado`),
  KEY `fk_id_Usuario_anonimo_idx` (`ID_ Usuario_anónimo`),
  KEY `fkey_iduser_idx` (`ID_User`),
  CONSTRAINT `fk_id_Usuario_anonimo` FOREIGN KEY (`ID_ Usuario_anónimo`) REFERENCES `usuario_anonimo` (`id_usuario_Anonimo`),
  CONSTRAINT `fk_id_Usuario_registrado` FOREIGN KEY (`ID_Usuario_registrado`) REFERENCES `usuario_registrado` (`id_Usuario_Registrado`),
  CONSTRAINT `fkey_id_Noticia` FOREIGN KEY (`ID_ Noticia`) REFERENCES `noticia` (`idNoticia`),
  CONSTRAINT `fkey_iduser` FOREIGN KEY (`ID_User`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderador`
--

LOCK TABLES `moderador` WRITE;
/*!40000 ALTER TABLE `moderador` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticia`
--

DROP TABLE IF EXISTS `noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticia` (
  `idNoticia` int NOT NULL AUTO_INCREMENT,
  `Comentario` varchar(45) DEFAULT NULL,
  `Titulo` varchar(45) NOT NULL,
  PRIMARY KEY (`idNoticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia`
--

LOCK TABLES `noticia` WRITE;
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagina_web`
--

DROP TABLE IF EXISTS `pagina_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagina_web` (
  `idPagina_web` int NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(45) NOT NULL,
  `ID_Noticia` int DEFAULT NULL,
  PRIMARY KEY (`idPagina_web`),
  KEY `foreingk_idNoticia_idx` (`ID_Noticia`),
  CONSTRAINT `foreingk_idNoticia` FOREIGN KEY (`ID_Noticia`) REFERENCES `noticia` (`idNoticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagina_web`
--

LOCK TABLES `pagina_web` WRITE;
/*!40000 ALTER TABLE `pagina_web` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagina_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apodo` varchar(45) DEFAULT 'Anonimo',
  `Contraseña` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_anonimo`
--

DROP TABLE IF EXISTS `usuario_anonimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_anonimo` (
  `id_usuario_Anonimo` int NOT NULL AUTO_INCREMENT,
  `Nombre_provicional` varchar(45) DEFAULT 'Anonimo',
  `id_Noticia` int NOT NULL,
  PRIMARY KEY (`id_usuario_Anonimo`),
  KEY `fk_idNoticia_idx` (`id_Noticia`),
  KEY `fk_idNoticia` (`id_Noticia`),
  CONSTRAINT `fk_id_Noticia` FOREIGN KEY (`id_Noticia`) REFERENCES `noticia` (`idNoticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_anonimo`
--

LOCK TABLES `usuario_anonimo` WRITE;
/*!40000 ALTER TABLE `usuario_anonimo` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_anonimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_registrado`
--

DROP TABLE IF EXISTS `usuario_registrado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_registrado` (
  `id_Usuario_Registrado` int NOT NULL AUTO_INCREMENT,
  `id_Noticia` int NOT NULL,
  `ID_User` int NOT NULL,
  `Perfil` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Usuario_Registrado`),
  KEY `fk_idNoticia_idx` (`id_Noticia`),
  KEY `fkey_id_user_idx` (`ID_User`),
  CONSTRAINT `fk_idNoticia` FOREIGN KEY (`id_Noticia`) REFERENCES `noticia` (`idNoticia`),
  CONSTRAINT `fkey_id_user` FOREIGN KEY (`ID_User`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_registrado`
--

LOCK TABLES `usuario_registrado` WRITE;
/*!40000 ALTER TABLE `usuario_registrado` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_registrado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-08  9:46:03
