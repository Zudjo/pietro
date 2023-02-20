-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 10, 2021 alle 12:12
-- Versione del server: 10.4.14-MariaDB
-- Versione PHP: 7.2.34

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
  `Id_Classi` int(20) NOT NULL,
  `Numero` int(1) NOT NULL,
  `Sezione` varchar(1) NOT NULL,
  `Anno_scolastico` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi`
--

CREATE TABLE `corsi` (
  `Codice_Corso` int(20) NOT NULL,
  `Titolo` varchar(20) NOT NULL,
  `Descrizione` varchar(20) NOT NULL,
  `Data_in` date NOT NULL,
  `Data_fin` date NOT NULL,
  `Monteore` int(20) NOT NULL,
  `Tipo_int` varchar(2) NOT NULL,
  `Ente` varchar(20) NOT NULL,
  `Rif_Doc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `debiti`
--

CREATE TABLE `debiti` (
  `Id_Deb` int(20) NOT NULL,
  `Numero` int(1) NOT NULL,
  `Sezione` int(1) NOT NULL,
  `Disciplina` varchar(20) NOT NULL,
  `Anno_scolastico` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `frequenza`
--

CREATE TABLE `frequenza` (
  `Cod_Stu` int(20) NOT NULL,
  `Id_Classi` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `ha`
--

CREATE TABLE `ha` (
  `Cod_Stu` int(11) NOT NULL,
  `Id_Deb` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `praticano`
--

CREATE TABLE `praticano` (
  `Cod_Stu` int(11) NOT NULL,
  `Codice_Corso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti`
--

CREATE TABLE `studenti` (
  `utente` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `Cod_Stu` int(20) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `Data_Nas` date NOT NULL,
  `Indrizzo` int(4) NOT NULL,
  `Telefono` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `classi`
--
ALTER TABLE `classi`
  ADD PRIMARY KEY (`Id_Classi`);

--
-- Indici per le tabelle `corsi`
--
ALTER TABLE `corsi`
  ADD PRIMARY KEY (`Codice_Corso`);

--
-- Indici per le tabelle `debiti`
--
ALTER TABLE `debiti`
  ADD PRIMARY KEY (`Id_Deb`);

--
-- Indici per le tabelle `frequenza`
--
ALTER TABLE `frequenza`
  ADD PRIMARY KEY (`Cod_Stu`,`Id_Classi`),
  ADD KEY `Id_Classi` (`Id_Classi`);

--
-- Indici per le tabelle `ha`
--
ALTER TABLE `ha`
  ADD PRIMARY KEY (`Cod_Stu`,`Id_Deb`),
  ADD KEY `Cod_Stu` (`Cod_Stu`,`Id_Deb`),
  ADD KEY `Id_Deb` (`Id_Deb`);

--
-- Indici per le tabelle `praticano`
--
ALTER TABLE `praticano`
  ADD PRIMARY KEY (`Cod_Stu`,`Codice_Corso`),
  ADD KEY `praticano_ibfk_1` (`Codice_Corso`);

--
-- Indici per le tabelle `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`Cod_Stu`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `classi`
--
ALTER TABLE `classi`
  MODIFY `Id_Classi` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `corsi`
--
ALTER TABLE `corsi`
  MODIFY `Codice_Corso` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `debiti`
--
ALTER TABLE `debiti`
  MODIFY `Id_Deb` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `praticano`
--
ALTER TABLE `praticano`
  MODIFY `Cod_Stu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `studenti`
--
ALTER TABLE `studenti`
  MODIFY `Cod_Stu` int(20) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `frequenza`
--
ALTER TABLE `frequenza`
  ADD CONSTRAINT `frequenza_ibfk_1` FOREIGN KEY (`Cod_Stu`) REFERENCES `studenti` (`Cod_Stu`),
  ADD CONSTRAINT `frequenza_ibfk_2` FOREIGN KEY (`Id_Classi`) REFERENCES `classi` (`Id_Classi`);

--
-- Limiti per la tabella `ha`
--
ALTER TABLE `ha`
  ADD CONSTRAINT `ha_ibfk_1` FOREIGN KEY (`Cod_Stu`) REFERENCES `studenti` (`Cod_Stu`),
  ADD CONSTRAINT `ha_ibfk_2` FOREIGN KEY (`Id_Deb`) REFERENCES `debiti` (`Id_Deb`);

--
-- Limiti per la tabella `praticano`
--
ALTER TABLE `praticano`
  ADD CONSTRAINT `praticano_ibfk_1` FOREIGN KEY (`Codice_Corso`) REFERENCES `corsi` (`Codice_Corso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
