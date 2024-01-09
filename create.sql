

USE dsci551;


DROP TABLE IF EXISTS `Assist`;
DROP TABLE IF EXISTS `TA`;
DROP TABLE IF EXISTS `Teach`;
DROP TABLE IF EXISTS `Take`;
DROP TABLE IF EXISTS `Instructor`;
DROP TABLE IF EXISTS `Student`;
DROP TABLE IF EXISTS `Course`;


-- dsci551.Course definition
CREATE TABLE `Course` (
  `number` varchar(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `semester` varchar(20) NOT NULL,
  PRIMARY KEY (`number`,`semester`)
) ;


-- dsci551.Student definition

CREATE TABLE `Student` (
  `id` varchar(4) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `program` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Student_CHECK` CHECK (regexp_like(`id`,_utf8mb4's[0-9]{3}'))
) ;


-- dsci551.Instructor definition

CREATE TABLE `Instructor` (
  `id` varchar(4) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Instructor_CHECK` CHECK (regexp_like(`id`,_utf8mb4'i[0-9]{3}'))
) ;


-- dsci551.Take definition

CREATE TABLE `Take` (
  `sid` varchar(4) NOT NULL,
  `cno` varchar(20) NOT NULL,
  `semester` varchar(20) NOT NULL,
  PRIMARY KEY (`sid`,`cno`,`semester`),
  KEY `Take_FK_1` (`cno`,`semester`),
  CONSTRAINT `Take_FK` FOREIGN KEY (`sid`) REFERENCES `Student` (`id`),
  CONSTRAINT `Take_FK_1` FOREIGN KEY (`cno`,`semester`) REFERENCES `Course` (`number`,`semester`)
) ;


-- dsci551.Teach definition

CREATE TABLE `Teach` (
  `rid` varchar(4) NOT NULL,
  `cno` varchar(20) NOT NULL,
  `semester` varchar(20) NOT NULL,
  PRIMARY KEY (`rid`,`cno`,`semester`),
  KEY `Teach_FK_1` (`cno`,`semester`),
  CONSTRAINT `Teach_FK` FOREIGN KEY (`rid`) REFERENCES `Instructor` (`id`),
  CONSTRAINT `Teach_FK_1` FOREIGN KEY (`cno`,`semester`) REFERENCES `Course` (`number`,`semester`)
);


-- dsci551.TA definition

CREATE TABLE `TA` (
  `sid` varchar(4) NOT NULL,
  `hours` int DEFAULT NULL,
  PRIMARY KEY (`sid`),
  CONSTRAINT `TA_FK` FOREIGN KEY (`sid`) REFERENCES `Student` (`id`)
) ;


-- dsci551.Assist definition

CREATE TABLE `Assist` (
  `sid` varchar(4) NOT NULL,
  `cno` varchar(20) NOT NULL,
  `semester` varchar(20) NOT NULL,
  PRIMARY KEY (`sid`,`cno`,`semester`),
  KEY `Assist_FK_1` (`cno`,`semester`),
  CONSTRAINT `Assist_FK` FOREIGN KEY (`sid`) REFERENCES `TA` (`sid`),
  CONSTRAINT `Assist_FK_1` FOREIGN KEY (`cno`,`semester`) REFERENCES `Course` (`number`,`semester`)
) ;