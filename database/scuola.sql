-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 03, 2021 alle 16:35
-- Versione del server: 10.4.19-MariaDB
-- Versione PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scuola`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `classi`
--

CREATE TABLE `classi` (
  `Numero` int(11) NOT NULL,
  `Sezione` char(1) NOT NULL,
  `Anno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_esterni`
--

CREATE TABLE `corsi_esterni` (
  `Descrizione` varchar(255) NOT NULL,
  `Data_Inizio` date NOT NULL,
  `Data_Fine` date NOT NULL,
  `Totale_Ore` int(11) NOT NULL,
  `Ente` varchar(255) NOT NULL,
  `Documentazione` varchar(255) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  `Codice` int(11) NOT NULL,
  `Matricola_Professore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `corsi_esterni`
--

INSERT INTO `corsi_esterni` (`Descrizione`, `Data_Inizio`, `Data_Fine`, `Totale_Ore`, `Ente`, `Documentazione`, `Titolo`, `Codice`, `Matricola_Professore`) VALUES
('Inglese - Look at this duude', '2021-06-04', '2021-06-15', 30, 'Stanford University', 'Stanford University Official Course', 'Inglese like a MF', 7, 1234),
('Questa è la descrizione', '2021-06-01', '2021-06-02', 15, 'Ente Figo spa', 'Documentazione certificante wow', 'Informatica Avanzata', 4687, 1234);

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_interni`
--

CREATE TABLE `corsi_interni` (
  `Titolo` varchar(255) NOT NULL,
  `Descrizione` varchar(255) NOT NULL,
  `Data_Inizio` date NOT NULL,
  `Data_Fine` date NOT NULL,
  `Totale_Ore` int(11) NOT NULL,
  `Codice` int(11) NOT NULL,
  `Matricola_Professore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `corsi_interni`
--

INSERT INTO `corsi_interni` (`Titolo`, `Descrizione`, `Data_Inizio`, `Data_Fine`, `Totale_Ore`, `Codice`, `Matricola_Professore`) VALUES
('Informatica - Bootstrap 5.0', 'Arricchimento - Un corso di arricchimento sulle funzionalità più utili di Bootstrap 5.0.', '2021-05-31', '2021-06-07', 21, 111, 1234),
('Matematica - Derivate', 'Recupero - Questo corso di recupero, si incentra su comprendere bene i concetti fondamentali delle derivate.', '2021-06-07', '2021-06-14', 14, 123, 1234);

-- --------------------------------------------------------

--
-- Struttura della tabella `debiti`
--

CREATE TABLE `debiti` (
  `Matricola` int(11) NOT NULL,
  `Anno` int(11) NOT NULL,
  `Materia` varchar(255) NOT NULL,
  `Matricola_Studente` int(11) NOT NULL,
  `Matricola_Professore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `professori`
--

CREATE TABLE `professori` (
  `Nome` varchar(255) NOT NULL,
  `Cognome` varchar(255) NOT NULL,
  `Matricola_Professori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `professori`
--

INSERT INTO `professori` (`Nome`, `Cognome`, `Matricola_Professori`) VALUES
('Prof0', 'uatcha', 1234);

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti`
--

CREATE TABLE `studenti` (
  `Matricola_Studenti` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Cognome` varchar(255) NOT NULL,
  `Comune` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `studenti`
--

INSERT INTO `studenti` (`Matricola_Studenti`, `Nome`, `Cognome`, `Comune`) VALUES
(1, 'Pietro', 'Zaro', 'Tavullia');

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti_classi`
--

CREATE TABLE `studenti_classi` (
  `Promosso` varchar(255) NOT NULL,
  `Matricola_Studente` int(11) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Sezione` char(1) NOT NULL,
  `Anno` int(11) NOT NULL,
  `Media_Finale` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti_corsi_esterni`
--

CREATE TABLE `studenti_corsi_esterni` (
  `Matricola_Studente` int(11) NOT NULL,
  `Codice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti_corsi_interni`
--

CREATE TABLE `studenti_corsi_interni` (
  `Matricola_Studente` int(11) NOT NULL,
  `Codice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `classi`
--
ALTER TABLE `classi`
  ADD PRIMARY KEY (`Numero`,`Sezione`,`Anno`);

--
-- Indici per le tabelle `corsi_esterni`
--
ALTER TABLE `corsi_esterni`
  ADD PRIMARY KEY (`Codice`);

--
-- Indici per le tabelle `corsi_interni`
--
ALTER TABLE `corsi_interni`
  ADD PRIMARY KEY (`Codice`),
  ADD KEY `Matricola_Professore` (`Matricola_Professore`);

--
-- Indici per le tabelle `debiti`
--
ALTER TABLE `debiti`
  ADD PRIMARY KEY (`Matricola`,`Anno`,`Materia`),
  ADD KEY `Matricola_Studente` (`Matricola_Studente`),
  ADD KEY `Matricola_Professore` (`Matricola_Professore`);

--
-- Indici per le tabelle `professori`
--
ALTER TABLE `professori`
  ADD PRIMARY KEY (`Matricola_Professori`);

--
-- Indici per le tabelle `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`Matricola_Studenti`);

--
-- Indici per le tabelle `studenti_classi`
--
ALTER TABLE `studenti_classi`
  ADD PRIMARY KEY (`Matricola_Studente`),
  ADD KEY `Numero` (`Numero`,`Sezione`,`Anno`);

--
-- Indici per le tabelle `studenti_corsi_esterni`
--
ALTER TABLE `studenti_corsi_esterni`
  ADD PRIMARY KEY (`Matricola_Studente`,`Codice`),
  ADD KEY `Codice` (`Codice`);

--
-- Indici per le tabelle `studenti_corsi_interni`
--
ALTER TABLE `studenti_corsi_interni`
  ADD PRIMARY KEY (`Matricola_Studente`,`Codice`),
  ADD KEY `Codice` (`Codice`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `corsi_interni`
--
ALTER TABLE `corsi_interni`
  ADD CONSTRAINT `corsi_interni_ibfk_1` FOREIGN KEY (`Matricola_Professore`) REFERENCES `professori` (`Matricola_Professori`);

--
-- Limiti per la tabella `debiti`
--
ALTER TABLE `debiti`
  ADD CONSTRAINT `debiti_ibfk_1` FOREIGN KEY (`Matricola_Studente`) REFERENCES `professori` (`Matricola_Professori`),
  ADD CONSTRAINT `debiti_ibfk_2` FOREIGN KEY (`Matricola_Professore`) REFERENCES `studenti` (`Matricola_Studenti`);

--
-- Limiti per la tabella `studenti_classi`
--
ALTER TABLE `studenti_classi`
  ADD CONSTRAINT `studenti_classi_ibfk_1` FOREIGN KEY (`Matricola_Studente`) REFERENCES `studenti` (`Matricola_Studenti`),
  ADD CONSTRAINT `studenti_classi_ibfk_2` FOREIGN KEY (`Numero`,`Sezione`,`Anno`) REFERENCES `classi` (`Numero`, `Sezione`, `Anno`);

--
-- Limiti per la tabella `studenti_corsi_esterni`
--
ALTER TABLE `studenti_corsi_esterni`
  ADD CONSTRAINT `studenti_corsi_esterni_ibfk_1` FOREIGN KEY (`Matricola_Studente`) REFERENCES `studenti` (`Matricola_Studenti`),
  ADD CONSTRAINT `studenti_corsi_esterni_ibfk_2` FOREIGN KEY (`Codice`) REFERENCES `corsi_esterni` (`Codice`);

--
-- Limiti per la tabella `studenti_corsi_interni`
--
ALTER TABLE `studenti_corsi_interni`
  ADD CONSTRAINT `studenti_corsi_interni_ibfk_1` FOREIGN KEY (`Matricola_Studente`) REFERENCES `studenti` (`Matricola_Studenti`),
  ADD CONSTRAINT `studenti_corsi_interni_ibfk_2` FOREIGN KEY (`Codice`) REFERENCES `corsi_interni` (`Codice`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
