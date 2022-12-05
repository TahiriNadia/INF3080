-- ========================
-- Auteur: Équipe 19
-- Date: 4 Février 2021
-- Description: Corrigé de l'exercice 2
-- ========================

-- ========================
-- CREATION TABLE Patient --
-- ========================

CREATE TABLE Patient(
    num_patient NUMBER(10)GENERATED ALWAYS AS IDENTITY,
    nom_patient VARCHAR2(20) NOT NULL,
    PRIMARY KEY(num_patient)
);

-- ========================
-- CREATION TABLE Employe --
-- ========================

CREATE TABLE Employe(
    num_employe NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    nom_employe VARCHAR2(20) NOT NULL,
    employe_type VARCHAR(20) NOT NULL,
    PRIMARY KEY(num_employe),
    CONSTRAINT type_employe CHECK (employe_type IN('secrétaire', 'assistamte', 'dentiste', 'chirurgien'))
);

-- ========================
-- TESTS: Table Employe
-- ========================
-- employe_type doit etre parmis 4 valeurs: Ce test ECHOUE
INSERT INTO Employe (nom_employe,employe_type) VALUES ('Roger', 'blop');
-- employe_type doit etre parmis 4 valeurs: Ce test REUSSIE
INSERT INTO Employe (nom_employe,employe_type) VALUES ('Roger', 'dentiste');


-- ========================
-- CREATION TABLE Rendez_Vous --
-- ========================

CREATE TABLE Rendez_Vous(
    rendez_vous_id NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    num_patient NUMBER(10),
    num_employe NUMBER(10),
    date_rdv DATE DEFAULT SYSDATE NOT NULL,
    num_chirurgiem NUMBER(10),
    PRIMARY KEY(rendez_vous_id),
    FOREIGN KEY(num_patient) REFERENCES Patient,
    FOREIGN KEY(num_employe) REFERENCES Employe
);
