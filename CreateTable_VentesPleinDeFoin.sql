SET ECHO ON
-- Script Oracle SQL*plus de creation du schema VentesPleinDeFoin 
-- du chapitre 7, volume 1 (Godin 2000a)

-- Creation des tables
SET ECHO ON
CREATE TABLE Client
(noClient 		INTEGER 		NOT NULL,
 nomClient 		VARCHAR(20) 	NOT NULL,
 noTelephone 	VARCHAR(15) 	NOT NULL,
 PRIMARY KEY 	(noClient)
)
/
CREATE TABLE Article
(noArticle 		INTEGER		NOT NULL,
 description 	VARCHAR(20),
 prixUnitaire 	DECIMAL(10,2)	NOT NULL,
 quantiteEnStock	INTEGER		DEFAULT 0 NOT NULL 
 	CHECK (quantiteEnStock >= 0),
 PRIMARY KEY (noArticle))
/
CREATE TABLE Commande
(noCommande 	INTEGER 		NOT NULL,
 dateCommande	DATE			NOT NULL,
 noClient		INTEGER		NOT NULL,
 PRIMARY KEY 	(noCommande),
 FOREIGN KEY 	(noClient) REFERENCES Client
)
/
CREATE TABLE LigneCommande
(noCommande 	INTEGER		NOT NULL,
 noArticle 		INTEGER		NOT NULL,
 quantite 		INTEGER		NOT NULL
	CHECK (quantite > 0),
 PRIMARY KEY (noCommande, noArticle),
 FOREIGN KEY (noCommande) REFERENCES Commande,
 FOREIGN KEY (noArticle) REFERENCES Article
)
/
CREATE TABLE Livraison
(noLivraison 	INTEGER 		NOT NULL,
 dateLivraison	DATE			NOT NULL,
 PRIMARY KEY (noLivraison)
)
/
CREATE TABLE DetailLivraison
(noLivraison 	INTEGER 		NOT NULL,
 noCommande 	INTEGER		NOT NULL,
 noArticle 		INTEGER		NOT NULL,
 quantiteLivree	INTEGER		NOT NULL
	CHECK (quantiteLivree > 0),
 PRIMARY KEY (noLivraison, noCommande, noArticle),
 FOREIGN KEY (noLivraison) REFERENCES Livraison,
 FOREIGN KEY (noCommande, noArticle) REFERENCES LigneCommande
)
/
SET ECHO OFF