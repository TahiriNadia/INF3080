-- ====================================================================== --
-- Auteurs: Francis Leroux-Contant, Raphael Dupuis, Geraud Frappier,      --
-- Salah Ghedda, Vincent Delisle, Navasaanth Natkunaseelan                --  
-- Date: 04/02/2021                                                       --              
-- Exercice 5 : Tables Client, Voiture et Réparation                      --
-- ====================================================================== --

-- ==================== --
-- TESTS: TABLE Voiture --
-- ==================== --
-- Insertion d'un client valide afin de pouvoir tester l'insertion de voiture
INSERT INTO Client (nom_client, prenom_client, adresse_client) VALUES( 'unNom', 'unPrenom', '123 rue de la rue');

-- num_immatriculation doit être sur le format "xxx ABC" ou "xxxAxxx" : Le test va échouer
INSERT INTO Voiture (num_immatriculation, marque, type_voiture, annee, id_client) VALUES ('j1o k;2', 'uneMarque', 'unType', 2004, 1);

-- num_immatriculation doit être sur le format "xxx ABC" ou "xxxAxxx" : Le test va réussir
INSERT INTO Voiture (num_immatriculation, marque, type_voiture, annee, id_client) VALUES ('132A789', 'uneMarque', 'unType', 2004, 1);

-- num_immatriculation doit être sur le format "xxx ABC" ou "xxxAxxx" : Le test va réussir
INSERT INTO Voiture (num_immatriculation, marque, type_voiture, annee, id_client) VALUES ('123 AGJ', 'uneMarque', 'unType', 2004, 1);

-- annee doit comporter 4 chiffres: Le test va échouer
INSERT INTO Voiture (num_immatriculation, marque, type_voiture, annee, id_client) VALUES ('123A456', 'uneMarque', 'unType', 23, 1);

-- annee doit comporter 4 chiffres: Le test va échouer
INSERT INTO Voiture (num_immatriculation, marque, type_voiture, annee, id_client) VALUES ('123A456', 'uneMarque', 'unType', 233, 1);

-- annee doit comporter 4 chiffres: Le test va échouer
INSERT INTO Voiture (num_immatriculation, marque, type_voiture, annee, id_client) VALUES ('123A456', 'uneMarque', 'unType', 23333, 1);

-- annee doit comporter 4 chiffres: Le test va réussir
INSERT INTO Voiture (num_immatriculation, marque, type_voiture, annee, id_client) VALUES ('123B456', 'uneMarque', 'unType', 2000, 1);


-- ======================= --
-- TESTS: TABLE Reparation --
-- ======================= --
-- montant_reparation doit etre plus grand que 0: Le test va échouer
INSERT INTO Reparation (date_reparation, montant_reparation, num_immatriculation) VALUES (CURRENT_DATE, -1234, '123A456');

-- montant_reparation doit etre plus grand que 0: Le test va réussir
INSERT INTO Reparation (date_reparation, montant_reparation, num_immatriculation) VALUES (CURRENT_DATE, 754, '132A789');


-- ===================== --
-- CREATION TABLE Client --
-- ===================== --
CREATE TABLE Client (
  id_client             NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  nom_client            VARCHAR2(255) NOT NULL,
  prenom_client         VARCHAR2(255) NOT NULL,
  adresse_client        VARCHAR2(255) NOT NULL,
  PRIMARY KEY (id_client)
);


-- ====================== --
-- CREATION TABLE Voiture --
-- ====================== --
CREATE TABLE Voiture (
  num_immatriculation   VARCHAR2(255),
  marque                VARCHAR2(255) NOT NULL,
  type_voiture          VARCHAR2(255) NOT NULL,
  annee                 NUMBER(10) NOT NULL,
  id_client             NUMBER(10) NOT NULL,
  PRIMARY KEY (num_immatriculation),
  FOREIGN KEY (id_client) REFERENCES Client,
  CONSTRAINT numero_immatriculation_doit_respecter_format CHECK (REGEXP_LIKE (num_immatriculation, '^[0-9]{3}( [A-Z]{3}|[A-Z][0-9]{3})$')),
  CONSTRAINT annee_doit_avoir_quatre_chiffres CHECK (annee > 999 AND annee < 10000)
);


-- ========================= --
-- CREATION TABLE Reparation --
-- ========================= --
CREATE TABLE Reparation(
  num_reparation        NUMBER(10) GENERATED ALWAYS AS IDENTITY,
  date_reparation       DATE NOT NULL,
  montant_reparation    NUMBER(10) NOT NULL,
  num_immatriculation   VARCHAR2(255) NOT NULL,
  PRIMARY KEY (num_reparation),
  FOREIGN KEY (num_immatriculation) REFERENCES Voiture,
  CONSTRAINT montant_reparation_doit_etre_plus_grand_zero CHECK (montant_reparation > 0)
);
