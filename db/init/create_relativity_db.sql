-- MySQL Workbench Synchronization
-- Generated: 2016-05-01 20:15
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Tyler Carney

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `RelativityDB` DEFAULT CHARACTER SET latin5 ;

CREATE TABLE IF NOT EXISTS `RelativityDB`.`Entities` (
  `ID` BIGINT(64) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID number for all objects in system',
  `Created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'This may be a bad idea, but perhaps not.  The idea is to provide a universally unique identifier that is generic… think “object”. Build a table that pairs those numbers and you can describe relationships of a particular type.  Is that actually better then just referencing different tables in the relationship table?  How can you keep it descriptive without being limiting and without unraveling?  Hmm… TODO.',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin5
COMMENT = 'Root nodes for all objects in system. Associated objects and relationships will be implemented in other tables based off of entries in this one. This generic collection will help tie together all possible permutations of the other structures to have a common set of identifiers through which to interact.  This table also hosts global metadata fields that apply to all objects.'
PACK_KEYS = Default;

CREATE TABLE IF NOT EXISTS `RelativityDB`.`Queries` (
  `EntityID` BIGINT(64) UNSIGNED NOT NULL,
  `Type` BIGINT(64) UNSIGNED NOT NULL,
  `Query` BLOB NULL DEFAULT NULL,
  `Response` BLOB NULL DEFAULT NULL,
  INDEX `EntityID_idx` (`EntityID` ASC),
  UNIQUE INDEX `EntityID_UNIQUE` (`EntityID` ASC),
  PRIMARY KEY (`EntityID`),
  INDEX `QueriesQueryType_idx` (`Type` ASC),
  CONSTRAINT `fkQueriesEntityID`
    FOREIGN KEY (`EntityID`)
    REFERENCES `RelativityDB`.`Entities` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkQueriesQueryType`
    FOREIGN KEY (`Type`)
    REFERENCES `RelativityDB`.`QueryTypes` (`EntityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin5
COMMENT = 'Queries we\'ve made.  Type field allows to extend to other related tables via shared EntityID.';

CREATE TABLE IF NOT EXISTS `RelativityDB`.`QueryTypes` (
  `EntityID` BIGINT(64) UNSIGNED NOT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `exec` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`EntityID`),
  INDEX `EntityID_idx` (`EntityID` ASC),
  CONSTRAINT `fkQueryTypesEntityID`
    FOREIGN KEY (`EntityID`)
    REFERENCES `RelativityDB`.`Entities` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin5;


CREATE TABLE IF NOT EXISTS `RelativityDB`.`IPv4Addr` (
  `EntityID` BIGINT(64) UNSIGNED NOT NULL,
  `Addr` BINARY(4) NULL DEFAULT NULL,
  PRIMARY KEY (`EntityID`),
  INDEX `EntityID_idx` (`EntityID` ASC),
  UNIQUE INDEX `EntityID_UNIQUE` (`EntityID` ASC),
  CONSTRAINT `fkIPv4AddrEntityID`
    FOREIGN KEY (`EntityID`)
    REFERENCES `RelativityDB`.`Entities` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin5
COMMENT = 'Queries we\'ve made.  Type field allows to extend to other related tables via shared EntityID.';

CREATE TABLE IF NOT EXISTS `RelativityDB`.`IPv6Addr` (
  `EntityID` BIGINT(64) UNSIGNED NOT NULL,
  `Addr` BINARY(16) NULL DEFAULT NULL,
  PRIMARY KEY (`EntityID`),
  INDEX `EntityID_idx` (`EntityID` ASC),
  UNIQUE INDEX `EntityID_UNIQUE` (`EntityID` ASC),
  CONSTRAINT `fkIPv6AddrEntityID`
    FOREIGN KEY (`EntityID`)
    REFERENCES `RelativityDB`.`Entities` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin5
COMMENT = 'Queries we\'ve made.  Type field allows to extend to other related tables via shared EntityID.';

CREATE TABLE IF NOT EXISTS `RelativityDB`.`Domain` (
  `EntityID` BIGINT(64) UNSIGNED NOT NULL,
  `Name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`EntityID`),
  INDEX `EntityID_idx` (`EntityID` ASC),
  UNIQUE INDEX `EntityID_UNIQUE` (`EntityID` ASC),
  CONSTRAINT `fkDomainEntityID`
    FOREIGN KEY (`EntityID`)
    REFERENCES `RelativityDB`.`Entities` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin5
COMMENT = 'Queries we\'ve made.  Type field allows to extend to other related tables via shared EntityID.';

CREATE TABLE IF NOT EXISTS `RelativityDB`.`Hostname` (
  `EntityID` BIGINT(64) UNSIGNED NOT NULL,
  `Name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`EntityID`),
  INDEX `EntityID_idx` (`EntityID` ASC),
  UNIQUE INDEX `EntityID_UNIQUE` (`EntityID` ASC),
  CONSTRAINT `fkHostnameEntityID`
    FOREIGN KEY (`EntityID`)
    REFERENCES `RelativityDB`.`Entities` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin5
COMMENT = 'Queries we\'ve made.  Type field allows to extend to other related tables via shared EntityID.';

CREATE TABLE IF NOT EXISTS `RelativityDB`.`URL` (
  `EntityID` BIGINT(64) UNSIGNED NOT NULL,
  `Name` VARCHAR(1024) NULL DEFAULT NULL,
  PRIMARY KEY (`EntityID`),
  INDEX `EntityID_idx` (`EntityID` ASC),
  UNIQUE INDEX `EntityID_UNIQUE` (`EntityID` ASC),
  CONSTRAINT `fkURLEntityID`
    FOREIGN KEY (`EntityID`)
    REFERENCES `RelativityDB`.`Entities` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin5
COMMENT = 'Queries we\'ve made.  Type field allows to extend to other related tables via shared EntityID.';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
