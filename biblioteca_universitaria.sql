-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Out-2022 às 17:12
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biblioteca_universitaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

CREATE TABLE `autor` (
  `id_autor` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `nacionalidade` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`id_autor`, `cidade`, `nacionalidade`) VALUES
('Kaká Werá Jecupé', 'São Paulo', 'Guarani'),
('Louise Welsh', 'Londres', 'Inglesa'),
('Marcos Bagno', 'Cataguases', 'Brasieiro'),
('Sophie Desplancques', 'Lile', 'Francesa'),
('Trudi Canavan', 'Kew', 'Australiana');

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor_has_livro`
--

CREATE TABLE `autor_has_livro` (
  `autor_id_autor` varchar(45) NOT NULL,
  `livro_id_isbn` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `autor_has_livro`
--

INSERT INTO `autor_has_livro` (`autor_id_autor`, `livro_id_isbn`) VALUES
('Louise Welsh', 9788581630007),
('Louise Welsh', 9788581630250);

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

CREATE TABLE `editora` (
  `id_editora` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `id_isbn` bigint(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`id_editora`, `nome`, `cidade`, `id_isbn`) VALUES
(1, 'Peirópolis', 'SP', 8585663243),
(2, 'Bertrand Brasil', 'Rio de Janeiro', 9780000170996);

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo`
--

CREATE TABLE `emprestimo` (
  `id_emprestimo` tinyint(1) NOT NULL,
  `id_isbn` bigint(13) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `emprestimo`
--

INSERT INTO `emprestimo` (`id_emprestimo`, `id_isbn`, `id_usuario`) VALUES
(1, 8585663243, 1),
(2, 9780000170996, 1),
(3, 9788525419231, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `id_livro` bigint(13) NOT NULL,
  `titulo` varchar(60) NOT NULL,
  `edicao` int(11) NOT NULL,
  `ano_publicacao` year(4) NOT NULL,
  `classificacao` varchar(20) NOT NULL,
  `id_autor_fk` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`id_livro`, `titulo`, `edicao`, `ano_publicacao`, `classificacao`, `id_autor_fk`) VALUES
(8585663243, 'Terra de Mil Povos', 4, 1998, 'História', 'Kaká Werá Jecupé'),
(9780000170996, '\"Alfabeto de Ossos\"', 1, 1965, 'Suspense', 'Louise Welsh'),
(9788515018895, 'Preconceito Linguístico', 52, 2009, 'Linguística', 'Marcos Bagno'),
(9788525413231, 'Egito Antigo', 1, 2009, 'Historia', 'Sophie Desplancques'),
(9788581630007, 'O clã dos Magos', 10, 2012, 'Fantasia', 'Trudi Canavan'),
(9788581630250, 'A aprendiz', 8, 2012, 'Fantasia', 'Trudi Canavan');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(90) NOT NULL,
  `endereco` varchar(90) NOT NULL,
  `universidade` varchar(90) NOT NULL,
  `curso` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `endereco`, `universidade`, `curso`) VALUES
(1, 'João Paulo ', 'Rua das estrelas, nº 13, Jardim das Alegrias', 'Universidade 13 de julho ', 'História'),
(2, 'Ana Maria', 'Estrada das pedras, 25, Jardim Ave Maria', 'Universidade Ursa Maior', 'Arquitetura'),
(3, 'Sonia Maria', 'Rua quatro, nº 8, Jardim das Margarida.', 'Universidade 13 de Julho', 'Gestão de Pessoas'),
(4, 'Ana Cecília ', 'Rua dos porquês, nº 36, Jardim do Enigma', 'Universidade Ursa Maior', 'Engenharia de Software');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Índices para tabela `autor_has_livro`
--
ALTER TABLE `autor_has_livro`
  ADD KEY `livro_id_isbn` (`livro_id_isbn`),
  ADD KEY `autor_id_autor` (`autor_id_autor`);

--
-- Índices para tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`id_editora`),
  ADD KEY `id_isbn` (`id_isbn`);

--
-- Índices para tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`id_emprestimo`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_isbn` (`id_isbn`);

--
-- Índices para tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `id_autor_fk` (`id_autor_fk`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `editora`
--
ALTER TABLE `editora`
  MODIFY `id_editora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `autor_has_livro`
--
ALTER TABLE `autor_has_livro`
  ADD CONSTRAINT `autor_has_livro_ibfk_2` FOREIGN KEY (`livro_id_isbn`) REFERENCES `livro` (`id_livro`),
  ADD CONSTRAINT `autor_id_autor_fk` FOREIGN KEY (`autor_id_autor`) REFERENCES `autor` (`id_autor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
