CREATE TABLE Pieces (
 Code NUMBER(10) PRIMARY KEY NOT NULL,
 Name VARCHAR2(255) NOT NULL
 );
CREATE TABLE Providers (
 Code VARCHAR2(40) 
 PRIMARY KEY NOT NULL,  
 Name VARCHAR2(255) NOT NULL 
 );
CREATE TABLE Provides (
 Piece NUMBER(10), 
 Provider VARCHAR2(40), 
 Price NUMBER(10) NOT NULL,
 FOREIGN KEY (Provider) REFERENCES Providers(Code),
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 PRIMARY KEY(Piece, Provider) 
 );
 
 
 
INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');

INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');

INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);
