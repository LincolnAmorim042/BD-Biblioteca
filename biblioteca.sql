-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: BIBLIOTECA
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.7-MariaDB-1:10.4.7+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ALUNO`
--

DROP TABLE IF EXISTS `ALUNO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ALUNO` (
  `cpf_aluno` varchar(11) DEFAULT NULL,
  `rga` varchar(5) NOT NULL,
  `curso` varchar(20) DEFAULT NULL,
  `setor_curso` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rga`),
  KEY `cpf_aluno` (`cpf_aluno`),
  CONSTRAINT `ALUNO_ibfk_1` FOREIGN KEY (`cpf_aluno`) REFERENCES `LEITOR` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALUNO`
--

LOCK TABLES `ALUNO` WRITE;
/*!40000 ALTER TABLE `ALUNO` DISABLE KEYS */;
INSERT INTO `ALUNO` VALUES ('76934899083','34151','LETRAS','Humanas'),('68229005001','35151','BIOTECNOLOGIA','Biologicas'),('49556621881','41431','COMPUTACAO','Exatas'),('01237193052','41441','MATEMATICA','Exatas'),('90802036023','45151','FILOSOFIA','Humanas');
/*!40000 ALTER TABLE `ALUNO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSUNTO`
--

DROP TABLE IF EXISTS `ASSUNTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSUNTO` (
  `nm_assunto` varchar(20) NOT NULL,
  `descricao` varchar(144) DEFAULT NULL,
  `nm_autor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nm_assunto`),
  KEY `idx_ASSUNTO_NOME` (`nm_assunto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSUNTO`
--

LOCK TABLES `ASSUNTO` WRITE;
/*!40000 ALTER TABLE `ASSUNTO` DISABLE KEYS */;
INSERT INTO `ASSUNTO` VALUES ('Comedia','Dois homens perdidos em um circo','Jô Soares'),('Misterio','Duas criancas desaparecem de maneira misteriosa','Maria Semple'),('Romance','Morre no final','Jonh Green'),('Terror','Palhaços a solta','Stephen King'),('Tragedia','Um casal apaixonado que nao podem ficar juntos','Agatha Christie');
/*!40000 ALTER TABLE `ASSUNTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSUNTO_LEITOR`
--

DROP TABLE IF EXISTS `ASSUNTO_LEITOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSUNTO_LEITOR` (
  `nomeale` varchar(20) NOT NULL,
  `cpfale` varchar(11) NOT NULL,
  PRIMARY KEY (`nomeale`,`cpfale`),
  KEY `cpfale` (`cpfale`),
  CONSTRAINT `ASSUNTO_LEITOR_ibfk_1` FOREIGN KEY (`nomeale`) REFERENCES `EDITORA` (`nome_editora`),
  CONSTRAINT `ASSUNTO_LEITOR_ibfk_2` FOREIGN KEY (`cpfale`) REFERENCES `LEITOR` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSUNTO_LEITOR`
--

LOCK TABLES `ASSUNTO_LEITOR` WRITE;
/*!40000 ALTER TABLE `ASSUNTO_LEITOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSUNTO_LEITOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOR`
--

DROP TABLE IF EXISTS `AUTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOR` (
  `nome_autor` varchar(20) NOT NULL,
  `pais` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nome_autor`),
  KEY `idx_AUTOR_NOME` (`nome_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOR`
--

LOCK TABLES `AUTOR` WRITE;
/*!40000 ALTER TABLE `AUTOR` DISABLE KEYS */;
INSERT INTO `AUTOR` VALUES ('Agatha Christie','INGLATERRA'),('J. R. R. Tolkien','INGLATERRA'),('Jonh Green','ESTADOS UNIDOS'),('Machado de Assis','BRASIL'),('Stephenie Meyer','ESTADOS UNIDOS');
/*!40000 ALTER TABLE `AUTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOR_LIVRO`
--

DROP TABLE IF EXISTS `AUTOR_LIVRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOR_LIVRO` (
  `nomeali` varchar(20) NOT NULL,
  `codigoali` int(5) NOT NULL,
  PRIMARY KEY (`nomeali`,`codigoali`),
  KEY `codigoali` (`codigoali`),
  CONSTRAINT `AUTOR_LIVRO_ibfk_1` FOREIGN KEY (`nomeali`) REFERENCES `AUTOR` (`nome_autor`),
  CONSTRAINT `AUTOR_LIVRO_ibfk_2` FOREIGN KEY (`codigoali`) REFERENCES `LIVRO` (`codigo_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOR_LIVRO`
--

LOCK TABLES `AUTOR_LIVRO` WRITE;
/*!40000 ALTER TABLE `AUTOR_LIVRO` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTOR_LIVRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BIBLIOTECARIO`
--

DROP TABLE IF EXISTS `BIBLIOTECARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BIBLIOTECARIO` (
  `cpf_bibliotecario` varchar(11) DEFAULT NULL,
  `num_matricula` varchar(5) NOT NULL,
  PRIMARY KEY (`num_matricula`),
  KEY `cpf_bibliotecario` (`cpf_bibliotecario`),
  CONSTRAINT `BIBLIOTECARIO_ibfk_1` FOREIGN KEY (`cpf_bibliotecario`) REFERENCES `LEITOR` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BIBLIOTECARIO`
--

LOCK TABLES `BIBLIOTECARIO` WRITE;
/*!40000 ALTER TABLE `BIBLIOTECARIO` DISABLE KEYS */;
INSERT INTO `BIBLIOTECARIO` VALUES ('20641704054','41458'),('29768153059','41459'),('35431970020','41457'),('44674818001','41461'),('93604776058','41460');
/*!40000 ALTER TABLE `BIBLIOTECARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHEFE`
--

DROP TABLE IF EXISTS `CHEFE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHEFE` (
  `cpf_chefe` varchar(11) DEFAULT NULL,
  `num_matricula` varchar(5) NOT NULL,
  `sigla_unidade` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`num_matricula`),
  KEY `cpf_chefe` (`cpf_chefe`),
  CONSTRAINT `CHEFE_ibfk_1` FOREIGN KEY (`cpf_chefe`) REFERENCES `LEITOR` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHEFE`
--

LOCK TABLES `CHEFE` WRITE;
/*!40000 ALTER TABLE `CHEFE` DISABLE KEYS */;
INSERT INTO `CHEFE` VALUES ('94401261089','41449','GG'),('53620902089','41450','GC'),('88692520004','41451','CC'),('06994623041','41452','CG'),('57551769064','41453','HG');
/*!40000 ALTER TABLE `CHEFE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIRETOR`
--

DROP TABLE IF EXISTS `DIRETOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DIRETOR` (
  `cpf_diretor` varchar(11) DEFAULT NULL,
  `num_matricula` varchar(5) NOT NULL,
  `sigla_setor` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`num_matricula`),
  KEY `cpf_diretor` (`cpf_diretor`),
  CONSTRAINT `DIRETOR_ibfk_1` FOREIGN KEY (`cpf_diretor`) REFERENCES `LEITOR` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIRETOR`
--

LOCK TABLES `DIRETOR` WRITE;
/*!40000 ALTER TABLE `DIRETOR` DISABLE KEYS */;
INSERT INTO `DIRETOR` VALUES ('64385292060','41452','PO'),('72038537054','41453','OG'),('93223361022','41454','SS'),('53252910098','41455','SR'),('67249582020','41456','SE');
/*!40000 ALTER TABLE `DIRETOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDITORA`
--

DROP TABLE IF EXISTS `EDITORA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDITORA` (
  `nome_editora` varchar(20) NOT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `nm_bairro` varchar(20) DEFAULT NULL,
  `nm_rua` varchar(20) DEFAULT NULL,
  `nr_cep` int(11) DEFAULT NULL,
  `nr_endereco` int(4) DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nome_editora`),
  KEY `idx_EDITORA_NOME` (`nome_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDITORA`
--

LOCK TABLES `EDITORA` WRITE;
/*!40000 ALTER TABLE `EDITORA` DISABLE KEYS */;
INSERT INTO `EDITORA` VALUES ('Aleph','Rest. Ilha Bela','Ponta da Praia','Canal 6',11025035,110,'BRASIL'),('Casa do Codigo','Shopping Aricanduva','Oscar Freire','Av. Paulista',11025010,300,'BRASIL'),('Darkside','Prox a Casas Bahia','Gopouva','Av. Pedro Wilson',1173000,1750,'BRASIL'),('FTD','Prox ao MASP','Madureira','Rua 110',1348759614,21,'BRASIL'),('Rocco','Restaurante Paris 6','Aparecida','Pedro Lessa',11025000,210,'BRASIL');
/*!40000 ALTER TABLE `EDITORA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDITORA_AUTOR`
--

DROP TABLE IF EXISTS `EDITORA_AUTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDITORA_AUTOR` (
  `nomeeea` varchar(20) NOT NULL,
  `nomeaea` varchar(20) NOT NULL,
  PRIMARY KEY (`nomeeea`,`nomeaea`),
  CONSTRAINT `EDITORA_AUTOR_ibfk_1` FOREIGN KEY (`nomeeea`) REFERENCES `EDITORA` (`nome_editora`),
  CONSTRAINT `EDITORA_AUTOR_ibfk_2` FOREIGN KEY (`nomeeea`) REFERENCES `AUTOR` (`nome_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDITORA_AUTOR`
--

LOCK TABLES `EDITORA_AUTOR` WRITE;
/*!40000 ALTER TABLE `EDITORA_AUTOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `EDITORA_AUTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDITORA_LIVRO`
--

DROP TABLE IF EXISTS `EDITORA_LIVRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDITORA_LIVRO` (
  `nomeel` varchar(20) NOT NULL,
  `codigoel` int(5) NOT NULL,
  PRIMARY KEY (`nomeel`,`codigoel`),
  KEY `codigoel` (`codigoel`),
  CONSTRAINT `EDITORA_LIVRO_ibfk_1` FOREIGN KEY (`nomeel`) REFERENCES `EDITORA` (`nome_editora`),
  CONSTRAINT `EDITORA_LIVRO_ibfk_2` FOREIGN KEY (`codigoel`) REFERENCES `LIVRO` (`codigo_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDITORA_LIVRO`
--

LOCK TABLES `EDITORA_LIVRO` WRITE;
/*!40000 ALTER TABLE `EDITORA_LIVRO` DISABLE KEYS */;
/*!40000 ALTER TABLE `EDITORA_LIVRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPRESTA`
--

DROP TABLE IF EXISTS `EMPRESTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPRESTA` (
  `ordem` varchar(5) NOT NULL,
  `cpf_leitor` varchar(11) NOT NULL,
  `num_matricula` varchar(5) NOT NULL,
  `dt_emprestimo` varchar(10) NOT NULL,
  `hr_emprestimo` varchar(5) NOT NULL,
  `dt_devolucao` varchar(10) DEFAULT NULL,
  `multa` int(6) DEFAULT NULL,
  `periodo_suspensao` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ordem`,`cpf_leitor`,`num_matricula`,`dt_emprestimo`,`hr_emprestimo`),
  KEY `cpf_leitor` (`cpf_leitor`),
  CONSTRAINT `EMPRESTA_ibfk_1` FOREIGN KEY (`ordem`) REFERENCES `EXEMPLAR` (`nr_ordem`),
  CONSTRAINT `EMPRESTA_ibfk_2` FOREIGN KEY (`cpf_leitor`) REFERENCES `LEITOR` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPRESTA`
--

LOCK TABLES `EMPRESTA` WRITE;
/*!40000 ALTER TABLE `EMPRESTA` DISABLE KEYS */;
INSERT INTO `EMPRESTA` VALUES ('00001','49556621881','41431','01/01/2020','11:40','20/01/2020',0,'0'),('00002','01237193052','41441','02/02/2021','12:30','20/02/2021',0,'0'),('00003','76934899083','34151','03/03/2020','13:45','20/03/2020',0,'0'),('00004','68229005001','35151','04/04/2021','14:00','20/04/2021',0,'0'),('00005','90802036023','45151','05/05/2020','15:00','20/05/2020',0,'0');
/*!40000 ALTER TABLE `EMPRESTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXEMPLAR`
--

DROP TABLE IF EXISTS `EXEMPLAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXEMPLAR` (
  `nr_ordem` varchar(5) NOT NULL,
  `tipo_capa` varchar(4) DEFAULT NULL,
  `estado_conservacao` varchar(10) DEFAULT NULL,
  `destinacao_atual` varchar(20) DEFAULT NULL,
  `codigo_exemplar` int(5) DEFAULT NULL,
  `cpf_leitor` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`nr_ordem`),
  KEY `codigo_exemplar` (`codigo_exemplar`),
  KEY `cpf_leitor` (`cpf_leitor`),
  CONSTRAINT `EXEMPLAR_ibfk_1` FOREIGN KEY (`codigo_exemplar`) REFERENCES `LIVRO` (`codigo_livro`),
  CONSTRAINT `EXEMPLAR_ibfk_2` FOREIGN KEY (`cpf_leitor`) REFERENCES `LEITOR` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXEMPLAR`
--

LOCK TABLES `EXEMPLAR` WRITE;
/*!40000 ALTER TABLE `EXEMPLAR` DISABLE KEYS */;
INSERT INTO `EXEMPLAR` VALUES ('00001','DURA','BOA','Gabriela Marculino',1,'49556621881'),('00002','MOLE','OTIMA','Lincoln Amorim',2,'01237193052'),('00003','DURA','RUIM','Lucas Hein',3,'76934899083'),('00004','DURA','BOA','Leonardo Hirata',4,'68229005001'),('00005','MOLE','BOA','João Gomes',5,'90802036023');
/*!40000 ALTER TABLE `EXEMPLAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LEITOR`
--

DROP TABLE IF EXISTS `LEITOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LEITOR` (
  `cpf` varchar(11) NOT NULL,
  `qnts_dias_permitidos_emprestimo` int(2) DEFAULT NULL,
  `nr_rg` varchar(9) DEFAULT NULL,
  `estado_emissor` varchar(2) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nm_leitor` varchar(20) DEFAULT NULL,
  `genero` varchar(4) DEFAULT NULL,
  `dt_nascimento` varchar(10) DEFAULT NULL,
  `rua` varchar(20) DEFAULT NULL,
  `numero` varchar(4) DEFAULT NULL,
  `sigla_estado` varchar(2) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idx_LEITOR_CPF` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LEITOR`
--

LOCK TABLES `LEITOR` WRITE;
/*!40000 ALTER TABLE `LEITOR` DISABLE KEYS */;
INSERT INTO `LEITOR` VALUES ('01237193052',4,'283824517','MS','olegario6435@uorak.com','Lincoln','Masc','13/05/2001','Rua Aricanduva','210','MS','Dourados','Prox ao Restaurante','6939436427','11730011'),('06994623041',10,'313083587','RO','roger@uorak.com','Roger','Masc','06/08/2000','Rua 12','08','RO','Porto Velho','Prox ao predio','9538336128','88072011'),('10636279073',7,'126494666','SC','julio@uorak.com','Julio','Masc','10/07/2000','Rua 6','550','SC','Floripa','Prox a Praia','8820768311','75000013'),('20641704054',3,'117483709','DF','rafaela@uorak.com','Rafaela','Femi','25/12/2010','Rua 20','1895','DF','Brasilia','Prox ao planalto','5123179511','27022011'),('25254340053',5,'181939435','MS','andre@uorak.com','Andre','Masc','07/03/2001','Rua 27','987','MS','Campo Grande','Prox ao Centro','6739858813','111110100'),('26716538089',10,'147384771','SP','pedro@uorak.com','Pedro','Masc','04/04/2001','Rua 24','190','SP','Aricanduva','Prox ao ponto de onibus','9521221694','11720130'),('29768153059',5,'354411068','AP','angela@uorak.com','Angela','Femi','15/6/2010','Rua 21','95','AP','Macapa','Prox a rua do ouro','7923894439','11022011'),('30860945081',15,'477283305','RN','nilton@uorak.com','Nilton','Masc','07/07/2007','Rua 8','161','RN','Natal','Prox a praia','6437454417','75000011'),('35431970020',25,'201305239','GO','luana@uorak.com','Luana','Femi','02/02/2000','Rua 19','1700','GO','Goiania','Prox ao rodeio','2433036696','18022000'),('44674818001',3,'410972885','ES','jose@uorak.com','Jose','Masc','08/01/199','Rua 23','250','ES','Serra','Prox a rua da igreja','1737246126','117201300'),('47335722047',25,'244294148','RS','amanda@uorak.com','Amanda','Femi','04/04/2001','Rua 7','777','RS','Porto Alegre','Prox ao Rancho','9522697199','75000011'),('49556621881',8,'394547238','SP','gabrielamarculino@gmail.com','Gabriela','Femi','14/11/2001','Rua Traira','151','SP','Sao Paulo','Prox ao Shopping Ibirapuera','13982208256','11730000'),('53252910098',5,'181327399','SC','luis@uorak.com','Luis','Masc','17/02/2000','Rua 17','1357','SC','Joinville','Prox ao museu','9731168828','11073010'),('53620902089',3,'405657079','PB','marcos@uorak.com','Marcos','Masc','03/02/2001','Rua 10','888','PB','Joao Pessoa','Prox a praia','8635231122','77022011'),('57551769064',15,'175064416','RR','ribamar@uorak.com','Ribamar','Masc','08/08/2000','Rua 13','71','RR','Boa Vista','Prox a avenida','6825878773','88072000'),('64385292060',20,'248188999','AM','lilian@uorak.com','Lilian','Femi','15/09/1999','Rua 14','899','AM','Manaus','Prox ao Bar','5535808323','87072022'),('64879425028',3,'303493768','SP','kseniya2361@uorak.com','Gabriel','Masc','30/01/2001','Rua 4','300','SP','Itanhaem','Prox a Igreja','6420891352','30830013'),('67249582020',15,'181327399','SP','luan@uorak.com','Luan','Masc','20/02/2000','Rua 18','1000','SP','Alphaville','Prox ao parque','7927206147','22023010'),('67831364005',20,'169154014','SP','Juliana@uorak.com','Juliana','Femi','05/03/2001','Rua 25','20','SP','Guarulhos','Prox ao Tucuruvi','9332620997','11720100'),('68229005001',3,'188594899','MT','bernd1249@uorak.com','Helena','Femi','25/10/2005','Rua Praiamar','121','MT','Cuiaba','Prox ao Bar','92 22284974','25830011'),('72038537054',22,'196801151','RJ','marilene@uorak.com','Marilene','Femi','01/09/1999','Rua 15','1785','RJ','Rio de Janeiro','Prox ao morro','8423727871','01072022'),('76934899083',7,'481682429','AC','azddine8213@uorak.com','Lucas','Masc','05/05/2005','Rua Praiamar','121','AC','Rio Branco','Prox ao Parque','6727151370','11830011'),('88092242054',5,'345295596','ES','mariana@uorak.com','Mariana','Femi','15/12/2000','Rua 5','450','ES','Vitoria','Prox a Vila','8932651290','30000013'),('88692520004',7,'474921025','PI','joana@uorak.com','Joana','Femi','09/12/2001','Rua 11','808','PI','Teresina','Prox a escola','9725148780','99072011'),('89051805071',3,'181939435','MS','anderson@uorak.com','Anderson','Masc','17/03/2001','Rua 28','997','MS','Campo Grande','Prox ao Centro','7138061167','111110000'),('89718336028',10,'435730629','SP','samanta@uorak.com','Samanta','Femi','15/03/2001','Rua 26','874','SP','Guarulhos','Prox ao Centro','2237491449','77710100'),('90802036023',9,'357870621','PR','pape3134@uorak.com','Maria','Femi','15/2/1999','Rua Joao','171','PR','Curitiba','Prox ao Centro','4628117296','15830011'),('93223361022',3,'389031653','MG','leonardo@uorak.com','Leonardo','Masc','07/08/1997','Rua 16','2358','MG','Belo Horizonte','Prox ao museu','6928367531','11072000'),('93604776058',15,'474576711','MG','Paulo@uorak.com','Paulo','Masc','11/11/2001','Rua 22','100','MG','Extrema','Prox a rua da estatua','4932426054','0072013'),('94401261089',30,'434552641','PE','marina@uorak.com','Marina','Femi','25/07/2001','Rua 9','8','PE','Recife','Prox a praia','4124512653','75022011');
/*!40000 ALTER TABLE `LEITOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIVRO`
--

DROP TABLE IF EXISTS `LIVRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIVRO` (
  `codigo_livro` int(5) NOT NULL,
  `num_exemplares` int(2) DEFAULT NULL,
  `nm_livro` varchar(20) DEFAULT NULL,
  `ano` int(4) DEFAULT NULL,
  `edicao` int(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_livro`),
  KEY `idx_LIVRO_CODIGO` (`codigo_livro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIVRO`
--

LOCK TABLES `LIVRO` WRITE;
/*!40000 ALTER TABLE `LIVRO` DISABLE KEYS */;
INSERT INTO `LIVRO` VALUES (1,5,'As Vantagens',2015,3),(2,10,'The Hobbit',1975,12),(3,3,'Data Science',2020,4),(4,15,'Banco de Dados',2000,6),(5,4,'Codigo Limpo',2012,9);
/*!40000 ALTER TABLE `LIVRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIVRO_ASSUNTO`
--

DROP TABLE IF EXISTS `LIVRO_ASSUNTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIVRO_ASSUNTO` (
  `codigola` int(5) NOT NULL,
  `nomela` varchar(20) NOT NULL,
  PRIMARY KEY (`codigola`,`nomela`),
  KEY `nomela` (`nomela`),
  CONSTRAINT `LIVRO_ASSUNTO_ibfk_1` FOREIGN KEY (`codigola`) REFERENCES `LIVRO` (`codigo_livro`),
  CONSTRAINT `LIVRO_ASSUNTO_ibfk_2` FOREIGN KEY (`nomela`) REFERENCES `ASSUNTO` (`nm_assunto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIVRO_ASSUNTO`
--

LOCK TABLES `LIVRO_ASSUNTO` WRITE;
/*!40000 ALTER TABLE `LIVRO_ASSUNTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `LIVRO_ASSUNTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIVRO_LEITOR`
--

DROP TABLE IF EXISTS `LIVRO_LEITOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIVRO_LEITOR` (
  `codigoll` int(5) NOT NULL,
  `cpfll` varchar(11) NOT NULL,
  `data` varchar(10) NOT NULL,
  PRIMARY KEY (`codigoll`,`cpfll`,`data`),
  KEY `cpfll` (`cpfll`),
  CONSTRAINT `LIVRO_LEITOR_ibfk_1` FOREIGN KEY (`codigoll`) REFERENCES `LIVRO` (`codigo_livro`),
  CONSTRAINT `LIVRO_LEITOR_ibfk_2` FOREIGN KEY (`cpfll`) REFERENCES `LEITOR` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIVRO_LEITOR`
--

LOCK TABLES `LIVRO_LEITOR` WRITE;
/*!40000 ALTER TABLE `LIVRO_LEITOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `LIVRO_LEITOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECRETARIO`
--

DROP TABLE IF EXISTS `SECRETARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SECRETARIO` (
  `cpf_secretario` varchar(11) DEFAULT NULL,
  `num_matricula` varchar(5) NOT NULL,
  `sigla_unidade` varchar(4) DEFAULT NULL,
  `sigla_setor` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`num_matricula`),
  KEY `cpf_secretario` (`cpf_secretario`),
  CONSTRAINT `SECRETARIO_ibfk_1` FOREIGN KEY (`cpf_secretario`) REFERENCES `LEITOR` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECRETARIO`
--

LOCK TABLES `SECRETARIO` WRITE;
/*!40000 ALTER TABLE `SECRETARIO` DISABLE KEYS */;
INSERT INTO `SECRETARIO` VALUES ('26716538089','41461','BB','JJ'),('67831364005','41462','DD','KK'),('89718336028','41463','FF','LL'),('25254340053','41464','HH','MM'),('89051805071','41465','II','NN');
/*!40000 ALTER TABLE `SECRETARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVIDOR`
--

DROP TABLE IF EXISTS `SERVIDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SERVIDOR` (
  `cpf_servidor` varchar(11) DEFAULT NULL,
  `num_matricula` varchar(5) NOT NULL,
  `sigla_unidade` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`num_matricula`),
  KEY `cpf_servidor` (`cpf_servidor`),
  CONSTRAINT `SERVIDOR_ibfk_1` FOREIGN KEY (`cpf_servidor`) REFERENCES `LEITOR` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVIDOR`
--

LOCK TABLES `SERVIDOR` WRITE;
/*!40000 ALTER TABLE `SERVIDOR` DISABLE KEYS */;
INSERT INTO `SERVIDOR` VALUES ('64879425028','41444','AA'),('88092242054','41445','AC'),('10636279073','41446','TG'),('47335722047','41447','TC'),('30860945081','41448','PP');
/*!40000 ALTER TABLE `SERVIDOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SETOR`
--

DROP TABLE IF EXISTS `SETOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SETOR` (
  `sigla_setor` varchar(4) NOT NULL,
  `nome_setor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sigla_setor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SETOR`
--

LOCK TABLES `SETOR` WRITE;
/*!40000 ALTER TABLE `SETOR` DISABLE KEYS */;
INSERT INTO `SETOR` VALUES ('BB','SETOR A'),('DD','SETOR B'),('FF','SETOR C'),('HH','SETOR D'),('II','SETOR E');
/*!40000 ALTER TABLE `SETOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UNIDADE`
--

DROP TABLE IF EXISTS `UNIDADE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UNIDADE` (
  `sigla_unidade` varchar(4) NOT NULL,
  `nome_unidade` varchar(20) DEFAULT NULL,
  `sigla_setor` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`sigla_unidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UNIDADE`
--

LOCK TABLES `UNIDADE` WRITE;
/*!40000 ALTER TABLE `UNIDADE` DISABLE KEYS */;
INSERT INTO `UNIDADE` VALUES ('AA','UNIDADE I','KK'),('EE','UNIDADE II','LL'),('FF','UNIDADE III','MM'),('HH','UNIDADE IV','NN'),('JJ','UNIDADE V','OO');
/*!40000 ALTER TABLE `UNIDADE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-29  9:53:30
