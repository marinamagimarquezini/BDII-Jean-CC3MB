-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pecas` (
  `id_Pecas` INT NOT NULL AUTO_INCREMENT,
  `custo_peca` INT NULL,
  `nome_peca` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Pecas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `cpf_Cliente` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `nome_cliente` VARCHAR(45) NULL,
  PRIMARY KEY (`cpf_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mecanico` (
  `idMecanico` INT NOT NULL AUTO_INCREMENT,
  `nome_Mecanico` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMecanico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fatura_serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fatura_serviço` (
  `id_Fatura_serviço` INT NOT NULL AUTO_INCREMENT,
  `Pecas_id_Pecas` INT NOT NULL,
  `Mecanico_idMecanico` INT NOT NULL,
  `Cliente_cpf_Cliente` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(10) NULL,
  `descricao` VARCHAR(90) NULL,
  `n_horas` INT NULL,
  `data` DATE NULL,
  `custo_total` BIGINT NULL,
  PRIMARY KEY (`id_Fatura_serviço`, `Peças_id_Peças`, `Mecanico_idMecanico`, `Cliente_cpf_Cliente`),
  INDEX `fk_Fatura_serviço_Peças_idx` (`Peças_id_Peças` ASC) VISIBLE,
  INDEX `fk_Fatura_serviço_Cliente1_idx` (`Cliente_cpf_Cliente` ASC) VISIBLE,
  INDEX `fk_Fatura_serviço_Mecanico1_idx` (`Mecanico_idMecanico` ASC) VISIBLE,
  CONSTRAINT `fk_Fatura_serviço_Peças`
    FOREIGN KEY (`Peças_id_Peças`)
    REFERENCES `Peças` (`id_Peças`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fatura_serviço_Cliente1`
    FOREIGN KEY (`Cliente_cpf_Cliente`)
    REFERENCES `Cliente` (`cpf_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fatura_serviço_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veiculo` (
  `placa_veiculo` VARCHAR(10) NOT NULL,
  `Cliente_cpf_Cliente` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NULL,
  `cor` VARCHAR(45) NULL,
  PRIMARY KEY (`placa_veiculo`, `Cliente_cpf_Cliente`),
  INDEX `fk_Veiculo_Cliente1_idx` (`Cliente_cpf_Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Cliente1`
    FOREIGN KEY (`Cliente_cpf_Cliente`)
    REFERENCES `Cliente` (`cpf_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Recepcionista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recepcionista` (
  `id_Recepcionista` INT NOT NULL AUTO_INCREMENT,
  `nome_recepcionista` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Recepcionista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fatura_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fatura_compra` (
  `id_Fatura_compra` BIGINT NOT NULL AUTO_INCREMENT,
  `Cliente_cpf_Cliente` VARCHAR(45) NOT NULL,
  `Recepcionista_id_Recepcionista` INT NOT NULL,
  `data` DATE NULL,
  PRIMARY KEY (`id_Fatura_compra`, `Cliente_cpf_Cliente`, `Recepcionista_id_Recepcionista`),
  INDEX `fk_Fatura_compra_Cliente1_idx` (`Cliente_cpf_Cliente` ASC) VISIBLE,
  INDEX `fk_Fatura_compra_Recepcionista1_idx` (`Recepcionista_id_Recepcionista` ASC) VISIBLE,
  CONSTRAINT `fk_Fatura_compra_Cliente1`
    FOREIGN KEY (`Cliente_cpf_Cliente`)
    REFERENCES `Cliente` (`cpf_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fatura_compra_Recepcionista1`
    FOREIGN KEY (`Recepcionista_id_Recepcionista`)
    REFERENCES `Recepcionista` (`id_Recepcionista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
