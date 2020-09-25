-- MySQL Workbench Synchronization
-- Generated: 2020-09-16 16:20
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: eneas

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `livraria_boco` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `livraria_boco`.`artigo` (
  `id_artigo` INT(11) NOT NULL AUTO_INCREMENT,
  `tema` VARCHAR(255) NOT NULL,
  `assunto` TEXT NOT NULL,
  `data_publicacao` DATE NOT NULL,
  `autor` VARCHAR(45) NOT NULL,
  `numero_artigo` VARCHAR(10) NOT NULL COMMENT '010 - artigos livraria | 020 - artigos informatica | 030 artigos papelaria',
  PRIMARY KEY (`id_artigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `livraria_boco`.`atendente` (
  `id_atendente` INT(11) NOT NULL AUTO_INCREMENT,
  `setor` VARCHAR(150) NOT NULL,
  `salario` DECIMAL(8,2) NOT NULL,
  `pessoa_livraria` INT(11) NOT NULL,
  PRIMARY KEY (`id_atendente`),
  INDEX `fk_pessoa_livraria_idx` (`pessoa_livraria` ASC) VISIBLE,
  CONSTRAINT `fk_pessoa_livraria`
    FOREIGN KEY (`pessoa_livraria`)
    REFERENCES `livraria_boco`.`pessoa_livraria` (`id_pessoa_livraria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `livraria_boco`.`cliente` (
  `id_cliente` INT(11) NOT NULL AUTO_INCREMENT,
  `necessidade` VARCHAR(255) NOT NULL,
  `satisfacao` VARCHAR(5) NOT NULL,
  `desconto` VARCHAR(5) NOT NULL,
  `atendente` INT(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_id_atendente_idx` (`atendente` ASC) VISIBLE,
  CONSTRAINT `fk_id_atendente`
    FOREIGN KEY (`atendente`)
    REFERENCES `livraria_boco`.`atendente` (`id_atendente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `livraria_boco`.`pessoa_livraria` (
  `id_pessoa_livraria` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(50) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(25) NOT NULL,
  `rg` VARCHAR(25) NOT NULL,
  `data_cadastro` DATE NOT NULL,
  `id_livraria` INT(11) NOT NULL,
  PRIMARY KEY (`id_pessoa_livraria`),
  INDEX `fk_id_livraria_idx` (`id_livraria` ASC) VISIBLE,
  CONSTRAINT `fk_id_livraria`
    FOREIGN KEY (`id_livraria`)
    REFERENCES `livraria_boco`.`livraria` (`idlivraria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `livraria_boco`.`produtos` (
  `idprodutos` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `precco` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`idprodutos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `livraria_boco`.`venda` (
  `id_venda` INT(11) NOT NULL AUTO_INCREMENT,
  `numero_artigo` VARCHAR(10) NOT NULL COMMENT '010 - artigos livraria | 020 - artigos informatica | 030 artigos papelaria',
  `data_venda` DATETIME NOT NULL,
  `quantidade` INT(11) NOT NULL,
  `custo_final` DECIMAL NOT NULL,
  `cliente` INT(11) NOT NULL,
  PRIMARY KEY (`id_venda`),
  INDEX `fk_id_cliente_idx` (`cliente` ASC) VISIBLE,
  CONSTRAINT `fk_id_cliente`
    FOREIGN KEY (`cliente`)
    REFERENCES `livraria_boco`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `livraria_boco`.`promocoes` (
  `id_promocoes` INT(11) NOT NULL AUTO_INCREMENT,
  `periodo_inicial` DATETIME NOT NULL,
  `periodo_final` DATETIME NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `produtos` INT(11) NOT NULL,
  PRIMARY KEY (`id_promocoes`),
  INDEX `fk_id_produtos_idx` (`produtos` ASC) VISIBLE,
  CONSTRAINT `fk_id_produtos`
    FOREIGN KEY (`produtos`)
    REFERENCES `livraria_boco`.`produtos` (`idprodutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `livraria_boco`.`afilial` (
  `id_afilial` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo_afilial` VARCHAR(45) NOT NULL,
  `ano_fundacao` DATE NOT NULL,
  `livraria` INT(11) NOT NULL,
  PRIMARY KEY (`id_afilial`),
  INDEX `fk_id_livraria_idx` (`livraria` ASC) VISIBLE,
  CONSTRAINT `fk_id_livraria`
    FOREIGN KEY (`livraria`)
    REFERENCES `livraria_boco`.`livraria` (`idlivraria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `livraria_boco`.`livraria` (
  `idlivraria` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `ano_fundacao` DATE NOT NULL,
  `estado` VARCHAR(150) NOT NULL,
  `cidade` VARCHAR(150) NOT NULL,
  `bairro` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idlivraria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `livraria_boco`.`artigo_produto` (
  `id_artigo` INT(11) NOT NULL,
  `id_produto` INT(11) NOT NULL,
  `id_artigo_produto` INT(11) NOT NULL AUTO_INCREMENT,
  INDEX `fk_id_artigo_idx` (`id_artigo` ASC) VISIBLE,
  INDEX `fk_id_produto_idx` (`id_produto` ASC) VISIBLE,
  PRIMARY KEY (`id_artigo_produto`),
  CONSTRAINT `fk_id_artigo`
    FOREIGN KEY (`id_artigo`)
    REFERENCES `livraria_boco`.`artigo` (`id_artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_produto`
    FOREIGN KEY (`id_produto`)
    REFERENCES `livraria_boco`.`produtos` (`idprodutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `livraria_boco`.`chamada_cliente` (
  `cliente` INT(11) NOT NULL,
  `artigo_produto` INT(11) NOT NULL,
  INDEX `fk_id_cliente_idx` (`cliente` ASC) VISIBLE,
  INDEX `fk_id_artigo_produto_idx` (`artigo_produto` ASC) VISIBLE,
  CONSTRAINT `fk_id_cliente`
    FOREIGN KEY (`cliente`)
    REFERENCES `livraria_boco`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_artigo_produto`
    FOREIGN KEY (`artigo_produto`)
    REFERENCES `livraria_boco`.`artigo_produto` (`id_artigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
