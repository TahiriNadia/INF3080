CREATE TABLE Physician (
  EmployeeID number(10) PRIMARY KEY NOT NULL,
  Name varchar2(255) NOT NULL,
  Position varchar2(255) NOT NULL,
  SSN number(10) NOT NULL
); 

CREATE TABLE Department (
  DepartmentID number(10) PRIMARY KEY NOT NULL,
  Name varchar2(255) NOT NULL,
  Head number(10) NOT NULL
    CONSTRAINT fk_Physician_EmployeeID REFERENCES Physician(EmployeeID)
);

CREATE TABLE Affiliated_With (
  Physician number(10) NOT NULL
    CONSTRAINT fk_Physician_EmployeeID1 REFERENCES Physician(EmployeeID),
  Department number(10) NOT NULL
    CONSTRAINT fk_Department_DepartmentID REFERENCES Department(DepartmentID),
  PrimaryAffiliation number(1) NOT NULL,
  PRIMARY KEY(Physician, Department)
);

CREATE TABLE Procedure (
  Code number(10) PRIMARY KEY NOT NULL,
  Name varchar2(255) NOT NULL,
  Cost number(10,2) NOT NULL
);

CREATE TABLE Trained_In (
  Physician number(10) NOT NULL
    CONSTRAINT fk_Physician_EmployeeID2 REFERENCES Physician(EmployeeID),
  Treatment number(10) NOT NULL
    CONSTRAINT fk_Procedure_Code2 REFERENCES Procedure(Code),
  CertificationDate timestamp NOT NULL,
  CertificationExpires timestamp NOT NULL,
  PRIMARY KEY(Physician, Treatment)
);

CREATE TABLE Patient (
  SSN number(10) PRIMARY KEY NOT NULL,
  Name varchar2(255) NOT NULL,
  Address varchar2(255) NOT NULL,
  Phone varchar2(255) NOT NULL,
  InsuranceID number(10) NOT NULL,
  PCP number(10) NOT NULL
    CONSTRAINT fk_Physician_EmployeeID3 REFERENCES Physician(EmployeeID)
);

CREATE TABLE Nurse (
  EmployeeID number(10) PRIMARY KEY NOT NULL,
  Name varchar2(255) NOT NULL,
  Position varchar2(255) NOT NULL,
  Registered number(1) NOT NULL,
  SSN number(10) NOT NULL
);

CREATE TABLE Appointment (
  AppointmentID number(10) PRIMARY KEY NOT NULL,
  Patient number(10) NOT NULL
    CONSTRAINT fk_Patient_SSN4 REFERENCES Patient(SSN),
  PrepNurse number(10)
    CONSTRAINT fk_Nurse_EmployeeID4 REFERENCES Nurse(EmployeeID),
  Physician number(10) NOT NULL
    CONSTRAINT fk_Physician_EmployeeID4 REFERENCES Physician(EmployeeID),
  start_datetime timestamp NOT NULL,
  end_datetime timestamp NOT NULL,
  ExaminationRoom varchar2(255) NOT NULL
);

CREATE TABLE Medication (
  Code number(10) PRIMARY KEY NOT NULL,
  Name varchar2(255) NOT NULL,
  Brand varchar2(255) NOT NULL,
  Description varchar2(255) NOT NULL
);

CREATE TABLE Prescribes (
  Physician number(10) NOT NULL
    CONSTRAINT fk_Physician_EmployeeID5 REFERENCES Physician(EmployeeID),
  Patient number(10) NOT NULL
    CONSTRAINT fk_Patient_SSN5 REFERENCES Patient(SSN),
  Medication number(10) NOT NULL
    CONSTRAINT fk_Medication_Code5 REFERENCES Medication(Code),
  dates timestamp NOT NULL,
  Appointment number(10)
    CONSTRAINT fk_Appointment_AppointmentID5 REFERENCES Appointment(AppointmentID),
  Dose varchar2(255) NOT NULL,
  PRIMARY KEY(Physician, Patient, Medication, dates)
);

CREATE TABLE Block (
  floor_num number(10) NOT NULL,
  Code number(10) NOT NULL,
  PRIMARY KEY(floor_num, Code)
); 

CREATE TABLE Room (
  room_num number(10) PRIMARY KEY NOT NULL,
  room_type varchar2(255) NOT NULL,
  BlockFloor number(10) NOT NULL,
  BlockCode number(10) NOT NULL,
  Unavailable number(1) NOT NULL,
  FOREIGN KEY(BlockFloor, BlockCode) REFERENCES Block
);

CREATE TABLE On_Call (
  Nurse number(10) NOT NULL
    CONSTRAINT fk_Nurse_EmployeeID6 REFERENCES Nurse(EmployeeID),
  BlockFloor number(10) NOT NULL,
  BlockCode number(10) NOT NULL,
  start_datetime timestamp NOT NULL,
  end_datetime timestamp NOT NULL,
  PRIMARY KEY(Nurse, BlockFloor, BlockCode, start_datetime, end_datetime),
  FOREIGN KEY(BlockFloor, BlockCode) REFERENCES Block
);

CREATE TABLE Stay (
  StayID number(10) PRIMARY KEY NOT NULL,
  Patient number(10) NOT NULL
    CONSTRAINT fk_Patient_SSN7 REFERENCES Patient(SSN),
  Room number(10) NOT NULL
    CONSTRAINT fk_Room_Number7 REFERENCES Room(room_num),
  start_datetime timestamp NOT NULL,
  end_datetime timestamp NOT NULL
);

CREATE TABLE Undergoes (
  Patient number(10) NOT NULL
    CONSTRAINT fk_Patient_SSN8 REFERENCES Patient(SSN),
  current_Procedure number(10) NOT NULL
    CONSTRAINT fk_Procedure_Code8 REFERENCES Procedure(Code),
  Stay number(10) NOT NULL
    CONSTRAINT fk_Stay_StayID8 REFERENCES Stay(StayID),
  dates timestamp NOT NULL,
  Physician number(10) NOT NULL
    CONSTRAINT fk_Physician_EmployeeID8 REFERENCES Physician(EmployeeID),
  AssistingNurse number(10)
    CONSTRAINT fk_Nurse_EmployeeID8 REFERENCES Nurse(EmployeeID),
  PRIMARY KEY(Patient, current_Procedure, Stay, dates)
);

INSERT INTO Physician VALUES(1,'John Dorian','Staff Internist',111111111);
INSERT INTO Physician VALUES(2,'Elliot Reid','Attending Physician',222222222);
INSERT INTO Physician VALUES(3,'Christopher Turk','Surgical Attending Physician',333333333);
INSERT INTO Physician VALUES(4,'Percival Cox','Senior Attending Physician',444444444);
INSERT INTO Physician VALUES(5,'Bob Kelso','Head Chief of Medicine',555555555);
INSERT INTO Physician VALUES(6,'Todd Quinlan','Surgical Attending Physician',666666666);
INSERT INTO Physician VALUES(7,'John Wen','Surgical Attending Physician',777777777);
INSERT INTO Physician VALUES(8,'Keith Dudemeister','MD Resident',888888888);
INSERT INTO Physician VALUES(9,'Molly Clock','Attending Psychiatrist',999999999);

INSERT INTO Department VALUES(1,'General Medicine',4);
INSERT INTO Department VALUES(2,'Surgery',7);
INSERT INTO Department VALUES(3,'Psychiatry',9);

INSERT INTO Affiliated_With VALUES(1,1,1);
INSERT INTO Affiliated_With VALUES(2,1,1);
INSERT INTO Affiliated_With VALUES(3,1,0);
INSERT INTO Affiliated_With VALUES(3,2,1);
INSERT INTO Affiliated_With VALUES(4,1,1);
INSERT INTO Affiliated_With VALUES(5,1,1);
INSERT INTO Affiliated_With VALUES(6,2,1);
INSERT INTO Affiliated_With VALUES(7,1,0);
INSERT INTO Affiliated_With VALUES(7,2,1);
INSERT INTO Affiliated_With VALUES(8,1,1);
INSERT INTO Affiliated_With VALUES(9,3,1);

INSERT INTO Procedure VALUES(1,'Reverse Rhinopodoplasty',1500.0);
INSERT INTO Procedure VALUES(2,'Obtuse Pyloric Recombobulation',3750.0);
INSERT INTO Procedure VALUES(3,'Folded Demiophtalmectomy',4500.0);
INSERT INTO Procedure VALUES(4,'Complete Walletectomy',10000.0);
INSERT INTO Procedure VALUES(5,'Obfuscated Dermogastrotomy',4899.0);
INSERT INTO Procedure VALUES(6,'Reversible Pancreomyoplasty',5600.0);
INSERT INTO Procedure VALUES(7,'Follicular Demiectomy',25.0);

INSERT INTO Patient VALUES(100000001,'John Smith','42 Foobar Lane','555-0256',68476213,1);
INSERT INTO Patient VALUES(100000002,'Grace Ritchie','37 Snafu Drive','555-0512',36546321,2);
INSERT INTO Patient VALUES(100000003,'Random J. Patient','101 Omgbbq Street','555-1204',65465421,2);
INSERT INTO Patient VALUES(100000004,'Dennis Doe','1100 Foobaz Avenue','555-2048',68421879,3);

INSERT INTO Nurse VALUES(101,'Carla Espinosa','Head Nurse',1,111111110);
INSERT INTO Nurse VALUES(102,'Laverne Roberts','Nurse',1,222222220);
INSERT INTO Nurse VALUES(103,'Paul Flowers','Nurse',0,333333330);

INSERT INTO Appointment VALUES(13216584,100000001,101,1,to_date('2008-04-24 10:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-04-24 11:00', 'yyyy-mm-dd HH24:MI'),'A');
INSERT INTO Appointment VALUES(26548913,100000002,101,2,to_date('2008-04-24 10:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-04-24 11:00', 'yyyy-mm-dd HH24:MI'),'B');
INSERT INTO Appointment VALUES(36549879,100000001,102,1,to_date('2008-04-25 10:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-04-25 11:00', 'yyyy-mm-dd HH24:MI'),'A');
INSERT INTO Appointment VALUES(46846589,100000004,103,4,to_date('2008-04-25 10:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-04-25 11:00', 'yyyy-mm-dd HH24:MI'),'B');
INSERT INTO Appointment VALUES(59871321,100000004,NULL,4,to_date('2008-04-26 10:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-04-26 11:00', 'yyyy-mm-dd HH24:MI'),'C');
INSERT INTO Appointment VALUES(69879231,100000003,103,2,to_date('2008-04-26 11:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-04-26 12:00', 'yyyy-mm-dd HH24:MI'),'C');
INSERT INTO Appointment VALUES(76983231,100000001,NULL,3,to_date('2008-04-26 12:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-04-26 13:00', 'yyyy-mm-dd HH24:MI'),'C');
INSERT INTO Appointment VALUES(86213939,100000004,102,9,to_date('2008-04-27 10:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-04-21 11:00', 'yyyy-mm-dd HH24:MI'),'A');
INSERT INTO Appointment VALUES(93216548,100000002,101,2,to_date('2008-04-27 10:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-04-27 11:00', 'yyyy-mm-dd HH24:MI'),'B');

INSERT INTO Medication VALUES(1,'Procrastin-X','X','N/A');
INSERT INTO Medication VALUES(2,'Thesisin','Foo Labs','N/A');
INSERT INTO Medication VALUES(3,'Awakin','Bar Laboratories','N/A');
INSERT INTO Medication VALUES(4,'Crescavitin','Baz Industries','N/A');
INSERT INTO Medication VALUES(5,'Melioraurin','Snafu Pharmaceuticals','N/A');

INSERT INTO Prescribes VALUES(1,100000001,1,to_date('2008-04-24 10:47', 'yyyy-mm-dd HH24:MI'),13216584,'5');
INSERT INTO Prescribes VALUES(9,100000004,2,to_date('2008-04-27 10:53', 'yyyy-mm-dd HH24:MI'),86213939,'10');
INSERT INTO Prescribes VALUES(9,100000004,2,to_date('2008-04-30 16:53', 'yyyy-mm-dd HH24:MI'),NULL,'5');

INSERT INTO Block VALUES(1,1);
INSERT INTO Block VALUES(1,2);
INSERT INTO Block VALUES(1,3);
INSERT INTO Block VALUES(2,1);
INSERT INTO Block VALUES(2,2);
INSERT INTO Block VALUES(2,3);
INSERT INTO Block VALUES(3,1);
INSERT INTO Block VALUES(3,2);
INSERT INTO Block VALUES(3,3);
INSERT INTO Block VALUES(4,1);
INSERT INTO Block VALUES(4,2);
INSERT INTO Block VALUES(4,3);

INSERT INTO Room VALUES(101,'Single',1,1,0);
INSERT INTO Room VALUES(102,'Single',1,1,0);
INSERT INTO Room VALUES(103,'Single',1,1,0);
INSERT INTO Room VALUES(111,'Single',1,2,0);
INSERT INTO Room VALUES(112,'Single',1,2,1);
INSERT INTO Room VALUES(113,'Single',1,2,0);
INSERT INTO Room VALUES(121,'Single',1,3,0);
INSERT INTO Room VALUES(122,'Single',1,3,0);
INSERT INTO Room VALUES(123,'Single',1,3,0);
INSERT INTO Room VALUES(201,'Single',2,1,1);
INSERT INTO Room VALUES(202,'Single',2,1,0);
INSERT INTO Room VALUES(203,'Single',2,1,0);
INSERT INTO Room VALUES(211,'Single',2,2,0);
INSERT INTO Room VALUES(212,'Single',2,2,0);
INSERT INTO Room VALUES(213,'Single',2,2,1);
INSERT INTO Room VALUES(221,'Single',2,3,0);
INSERT INTO Room VALUES(222,'Single',2,3,0);
INSERT INTO Room VALUES(223,'Single',2,3,0);
INSERT INTO Room VALUES(301,'Single',3,1,0);
INSERT INTO Room VALUES(302,'Single',3,1,1);
INSERT INTO Room VALUES(303,'Single',3,1,0);
INSERT INTO Room VALUES(311,'Single',3,2,0);
INSERT INTO Room VALUES(312,'Single',3,2,0);
INSERT INTO Room VALUES(313,'Single',3,2,0);
INSERT INTO Room VALUES(321,'Single',3,3,1);
INSERT INTO Room VALUES(322,'Single',3,3,0);
INSERT INTO Room VALUES(323,'Single',3,3,0);
INSERT INTO Room VALUES(401,'Single',4,1,0);
INSERT INTO Room VALUES(402,'Single',4,1,1);
INSERT INTO Room VALUES(403,'Single',4,1,0);
INSERT INTO Room VALUES(411,'Single',4,2,0);
INSERT INTO Room VALUES(412,'Single',4,2,0);
INSERT INTO Room VALUES(413,'Single',4,2,0);
INSERT INTO Room VALUES(421,'Single',4,3,1);
INSERT INTO Room VALUES(422,'Single',4,3,0);
INSERT INTO Room VALUES(423,'Single',4,3,0);

INSERT INTO On_Call VALUES(101,1,1,to_date('2008-11-04 11:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-11-04 19:00', 'yyyy-mm-dd HH24:MI'));
INSERT INTO On_Call VALUES(101,1,2,to_date('2008-11-04 11:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-11-04 19:00', 'yyyy-mm-dd HH24:MI'));
INSERT INTO On_Call VALUES(102,1,3,to_date('2008-11-04 11:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-11-04 19:00', 'yyyy-mm-dd HH24:MI'));
INSERT INTO On_Call VALUES(103,1,1,to_date('2008-11-04 19:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-11-05 03:00', 'yyyy-mm-dd HH24:MI'));
INSERT INTO On_Call VALUES(103,1,2,to_date('2008-11-04 19:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-11-05 03:00', 'yyyy-mm-dd HH24:MI'));
INSERT INTO On_Call VALUES(103,1,3,to_date('2008-11-04 19:00', 'yyyy-mm-dd HH24:MI'),to_date('2008-11-05 03:00', 'yyyy-mm-dd HH24:MI'));

INSERT INTO Stay VALUES(3215,100000001,111,to_date('2008-05-01', 'yyyy-mm-dd'),to_date('2008-05-04', 'yyyy-mm-dd'));
INSERT INTO Stay VALUES(3216,100000003,123,to_date('2008-05-03', 'yyyy-mm-dd'),to_date('2008-05-14', 'yyyy-mm-dd'));
INSERT INTO Stay VALUES(3217,100000004,112,to_date('2008-05-02', 'yyyy-mm-dd'),to_date('2008-05-03', 'yyyy-mm-dd'));

INSERT INTO Undergoes VALUES(100000001,6,3215,to_date('2008-05-02', 'yyyy-mm-dd'),3,101);
INSERT INTO Undergoes VALUES(100000001,2,3215,to_date('2008-05-03', 'yyyy-mm-dd'),7,101);
INSERT INTO Undergoes VALUES(100000004,1,3217,to_date('2008-05-07', 'yyyy-mm-dd'),3,102);
INSERT INTO Undergoes VALUES(100000004,5,3217,to_date('2008-05-09', 'yyyy-mm-dd'),6,NULL);
INSERT INTO Undergoes VALUES(100000001,7,3217,to_date('2008-05-10', 'yyyy-mm-dd'),7,101);
INSERT INTO Undergoes VALUES(100000004,4,3217,to_date('2008-05-13', 'yyyy-mm-dd'),3,103);

INSERT INTO Trained_In VALUES(3,1,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(3,2,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(3,5,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(3,6,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(3,7,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(6,2,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(6,5,to_date('2007-01-01', 'yyyy-mm-dd'),to_date('2007-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(6,6,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(7,1,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(7,2,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(7,3,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(7,4,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(7,5,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(7,6,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
INSERT INTO Trained_In VALUES(7,7,to_date('2008-01-01', 'yyyy-mm-dd'),to_date('2008-12-31', 'yyyy-mm-dd'));
