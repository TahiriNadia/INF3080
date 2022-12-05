create table Scientists (
  SSN number(10),
  Name varchar2(30) not null,
  Primary Key (SSN)
);

Create table Projects (
  Code varchar2(4),
  Name varchar2(50) not null,
  Hours number(10),
  Primary Key (Code)
);
	
create table AssignedTo (
  Scientist number(10) not null,
  Project varchar2(4) not null,
  Primary Key (Scientist, Project),
  Foreign Key (Scientist) references Scientists (SSN),
  Foreign Key (Project) references Projects (Code)
);

INSERT INTO Scientists(SSN,Name) VALUES(123234877,'Michael Rogers');
INSERT INTO Scientists(SSN,Name) VALUES(152934485,'Anand Manikutty');
INSERT INTO Scientists(SSN,Name) VALUES(222364883, 'Carol Smith');
INSERT INTO Scientists(SSN,Name) VALUES(326587417,'Joe Stevens');
INSERT INTO Scientists(SSN,Name) VALUES(332154719,'Mary-Anne Foster');	
INSERT INTO Scientists(SSN,Name) VALUES(332569843,'George ODonnell');
INSERT INTO Scientists(SSN,Name) VALUES(546523478,'John Doe');
INSERT INTO Scientists(SSN,Name) VALUES(631231482,'David Smith');
INSERT INTO Scientists(SSN,Name) VALUES(654873219,'Zacary Efron');
INSERT INTO Scientists(SSN,Name) VALUES(745685214,'Eric Goldsmith');
INSERT INTO Scientists(SSN,Name) VALUES(845657245,'Elizabeth Doe');
INSERT INTO Scientists(SSN,Name) VALUES(845657246,'Kumar Swamy');

INSERT INTO Projects ( Code,Name,Hours) VALUES ('AeH1','Winds: Studying Bernoullis Principle', 156);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('AeH2','Aerodynamics and Bridge Design',189);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('AeH3','Aerodynamics and Gas Mileage', 256);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('AeH4','Aerodynamics and Ice Hockey', 789);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('AeH5','Aerodynamics of a Football', 98);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('AeH6','Aerodynamics of Air Hockey',89);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('Ast1','A Matter of Time',112);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('Ast2','A Puzzling Parallax', 299);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('Ast3','Build Your Own Telescope', 6546);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('Bte1','Juicy: Extracting Apple Juice with Pectinase', 321);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('Bte2','A Magnetic Primer Designer', 9684);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('Bte3','Bacterial Transformation Efficiency', 321);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('Che1','A Silver-Cleaning Battery', 545);
INSERT INTO Projects ( Code,Name,Hours) VALUES ('Che2','A Soluble Separation Solution', 778);

INSERT INTO AssignedTo ( Scientist, Project) VALUES (123234877,'AeH1');
INSERT INTO AssignedTo ( Scientist, Project) VALUES (152934485,'AeH3');
INSERT INTO AssignedTo ( Scientist, Project) VALUES (222364883,'Ast3');	   
INSERT INTO AssignedTo ( Scientist, Project) VALUES (326587417,'Ast3');
INSERT INTO AssignedTo ( Scientist, Project) VALUES (332154719,'Bte1');
INSERT INTO AssignedTo ( Scientist, Project) VALUES (546523478,'Che1');
INSERT INTO AssignedTo ( Scientist, Project) VALUES (631231482,'Ast3');
INSERT INTO AssignedTo ( Scientist, Project) VALUES (654873219,'Che1');
INSERT INTO AssignedTo ( Scientist, Project) VALUES (745685214,'AeH3');
INSERT INTO AssignedTo ( Scientist, Project) VALUES (845657245,'Ast1');
INSERT INTO AssignedTo ( Scientist, Project) VALUES (845657246,'Ast2');
INSERT INTO AssignedTo ( Scientist, Project) VALUES (332569843,'AeH4');
