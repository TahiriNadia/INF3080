-- ====================
--Auteur: Équipe 18
--Date: 4 février 2021
--Description: Corrigé de l'exercice 6
-- ====================

--CRÉATION TABLE Mecanicien
CREATE TABLE mecanicien (
    nummecano         NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    nommecano         VARCHAR2(255) NOT NULL,
    adressemecano     VARCHAR2(255) NOT NULL,
    telephonemecano   NUMBER(19) NOT NULL,

--contraintes
    PRIMARY KEY ( nummecano )
);

--CRÉATION TABLE Pilote

CREATE TABLE pilote (
    numbrevet         NUMBER(10),
    nompilote         VARCHAR2(255) NOT NULL,
    adressepilote     VARCHAR2(255) NOT NULL,
    telephonepilote   NUMBER(10) NOT NULL,

--contraintes
    PRIMARY KEY ( numbrevet )
);

--CRÉATION TABLE Propriétaire

CREATE TABLE proprietaire (
    numproprietaire   NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    nomproprietaire   VARCHAR2(255) NOT NULL,
    adresseprop       VARCHAR2(255) NOT NULL,
    telephoneprop     NUMBER(10) NOT NULL,

--contraintes
    PRIMARY KEY ( numproprietaire ),
    CONSTRAINT nom_proprietaire_parmis_liste CHECK ( nomproprietaire IN (
        'AirCanada',
        'AirTransat',
        'WestJet',
        'Tunisiair'
    ) )
);
    
--CRÉATION TABLE Constructeur

CREATE TABLE constructeur (
    nomconstructeur VARCHAR2(255),

--contraintes
    PRIMARY KEY ( nomconstructeur )
);

--CRÉATION TABLE TYPE

CREATE TABLE type (
    nomtype           VARCHAR2(255),
    puissance         NUMBER(10) NOT NULL,
    nbrplaces         NUMBER(10) NOT NULL,
    nomconstructeur   VARCHAR2(255) NOT NULL
);

--ajouter contraintes pour type

ALTER TABLE type ADD PRIMARY KEY ( nomtype );

ALTER TABLE type ADD FOREIGN KEY ( nomconstructeur )
    REFERENCES constructeur;

ALTER TABLE type ADD CONSTRAINT puissance_au_dessus_5000 CHECK ( puissance > 5000 );

ALTER TABLE type
    ADD CONSTRAINT nbr_places_entre_50_et_300 CHECK ( nbrplaces >= 50
                                                      AND nbrplaces <= 300 );

--CRÉATION TABLE mecanicien_type

CREATE TABLE mecanicien_type (
    nummecano   NUMBER(10),
    nomtype     VARCHAR2(255),

--contraintes
    FOREIGN KEY ( nummecano )
        REFERENCES mecanicien,
    FOREIGN KEY ( nomtype )
        REFERENCES type,
    PRIMARY KEY ( nummecano, nomtype )
);

--CRÉATION TABLE type_pilote

CREATE TABLE type_pilote (
    nomtype     VARCHAR2(255),
    numbrevet   NUMBER(10),
    nbvols      NUMBER(10) NOT NULL,

--contraintes
    FOREIGN KEY ( nomtype )
        REFERENCES type,
    FOREIGN KEY ( numbrevet )
        REFERENCES pilote,
    PRIMARY KEY ( nomtype, numbrevet )
);

--CRÉATION TABLE Avion

CREATE TABLE avion (
    immatriculation   VARCHAR2(255),
    dateachat         DATE NOT NULL,
    numproprietaire   NUMBER(10) NOT NULL,
    nomtype           VARCHAR2(255) NOT NULL,

--contraintes
    PRIMARY KEY ( immatriculation ),
    FOREIGN KEY ( numproprietaire )
        REFERENCES proprietaire,
    FOREIGN KEY ( nomtype )
        REFERENCES type
);

--CRÉATION TABLE intervention

CREATE TABLE intervention (
    numintervention     NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    objetintervention   VARCHAR2(255) NOT NULL,
    dateintervention    DATE NOT NULL,
    duree               NUMBER(10) NOT NULL,
    immatriculation     VARCHAR2(255) NOT NULL,
    nummecano           NUMBER(10) NOT NULL,

--contraintes
    PRIMARY KEY ( numintervention ),
    FOREIGN KEY ( immatriculation )
        REFERENCES avion,
    FOREIGN KEY ( nummecano )
        REFERENCES mecanicien
);

-- ====================
-- TESTS
-- ====================

--TESTS: Table Proprietaire
--le nom doit faire partie de la liste donnée: ce test ÉCHOUE

INSERT INTO proprietaire (
    nomproprietaire,
    adresseprop,
    telephoneprop
) VALUES (
    'nom qui échoue',
    '1523 montreal',
    5145550000
);

--le nom doit faire partie de la liste donnée: ce test RÉUSSIT

INSERT INTO proprietaire (
    nomproprietaire,
    adresseprop,
    telephoneprop
) VALUES (
    'AirCanada',
    '1523 montreal',
    5145550000
);

--TESTS: Table type
--La puissance doit être supérieure à 5000 : ce test ÉCHOUE

INSERT INTO type (
    nomtype,
    puissance,
    nbrplaces
) VALUES (
    'Type numero 1',
    4999,
    51
);

--La puissance doit être supérieure à 5000 : ce test RÉUSSIT

INSERT INTO type (
    nomtype,
    puissance,
    nbrplaces
) VALUES (
    'Type numero 1',
    5001,
    51
);

--Le nombre de places doit être entre 50 et 300 : ce test ÉCHOUE

INSERT INTO type (
    nomtype,
    puissance,
    nbrplaces
) VALUES (
    'Type numero 2',
    5001,
    49
);

--Le nombre de places doit être entre 50 et 300 : ce test ÉCHOUE

INSERT INTO type (
    nomtype,
    puissance,
    nbrplaces
) VALUES (
    'Type numero 4',
    5001,
    301
);

--Le nombre de places doit être entre 50 et 300 : ce test RÉUSSIT

INSERT INTO type (
    nomtype,
    puissance,
    nbrplaces
) VALUES (
    'Type numero 3',
    5001,
    60
);


--code pour supprimer toutes les tables:
--   SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
