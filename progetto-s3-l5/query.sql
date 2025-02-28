CREATE DATABASE PoliziaMunicipale;

USE PoliziaMunicipale;

CREATE TABLE ANAGRAFICA (
    idanagrafica INT IDENTITY(1,1) PRIMARY KEY,
    Cognome VARCHAR(20) NOT NULL,
    Nome VARCHAR(20) NOT NULL,
    Indirizzo VARCHAR(100) NOT NULL,
    Città VARCHAR(20) NOT NULL,
    CAP VARCHAR(5) NOT NULL,
    Cod_Fisc VARCHAR(16) UNIQUE NOT NULL
);

CREATE TABLE TIPO_VIOLAZIONE (
    idviolazione INT IDENTITY(1,1) PRIMARY KEY,
    descrizione VARCHAR(200) NOT NULL
);

CREATE TABLE VERBALE (
    idverbale INT IDENTITY(1,1) PRIMARY KEY,
    DataViolazione DATE NOT NULL,
    IndirizzoViolazione VARCHAR(100) NOT NULL,
    Nominativo_Agente VARCHAR(20) NOT NULL,
    DataTrascrizioneVerbale DATE NOT NULL,
    Importo MONEY NOT NULL,
    DecurtamentoPunti INT NOT NULL,
	idanagrafica INT NOT NULL,
   CONSTRAINT FK_ID_ANAGRAFICA FOREIGN KEY (idanagrafica) REFERENCES ANAGRAFICA(idanagrafica)
   );

CREATE TABLE VERBALE_VIOLAZIONE (
   id_verbale_violazione INT IDENTITY(1,1) PRIMARY KEY,
    idverbale INT NOT NULL,
    idviolazione INT NOT NULL,
    CONSTRAINT FK_ID_VERBALE FOREIGN KEY (idverbale) REFERENCES VERBALE(idverbale),
    CONSTRAINT FK_ID_VIOLAZIONE FOREIGN KEY (idviolazione) REFERENCES TIPO_VIOLAZIONE(idviolazione)
);

INSERT INTO ANAGRAFICA (Cognome, Nome, Indirizzo, Città, CAP, Cod_Fisc)
VALUES
('Rossi', 'Marco', 'Via Roma 1', 'Milano', '20100', 'RSSMRC80A01H501Z'),
('Bianchi', 'Giulia', 'Via Milano 5', 'Roma', '00100', 'BNCGLI90B42H501Y'),
('Verdi', 'Luca', 'Corso Vittorio 10', 'Napoli', '80100', 'VRDLUC85C12H501M'),
('Esposito', 'Maria', 'Via Napoli 25', 'Napoli', '80121', 'ESPMRA85D55H501F'),
('Ferrari', 'Giovanni', 'Viale Trento 12', 'Torino', '10100', 'FRRGNN70A01H501D'),
('Galli', 'Francesca', 'Piazza Garibaldi 4', 'Milano', '20121', 'GLLFNC92C40H501J'),
('Lombardi', 'Paolo', 'Via Dante 7', 'Roma', '00121', 'LMBPLZ81A10H501S'),
('Martini', 'Sofia', 'Viale Lazio 3', 'Bologna', '40100', 'MRTSFN86L55H501P'),
('Conti', 'Alessandro', 'Via Torino 15', 'Firenze', '50100', 'CNTALS83B16H501Q'),
('Giordano', 'Simona', 'Via Milano 3', 'Verona', '37100', 'GRDSMN74D57H501E'),
('Russo', 'Antonio', 'Piazza del Popolo 2', 'Catania', '95100', 'RSSNTN79P01H501L'),
('Mazzini', 'Alessandra', 'Via Marconi 20', 'Genova', '16100', 'MZZLSA81M54H501R'),
('Ricci', 'Francesco', 'Via Garibaldi 11', 'Cagliari', '09100', 'RCCFNC80B12H501G'),
('Sanna', 'Emanuela', 'Viale Europa 22', 'Palermo', '90100', 'SNNMNL86C30H501B'),
('Perri', 'Luigi', 'Via dei Mille 8', 'Bari', '70100', 'PRRLGI77D14H501F');


INSERT INTO TIPO_VIOLAZIONE (descrizione)
VALUES
('Eccesso di velocità'),
('Guida in stato di ebbrezza'),
('Passaggio con semaforo rosso'),
('Sosta vietata'),
('Mancato utilizzo delle cinture di sicurezza'),
('Utilizzo del cellulare alla guida'),
('Sorpasso in prossimità di una curva'),
('Mancato rispetto della precedenza'),
('Guida senza patente'),
('Eccesso di velocità in zona scolastica'),
('Guida con veicolo senza assicurazione'),
('Mancato fermarsi al segnale di stop'),
('Comportamento aggressivo alla guida'),
('Superamento dei limiti di velocità in autostrada'),
('Guida sotto effetto di droghe');


INSERT INTO VERBALE (DataViolazione, IndirizzoViolazione, Nominativo_Agente, DataTrascrizioneVerbale, Importo, DecurtamentoPunti, idanagrafica)
VALUES
('2005-02-01', 'Via Roma 1', 'Agente 1', '2005-02-02', 150.00, 2, 1),
('2007-02-03', 'Via Milano 5', 'Agente 2', '2007-02-04', 200.00, 3, 2),
('2009-02-10', 'Corso Vittorio 10', 'Agente 3', '2009-02-11', 570.00, 1, 3),
('2010-02-15', 'Via Napoli 25', 'Agente 4', '2010-02-16', 80.00, 1, 4),
('2009-02-20', 'Viale Trento 12', 'Agente 5', '2009-02-21', 100.00, 1, 5),
('2008-02-22', 'Piazza Garibaldi 4', 'Agente 6', '2008-02-23', 250.00, 4, 6),
('2007-02-24', 'Via Dante 7', 'Agente 7', '2007-02-25', 580.00, 2, 7),
('2010-02-26', 'Viale Lazio 3', 'Agente 8', '2010-02-27', 90.00, 1, 8),
('2009-02-28', 'Via Torino 15', 'Agente 9', '2009-03-01', 130.00, 2, 9),
('2004-03-02', 'Via Milano 3', 'Agente 10', '2004-03-03', 110.00, 2, 10),
('2007-03-04', 'Piazza del Popolo 2', 'Agente 11', '2007-03-05', 160.00, 3, 11),
('2006-03-06', 'Via Marconi 20', 'Agente 12', '2006-03-07', 140.00, 2, 12),
('2009-03-08', 'Via Garibaldi 11', 'Agente 13', '2009-03-09', 450.00, 3, 13),
('2010-03-10', 'Viale Europa 22', 'Agente 14', '2010-03-11', 220.00, 3, 14),
('2009-03-12', 'Via dei Mille 8', 'Agente 15', '2009-03-13', 90.00, 7, 15);

INSERT INTO VERBALE_VIOLAZIONE (idverbale, idviolazione)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 6),
(4, 7),
(5, 8),
(6, 9),
(7, 10),
(8, 11),
(9, 12),
(10, 13),
(11, 14),
(12, 15);


--1--
SELECT COUNT(*) AS TOTVERBALI FROM VERBALE;

--2--
SELECT A.idanagrafica, A.Cognome, A.Nome, COUNT(V.idverbale) AS ContoVerbali
FROM ANAGRAFICA A
INNER JOIN VERBALE V ON A.idanagrafica = V.idanagrafica
GROUP BY A.idanagrafica, A.Cognome, A.Nome;

--3--
SELECT TV.idviolazione, TV.descrizione, COUNT(VV.idverbale) AS ContoVerbali
FROM TIPO_VIOLAZIONE TV
INNER JOIN VERBALE_VIOLAZIONE VV ON TV.idviolazione = VV.idviolazione
GROUP BY TV.idviolazione, TV.descrizione

--4--
SELECT A.idanagrafica, A.Cognome, A.Nome, SUM(V.DecurtamentoPunti) AS TotalePuntiDecurtati
FROM ANAGRAFICA A
INNER JOIN VERBALE V ON A.idanagrafica = V.idanagrafica
GROUP BY A.idanagrafica, A.Cognome, A.Nome

--5--
SELECT A.Cognome, A.Nome, V.DataViolazione, V.IndirizzoViolazione, V.Importo, V.DecurtamentoPunti
FROM ANAGRAFICA A
INNER JOIN VERBALE V ON A.idanagrafica = V.idanagrafica
WHERE A.Città = 'Palermo';

--6--
SELECT A.Cognome, A.Nome, V.DataViolazione, V.IndirizzoViolazione, V.Importo, V.DecurtamentoPunti
FROM ANAGRAFICA A
INNER JOIN VERBALE V ON A.idanagrafica = V.idanagrafica
WHERE V.DataViolazione BETWEEN '2009-02-01' AND '2009-07-30';

--7--
SELECT A.idanagrafica ,SUM(V.Importo) AS TotaleImporto
FROM ANAGRAFICA A
INNER JOIN VERBALE V ON A.idanagrafica = V.idanagrafica
GROUP BY A.idanagrafica;

--8--
SELECT * FROM ANAGRAFICA WHERE Città = 'Palermo';

--9--
SELECT DataViolazione, Importo, DecurtamentoPunti FROM VERBALE WHERE DataViolazione LIKE '2025-02-10';

--10--
SELECT V.Nominativo_Agente, COUNT(VV.idviolazione) AS NumeroViolazioni
FROM VERBALE V
INNER JOIN VERBALE_VIOLAZIONE VV ON V.idverbale = VV.idverbale
GROUP BY V.Nominativo_Agente;

--11--
SELECT A.Cognome, A.Nome, A.Indirizzo, V.DataViolazione, V.Importo, V.DecurtamentoPunti
FROM ANAGRAFICA A
INNER JOIN VERBALE V ON A.idanagrafica = V.idanagrafica
WHERE V.DecurtamentoPunti > 5;

--12--
SELECT A.Cognome, A.Nome, A.Indirizzo, V.DataViolazione, V.Importo, V.DecurtamentoPunti
FROM ANAGRAFICA A
INNER JOIN VERBALE V ON A.idanagrafica = V.idanagrafica
WHERE V.Importo > 400;

--EXTRA 1--
SELECT Nominativo_Agente ,COUNT(idverbale) AS TotVerbali, SUM(Importo) AS TotImporto FROM VERBALE GROUP BY Nominativo_Agente;

--EXTRA 2--
SELECT AVG(Importo) AS MediaImporti, VV.idviolazione
FROM VERBALE V
INNER JOIN VERBALE_VIOLAZIONE VV ON V.idverbale = VV.idverbale
GROUP BY VV.idviolazione;