-- ==================================
-- Auteurs: Jonathan Lopez 
--          Sukhmandeep Bénipal 
--          Jérémy Prioletta
--          Edvin Honda
-- Date: 4 février 2021
-- Description: Exercice 7 semaine 3
-- ==================================


-- ======================
-- TESTS: table personne
-- ======================
-- Test avec un sexe de type F. Ce test réussi.
INSERT INTO PERSONNE (NOM, PRENOM, SEXE, AGE, PROFESSION) VALUES ('BENIPAL', 'ALEXANDRA', 'F', 18, 'PROFESSEUR');
-- Test avec un sexe de type H. Ce test réussi.
INSERT INTO PERSONNE (NOM, PRENOM, SEXE, AGE, PROFESSION) VALUES ('TEN', 'BEN', 'H', 26, 'CHARGÉ DE LABORATOIRE');
-- Test avec un sexe de type ND. Ce test réussi.
INSERT INTO PERSONNE (NOM, PRENOM, SEXE, AGE, PROFESSION) VALUES ('BINNE', 'JO', 'ND', 3, 'BÉBÉ'); 
-- Test avec un type de sexe non valide. Ce test échoue.
INSERT INTO PERSONNE (NOM, PRENOM, SEXE, AGE, PROFESSION) VALUES ('PIERRE', 'ONCLE', 'AFK', 50, 'UNKNOWN');

-- =======================
-- TESTS: table type plat
-- =======================

-- Le type de plat doit être un choix parmis régulier, végétalien ou végétarien. Ce test réussi.
INSERT INTO TYPE_PLAT (NOM_TYPE) VALUES ('végétarien');
-- Le type de plat doit être un choix parmis régulier, végétalien ou végétarien. Ce test réussi.
INSERT INTO TYPE_PLAT (NOM_TYPE) VALUES ('végétalien');
-- Le type de plat doit être un choix parmis régulier, végétalien ou végétarien. Ce test réussi.
INSERT INTO TYPE_PLAT (NOM_TYPE) VALUES ('régulier');
-- Test pour nom_type avec une entrée non valide. Ce test échoue.
INSERT INTO TYPE_PLAT (NOM_TYPE) VALUES ('kéto');


-- =========================
-- CREATION TABLE: PERSONNE
-- =========================
CREATE TABLE personne (
    id_personne   NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    nom           VARCHAR2(255) NOT NULL,
    prenom        VARCHAR2(255) NOT NULL,
    sexe          CHAR(255) NOT NULL,
    age           NUMBER(10) NOT NULL,
    profession    VARCHAR2(255) NOT NULL,
    PRIMARY KEY ( id_personne ),
    CONSTRAINT status_sexe CHECK ( sexe IN (
        'H',
        'F',
        'ND'
    ) )
);
-- ==========================
-- CREATION TABLE: RECEPTION
-- ==========================
CREATE TABLE reception (
    num_reception    NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    date_reception   DATE NOT NULL,
    PRIMARY KEY ( num_reception )
);

-- =====================
-- CREATION TABLE: VINS
-- =====================
CREATE TABLE VINS (
NUM_VIN NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
NOM_VIN   VARCHAR2(255) NOT NULL,
PRIMARY KEY (NUM_VIN)
);

-- ==========================
-- CREATION TABLE: TYPE PLAT
-- ==========================      
 CREATE TABLE type_plat (
    num_type   NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    nom_type   VARCHAR2(255) NOT NULL,
    PRIMARY KEY ( num_type ),
    CONSTRAINT plat_disponible CHECK ( nom_type IN (
        'régulier',
        'végétalien',
        'végétarien'
    ) )
);                    

-- =====================
-- CREATION TABLE: PLAT
-- =====================
CREATE TABLE plat (
    num_plat   NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    nom_plat   VARCHAR2(255) NOT NULL,
    num_type   NUMBER(10) NOT NULL,
    PRIMARY KEY ( num_plat ),
    FOREIGN KEY ( num_type )
        REFERENCES type_plat
);

-- ==============================
-- CREATION TABLE: PERSONNE PLAT
-- ============================== 
CREATE TABLE personne_plat (
    id_personne   NUMBER(10) NOT NULL,
    num_plat      NUMBER(10) NOT NULL,
    FOREIGN KEY ( id_personne )
        REFERENCES personne,
    FOREIGN KEY ( num_plat )
        REFERENCES plat
);

-- ===================================
-- CREATION TABLE: PERSONNE RECEPTION
-- ===================================
CREATE TABLE personne_reception (
    id_personne     NUMBER(10) NOT NULL,
    num_reception   NUMBER(10) NOT NULL,
    FOREIGN KEY ( id_personne )
        REFERENCES personne,
    FOREIGN KEY ( num_reception )
        REFERENCES reception
);

-- ===============================
-- CREATION TABLE: RECEPTION PLAT
-- ===============================
CREATE TABLE reception_plat (
    num_reception   NUMBER(10) NOT NULL,
    num_plat        NUMBER(10) NOT NULL,
    FOREIGN KEY ( num_reception )
        REFERENCES reception,
    FOREIGN KEY ( num_plat )
        REFERENCES plat
);

-- ===========================
-- CREATION TABLE: PLAT VINS
-- ===========================
CREATE TABLE plat_vins (
    num_plat   NUMBER(10) NOT NULL,
    num_vin    NUMBER(10) NOT NULL,
    FOREIGN KEY ( num_plat )
        REFERENCES plat,
    FOREIGN KEY ( num_vin )
        REFERENCES vins
);
