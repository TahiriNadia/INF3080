-- =========================================
--Auteur: 
--Clayton Charles-Augustin
--Pascal Puttee
--Mohammed Amine Gadi
--Philip Truong
--Erik Thirion-Charlebois
--Date: 2 Fevrier 2021
--Description: Exercice Numero 4 equipe 21 
-- ===========================================

CREATE TABLE auteur (
    id_auteur  NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    nom        VARCHAR(256) NOT NULL,
    prenom     VARCHAR(256) NOT NULL,
    PRIMARY KEY ( id_auteur )
);

CREATE TABLE editeur (
    id_editeur   NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    nom_editeur  VARCHAR(256) NOT NULL,
    adresse      VARCHAR(256) NOT NULL,
    PRIMARY KEY ( id_editeur )
);

CREATE TABLE emprunteur (
    id_emprunteur         NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    nom_emprunteur        VARCHAR2(255) NOT NULL,
    adresse_emprunteur    VARCHAR2(255),
    telephone_emprunteur  VARCHAR2(255) NOT NULL,
    PRIMARY KEY ( id_emprunteur ),
    CONSTRAINT validite_telephone CHECK ( REGEXP_LIKE ( telephone_emprunteur,
                                                        '^514-[0-9]{3}-[0-9]{4}$' )
                                          OR REGEXP_LIKE ( telephone_emprunteur,
                                                           '^438-[0-9]{3}-[0-9]{4}$' ) )
);

CREATE TABLE ouvrage (
    id_ouvrage  NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    titre       NUMBER(10) NOT NULL,
    id_editeur  NUMBER(10) NOT NULL,
    PRIMARY KEY ( id_ouvrage ),
    CONSTRAINT clef_etrangere_editeur FOREIGN KEY ( id_editeur )
        REFERENCES editeur
);

CREATE TABLE exemplaire (
    num_exemplaire  NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    position        NUMBER(10) NOT NULL,
    date_achat      DATE NOT NULL,
    id_ouvrage      NUMBER(10),
    PRIMARY KEY ( num_exemplaire ),
    CONSTRAINT clef_etrangere_ouvrage FOREIGN KEY ( id_ouvrage )
        REFERENCES ouvrage ( id_ouvrage ),
    CONSTRAINT position_plus_grand_que_zero CHECK ( position >= 0 )
);


CREATE TABLE auteur_ouvrage (
    id_auteur    NUMBER(10)
        REFERENCES auteur,
    id_ouvrage   NUMBER(10)
        REFERENCES ouvrage,
    PRIMARY KEY ( id_auteur,
                  id_ouvrage )
);

-- =========================================
--Auteur: 
--Clayton Charles-Augustin
--Pascal Puttee
--Mohammed Amine Gadi
--Philip Truong
--Erik Thirion-Charlebois
--Date: 2 Fevrier 2021
--Description: Test
-- ===========================================

-- ===========================
-- TESTS: Table Exemplaire
-- ===========================

-- Verification position >= 0.Ce test devrait reussir
INSERT INTO exemplaire (
    position ,
    date_achat
) VALUES (
    '10',
    DATE '2000-01-01'
);


-- Verification position >= 0.Ce test devrait echouer
INSERT INTO exemplaire (
    position ,
    date_achat
) VALUES (
    '-1',
    DATE '2000-01-01'
);

-- ===========================
-- TESTS: Table emprunter
-- ===========================

-- Verification numero commencant par 514.Ce test devrait reussir
INSERT INTO emprunteur (
    nom_emprunteur,
    telephone_emprunteur
) VALUES (
    'Etienne',
    '514-335-5555'
);

-- Verification numero commencant par 438.Ce test devrait reussir
INSERT INTO emprunteur (
    nom_emprunteur,
    telephone_emprunteur
) VALUES (
    'Etienne',
    '438-335-5555'
);

-- Verification numero avec des carateres de non-numérique.Ce test devrait échouer
INSERT INTO emprunteur (
    nom_emprunteur,
    telephone_emprunteur
) VALUES (
    'Etienne',
    '438-abc-abcd'
);

-- Verification numero avec code regional autre que 514 ou 438.Ce test devrait échouer
INSERT INTO emprunteur (
    nom_emprunteur,
    telephone_emprunteur
) VALUES (
    'Etienne',
    '819-111-1111'
);
