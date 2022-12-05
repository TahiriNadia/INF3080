-- ======================================================
-- Auteurs: The Minh Luong, Walid Bennani, Adam Bem Mekki
-- Date: 2021/02/04
-- Description: Exercice 3 (semaine 4)
-- Équipe: 17
-- ======================================================



-- =====================
-- Test: Table Technicien
-- =====================

-- Nom doit être séparé en deux mots -> Ce test réussi
INSERT INTO technicien ( nom ) VALUES ( 'Robert Johnson Dimitrius Premier' );

-- Nom doit être séparé en deux mots -> Ce test échoue
INSERT INTO technicien ( nom ) VALUES ( 'Robert' );


-- =====================
-- Création table Article
-- =====================
CREATE TABLE article (
    id_article  NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    nom         VARCHAR2(256) NOT NULL,
    PRIMARY KEY ( id_article )
);

-- =====================
-- Création table Client
-- =====================
CREATE TABLE client (
    id_client       NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    nom             VARCHAR2(256) NOT NULL,
    date_naissance  DATE NOT NULL,
    PRIMARY KEY ( id_client )
);

-- =====================
-- Création table Appel
-- =====================
CREATE TABLE appel (
    id_appel            NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    date_appel          DATE DEFAULT current_date,
    duree_appel               NUMBER(10) NOT NULL,
    PRIMARY KEY ( id_appel ),
    article_id_article
        REFERENCES article ( id_article ),
    client_id_client    
        REFERENCES client ( id_client )
);

-- =====================
-- Création table Technicien
-- =====================
CREATE TABLE technicien (
    id_technicien  NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    nom            VARCHAR2(256) NOT NULL,
    PRIMARY KEY ( id_technicien ),
    CONSTRAINT nom_deux_mots CHECK (regexp_like(nom, '[A-z]{1,} [A-z]{1,}'))
);

-- =====================
-- Création table Dossier
-- =====================
CREATE TABLE dossier (
    nom_de_dossier            NUMBER(10)
        GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY ( nom_de_dossier ),
    appel_id_appel            
        REFERENCES appel ( id_appel ),
    technicien_id_technicien  
        REFERENCES technicien ( id_technicien )
);
