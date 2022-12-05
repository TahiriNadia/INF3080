-- ========================
-- Auteur: Etienne Pilon
-- Date: 19 Janvier 2021
-- Description: Demo sur les contraintes de tables et sequences
-- ========================

-- ========================
-- TESTS: Table Client
-- ========================

-- Age doit etre > 18: Ce test ECHOUE
INSERT INTO Client (nom, prenom, age, no_tel) VALUES ('Pilon', 'Etienne', 17, '555-555-5555');
-- Doit ajouter Inconnu comme nom par default: Ce test REUSSIE
INSERT INTO Client (prenom, age, no_tel) VALUES ('Etienne', 30, '555-555-5555');

-- ========================
-- CREATION TABLE CLIENT --
-- ========================

CREATE TABLE client (
    no_client   NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    nom         VARCHAR2(50) DEFAULT 'Inconnu' NOT NULL,
    prenom      VARCHAR2(50) NOT NULL,
    age         NUMBER(3) NOT NULL,
    no_tel      VARCHAR2(20),
    PRIMARY KEY (no_client)
);

ALTER Table client add constraint client_doit_etre_majeur CHECK (age >= 18);


-- ========================
-- TESTS: Table Facture
-- ========================
-- Status doit etre parmis 3 valeurs: Ce test ECHOUE
INSERT INTO Facture (montant, status, no_client) VALUES (10.32, 'envoye', 1);
-- La date_heure doit etre inscrite par default: Ce test REUSSIE
INSERT INTO Facture (montant, status, no_client) VALUES (10.32, 'paye', 1);

-- ========================
-- CREATION TABLE Facture --
-- ========================
CREATE TABLE facture (
    no_facture   NUMBER(10) GENERATED ALWAYS AS IDENTITY,
    montant      NUMBER(10, 2) NOT NULL,
    date_heure   TIMESTAMP DEFAULT current_timestamp NOT NULL,
    status       VARCHAR(20) DEFAULT 'en_attente',
    no_client NUMBER(10),
    PRIMARY KEY (no_facture),
    FOREIGN KEY (no_client) REFERENCES client,
    CONSTRAINT status_possible_facture CHECK ( status IN (
            'en_attente',
            'paye',
            'recouvrement'
        ) )
);
