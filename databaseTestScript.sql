-- MySQL Script generated by MySQL Workbench
-- Mon Nov 20 19:38:37 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema conushop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `conushop` ;

-- -----------------------------------------------------
-- Schema conushop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `conushop` DEFAULT CHARACTER SET utf8 ;
USE `conushop` ;

-- -----------------------------------------------------
-- Table `conushop`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `conushop`.`User` ;

CREATE TABLE IF NOT EXISTS `conushop`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `phone` VARCHAR(25) NULL,
  `admin` TINYINT NULL,
  `physicalAddress` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `remember_token` VARCHAR(100) NULL,
  `isDeleted` TINYINT NULL,
  `isLoggedIn` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conushop`.`ElectronicType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `conushop`.`ElectronicType` ;

CREATE TABLE IF NOT EXISTS `conushop`.`ElectronicType` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `dimensionUnit` VARCHAR(45) NULL,
  `screenSizeUnit` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conushop`.`ElectronicSpecification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `conushop`.`ElectronicSpecification` ;

CREATE TABLE IF NOT EXISTS `conushop`.`ElectronicSpecification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dimension` VARCHAR(45) NULL,
  `weight` FLOAT NULL,
  `modelNumber` VARCHAR(45) NULL,
  `brandName` VARCHAR(45) NULL,
  `hdSize` VARCHAR(25) NULL,
  `price` VARCHAR(45) NULL,
  `processorType` VARCHAR(45) NULL,
  `ramSize` VARCHAR(45) NULL,
  `cpuCores` INT NULL,
  `batteryInfo` VARCHAR(45) NULL,
  `os` VARCHAR(45) NULL,
  `camera` TINYINT NULL,
  `touchScreen` TINYINT NULL,
  `ElectronicType_id` INT NULL,
  `displaySize` DOUBLE(5,1) NULL,
  `image` VARCHAR(45) NULL,
  `isDeleted` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Electronic_ElectronicType_idx` (`ElectronicType_id` ASC),
  CONSTRAINT `fk_Electronic_ElectronicType`
    FOREIGN KEY (`ElectronicType_id`)
    REFERENCES `conushop`.`ElectronicType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conushop`.`Payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `conushop`.`Payment` ;

CREATE TABLE IF NOT EXISTS `conushop`.`Payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conushop`.`Sale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `conushop`.`Sale` ;

CREATE TABLE IF NOT EXISTS `conushop`.`Sale` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `User_id` INT NOT NULL,
  `isComplete` VARCHAR(45) NULL,
  `timestamp` VARCHAR(45) NULL,
  `Payment_id` INT NULL,
  INDEX `fk_Sale_User1_idx` (`User_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_Sale_Payment1_idx` (`Payment_id` ASC),
  CONSTRAINT `fk_Sale_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `conushop`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sale_Payment1`
    FOREIGN KEY (`Payment_id`)
    REFERENCES `conushop`.`Payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conushop`.`ElectronicItem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `conushop`.`ElectronicItem` ;

CREATE TABLE IF NOT EXISTS `conushop`.`ElectronicItem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ElectronicSpecification_id` INT NULL,
  `serialNumber` VARCHAR(45) NULL,
  `User_id` INT NULL,
  `expiryForUser` DATETIME NULL,
  `Sale_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Item_Electronic1_idx` (`ElectronicSpecification_id` ASC),
  INDEX `fk_ElectronicItem_User1_idx` (`User_id` ASC),
  INDEX `fk_ElectronicItem_Sale1_idx` (`Sale_id` ASC),
  CONSTRAINT `fk_Item_Electronic1`
    FOREIGN KEY (`ElectronicSpecification_id`)
    REFERENCES `conushop`.`ElectronicSpecification` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ElectronicItem_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `conushop`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ElectronicItem_Sale1`
    FOREIGN KEY (`Sale_id`)
    REFERENCES `conushop`.`Sale` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conushop`.`LoginLog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `conushop`.`LoginLog` ;

CREATE TABLE IF NOT EXISTS `conushop`.`LoginLog` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_LoginLog_User1_idx` (`User_id` ASC),
  CONSTRAINT `fk_LoginLog_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `conushop`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- INSERT
-- -----------------------------------------------------
REPLACE INTO ElectronicType (id, name) values (1, "Desktop");
REPLACE INTO ElectronicType (id, name) values (2, "Laptop");
REPLACE INTO ElectronicType (id, name) values (3, "Monitor");
REPLACE INTO ElectronicType (id, name) values (4, "Tablet");
/**REPLACE INTO ElectronicType (id, name) values (5, "Television");**/

REPLACE INTO User (id, email, password, admin, isDeleted, isLoggedIn) values (1, 'admin1@conushop.com', '$2y$10$wwTY.Z0ROcEgdQLlGAYuSOOGtEbm9JMo887OtiHQdgpV6h6LFhMqO', 1, 0, 0);
REPLACE INTO User (id, email, password, admin, isDeleted, isLoggedIn) values (2, 'admin2@conushop.com', '$2y$10$wwTY.Z0ROcEgdQLlGAYuSOOGtEbm9JMo887OtiHQdgpV6h6LFhMqO', 1,  0, 0);
REPLACE INTO User (id, email, password, admin, isDeleted, isLoggedIn) values (3, 'admin3@conushop.com', '$2y$10$wwTY.Z0ROcEgdQLlGAYuSOOGtEbm9JMo887OtiHQdgpV6h6LFhMqO', 1,  0, 0);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
