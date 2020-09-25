use concecionaria;

desc pessoa;
desc cliente;

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `interesse` varchar(45) DEFAULT NULL,
  `credito` decimal(5,0) DEFAULT NULL,
  `pessoa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_pessoa` (`pessoa`),
  CONSTRAINT `fk_pessoa` FOREIGN KEY (`pessoa`) REFERENCES `pessoa` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `pessoa` (
  `id_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nomel` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cpfcnpj` varchar(45) DEFAULT NULL,
  `status` char(1) DEFAULT 'A' COMMENT 'A - Ativo | C - Caloteiro | S - Suspenso | I - Inativo',
  PRIMARY KEY (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
