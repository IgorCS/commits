/*SQLyog Ultimate v8.55 
MySQL - 5.6.12 : Database - fj21**********************************************************************//*!40101 SET NAMES utf8 */;/*!40101 SET SQL_MODE=''*/;/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;CREATE DATABASE /*!32312 IF NOT EXISTS*/fj21 /*!40100 DEFAULT CHARACTER SET latin1 */;USE fj21;/*Table structure for table contatos */DROP TABLE IF EXISTS contatos;CREATE TABLE contatos (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  email varchar(45) NOT NULL,
  endereco varchar(255) NOT NULL,
  dataNascimento datetime NOT NULL,
  cpf varchar(14) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;/*Data for the table contatos */insert  into contatos(id,nome,email,endereco,dataNascimento,cpf) values (2,'IGOR CARVALHO SOARES','igor@mail.com','av.roraima 3442','1981-06-12 00:00:00','917.893.893-71'),(4,'Joao Carvalho da Silva Sauro','joao@joao.com','av.joaoXXIII','1992-03-23 00:00:00','123.876.890-22'),(5,'Joao da Silva                        ','silva@mail.com                        ','av.testes 4509                        ','2013-05-28 00:00:00','917.893.893-09'),(6,'testes                        ','testes@mail.com ','testes 4345                        ','2013-05-08 00:00:00','000.908.971-07');/*Table structure for table os */DROP TABLE IF EXISTS os;CREATE TABLE os (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  id_cliente int(10) unsigned NOT NULL,
  status varchar(45) NOT NULL,
  texto varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;/*Data for the table os */insert  into os(id,id_cliente,status,texto) values (1,3,'A','testes'),(3,3,'A','teste_testes'),(8,3,'A','testes|testes|testes'),(20,7,'A','mega_via  '),(25,4,'F','MEGAVIA testes'),(26,5,'F','ok tudo funfando'),(30,5,'A','testes feitos e concluido'),(31,6,'P','testes'),(32,4,'A','testes variados'),(33,4,'P','testes variados ');/*Table structure for table tarefas */DROP TABLE IF EXISTS tarefas;CREATE TABLE tarefas (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  descricao varchar(255) DEFAULT NULL,
  finalizado tinyint(1) DEFAULT NULL,
  dataFinalizacao date DEFAULT NULL,
  nomeUsuario varchar(255) DEFAULT NULL,
  dataAbertura date DEFAULT NULL,
  nota varchar(10) DEFAULT NULL,
  tipoUsuario varchar(10) DEFAULT NULL,
  responsavel varchar(50) DEFAULT NULL,
  observacao varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;/*Data for the table tarefas */insert  into tarefas(id,descricao,finalizado,dataFinalizacao,nomeUsuario,dataAbertura,nota,tipoUsuario,responsavel,observacao) values (10,'igor cavalera da silva sauro',1,'2014-07-14','admin','2000-09-22','',NULL,'ivone',NULL),(60,'OK!!!',0,'2014-07-14','admin','2013-12-12','',NULL,'ivone',NULL),(62,'testes users',1,'2013-07-23','admin','2013-09-12','',NULL,'Ivonete ',NULL),(63,'testes variados de usurio',1,'2014-09-22','admin','2013-03-11','',NULL,'Igor (T.I)',NULL),(68,'testes suporte',0,'2013-09-12','admin','2013-09-12','',NULL,'Mazé',NULL),(69,'testes variados!!!\r\nOK.',1,'2013-08-02','igor','2000-09-12','',NULL,'Tarcísio',NULL),(81,'problema no server DELL Proliant 350ML',1,'2013-07-24','admin','2013-07-23','10',NULL,'',NULL),(82,'Problema no CADES testes<',1,'2013-07-31','igor','2013-07-23','',NULL,'Tarcísio',NULL),(83,'TESTES DE CORES (Efeito ZEBRADO)',0,NULL,'igor','2013-07-29','',NULL,'Conceição',NULL),(84,'testes colors',0,NULL,'igor','2013-07-29','',NULL,'Igor',NULL),(85,'testes',1,'2013-08-02','igor','2013-07-29','10',NULL,'Tarcísio',NULL),(86,'testes ok ok ok',1,'2013-08-02','igor','2013-07-31','',NULL,'',NULL),(87,'wystanzim cheio de problema',1,'2013-08-02','igor','2013-08-02','',NULL,'Igor',NULL),(88,'SILDENNY CABEÇA DE CAPÂO',1,'2013-08-02','igor','2013-08-02','',NULL,'',NULL),(89,'Aluno nao acessa o sistema ONLINE',1,'2013-08-02','igor','2013-08-02','',NULL,'Tarcísio',NULL),(91,'TESTES OK',1,'2013-08-02','igor','2013-08-02',NULL,NULL,'admin',NULL);/*Table structure for table usuarios */DROP TABLE IF EXISTS usuarios;CREATE TABLE usuarios (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  nome varchar(255) DEFAULT NULL,
  senha varchar(255) DEFAULT NULL,
  tipoUsuario varchar(10) DEFAULT NULL,
  matricula varchar(10) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;/*Data for the table usuarios */insert  into usuarios(id,nome,senha,tipoUsuario,matricula) values (1,'igor','dd97813dd40be87559aaefed642c3fbb','T',NULL),(2,'admin','21232f297a57a5a743894a0e4a801fc3','A',NULL),(3,'ivone','ea6d9ee50b6e1427e51d9bfd4a85f4df','C',NULL),(4,'SAYONARA MENDES SOARES','21232f297a57a5a743894a0e4a801fc3','C','A131067');/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;