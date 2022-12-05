--===========================================================
--Auteurs:  Gabriel Demers, Amine El Yakoubi, Felix Laurin, 
--          Justin Rooney, Dominic Tremblay
--Date:     2021-02-05
--Description: Corriger de l'exercice 8
--===========================================================
-----------------------------
--TESTS  TYPE CLIENT
-----------------------------

--marche pas
INSERT INTO client (
    nom,
    prenom,
    adresse,
    cote_credit,
    num_tel,
    type_client
) VALUES (
    'Jean',
    'Jean',
    '123 rue',
    500,
    '500-500-5000',
    'pascorrect'
);

--marche
INSERT INTO client (
    nom,
    prenom,
    adresse,
    cote_credit,
    num_tel,
    type_client
) VALUES (
    'Jon',
    'Jean',
    '145 ruerue',
    501,
    '500-500-5001',
    'corporatif'
);
-----------------------------
--TEST QUANTITE 0 PAR DEFAUT
-----------------------------

INSERT INTO item (
    prix,
    description
) VALUES (
    10.01,
    'un bel objet de qualite'
);

INSERT INTO ITEM_COMMANDE (
    quantite
) VALUES (
); 



------------------------------
--TEST FORMAT NUMERO TELEPHONE
-----------------------------
--marche pas
INSERT INTO client (
    nom,
    prenom,
    adresse,
    cote_credit,
    num_tel,
    type_client
) VALUES (
    'Jojo',
    'Joji',
    '654 lereu',
    799,
    '50',
    'corporatif'
);

--marche
INSERT INTO client (
    nom,
    prenom,
    adresse,
    cote_credit,
    num_tel,
    type_client
) VALUES (
    'Joja',
    'Jijoo',
    '6599 lereu',
    500,
    '500-100-1234',
    'corporatif'
);

-----------------------------
--TEST DATE RECUE : DATE DE CRÉATION PAR DEFAUT
-----------------------------
INSERT INTO commande (
    est_prepaye,
    client_id
) VALUES (
    0,
    1
);

-----------------------------
--TABLE ITEM
-----------------------------
CREATE TABLE item (
    id_item      NUMBER(10)
        GENERATED ALWAYS AS IDENTITY
    NOT NULL,
    prix         NUMBER(6, 2) NOT NULL,
    description  VARCHAR2(64) NOT NULL,
    PRIMARY KEY ( id_item )
);


-----------------------------
--TABLE CLIENT
-----------------------------
CREATE TABLE client (
    id_client         NUMBER(10) GENERATED ALWAYS AS IDENTITY NOT NULL,
    nom               VARCHAR2(256) NOT NULL,
    prenom            VARCHAR(256) NOT NULL,
    adresse           VARCHAR2(256),
    cote_credit       NUMBER(3) NOT NULL,
    num_tel  VARCHAR2(16) NOT NULL,
    type_client       VARCHAR2(12) NOT NULL,
    PRIMARY KEY ( id_client ),

  constraint       particulier_ou_corporartif CHECK ( type_client IN ( 'particulier', 'corporatif' ) ),
  constraint       NUM_FORMAT_TELEPHONE CHECK(REGEXP_LIKE(NUM_TEL,'[0-9]{3}-[0-9]{3}-[0-9]{4}$'))
);

-----------------------------
--TABLE COMMANDE
-----------------------------
CREATE TABLE COMMANDE (
    num_cmd     NUMBER(10)  GENERATED ALWAYS AS IDENTITY,
    date_recu   DATE        DEFAULT current_date    NOT NULL,
    est_prepaye NUMBER(1)   NOT NULL,
    client_id   NUMBER(10)  NOT NULL,
    PRIMARY KEY (num_cmd),
    FOREIGN KEY (client_id) REFERENCES CLIENT
);


-----------------------------
--TABLE ITEM_COMMANDE
-----------------------------
CREATE TABLE ITEM_COMMANDE (
    commande_num_cmd    NUMBER(10),
    item_id             NUMBER(10)  NOT NULL,
    quantite            NUMBER(6)   DEFAULT 0    NOT NULL,
    PRIMARY KEY (item_id,commande_num_cmd),
    FOREIGN KEY (commande_num_cmd)  REFERENCES  COMMANDE,
    FOREIGN KEY (item_id) REFERENCES    ITEM
);

-----------------------------
--TABLE PARTICULIER
-----------------------------
CREATE TABLE PARTICULIER (
    carte_credit    NUMBER(16)  NOT NULL,
    client_id       NUMBER(10)  NOT NULL,
    PRIMARY KEY (client_id),
    FOREIGN KEY (client_id) 
        REFERENCES CLIENT
);

-----------------------------
--TABLE CORPORATIF
-----------------------------

CREATE TABLE corporatif (
    nom_contact    VARCHAR(64) NOT NULL,
    limite_credit  NUMBER(6) NOT NULL,
    client_id      NUMBER(10),
    PRIMARY KEY ( client_id ),
    FOREIGN KEY ( client_id )
        REFERENCES client
);



