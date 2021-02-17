DROP TABLE IF EXISTS Mouvement;
DROP TABLE IF EXISTS TempHumi;
DROP TABLE IF EXISTS AirPressure;
DROP TABLE IF EXISTS Type;
DROP TABLE IF EXISTS Logement;
DROP TABLE IF EXISTS Poste;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS AirQualite;

CREATE TABLE Poste		(code TEXT PRIMARY KEY,									
						 ville TEXT NOT NULL);									

CREATE TABLE Address	(id INTEGER PRIMARY KEY AUTOINCREMENT,							
						 adressN INTEGER NOT NULL,											
						 adressR TEXT NOT NULL,		
						 adressP TEXT NOT NULL,									
						 FOREIGN KEY (adressP) REFERENCES Poste(code));

CREATE TABLE Logement	(id INTEGER PRIMARY KEY AUTOINCREMENT,
						 name TEXT NOT NULL,				
						 teleNum TEXT NOT NULL,															
						 ip TEXT NOT NULL,											
						 adress INTEGER NOT NULL,								
						 FOREIGN KEY (adress) REFERENCES Address(id));

CREATE TABLE Mouvement	(id INTEGER PRIMARY KEY AUTOINCREMENT, 					
						 x INTEGER NOT NULL,									
						 y INTEGER NOT NULL,									
						 z INTEGER NOT NULL,			
						 idType INTEGER NOT NULL,	
						 dateInser TIMESTAMP DEFAULT CURRENT_TIMESTAMP,							
						 FOREIGN KEY (idType) REFERENCES Type(id));	

CREATE TABLE TempHumi	(id INTEGER PRIMARY KEY AUTOINCREMENT, 					
						 temp INTEGER NOT NULL,									
						 humi INTEGER NOT NULL,	
						 idType INTEGER NOT NULL,
						 dateInser TIMESTAMP DEFAULT CURRENT_TIMESTAMP,								
						 FOREIGN KEY (idType) REFERENCES Type(id));	

CREATE TABLE AirPressure	(id INTEGER PRIMARY KEY AUTOINCREMENT, 					
						 	 press INTEGER NOT NULL,
						 	 idType INTEGER NOT NULL,	
						 	 dateInser TIMESTAMP DEFAULT CURRENT_TIMESTAMP,								
						 	 FOREIGN KEY (idType) REFERENCES Type(id));	

CREATE TABLE AirQualite	(id INTEGER PRIMARY KEY AUTOINCREMENT, 					
						 co2 INTEGER NOT NULL,
						 tvoc INTEGER NOT NULL,	
						 idType INTEGER NOT NULL,
						 dateInser TIMESTAMP DEFAULT CURRENT_TIMESTAMP,								
						 FOREIGN KEY (idType) REFERENCES Type(id));	

CREATE TABLE Type	(id INTEGER PRIMARY KEY AUTOINCREMENT,					
					 type TEXT NOT NULL,									
					 unite TEXT NOT NULL,									
					 precision FLOAT NOT NULL,								
					 commentaire TEXT);										

	

INSERT INTO Type (type, unite, precision, commentaire) VALUES ("gy-520", "m/(s*s)", "0.001","Pour tester le bougement");
INSERT INTO Type (type, unite, precision, commentaire) VALUES ("dht11", "degree, pourcentage", "0.001","Pour tester la temperature et l'humidite");
INSERT INTO Type (type, unite, precision, commentaire) VALUES ("bmp280", "pasca", "0.001","Pour tester la pression de l'air");


INSERT INTO Logement (name, teleNum, ip, adress) VALUES ("Toto", "123456789", "987654321","1");
INSERT INTO Address (adressN, adressR, adressP) VALUES ("20", "pierre", "95000");
INSERT INTO Poste (code, ville) VALUES ("95000", "Juessieu");

INSERT INTO TempHumi (temp, humi, idType) VALUES ("1", "13", "1");
INSERT INTO TempHumi (temp, humi, idType) VALUES ("13", "23", "1");
INSERT INTO TempHumi (temp, humi, idType) VALUES ("22", "5", "1");
INSERT INTO TempHumi (temp, humi, idType) VALUES ("2", "6", "1");
INSERT INTO TempHumi (temp, humi, idType) VALUES ("4", "17", "1");

INSERT INTO Mouvement (x, y, z, idType) VALUES ("1", "13", "1", "2");
INSERT INTO Mouvement (x, y, z, idType) VALUES ("2", "12", "12", "2");
INSERT INTO Mouvement (x, y, z, idType) VALUES ("3", "14", "5", "2");
INSERT INTO Mouvement (x, y, z, idType) VALUES ("4", "11", "7", "2");
INSERT INTO Mouvement (x, y, z, idType) VALUES ("4", "12", "1", "2");
INSERT INTO Mouvement (x, y, z, idType) VALUES ("2", "17", "19", "2");


INSERT INTO AirQualite (co2, tvoc, idType) VALUES ("12", "3", "2");
INSERT INTO AirQualite (co2, tvoc, idType) VALUES ("11", "9", "2");
INSERT INTO AirQualite (co2, tvoc, idType) VALUES ("9", "7", "2");
INSERT INTO AirQualite (co2, tvoc, idType) VALUES ("22", "6", "2");
INSERT INTO AirQualite (co2, tvoc, idType) VALUES ("42", "5", "2");
INSERT INTO AirQualite (co2, tvoc, idType) VALUES ("2", "2", "2");


INSERT INTO AirPressure (press, idType) VALUES ("2", "2");
INSERT INTO AirPressure (press, idType) VALUES ("3", "2");
INSERT INTO AirPressure (press, idType) VALUES ("4", "2");
INSERT INTO AirPressure (press, idType) VALUES ("5", "2");
INSERT INTO AirPressure (press, idType) VALUES ("2", "2");
INSERT INTO AirPressure (press, idType) VALUES ("3", "2");