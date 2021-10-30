/*
SQLyog Ultimate v8.55 
MySQL - 8.0.18 : Database - lasaintebible_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lasaintebible_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `lasaintebible_db`;

/*Table structure for table `bc_bookmarks` */

DROP TABLE IF EXISTS `bc_bookmarks`;

CREATE TABLE `bc_bookmarks` (
  `idUser` int(11) NOT NULL,
  `bookOsis` varchar(20) NOT NULL,
  `verse` text NOT NULL,
  `colorMarkerId` int(11) DEFAULT '0',
  `dateCreated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `bc_chaptersread` */

DROP TABLE IF EXISTS `bc_chaptersread`;

CREATE TABLE `bc_chaptersread` (
  `idUser` int(11) NOT NULL,
  `bookOsis` varchar(20) DEFAULT NULL,
  `chapitre` int(11) DEFAULT NULL,
  `groupeId` int(11) DEFAULT NULL COMMENT '0=AT; 1=NT',
  `dateCreated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `bc_notes` */

DROP TABLE IF EXISTS `bc_notes`;

CREATE TABLE `bc_notes` (
  `idUser` int(11) NOT NULL,
  `bookOsis` varchar(20) NOT NULL,
  `verse` text NOT NULL,
  `noteUnformated` text NOT NULL,
  `colorMarkerId` int(11) DEFAULT '0',
  `dateCreated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `bc_plandelecture` */

DROP TABLE IF EXISTS `bc_plandelecture`;

CREATE TABLE `bc_plandelecture` (
  `isPublic` int(11) DEFAULT '0',
  `idUser` int(11) NOT NULL,
  `codeLecture` varchar(100) NOT NULL,
  `isImageNetworkBg` int(11) DEFAULT NULL,
  `imageBg` text,
  `bookIdDebut` varchar(100) DEFAULT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `sousTitre` varchar(100) DEFAULT NULL,
  `groupe` varchar(100) DEFAULT NULL,
  `nbrJours` int(11) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `isNotificationActive` int(11) DEFAULT NULL,
  `timeNotificationActive` time DEFAULT NULL,
  `dateSync` datetime DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `bc_plandelecturechapread` */

DROP TABLE IF EXISTS `bc_plandelecturechapread`;

CREATE TABLE `bc_plandelecturechapread` (
  `idUser` int(11) NOT NULL,
  `codeLecture` varchar(100) NOT NULL,
  `bookOsis` varchar(50) NOT NULL,
  `chapitre` int(11) NOT NULL,
  `dateCreated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `bc_statisticqr` */

DROP TABLE IF EXISTS `bc_statisticqr`;

CREATE TABLE `bc_statisticqr` (
  `idUser` int(11) NOT NULL,
  `nbrQuestion` int(11) DEFAULT NULL,
  `nbrReponseCorrect` int(11) DEFAULT NULL,
  `nbrReponseInCorrect` int(11) DEFAULT NULL,
  `dateLastUpdate` datetime DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `quiz_forms` */

DROP TABLE IF EXISTS `quiz_forms`;

CREATE TABLE `quiz_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `formName` varchar(100) NOT NULL,
  `resumeForm` text,
  `dureeEnSeconde` int(11) DEFAULT NULL,
  `minuteurActiveYN` int(11) DEFAULT '1',
  `activeYN` int(11) DEFAULT '1',
  `dateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `quiz_formsquestions` */

DROP TABLE IF EXISTS `quiz_formsquestions`;

CREATE TABLE `quiz_formsquestions` (
  `idForms` int(11) NOT NULL,
  `idQuestions` int(11) DEFAULT NULL,
  `ordreQuestion` int(11) DEFAULT NULL,
  `estDebutQuestion` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `quiz_questions` */

DROP TABLE IF EXISTS `quiz_questions`;

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `libelleQuestion` text NOT NULL,
  `detailsQuestion` text,
  `typeQuestion` int(11) DEFAULT NULL,
  `scoreTotal` double DEFAULT NULL,
  `caractereAccepte` int(11) DEFAULT NULL,
  `nbreValeurMinimal` int(11) DEFAULT NULL,
  `nbreCaractereMaximal` int(11) DEFAULT NULL,
  `qPrecedent` varchar(50) DEFAULT NULL,
  `qSuivant` varchar(50) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `quiz_reponses` */

DROP TABLE IF EXISTS `quiz_reponses`;

CREATE TABLE `quiz_reponses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idQuestions` int(11) NOT NULL,
  `libelleReponse` varchar(255) NOT NULL,
  `isCorrect` int(11) DEFAULT '0',
  `scoreTotal` double DEFAULT '0',
  `estEnfant` int(11) DEFAULT '0',
  `avoirEnfant` int(11) DEFAULT '0',
  `codeParent` varchar(55) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `quiz_resultat` */

DROP TABLE IF EXISTS `quiz_resultat`;

CREATE TABLE `quiz_resultat` (
  `idUser` int(11) NOT NULL,
  `idForms` int(11) NOT NULL,
  `scoreResult` double DEFAULT NULL,
  `scoreFinal` double DEFAULT NULL,
  `mention` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `quiz_resultatdetails` */

DROP TABLE IF EXISTS `quiz_resultatdetails`;

CREATE TABLE `quiz_resultatdetails` (
  `idUser` int(11) NOT NULL,
  `idForms` int(11) NOT NULL,
  `idQuestions` int(11) NOT NULL,
  `idReponses` int(11) NOT NULL,
  `reponseEntree` text,
  `Score` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `quiz_shared` */

DROP TABLE IF EXISTS `quiz_shared`;

CREATE TABLE `quiz_shared` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idForms` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idUserCreator` int(11) NOT NULL,
  `isRead` int(11) DEFAULT '0',
  `statut` int(11) DEFAULT '0' COMMENT '0=Nothing; 1=Accepted; 2=Refuse',
  `dateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `utilisateurs` */

DROP TABLE IF EXISTS `utilisateurs`;

CREATE TABLE `utilisateurs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photoPath` text,
  `userName` varchar(100) NOT NULL,
  `motDePasse` varchar(100) NOT NULL,
  `nomComplet` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `activeYN` int(11) DEFAULT '1',
  `idAppFireBase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `idFirebaseToken` text,
  `lastLogin` datetime DEFAULT NULL,
  `connecterYN` int(11) DEFAULT '0',
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
