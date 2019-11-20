-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20-Nov-2019 às 19:38
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monitoriavoluntaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `Senha` int(10) DEFAULT NULL,
  `Login` varchar(100) DEFAULT NULL,
  `Codigo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador_curso`
--

CREATE TABLE `administrador_curso` (
  `fk_Disciplina_Codigo` int(10) DEFAULT NULL,
  `fk_Curso_Codigo` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `Periodo` int(3) DEFAULT NULL,
  `cod_disciplina` int(10) DEFAULT NULL,
  `Codigo` int(30) NOT NULL,
  `Nome_Completo` varchar(250) DEFAULT NULL,
  `Matricula` int(10) DEFAULT NULL,
  `E_mail` varchar(50) DEFAULT NULL,
  `situacao` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`Periodo`, `cod_disciplina`, `Codigo`, `Nome_Completo`, `Matricula`, `E_mail`, `situacao`) VALUES
(3, 1234, 201546, 'Maria Alice De Moraes', 2018231450, 'Maria@gmail.com', 'Homologada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `Nome` varchar(50) DEFAULT NULL,
  `Codigo` int(10) NOT NULL,
  `fk_Administrador_Codigo` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `Nome` varchar(50) DEFAULT NULL,
  `Codigo` int(10) NOT NULL,
  `cod_curso` int(10) DEFAULT NULL,
  `fk_Aluno_Codigo` int(30) DEFAULT NULL,
  `fk_Administrador_Codigo` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `Nome` varchar(250) DEFAULT NULL,
  `Telefone` int(15) DEFAULT NULL,
  `Siape` int(10) DEFAULT NULL,
  `E_mail` varchar(250) DEFAULT NULL,
  `Codigo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor_disciplina`
--

CREATE TABLE `professor_disciplina` (
  `fk_Professor_Codigo` int(10) DEFAULT NULL,
  `fk_Disciplina_Codigo` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indexes for table `administrador_curso`
--
ALTER TABLE `administrador_curso`
  ADD KEY `FK_administrador_curso_1` (`fk_Disciplina_Codigo`),
  ADD KEY `FK_administrador_curso_2` (`fk_Curso_Codigo`);

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Curso_2` (`fk_Administrador_Codigo`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_Disciplina_2` (`fk_Aluno_Codigo`),
  ADD KEY `FK_Disciplina_3` (`fk_Administrador_Codigo`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indexes for table `professor_disciplina`
--
ALTER TABLE `professor_disciplina`
  ADD KEY `FK_professor_disciplina_1` (`fk_Professor_Codigo`),
  ADD KEY `FK_professor_disciplina_2` (`fk_Disciplina_Codigo`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `administrador_curso`
--
ALTER TABLE `administrador_curso`
  ADD CONSTRAINT `FK_administrador_curso_1` FOREIGN KEY (`fk_Disciplina_Codigo`) REFERENCES `disciplina` (`Codigo`),
  ADD CONSTRAINT `FK_administrador_curso_2` FOREIGN KEY (`fk_Curso_Codigo`) REFERENCES `curso` (`Codigo`);

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `FK_Curso_2` FOREIGN KEY (`fk_Administrador_Codigo`) REFERENCES `administrador` (`Codigo`);

--
-- Limitadores para a tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `FK_Disciplina_2` FOREIGN KEY (`fk_Aluno_Codigo`) REFERENCES `aluno` (`Codigo`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Disciplina_3` FOREIGN KEY (`fk_Administrador_Codigo`) REFERENCES `administrador` (`Codigo`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `professor_disciplina`
--
ALTER TABLE `professor_disciplina`
  ADD CONSTRAINT `FK_professor_disciplina_1` FOREIGN KEY (`fk_Professor_Codigo`) REFERENCES `professor` (`Codigo`),
  ADD CONSTRAINT `FK_professor_disciplina_2` FOREIGN KEY (`fk_Disciplina_Codigo`) REFERENCES `disciplina` (`Codigo`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
