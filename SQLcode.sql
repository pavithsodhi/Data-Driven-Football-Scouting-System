-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema final_dbms_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema final_dbms_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `final_dbms_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `final_dbms_project` ;

-- -----------------------------------------------------
-- Table `final_dbms_project`.`team_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_dbms_project`.`team_table` (
  `Team_ID` INT NOT NULL,
  `Team` VARCHAR(100) NULL DEFAULT NULL,
  `Comp` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`Team_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `final_dbms_project`.`player_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_dbms_project`.`player_table` (
  `Player_ID` INT NOT NULL,
  `Player` VARCHAR(100) NULL DEFAULT NULL,
  `Nation` VARCHAR(100) NULL DEFAULT NULL,
  `Pos` VARCHAR(100) NULL DEFAULT NULL,
  `Team_ID` INT NULL DEFAULT NULL,
  `Age` INT NULL DEFAULT NULL,
  `Born` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Player_ID`),
  INDEX `Team_ID` (`Team_ID` ASC) VISIBLE,
  CONSTRAINT `player_table_ibfk_1`
    FOREIGN KEY (`Team_ID`)
    REFERENCES `final_dbms_project`.`team_table` (`Team_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `final_dbms_project`.`arial_stats_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_dbms_project`.`arial_stats_table` (
  `Player_ID` INT NULL DEFAULT NULL,
  `AerWon` FLOAT NULL DEFAULT NULL,
  `AerLost` FLOAT NULL DEFAULT NULL,
  `AerWon_percent` FLOAT NULL DEFAULT NULL,
  INDEX `Player_ID` (`Player_ID` ASC) VISIBLE,
  CONSTRAINT `arial_stats_table_ibfk_1`
    FOREIGN KEY (`Player_ID`)
    REFERENCES `final_dbms_project`.`player_table` (`Player_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `final_dbms_project`.`defensive_stats_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_dbms_project`.`defensive_stats_table` (
  `Player_ID` INT NULL DEFAULT NULL,
  `TackeledPlayers` FLOAT NULL DEFAULT NULL,
  `TklWon_for_Possession` FLOAT NULL DEFAULT NULL,
  `TklDef3rd` FLOAT NULL DEFAULT NULL,
  `TklMid3rd` FLOAT NULL DEFAULT NULL,
  `TklAtt3rd` FLOAT NULL DEFAULT NULL,
  `Dribblers_Tackeled` FLOAT NULL DEFAULT NULL,
  `Dribblers_Tackeled_percent` FLOAT NULL DEFAULT NULL,
  `TklDriPast` FLOAT NULL DEFAULT NULL,
  `Blocks` FLOAT NULL DEFAULT NULL,
  `BlkSh` FLOAT NULL DEFAULT NULL,
  `BlkPass` FLOAT NULL DEFAULT NULL,
  `Interceptions` FLOAT NULL DEFAULT NULL,
  `Tkl_plus_Int` FLOAT NULL DEFAULT NULL,
  `Clr` FLOAT NULL DEFAULT NULL,
  `Err` FLOAT NULL DEFAULT NULL,
  INDEX `Player_ID` (`Player_ID` ASC) VISIBLE,
  CONSTRAINT `defensive_stats_table_ibfk_1`
    FOREIGN KEY (`Player_ID`)
    REFERENCES `final_dbms_project`.`player_table` (`Player_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `final_dbms_project`.`discipline_stats_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_dbms_project`.`discipline_stats_table` (
  `Player_ID` INT NULL DEFAULT NULL,
  `CrdY` FLOAT NULL DEFAULT NULL,
  `CrdR` FLOAT NULL DEFAULT NULL,
  `Two_CrdY` FLOAT NULL DEFAULT NULL,
  `Fls` FLOAT NULL DEFAULT NULL,
  `FlsDrawn` FLOAT NULL DEFAULT NULL,
  INDEX `Player_ID` (`Player_ID` ASC) VISIBLE,
  CONSTRAINT `discipline_stats_table_ibfk_1`
    FOREIGN KEY (`Player_ID`)
    REFERENCES `final_dbms_project`.`player_table` (`Player_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `final_dbms_project`.`dribbling_stats_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_dbms_project`.`dribbling_stats_table` (
  `Player_ID` INT NULL DEFAULT NULL,
  `TakeOns_Att` FLOAT NULL DEFAULT NULL,
  `TakeOns_Suc` FLOAT NULL DEFAULT NULL,
  `TakeOns_Suc_percent` FLOAT NULL DEFAULT NULL,
  `ToTkl` FLOAT NULL DEFAULT NULL,
  `ToTkl_percent` FLOAT NULL DEFAULT NULL,
  `Carries` FLOAT NULL DEFAULT NULL,
  `CarTotDist` FLOAT NULL DEFAULT NULL,
  `CarPrgDist` FLOAT NULL DEFAULT NULL,
  `CarProg` FLOAT NULL DEFAULT NULL,
  `Car3rd` FLOAT NULL DEFAULT NULL,
  `Miscontrol` FLOAT NULL DEFAULT NULL,
  `Miscontrol_after_tackle` FLOAT NULL DEFAULT NULL,
  INDEX `Player_ID` (`Player_ID` ASC) VISIBLE,
  CONSTRAINT `dribbling_stats_table_ibfk_1`
    FOREIGN KEY (`Player_ID`)
    REFERENCES `final_dbms_project`.`player_table` (`Player_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `final_dbms_project`.`gca_sca_stats_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_dbms_project`.`gca_sca_stats_table` (
  `Player_ID` INT NULL DEFAULT NULL,
  `PassesLeading_to_Shot` FLOAT NULL DEFAULT NULL,
  `Passes_into_final3rd` FLOAT NULL DEFAULT NULL,
  `Crosses_into_the_box` FLOAT NULL DEFAULT NULL,
  `Switch_of_Play` FLOAT NULL DEFAULT NULL,
  `Crosses` FLOAT NULL DEFAULT NULL,
  `Throwins` FLOAT NULL DEFAULT NULL,
  `Corners` FLOAT NULL DEFAULT NULL,
  `InswingCorners` FLOAT NULL DEFAULT NULL,
  `OutswingCorners` FLOAT NULL DEFAULT NULL,
  `Offsides` FLOAT NULL DEFAULT NULL,
  `Shot_Creating_Actions` FLOAT NULL DEFAULT NULL,
  `OpenPlay_Shot_Creating_Passes` FLOAT NULL DEFAULT NULL,
  `DeadBall_Shot_Creating_Passes` FLOAT NULL DEFAULT NULL,
  `Dribbles_Leading_to_Shot` FLOAT NULL DEFAULT NULL,
  `Fouls_drawn_for_Shot` FLOAT NULL DEFAULT NULL,
  `Goal_Creating_Actions` FLOAT NULL DEFAULT NULL,
  `OpenPlay_GCA` FLOAT NULL DEFAULT NULL,
  `DeadBall_GCA` FLOAT NULL DEFAULT NULL,
  `Dribbles_GCA` FLOAT NULL DEFAULT NULL,
  `FoulsDrawn_GCA` FLOAT NULL DEFAULT NULL,
  INDEX `Player_ID` (`Player_ID` ASC) VISIBLE,
  CONSTRAINT `gca_sca_stats_table_ibfk_1`
    FOREIGN KEY (`Player_ID`)
    REFERENCES `final_dbms_project`.`player_table` (`Player_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `final_dbms_project`.`match_stats_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_dbms_project`.`match_stats_table` (
  `Player_ID` INT NULL DEFAULT NULL,
  `MP` FLOAT NULL DEFAULT NULL,
  `Starts` FLOAT NULL DEFAULT NULL,
  `Min` FLOAT NULL DEFAULT NULL,
  `Min_per_90` FLOAT NULL DEFAULT NULL,
  `Goals` FLOAT NULL DEFAULT NULL,
  `Shots` FLOAT NULL DEFAULT NULL,
  `SoT` INT NULL DEFAULT NULL,
  `SoT_percent` FLOAT NULL DEFAULT NULL,
  INDEX `Player_ID` (`Player_ID` ASC) VISIBLE,
  CONSTRAINT `match_stats_table_ibfk_1`
    FOREIGN KEY (`Player_ID`)
    REFERENCES `final_dbms_project`.`player_table` (`Player_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `final_dbms_project`.`passing_stats_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_dbms_project`.`passing_stats_table` (
  `Player_ID` INT NULL DEFAULT NULL,
  `PassesCompleted` INT NULL DEFAULT NULL,
  `PassesAttempted` INT NULL DEFAULT NULL,
  `PassCompleted_percent` FLOAT NULL DEFAULT NULL,
  `PassingDist` FLOAT NULL DEFAULT NULL,
  `Progressive_PassesDist` FLOAT NULL DEFAULT NULL,
  `ShortPasses` INT NULL DEFAULT NULL,
  `ShortPassesAtt` INT NULL DEFAULT NULL,
  `ShortPasses_percent` FLOAT NULL DEFAULT NULL,
  `MediumPasses` INT NULL DEFAULT NULL,
  `MediumPassesAtt` INT NULL DEFAULT NULL,
  `MediumPasses_percent` FLOAT NULL DEFAULT NULL,
  `LongPasses` INT NULL DEFAULT NULL,
  `LongPassesAtt` INT NULL DEFAULT NULL,
  `LongPasses_percent` FLOAT NULL DEFAULT NULL,
  `Assists` INT NULL DEFAULT NULL,
  `PassesLeading_to_Shot` INT NULL DEFAULT NULL,
  `Passes_into_final_3rd` INT NULL DEFAULT NULL,
  INDEX `Player_ID` (`Player_ID` ASC) VISIBLE,
  CONSTRAINT `passing_stats_table_ibfk_1`
    FOREIGN KEY (`Player_ID`)
    REFERENCES `final_dbms_project`.`player_table` (`Player_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `final_dbms_project`.`possession_stats_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_dbms_project`.`possession_stats_table` (
  `Player_ID` INT NULL DEFAULT NULL,
  `Touches` FLOAT NULL DEFAULT NULL,
  `TouDefPen` FLOAT NULL DEFAULT NULL,
  `TouDef3rd` FLOAT NULL DEFAULT NULL,
  `TouMid3rd` FLOAT NULL DEFAULT NULL,
  `TouAtt3rd` FLOAT NULL DEFAULT NULL,
  `TouAttPen` FLOAT NULL DEFAULT NULL,
  INDEX `Player_ID` (`Player_ID` ASC) VISIBLE,
  CONSTRAINT `possession_stats_table_ibfk_1`
    FOREIGN KEY (`Player_ID`)
    REFERENCES `final_dbms_project`.`player_table` (`Player_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `final_dbms_project`.`shot_efficiency_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `final_dbms_project`.`shot_efficiency_table` (
  `Player_ID` INT NULL DEFAULT NULL,
  `G_Sh` FLOAT NULL DEFAULT NULL,
  `G_SoT` FLOAT NULL DEFAULT NULL,
  `ShoDist` FLOAT NULL DEFAULT NULL,
  `Freekicks` FLOAT NULL DEFAULT NULL,
  `PK_scored` FLOAT NULL DEFAULT NULL,
  `PK_attempted` FLOAT NULL DEFAULT NULL,
  INDEX `Player_ID` (`Player_ID` ASC) VISIBLE,
  CONSTRAINT `shot_efficiency_table_ibfk_1`
    FOREIGN KEY (`Player_ID`)
    REFERENCES `final_dbms_project`.`player_table` (`Player_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
