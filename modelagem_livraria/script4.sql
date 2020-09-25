CREATE TABLE `livraria` (
  `idlivraria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ano_fundacao` date NOT NULL,
  `estado` varchar(150) NOT NULL,
  `cidade` varchar(150) NOT NULL,
  `bairro` varchar(150) NOT NULL,
  PRIMARY KEY (`idlivraria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `afilial` (
  `idafilial` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_afilial` varchar(45) NOT NULL,
  `ano_fundacao` date NOT NULL,
  `cod_livraria` int(11) NOT NULL,
  PRIMARY KEY (`idafilial`),
  KEY `fk_codigo_livraria` (`cod_livraria`),
  CONSTRAINT `fk_codigo_livraria`
  FOREIGN KEY (`cod_livraria`) REFERENCES `livraria` (`idlivraria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





