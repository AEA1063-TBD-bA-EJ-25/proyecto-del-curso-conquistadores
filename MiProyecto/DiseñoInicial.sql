create database CONQUISTADORES

GO
use CONQUISTADORES

CREATE TABLE Persona(
    CURP CHAR(18) PRIMARY KEY,
    ApellidoPaterno NVARCHAR(50) NOT NULL,
    ApellidoMaterno NVARCHAR(50) NOT NULL,
    Nombres NVARCHAR(50) NOT NULL,
    Sexo VARCHAR(10) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Direccion VARCHAR(80) NOT NULL,
    Tipo VARCHAR(20) NOT NULL
)

CREATE TABLE Niño(
    CURP CHAR(18) PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP),
    Enfermedad VARCHAR(50),
    ContactoEmergencia VARCHAR(25) NOT NULL,
    ClaveClaseNino INT FOREIGN KEY REFERENCES Clase(NumeroClase),
    CurpTutor CHAR(18) FOREIGN KEY REFERENCES Tutor(CURP),
    ClaveUnidadNino INT FOREIGN KEY REFERENCES Unidad(ClaveUnidad)
)


CREATE TABLE Directivo(
    CURP CHAR(18) PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP),
    ROL VARCHAR(50) NOT NULL,
    ClaveClubDirectivo VARCHAR(15) FOREIGN KEY REFERENCES Club(ClaveClub)
)

CREATE TABLE Consejero(
    CURP CHAR(18) PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP),
    Aspiracion VARCHAR(50) NOT NULL,
    ClaveClubConsejero VARCHAR(15) FOREIGN KEY REFERENCES Club(ClaveClub)
)

CREATE TABLE Instructor(
    CURP CHAR(18) PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP),
    ClaveClubInstructor VARCHAR(15) FOREIGN KEY REFERENCES Club(ClaveClub)
)

CREATE TABLE Tutor(
    CURP CHAR(18) NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP),
    Telefono VARCHAR(10) NOT NULL
)

CREATE TABLE Historial(
    NumeroHistorial INT PRIMARY KEY, 
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    CurpPersona CHAR(18) FOREIGN KEY REFERENCES Persona(CURP)
)

CREATE TABLE Clase (
    NumeroClase INT NOT NULL PRIMARY KEY,
    Color VARCHAR(15) NOT NULL,
    Logo VARCHAR(50),
    EdadMinima INT NOT NULL
)

CREATE TABLE Unidad (
    ClaveUnidad INT NOT NULL PRIMARY KEY,
    NombreUnidad VARCHAR(80) NOT NULL,
    Lema VARCHAR(100),
    Logo VARCHAR(50),
    CurpConsejero CHAR(18) FOREIGN KEY REFERENCES Consejero(CURP)
)

CREATE TABLE Club (
    ClaveClub VARCHAR(15) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Lema VARCHAR(100),
    Logo VARCHAR(50),
    Direccion VARCHAR(80) NOT NULL
)

CREATE TABLE Especialidad(
    ClaveEspecialidad VARCHAR(15) NOT NULL PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Area VARCHAR(50) NOT NULL,
    FechaAceptacion DATE NOT NULL,
    Nivel INT NOT NULL,
    CurpInstructor CHAR(18) FOREIGN KEY REFERENCES Instructor(CURP)
)

CREATE TABLE Reunion(
    ClaveReunion VARCHAR(15) NOT NULL PRIMARY KEY,
    Fecha DATE NOT NULL,
    Puntualidad BIT NOT NULL,
    Asistencia BIT NOT NULL,
    Uniforme BIT NOT NULL,
    Limpieza BIT NOT NULL,
    Tareas BIT NOT NULL,
    ClaveUnidadReunion INT FOREIGN KEY REFERENCES Unidad(ClaveUnidad)
)

CREATE TABLE Requisito(
    ClaveRequisito CHAR(15) PRIMARY KEY,
    ClaveEspecialidadRequisito VARCHAR(15) FOREIGN KEY REFERENCES Especialidad(ClaveEspecialidad)
)

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)
VALUES ('CURP12345678901234', 'García', 'López', 'Juan', 'Masculino', '2000-01-01', 'Calle Marte 123', 'Niño');

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)
VALUES ('CURP12345678901238', 'Martínez', 'Hernández', 'Ana', 'Femenino', '2005-05-15', 'Calle Luna 456', 'Niño');

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)
VALUES ('CURP12345678901239', 'Pérez', 'Gómez', 'Carlos', 'Masculino', '1990-08-20', 'Calle Sol 789', 'Tutor');

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)
VALUES ('CURP12345678901240', 'Hernández', 'Ramírez', 'Luis', 'Masculino', '1995-03-10', 'Calle Estrella 123', 'Niño');

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)
VALUES ('CURP12345678901241', 'Gómez', 'Sánchez', 'María', 'Femenino', '2003-07-22', 'Calle Luna 789', 'Niño');

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)
VALUES ('CURP12345678901242', 'López', 'Martínez', 'Pedro', 'Masculino', '1988-11-15', 'Calle Sol 456', 'Tutor');

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)
VALUES ('CURP12345678901243', 'Fernández', 'García', 'Ana', 'Femenino', '1992-02-28', 'Calle Marte 789', 'Tutor');

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)
VALUES ('CURP12345678901244', 'Ruiz', 'Hernández', 'Carlos', 'Masculino', '2001-09-05', 'Calle Venus 123', 'Niño');

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)
VALUES ('CURP12345678901245', 'Pérez', 'López', 'Laura', 'Femenino', '2004-12-12', 'Calle Mercurio 456', 'Niño');

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP98765432109876', 'Hernández', 'Martínez', 'Ana', 'Femenino', '1995-05-23', 'Avenida Sol 456', 'Instructor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP45612378965432', 'Pérez', 'Ramírez', 'Carlos', 'Masculino', '1988-11-12', 'Calle Luna 789', 'Consejero');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP85296374125896', 'Sánchez', 'Gómez', 'María', 'Femenino', '2005-07-19', 'Boulevard Estrella 321', 'Tutor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP36985214785236', 'Rodríguez', 'Flores', 'Jorge', 'Masculino', '2010-09-30', 'Calle Júpiter 567', 'Niño');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP14725836995147', 'Fernández', 'Torres', 'Lucía', 'Femenino', '1990-03-05', 'Avenida Saturno 852', 'Directivo');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP95175385296325', 'Gómez', 'Mendoza', 'Raúl', 'Masculino', '2003-06-21', 'Calle Mercurio 963', 'Instructor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP35715948625135', 'Morales', 'Ortega', 'Sofía', 'Femenino', '2015-08-10', 'Boulevard Neptuno 741', 'Niño');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP45678912365478', 'Navarro', 'Vega', 'David', 'Masculino', '1975-04-02', 'Avenida Venus 159', 'Consejero');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP95135725815935', 'Ortega', 'Jiménez', 'Elena', 'Femenino', '2008-12-15', 'Calle Marte 753', 'Tutor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP75395185296345', 'Torres', 'Herrera', 'Miguel', 'Masculino', '2017-11-05', 'Calle Plutón 654', 'Niño');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP25836914785214', 'Medina', 'Castillo', 'Diana', 'Femenino', '1998-02-27', 'Avenida Urano 987', 'Instructor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP12365478945632', 'Chávez', 'Luna', 'Alejandro', 'Masculino', '2001-10-18', 'Boulevard Tierra 321', 'Consejero');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP14725896385214', 'Ríos', 'Campos', 'Valeria', 'Femenino', '2012-05-09', 'Calle Sol 951', 'Niño');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP36974185296325', 'Flores', 'Zamora', 'Roberto', 'Masculino', '1982-06-25', 'Avenida Estrella 753', 'Directivo');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP75325815945632', 'Santos', 'Paredes', 'Andrea', 'Femenino', '1993-03-11', 'Calle Neptuno 987', 'Instructor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP25874196325847', 'Delgado', 'Acosta', 'José', 'Masculino', '2004-07-28', 'Boulevard Plutón 654', 'Tutor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP95136985214785', 'Castro', 'Salinas', 'Isabella', 'Femenino', '2013-12-31', 'Avenida Tierra 123', 'Niño');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP12378965425847', 'Reyes', 'Escobar', 'Fernando', 'Masculino', '1967-09-04', 'Calle Luna 456', 'Consejero');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP35715948695135', 'Lara', 'Silva', 'Camila', 'Femenino', '2007-02-13', 'Boulevard Mercurio 789', 'Tutor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP74125896314785', 'Domínguez', 'Núñez', 'Martín', 'Masculino', '2011-04-17', 'Calle Saturno 852', 'Niño');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP36925814785214', 'Guerra', 'Espinoza', 'Rosa', 'Femenino', '1991-09-12', 'Avenida Plutón 741', 'Directivo');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP25814736985214', 'Villanueva', 'Peña', 'Emilio', 'Masculino', '2006-12-29', 'Boulevard Urano 963', 'Tutor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP12345678965478', 'Estrada', 'Suárez', 'Paola', 'Femenino', '1984-07-08', 'Calle Mercurio 789', 'Consejero');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP75395185245632', 'Cortés', 'Aguilar', 'Hugo', 'Masculino', '1979-05-23', 'Avenida Júpiter 357', 'Instructor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP95125836975314', 'Mendoza', 'Delgado', 'Natalia', 'Femenino', '2016-03-14', 'Calle Tierra 123', 'Niño');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP35715985214785', 'Salazar', 'Hernández', 'Gabriel', 'Masculino', '1994-01-19', 'Boulevard Venus 654', 'Instructor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP95135725865478', 'León', 'Ríos', 'Carolina', 'Femenino', '2009-08-31', 'Avenida Sol 951', 'Tutor');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP15935725874126', 'Fuentes', 'Lara', 'Óscar', 'Masculino', '1986-06-27', 'Calle Neptuno 321', 'Consejero');  

INSERT INTO Persona (CURP, ApellidoPaterno, ApellidoMaterno, Nombres, Sexo, FechaNacimiento, Direccion, Tipo)  
VALUES ('CURP35795125814735', 'Velázquez', 'Miranda', 'Daniela', 'Femenino', '2018-10-22', 'Boulevard Estrella 147', 'Niño');  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)
VALUES ('CURP12345678901234', 'Ninguna', '555-1234', 1, 'CURP12345678901239', 1);

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)
VALUES ('CURP12345678901238', 'Asma', '555-6789', 2, 'CURP12345678901239', 2);

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP98765432109876', 'Asma', '555-6789', 2, 'CURP98765432109879', 3);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP45612378965432', 'Alergia al polen', '555-4321', 3, 'CURP45612378965439', 2);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP85296374125896', 'Ninguna', '555-9638', 1, 'CURP85296374125899', 5);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP36985214785236', 'Diabetes', '555-7412', 4, 'CURP36985214785239', 1);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP14725836995147', 'Epilepsia', '555-3698', 2, 'CURP14725836995149', 4);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP95175385296325', 'Alergia a la penicilina', '555-1597', 3, 'CURP95175385296329', 2);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP35715948625135', 'Ninguna', '555-7531', 1, 'CURP35715948625139', 5);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP45678912365478', 'Problemas cardíacos', '555-9876', 5, 'CURP45678912365479', 3);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP95135725815935', 'Ninguna', '555-2583', 2, 'CURP95135725815939', 4);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP75395185296345', 'Asma', '555-3697', 4, 'CURP75395185296349', 1);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP25836914785214', 'Alergia a los mariscos', '555-1236', 3, 'CURP25836914785219', 2);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP12365478945632', 'Ninguna', '555-7896', 1, 'CURP12365478945639', 3);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP14725896385214', 'Diabetes', '555-6547', 2, 'CURP14725896385219', 5);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP36974185296325', 'Ninguna', '555-8527', 3, 'CURP36974185296329', 4);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP75325815945632', 'Epilepsia', '555-9513', 4, 'CURP75325815945639', 1);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP25874196325847', 'Ninguna', '555-3579', 5, 'CURP25874196325849', 2);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP95136985214785', 'Asma', '555-7536', 1, 'CURP95136985214789', 3);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP12378965425847', 'Alergia a la penicilina', '555-1478', 2, 'CURP12378965425849', 4);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP35715948695135', 'Ninguna', '555-3214', 3, 'CURP35715948695139', 5);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP74125896314785', 'Alergia al polvo', '555-8523', 4, 'CURP74125896314789', 1);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP36925814785214', 'Ninguna', '555-4567', 5, 'CURP36925814785219', 2);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP25814736985214', 'Diabetes', '555-3695', 1, 'CURP25814736985219', 3);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP12345678965478', 'Ninguna', '555-1598', 2, 'CURP12345678965479', 4);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP75395185245632', 'Epilepsia', '555-7539', 3, 'CURP75395185245639', 5);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP95125836975314', 'Alergia a los mariscos', '555-2581', 4, 'CURP95125836975319', 1);  

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)  
VALUES ('CURP35715985214785', 'Ninguna', '555-7892', 5, 'CURP35715985214789', 2);  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)
VALUES ('CURP12345678901234', 'Presidente', 'CLUB001');

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)
VALUES ('CURP12345678901238', 'Vicepresidente', 'CLUB002');

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP98765432109876', 'Secretario', 'CLUB002');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP45612378965432', 'Tesorero', 'CLUB003');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP85296374125896', 'Presidente', 'CLUB004');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP36985214785236', 'Vicepresidente', 'CLUB005');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP14725836995147', 'Secretario', 'CLUB006');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP95175385296325', 'Tesorero', 'CLUB007');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP35715948625135', 'Presidente', 'CLUB008');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP45678912365478', 'Vicepresidente', 'CLUB009');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP95135725815935', 'Secretario', 'CLUB010');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP75395185296345', 'Tesorero', 'CLUB011');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP25836914785214', 'Presidente', 'CLUB012');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP12365478945632', 'Vicepresidente', 'CLUB013');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP14725896385214', 'Secretario', 'CLUB014');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP36974185296325', 'Tesorero', 'CLUB015');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP75325815945632', 'Presidente', 'CLUB016');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP25874196325847', 'Vicepresidente', 'CLUB017');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP95136985214785', 'Secretario', 'CLUB018');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP12378965425847', 'Tesorero', 'CLUB019');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP35715948695135', 'Presidente', 'CLUB020');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP74125896314785', 'Vicepresidente', 'CLUB021');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP36925814785214', 'Secretario', 'CLUB022');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP25814736985214', 'Tesorero', 'CLUB023');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP12345678965478', 'Presidente', 'CLUB024');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP75395185245632', 'Vicepresidente', 'CLUB025');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP95125836975314', 'Secretario', 'CLUB026');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP35715985214785', 'Tesorero', 'CLUB027');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP15935725874126', 'Presidente', 'CLUB028');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP35795125814735', 'Vicepresidente', 'CLUB029');  

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)  
VALUES ('CURP95135725865478', 'Secretario', 'CLUB030');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)
VALUES ('CURP12345678901244', 'Liderazgo', 'CLUB002');

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)
VALUES ('CURP12345678901245', 'Educación', 'CLUB005');

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP98765432109876', 'Empoderamiento', 'CLUB001');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP45612378965432', 'Trabajo en equipo', 'CLUB002');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP85296374125896', 'Desarrollo personal', 'CLUB003');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP36985214785236', 'Superación profesional', 'CLUB004');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP14725836995147', 'Liderazgo', 'CLUB005');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP95175385296325', 'Innovación', 'CLUB006');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP35715948625135', 'Motivación', 'CLUB007');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP45678912365478', 'Creatividad', 'CLUB008');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP95135725815935', 'Compromiso', 'CLUB009');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP75395185296345', 'Ética', 'CLUB010');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP25836914785214', 'Desarrollo profesional', 'CLUB011');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP12365478945632', 'Trabajo en equipo', 'CLUB012');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP14725896385214', 'Liderazgo', 'CLUB013');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP36974185296325', 'Transformación social', 'CLUB014');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP75325815945632', 'Educación continua', 'CLUB015');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP25874196325847', 'Motivación', 'CLUB016');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP95136985214785', 'Éxito colectivo', 'CLUB017');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP12378965425847', 'Crecimiento personal', 'CLUB018');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP35715948695135', 'Trabajo en equipo', 'CLUB019');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP74125896314785', 'Liderazgo', 'CLUB020');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP36925814785214', 'Innovación', 'CLUB021');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP25814736985214', 'Motivación', 'CLUB022');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP12345678965478', 'Ética', 'CLUB023');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP75395185245632', 'Desarrollo profesional', 'CLUB024');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP95125836975314', 'Trabajo en equipo', 'CLUB025');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP35715985214785', 'Crecimiento personal', 'CLUB026');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP15935725874126', 'Empoderamiento', 'CLUB027');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP35795125814735', 'Superación personal', 'CLUB028');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP95135725865478', 'Innovación', 'CLUB029');  

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)  
VALUES ('CURP12345678912345', 'Liderazgo', 'CLUB030');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)
VALUES ('CURP12345678901238', 'CLUB005');

INSERT INTO Instructor (CURP, ClaveClubInstructor)
VALUES ('CURP12345678901243', 'CLUB002');

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP98765432109875', 'CLUB001');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP45612378965431', 'CLUB002');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP85296374125895', 'CLUB003');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP36985214785235', 'CLUB004');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP14725836995146', 'CLUB005');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP95175385296324', 'CLUB006');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP35715948625134', 'CLUB007');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP45678912365477', 'CLUB008');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP95135725815934', 'CLUB009');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP75395185296344', 'CLUB010');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP25836914785213', 'CLUB011');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP12365478945631', 'CLUB012');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP14725896385213', 'CLUB013');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP36974185296324', 'CLUB014');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP75325815945631', 'CLUB015');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP25874196325846', 'CLUB016');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP95136985214784', 'CLUB017');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP12378965425846', 'CLUB018');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP35715948695134', 'CLUB019');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP74125896314784', 'CLUB020');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP36925814785213', 'CLUB021');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP25814736985213', 'CLUB022');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP12345678965477', 'CLUB023');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP75395185245631', 'CLUB024');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP95125836975313', 'CLUB025');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP35715985214784', 'CLUB026');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP15935725874125', 'CLUB027');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP35795125814734', 'CLUB028');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP95135725865477', 'CLUB029');  

INSERT INTO Instructor (CURP, ClaveClubInstructor)  
VALUES ('CURP12345678912344', 'CLUB030');  

INSERT INTO Tutor (CURP, Telefono)
VALUES ('CURP12345678901239', '555-5678');

INSERT INTO Tutor (CURP, Telefono)
VALUES ('CURP12345678901242', '555-9876');

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP98765432109877', '555-2345');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP45612378965433', '555-8765');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP85296374125897', '555-4321');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP36985214785237', '555-9087');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP14725836995148', '555-5467');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP95175385296326', '555-7890');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP35715948625136', '555-1234');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP45678912365479', '555-6543');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP95135725815936', '555-3210');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP75395185296346', '555-6542');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP25836914785215', '555-7456');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP12365478945633', '555-4897');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP14725896385215', '555-8597');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP36974185296326', '555-7539');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP75325815945633', '555-2368');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP25874196325848', '555-8473');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP95136985214786', '555-2950');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP12378965425848', '555-7612');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP35715948695136', '555-2658');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP74125896314786', '555-4609');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP36925814785216', '555-5983');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP25814736985216', '555-8275');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP12345678965479', '555-7049');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP75395185245632', '555-3501');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP95125836975315', '555-5007');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP35715985214786', '555-1439');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP15935725874127', '555-9621');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP35795125814736', '555-6845');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP95135725865479', '555-3782');  

INSERT INTO Tutor (CURP, Telefono)  
VALUES ('CURP12345678912346', '555-8290');  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)
VALUES (1, 'Rojo', 10);

INSERT INTO Clase (NumeroClase, Color, EdadMinima)
VALUES (2, 'Azul', 12);

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (1, 'Rojo', 10);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (2, 'Azul', 12);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (3, 'Verde', 8);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (4, 'Amarillo', 15);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (5, 'Naranja', 9);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (6, 'Violeta', 11);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (7, 'Negro', 13);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (8, 'Blanco', 10);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (9, 'Marrón', 14);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (10, 'Gris', 7);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (11, 'Rosa', 6);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (12, 'Turquesa', 9);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (13, 'Cian', 12);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (14, 'Púrpura', 8);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (15, 'Celeste', 10);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (16, 'Beige', 13);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (17, 'Verde Claro', 11);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (18, 'Amarillo Claro', 7);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (19, 'Rojo Claro', 9);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (20, 'Morado', 15);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (21, 'Lila', 10);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (22, 'Verde Oscuro', 12);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (23, 'Azul Claro', 11);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (24, 'Rojo Oscuro', 13);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (25, 'Verde Pastel', 10);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (26, 'Amarillo Pastel', 12);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (27, 'Naranja Claro', 14);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (28, 'Azul Oscuro', 8);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (29, 'Verde Oliva', 15);  

INSERT INTO Clase (NumeroClase, Color, EdadMinima)  
VALUES (30, 'Blanco Perla', 9);  


INSERT INTO Unidad (ClaveUnidad, NombreUnidad)
VALUES (1, 'Unidad Alfa');

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)
VALUES (2, 'Unidad Beta');

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (1, 'Unidad Alpha');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (2, 'Unidad Delta');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (3, 'Unidad Kappa');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (4, 'Unidad Epsilon');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (5, 'Unidad Sigma');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (6, 'Unidad Beta');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (7, 'Unidad Omega');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (8, 'Unidad Pi');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (9, 'Unidad Zeta');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (10, 'Unidad Rho');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (11, 'Unidad Theta');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (12, 'Unidad Gamma');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (13, 'Unidad Xi');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (14, 'Unidad Mu');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (15, 'Unidad Lambda');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (16, 'Unidad Tau');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (17, 'Unidad Chi');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (18, 'Unidad Rho');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (19, 'Unidad Zeta Alpha');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (20, 'Unidad Sigma Beta');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (21, 'Unidad Theta Delta');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (22, 'Unidad Omega Sigma');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (23, 'Unidad Alpha Gamma');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (24, 'Unidad Beta Kappa');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (25, 'Unidad Pi Alpha');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (26, 'Unidad Xi Theta');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (27, 'Unidad Mu Chi');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (28, 'Unidad Omega Pi');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (29, 'Unidad Lambda Epsilon');  

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)  
VALUES (30, 'Unidad Delta Omega');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)
VALUES ('CLUB005', 'Águilas Reales', 'Calle Real 456');

INSERT INTO Club (ClaveClub, Nombre, Direccion)
VALUES ('CLUB006', 'Beta Crucis', 'Calle Verde 123');

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB001', 'Leones Dorados', 'Avenida Central 789');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB002', 'Tigres Salvajes', 'Calle Fuerte 123');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB003', 'Halcones Negros', 'Boulevard del Sol 234');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB004', 'Toros Bravos', 'Calle de la Paz 456');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB005', 'Águilas Reales', 'Calle Real 456');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB006', 'Jaguares Rojos', 'Avenida 22 de Octubre 678');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB007', 'Cazadores de Oro', 'Calle Nueva 890');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB008', 'Búhos Plateados', 'Avenida de los Árboles 112');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB009', 'Serpientes de Fuego', 'Calle de la Luna 134');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB010', 'Pumas Dorados', 'Calle Los Pinos 567');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB011', 'Dragones de Acero', 'Avenida Libertad 890');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB012', 'Árboles Sagrados', 'Calle del Río 123');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB013', 'Elefantes Majestuosos', 'Calle Gran Mar 678');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB014', 'Lobos del Norte', 'Avenida del Sol 234');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB015', 'Cruzados de Plata', 'Calle Hermosa 345');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB016', 'Gatos Negros', 'Calle de la Cima 456');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB017', 'Leones Blancos', 'Calle del Valle 567');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB018', 'Tiburones de Acero', 'Avenida del Mar 890');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB019', 'Osos Grises', 'Calle del Bosque 234');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB020', 'Ángeles Dorados', 'Calle El Sol 123');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB021', 'Cuervos Negros', 'Calle de la Luna 345');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB022', 'Águilas Blancas', 'Avenida Principal 456');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB023', 'Zorros de Plata', 'Calle Verde 789');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB024', 'Guerreros de la Tierra', 'Avenida de la Paz 112');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB025', 'Corazones Fuertes', 'Calle Esperanza 234');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB026', 'Fuerza del Tigre', 'Calle del Oro 567');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB027', 'Dragones del Sol', 'Calle Primavera 678');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB028', 'Luz de Luna', 'Avenida de las Estrellas 789');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB029', 'Rays del Mar', 'Calle del Mar 890');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)  
VALUES ('CLUB030', 'Guerreros del Desierto', 'Calle desértica 456');  

INSERT INTO Club (ClaveClub, Nombre, Direccion)
VALUES ('CLUB003', 'Delfines', 'Calle Lomas 912');

INSERT INTO Club (ClaveClub, Nombre, Direccion)
VALUES ('CLUB004', 'Polaris', 'Calle Rojo 637');


INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)
VALUES ('ESP001', 'Nudos', 'Supervivencia', '2025-01-01', 1, 'CURP12345678901238');

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP001', 'Nudos', 'Supervivencia', '2025-01-01', 1, 'CURP12345678901238');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP002', 'Primeros Auxilios', 'Salud', '2025-02-15', 2, 'CURP12345678901239');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP003', 'Técnicas de Navegación', 'Supervivencia', '2025-03-10', 1, 'CURP12345678901240');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP004', 'Caza y Pesca', 'Supervivencia', '2025-04-20', 3, 'CURP12345678901241');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP005', 'Escalada', 'Aventura', '2025-05-05', 2, 'CURP12345678901242');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP006', 'Botánica', 'Naturaleza', '2025-06-15', 1, 'CURP12345678901243');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP007', 'Orientación', 'Supervivencia', '2025-07-10', 2, 'CURP12345678901244');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP008', 'Cocina de Campamento', 'Supervivencia', '2025-08-01', 1, 'CURP12345678901245');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP009', 'Fotografía de Naturaleza', 'Arte', '2025-09-20', 3, 'CURP12345678901246');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP010', 'Supervivencia en el Agua', 'Supervivencia', '2025-10-10', 2, 'CURP12345678901247');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP011', 'Técnicas de Camuflaje', 'Supervivencia', '2025-11-15', 1, 'CURP12345678901248');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP012', 'Trekking', 'Aventura', '2025-12-01', 2, 'CURP12345678901249');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP013', 'Vela', 'Aventura', '2026-01-10', 1, 'CURP12345678901250');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP014', 'Montañismo', 'Aventura', '2026-02-25', 3, 'CURP12345678901251');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP015', 'Rappel', 'Aventura', '2026-03-30', 2, 'CURP12345678901252');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP016', 'Autodefensa', 'Salud', '2026-04-10', 3, 'CURP12345678901253');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP017', 'Técnicas de Supervivencia en el Desierto', 'Supervivencia', '2026-05-15', 2, 'CURP12345678901254');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP018', 'Navegación Nocturna', 'Supervivencia', '2026-06-20', 1, 'CURP12345678901255');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP019', 'Buceo', 'Aventura', '2026-07-25', 2, 'CURP12345678901256');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP020', 'Rescate en Montaña', 'Supervivencia', '2026-08-30', 3, 'CURP12345678901257');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP021', 'Ciclismo de Montaña', 'Aventura', '2026-09-05', 1, 'CURP12345678901258');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP022', 'Pesca con Mosca', 'Supervivencia', '2026-10-10', 2, 'CURP12345678901259');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP023', 'Canoas', 'Aventura', '2026-11-15', 1, 'CURP12345678901260');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP024', 'Observación de Fauna', 'Naturaleza', '2026-12-01', 3, 'CURP12345678901261');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP025', 'Técnicas de Refugio', 'Supervivencia', '2027-01-10', 2, 'CURP12345678901262');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP026', 'Cruz Roja', 'Salud', '2027-02-05', 1, 'CURP12345678901263');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP027', 'Pesca Submarina', 'Supervivencia', '2027-03-20', 3, 'CURP12345678901264');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP028', 'Construcción de Refugios', 'Supervivencia', '2027-04-25', 2, 'CURP12345678901265');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP029', 'Supervivencia en la Jungla', 'Supervivencia', '2027-05-30', 3, 'CURP12345678901266');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP030', 'Kárate', 'Deportes', '2027-06-10', 1, 'CURP12345678901267');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)
VALUES ('ESP002', 'Primeros Auxilios', 'Salud', '2025-02-01', 2, 'CURP12345678901243');


INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU001', '2025-03-09', 1, 1, 1, 1, 1, 001);

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU001', '2025-03-09', 1, 1, 1, 1, 1, 001);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU002', '2025-03-10', 1, 1, 0, 1, 1, 002);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU003', '2025-03-11', 1, 0, 1, 0, 1, 003);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU004', '2025-03-12', 0, 1, 1, 1, 0, 004);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU005', '2025-03-13', 1, 1, 0, 1, 1, 005);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU006', '2025-03-14', 0, 1, 1, 1, 1, 006);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU007', '2025-03-15', 1, 1, 1, 0, 1, 007);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU008', '2025-03-16', 0, 0, 1, 1, 0, 008);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU009', '2025-03-17', 1, 1, 1, 1, 1, 009);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU010', '2025-03-18', 1, 0, 1, 1, 1, 010);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU011', '2025-03-19', 0, 1, 0, 1, 0, 011);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU012', '2025-03-20', 1, 1, 1, 0, 0, 012);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU013', '2025-03-21', 0, 0, 1, 0, 1, 013);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU014', '2025-03-22', 1, 1, 1, 1, 0, 014);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU015', '2025-03-23', 0, 1, 1, 1, 1, 015);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU016', '2025-03-24', 1, 0, 0, 1, 1, 016);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU017', '2025-03-25', 1, 1, 1, 1, 1, 017);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU018', '2025-03-26', 0, 1, 1, 0, 1, 018);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU019', '2025-03-27', 1, 0, 1, 0, 1, 019);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU020', '2025-03-28', 0, 1, 0, 1, 1, 020);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU021', '2025-03-29', 1, 1, 1, 1, 0, 021);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU022', '2025-03-30', 0, 1, 1, 1, 0, 022);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU023', '2025-03-31', 1, 1, 0, 1, 1, 023);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU024', '2025-04-01', 0, 0, 1, 1, 0, 024);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU025', '2025-04-02', 1, 1, 1, 0, 1, 025);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU026', '2025-04-03', 0, 1, 1, 1, 1, 026);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU027', '2025-04-04', 1, 0, 1, 1, 0, 027);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU028', '2025-04-05', 1, 1, 0, 1, 1, 028);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU029', '2025-04-06', 0, 1, 1, 0, 1, 029);  

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU030', '2025-04-07', 1, 1, 1, 1, 0, 030);  



INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)
VALUES ('ESP001', 'Nudos', 'Supervivencia', '2025-01-01', 1, 'CURP12345678901238');

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)
VALUES ('ESP002', 'Primeros Auxilios', 'Salud', '2025-02-01', 2, 'CURP12345678901243');

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP001', 'Nudos', 'Supervivencia', '2025-01-01', 1, 'CURP12345678901238');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP002', 'Primeros Auxilios', 'Salud', '2025-02-15', 2, 'CURP12345678901239');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP003', 'Técnicas de Navegación', 'Supervivencia', '2025-03-10', 1, 'CURP12345678901240');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP004', 'Caza y Pesca', 'Supervivencia', '2025-04-20', 3, 'CURP12345678901241');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP005', 'Escalada', 'Aventura', '2025-05-05', 2, 'CURP12345678901242');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP006', 'Botánica', 'Naturaleza', '2025-06-15', 1, 'CURP12345678901243');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP007', 'Orientación', 'Supervivencia', '2025-07-10', 2, 'CURP12345678901244');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP008', 'Cocina de Campamento', 'Supervivencia', '2025-08-01', 1, 'CURP12345678901245');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP009', 'Fotografía de Naturaleza', 'Arte', '2025-09-20', 3, 'CURP12345678901246');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP010', 'Supervivencia en el Agua', 'Supervivencia', '2025-10-10', 2, 'CURP12345678901247');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP011', 'Técnicas de Camuflaje', 'Supervivencia', '2025-11-15', 1, 'CURP12345678901248');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP012', 'Trekking', 'Aventura', '2025-12-01', 2, 'CURP12345678901249');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP013', 'Vela', 'Aventura', '2026-01-10', 1, 'CURP12345678901250');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP014', 'Montañismo', 'Aventura', '2026-02-25', 3, 'CURP12345678901251');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP015', 'Rappel', 'Aventura', '2026-03-30', 2, 'CURP12345678901252');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP016', 'Autodefensa', 'Salud', '2026-04-10', 3, 'CURP12345678901253');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP017', 'Técnicas de Supervivencia en el Desierto', 'Supervivencia', '2026-05-15', 2, 'CURP12345678901254');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP018', 'Navegación Nocturna', 'Supervivencia', '2026-06-20', 1, 'CURP12345678901255');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP019', 'Buceo', 'Aventura', '2026-07-25', 2, 'CURP12345678901256');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP020', 'Rescate en Montaña', 'Supervivencia', '2026-08-30', 3, 'CURP12345678901257');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP021', 'Ciclismo de Montaña', 'Aventura', '2026-09-05', 1, 'CURP12345678901258');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP022', 'Pesca con Mosca', 'Supervivencia', '2026-10-10', 2, 'CURP12345678901259');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP023', 'Canoas', 'Aventura', '2026-11-15', 1, 'CURP12345678901260');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP024', 'Observación de Fauna', 'Naturaleza', '2026-12-01', 3, 'CURP12345678901261');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP025', 'Técnicas de Refugio', 'Supervivencia', '2027-01-10', 2, 'CURP12345678901262');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP026', 'Cruz Roja', 'Salud', '2027-02-05', 1, 'CURP12345678901263');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP027', 'Pesca Submarina', 'Supervivencia', '2027-03-20', 3, 'CURP12345678901264');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP028', 'Construcción de Refugios', 'Supervivencia', '2027-04-25', 2, 'CURP12345678901265');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP029', 'Supervivencia en la Jungla', 'Supervivencia', '2027-05-30', 3, 'CURP12345678901266');  

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)  
VALUES ('ESP030', 'Kárate', 'Deportes', '2027-06-10', 1, 'CURP12345678901267');  


ALTER TABLE Persona
ADD CONSTRAINT CHK_Sexo CHECK (Sexo IN ('Masculino', 'Femenino'));

ALTER TABLE Niño
ADD CONSTRAINT CHK_Enfermedad CHECK (Enfermedad IS NOT NULL OR Enfermedad = 'Ninguna');


SELECT * FROM Niño;

SELECT * FROM Directivo;

SELECT * FROM Instructor;

SELECT * FROM Persona;

SELECT * FROM Consejero;

SELECT * FROM Especialidad WHERE CurpInstructor = 'CURP12345678901238';

SELECT * FROM Reunion WHERE ClaveUnidadReunion = 'UNIDAD001';

SELECT * FROM Tutor;

SELECT * FROM Clase;

SELECT * FROM Unidad;

SELECT * FROM Club;

SELECT * FROM Especialidad;

SELECT * FROM Reunion;

SELECT * FROM Requisito;

SELECT * FROM Persona WHERE Tipo = 'Niño';

SELECT * FROM Persona WHERE Tipo = 'Tutor';

SELECT * FROM Persona WHERE FechaNacimiento > '2000-01-01';

SELECT * FROM Especialidad WHERE Area = 'Supervivencia';

SELECT * FROM Reunion WHERE Fecha = '2025-03-09';

SELECT * FROM Niño WHERE Enfermedad = 'Asma';

SELECT * FROM Directivo WHERE ClaveClubDirectivo = 'CLUB001';

SELECT * FROM Clase WHERE EdadMinima > 10;

drop table niño;
drop table club;
DELETE from club;

select *
from Niño
select *
from Persona

--CONSULTAS/ UNIDAD 2- RECUPERACION--

--01- Dar seguimiento al cumplimiento de los requisitos de la especialidad de "Avicultura"
select R.ClaveRequisito
from Requisito R
join Especialidad E on R.ClaveEspecialidadRequisito = E.ClaveEspecialidad
where E.nombre = 'Avicultura'

--02- Conocer cuantas especialidades está manejando cada instructor
--     llevar un seguimiento para conocer la disponibilidad y sobrecarga
select I.curp, P.nombres + ' '+ P.ApellidoPaterno + ' '+ P.ApellidoMaterno as NombreInstructor,
    count(E.ClaveEspecialidad) as NumeroEspecialidades
from Instructor I
join Persona P on I.CURP = P.CURP
left join Especialidad E on E.CurpInstructor = I.CURP
group by I.CURP, P.Nombres, P.ApellidoPaterno, P.ApellidoMaterno;

--03- Analizar el promedio de edad por unidad
select U.NombreUnidad, AVG(DATEDIFF(YEAR, P.FechaNacimiento, GETDATE())) as EdadPromedio
from Niño N
join Persona P on N.CURP = P.CURP
join Unidad U on N.ClaveUnidadNino = U.ClaveUndiad
group by U.NombreUnidad;

--04- Conocer a los niños que tienen al menos una enfermedad registrada
select P.Nombres, P.ApellidoPaterno, P.ApellidoMaterno, N.Enfermedad
from Niño N
join Persona P on N.CURP = P.CURP
where N.Enfermedad is not null and N.Enfermedad <> ' ';

--05- Conocer la cantidad de niños que hay por clase
select C.NumeroClase,
count(N.CURP) as TotalNiños
from Clase C
left join Niño N on N.ClaveClaseNino = C.NumeroClase
group by C.NumeroClase;

--06- Imprimir las listas de niños que tiene a cargo el tutor
select T.CURP, P.Nombres + ' '+ P.ApellidoPaterno as NombreTutor,
count(N.CURP) as NumeroNiños
from Tutor T
join Persona P on T.CURP = P.CURP
left join Niño N on T.CURP = N.CurpTutor
group by T.CURP, P.Nombres, P.ApellidoPaterno;

--07- Conocer quienes han sido directivos en más de un club y conocer su experiencia
select H.curpPersona, P.Nombres + ' '+ P.ApellidoPaterno as Nombre,
count(distinct D.ClaveClubDirectivo) as ClubesDistintos
from Historial H
join Persona P on H.CurpPersona = P.CURP
join Directivo D on D.CURP = H.CurpPersona
group by H.CurpPersona, P.Nombres, P.ApellidoPaterno
having count(Distinct D.ClaveDirectivo) > 1;

--08- revisar la frecuencia de reuniones recientes de una unidad en el ultimo semestre
--en el ejemplo el código de la clase es 100(es hipotetico)
select ClaveReunion, Fecha
from Reunion
where ClaveUnidadReunion = 100
and Fecha >= Dateadd(month, -6, getdate());

--10- Consultar cuantas especialidades existen por área
select Area, 
count(*) as TotalEspecialidades
from Especialidad
group by Area;

--09- Todos los niños que no presenten alguna enfermedad registrada
select P.Nombres, P.ApellidoPaterno, P.ApellidoMaterno
from Niño N
join Persona P on N.CURP = P.CURP
where N.Enfermedad is null or N.Enfermedad = '';

--10- mostrar los tutores que tiene a más de un hijo en diferentes unidades
Select T.CURP, P.Nombres,
count(distinct N.ClaveUnidadNino) as Unidades
from Tutor T
join Persona P on T.CURP = P.CURP
join Niño N on T.CURP = N.CurpTutor
group by T.CURP, P.Nombres
having count(distinct N.ClaveUnidadNino) > 1;

--11- Mostrar las especialidades que tienen más de tres requisitos
select E.Nombre,
count(R.ClaveRequisito) as TotalRequisitos
from Especialidad E
join Requisito R on E.ClaveEspecialidad = R.ClaveEspecialidadRequisito
group by E.Nombre
Having count(R.ClaveRequsiito) > 3;

--12- Conocer quienes son los instructores que no tienen ninguna especialidad
-- para impartir
select P.Nombres, P.ApellidoPaterno
from Instructor I
join Persona.P on I.CURP = P.CURP
where I.CURP not in(select distinct CurpInstructor
                    from Especialidad);

--13- Mostrar la lista de los alumnos inscritos en la clase con 
--mayor cantidad de inscritos
select P.Nombres, P.ApellidoPaterno, C.NumeroClase
from Niño N
join Persona p on N.CURP = P.CURP
join Clase C on N.ClaveClaseNino = C.NumeroClase
where C.NumeroClase = (select TOP 1 ClaveClaseNino
                    from Niño
                    group by ClaveClaseNino
                    order by count(*) desc);

--14- contar cuantas especialidades tiene cada área
with EspecialidadesPorArea as (select Area, count(*) as Total
                            from Especialidad
                            group by Area)
select Area, Total
from EspecialidadesPorArea
order by Total desc;

--15- Saber que niños cumplen años en el siguiente mes
--de su consulta
select P.Nombres, P.ApellidoPaterno, P.FechaNacimiento
from Persona P
join Niño N on P.CURP = N.CURP
where month (P.FechaNacimiento) = month(getdate());

--16- Mostrar los clubes que se encuentran activos consultando
--su historial de actividades
select C.ClaveClub, C.Nombre, min(H.FechaInicio) as Inicio, max(H.FechaFin) as Fin
from Club C
join Directivo D on C.ClaveClub = D.ClaveClubDirectivo
join Historial H on D.CURP = H.CurpPersona
where getdate() between H.FechaInicio and H.FechaFin
group by C.ClaveClub, C.Nombre;

--17- Calcular la edad de cada niño
select P.Nombres, P.ApellidoPaterno, P.ApellidoMaterno,
datediff(year, P.FechaNacimiento, getdate())
as Edad
from Persona P
join Niño N on P.CURP = N.CURP;

--18- Desplegar el historial de la duración de una persona en días
select H.NumeroHistorial, P.Nombres, P.ApellidoPaterno, datediff(day, H.FechaInicio, H.FechaFin)
as DiasDeServicio
from Historial H
join Persona P on H.CurpPersona = P.CURP;

--19- Saber cuales especialidades han sido aceptadas antes
--del 2015
select ClaveEspecialidad, Nombre, Area, FechaAceptacion
from Especialidad 
where year (FechaAceptacion) < 2000;

--20- Mostrar el lema de las unidades en mayúsculas
select ClaveUnidad, NombreUnidad, upper(Lema) 
as LemaMayusculas
from Unidad;

--21- Mostrar el nombre completo de todos los niños
select P.CURP, CONCAT(P.Nombres, ' ', P.ApellidoPaterno, ' ', P.ApellidoMaterno)
as NombreCompleto
from Persona P
join Niño N on P.CURP = N.CURP;

--22- Crear un código uniendo el área y nivel de la especialidad
--para mejores busquedas
select ClaveEspecialidad, Nombre, 
concat(left(Area, 2), '- ', Nivel)
as CodigoEspecialidad
from Especialidad;

--23-Clasificar el nivel de dificultad de las especialidades
select Nombre, Nivel,
case
    when Nivel <= 2 then 'Básico'
    when Nivel = 3 then 'Intermedio'
    else 'Avanzado'
end as Dificultad
from Especialidad;

--24- Mostrar el sexo, pasar de M/F a Masculino/Femenino
select CURP, Nombres, ApellidoPaterno,
case 
    when Sexo = 'M' then 'Masculino'
    when Sexo = 'F' then 'Femenino'
    else 'No definido'
end as SexoCompleto
from Persona;


--  ¿Quiénes son los niños más grandes y más pequeños del club?
SELECT CONCAT(p.Nombres, ' ', p.ApellidoPaterno, ' ', p.ApellidoMaterno) AS NombreCompleto,
       DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) AS Edad
FROM Persona p
JOIN Niño n ON p.CURP = n.CURP
ORDER BY Edad DESC;

--  ¿Qué tutores tienen a su cargo más de 3 niños?
SELECT t.CURP, p.Nombres, p.ApellidoPaterno, p.ApellidoMaterno, COUNT(n.CURP) AS NinosAsignados
FROM Tutor t
JOIN Persona p ON t.CURP = p.CURP
JOIN Niño n ON t.CURP = n.CurpTutor
GROUP BY t.CURP, p.Nombres, p.ApellidoPaterno, p.ApellidoMaterno
HAVING COUNT(n.CURP) > 3;

--  ¿Cuántos directivos tiene cada club?
SELECT c.Nombre, COUNT(d.CURP) AS TotalDirectivos
FROM Club c
LEFT JOIN Directivo d ON c.ClaveClub = d.ClaveClubDirectivo
GROUP BY c.Nombre;

--  ¿Qué niños tienen enfermedades y quién es su tutor?
SELECT p.Nombres AS NombreNino, n.Enfermedad, pt.Nombres AS NombreTutor
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP
JOIN Persona pt ON n.CurpTutor = pt.CURP
WHERE n.Enfermedad IS NOT NULL AND n.Enfermedad <> 'Ninguna';

--  ¿Cuál es la edad promedio de los niños en cada clase?
SELECT c.Color, AVG(DATEDIFF(YEAR, p.FechaNacimiento, GETDATE())) AS EdadPromedio
FROM Clase c
JOIN Niño n ON c.NumeroClase = n.ClaveClaseNino
JOIN Persona p ON n.CURP = p.CURP
GROUP BY c.Color;

--  ¿Qué instructores no tienen ninguna especialidad asignada?
SELECT i.CURP, p.Nombres, p.ApellidoPaterno, p.ApellidoMaterno
FROM Instructor i
JOIN Persona p ON i.CURP = p.CURP
LEFT JOIN Especialidad e ON i.CURP = e.CurpInstructor
WHERE e.ClaveEspecialidad IS NULL;

--  ¿Qué niños han cambiado de unidad más de una vez?
SELECT CURP, COUNT(*) AS CambiosUnidad
FROM AuditoriaCambioUnidadNino
GROUP BY CURP
HAVING COUNT(*) > 1;

--  ¿Qué clubes tienen consejeros con más de dos unidades a cargo?
SELECT c.Nombre, COUNT(u.ClaveUnidad) AS Unidades
FROM Club c
JOIN Consejero co ON c.ClaveClub = co.ClaveClubConsejero
JOIN Unidad u ON co.CURP = u.CurpConsejero
GROUP BY c.Nombre
HAVING COUNT(u.ClaveUnidad) > 2;

--  ¿Qué niños tiene cada tutor? (en una sola fila por tutor)
SELECT t.CURP,
       p.Nombres + ' ' + p.ApellidoPaterno AS NombreTutor,
       STRING_AGG(pn.Nombres + ' ' + pn.ApellidoPaterno, ', ') AS Ninos
FROM Tutor t
JOIN Persona p ON t.CURP = p.CURP
LEFT JOIN Niño n ON t.CURP = n.CurpTutor
LEFT JOIN Persona pn ON n.CURP = pn.CURP
GROUP BY t.CURP, p.Nombres, p.ApellidoPaterno;

--  ¿Cuántos niños tienen cada tipo de enfermedad?
SELECT Enfermedad, COUNT(*) AS Total
FROM Niño
WHERE Enfermedad IS NOT NULL AND Enfermedad <> 'Ninguna'
GROUP BY Enfermedad;

--  ¿Quién es el presidente de cada club?
SELECT c.Nombre AS Club, 
       COALESCE(p.Nombres + ' ' + p.ApellidoPaterno, 'Sin presidente') AS Presidente
FROM Club c
LEFT JOIN Directivo d ON c.ClaveClub = d.ClaveClubDirectivo AND d.ROL = 'Presidente'
LEFT JOIN Persona p ON d.CURP = p.CURP;

--  ¿Hay niños sin tutor asignado?
SELECT p.Nombres, p.ApellidoPaterno, p.ApellidoMaterno
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP
WHERE n.CurpTutor IS NULL;

--  ¿Qué tutores tienen niños con enfermedades graves?
SELECT DISTINCT t.CURP, p.Nombres, p.ApellidoPaterno
FROM Tutor t
JOIN Persona p ON t.CURP = p.CURP
JOIN Niño n ON t.CURP = n.CurpTutor
WHERE n.Enfermedad IN ('Epilepsia', 'Diabetes', 'Problemas cardíacos');

--  ¿A qué clase pertenece cada niño?
SELECT p.Nombres, p.ApellidoPaterno, c.Color AS Clase
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP
JOIN Clase c ON n.ClaveClaseNino = c.NumeroClase;

--  ¿Qué clubes tienen un tesorero?
SELECT DISTINCT c.Nombre
FROM Club c
JOIN Directivo d ON c.ClaveClub = d.ClaveClubDirectivo
WHERE d.ROL = 'Tesorero';

--  ¿Qué niños han sido dados de baja y cuándo?
SELECT p.Nombres, p.ApellidoPaterno, h.FechaFin AS FechaBaja
FROM Historial h
JOIN Persona p ON h.CurpPersona = p.CURP;

--  ¿Cuál es el promedio de niños por tutor?
SELECT AVG(NinosPorTutor) AS Promedio
FROM (
  SELECT COUNT(*) AS NinosPorTutor
  FROM Tutor t
  LEFT JOIN Niño n ON t.CURP = n.CurpTutor
  GROUP BY t.CURP
) AS Sub;

--  ¿Cuántas especialidades imparte cada instructor?
SELECT p.Nombres, p.ApellidoPaterno, COUNT(e.ClaveEspecialidad) AS TotalEspecialidades
FROM Instructor i
JOIN Persona p ON i.CURP = p.CURP
LEFT JOIN Especialidad e ON i.CURP = e.CurpInstructor
GROUP BY p.Nombres, p.ApellidoPaterno;

--  ¿Qué niños han cambiado de tutor alguna vez?
SELECT DISTINCT CURP_Nino
FROM AuditoriaCambioTutorNino;

--  ¿Cuántas reuniones se han realizado en las unidades de cada club?
SELECT c.Nombre, COUNT(r.ClaveReunion) AS TotalReuniones
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Reunion r ON u.ClaveUnidad = r.ClaveUnidadReunion
GROUP BY c.Nombre;

--  ¿Qué niños han tenido más de un tutor?
SELECT CURP_Nino, COUNT(DISTINCT TutorNuevo) AS TutoresDistintos
FROM AuditoriaCambioTutorNino
GROUP BY CURP_Nino
HAVING COUNT(DISTINCT TutorNuevo) > 1;

--  ¿Cuántos niños dados de baja tenía cada tutor?
SELECT t.CURP, p.Nombres, COUNT(h.CurpPersona) AS NinosDadosDeBaja
FROM Tutor t
JOIN Persona p ON t.CURP = p.CURP
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Historial h ON n.CURP = h.CurpPersona
GROUP BY t.CURP, p.Nombres;

-- ¿Qué niños han participado en más de 5 reuniones?
SELECT n.CURP, p.Nombres, COUNT(r.ClaveReunion) AS TotalReuniones
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP
JOIN Unidad u ON n.ClaveUnidadNino = u.ClaveUnidad
JOIN Reunion r ON u.ClaveUnidad = r.ClaveUnidadReunion
GROUP BY n.CURP, p.Nombres
HAVING COUNT(r.ClaveReunion) > 5;

--  ¿Cuántas especialidades ha cursado cada niño?
SELECT p.Nombres, p.ApellidoPaterno, 
  (SELECT COUNT(*) FROM Especialidad e WHERE e.CurpInstructor = n.CURP) AS EspecialidadesCursadas
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP;

--  ¿Cuál es el teléfono de cada tutor?
SELECT p.Nombres, p.ApellidoPaterno, COALESCE(t.Telefono, 'No registrado') AS Telefono
FROM Tutor t
JOIN Persona p ON t.CURP = p.CURP;

--  ¿Qué niños están en unidades con "Alfa" en el nombre?
SELECT p.Nombres, u.NombreUnidad
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP
JOIN Unidad u ON n.ClaveUnidadNino = u.ClaveUnidad
WHERE u.NombreUnidad LIKE '%Alfa%';

-- ¿Cuántos niños tiene cada club en total?
SELECT c.Nombre, COUNT(n.CURP) AS TotalNinos
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Niño n ON u.ClaveUnidad = n.ClaveUnidadNino
GROUP BY c.Nombre;

--  ¿Qué niños han cambiado de clase alguna vez?
SELECT DISTINCT CURP
FROM AuditoriaPromocionClase;

-- ¿Quién es el consejero de cada niño?
SELECT p.Nombres AS NombreNino, pc.Nombres AS NombreConsejero
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP
JOIN Unidad u ON n.ClaveUnidadNino = u.ClaveUnidad
JOIN Persona pc ON u.CurpConsejero = pc.CURP;

--  ¿Cuántas especialidades se imparten en las unidades de cada club?
SELECT c.Nombre, COUNT(e.ClaveEspecialidad) AS TotalEspecialidades
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Especialidad e ON u.ClaveUnidad = e.CurpInstructor
GROUP BY c.Nombre;

--  ¿Cuándo fue la última reunión de cada niño?
SELECT p.Nombres, 
  (SELECT MAX(r.Fecha) 
   FROM Reunion r 
   JOIN Unidad u ON r.ClaveUnidadReunion = u.ClaveUnidad
   WHERE u.ClaveUnidad = n.ClaveUnidadNino) AS UltimaReunion
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP;

--  ¿Cuántos niños con enfermedades graves tiene cada tutor?
SELECT t.CURP, p.Nombres, COUNT(n.CURP) AS NinosGraves
FROM Tutor t
JOIN Persona p ON t.CURP = p.CURP
JOIN Niño n ON t.CURP = n.CurpTutor
WHERE n.Enfermedad IN ('Epilepsia', 'Diabetes', 'Problemas cardíacos')
GROUP BY t.CURP, p.Nombres;

-- ¿Cuál es la especialidad más reciente de cada niño?
SELECT p.Nombres, 
  (SELECT TOP 1 e.Nombre 
   FROM Especialidad e 
   WHERE e.CurpInstructor = n.CURP 
   ORDER BY e.FechaAceptacion DESC) AS EspecialidadReciente
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP;

-- ¿Cuántas reuniones con asistencia perfecta ha tenido cada club?
SELECT c.Nombre, COUNT(r.ClaveReunion) AS ReunionesPerfectas
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Reunion r ON u.ClaveUnidad = r.ClaveUnidadReunion
WHERE r.Asistencia = 1
GROUP BY c.Nombre;

--  ¿Cuántas veces ha cambiado de unidad cada niño?
SELECT CURP, COUNT(*) AS CambiosUnidad
FROM AuditoriaCambioUnidadNino
GROUP BY CURP;

-- ¿Cuándo se le asignó el primer niño a cada tutor?
SELECT t.CURP, p.Nombres, 
  (SELECT MIN(pn.FechaNacimiento) 
   FROM Niño n 
   JOIN Persona pn ON n.CURP = pn.CURP 
   WHERE n.CurpTutor = t.CURP) AS FechaPrimerNino
FROM Tutor t
JOIN Persona p ON t.CURP = p.CURP;

-- ¿A qué unidad pertenece cada niño?
SELECT p.Nombres, COALESCE(u.NombreUnidad, 'Sin unidad') AS Unidad
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP
LEFT JOIN Unidad u ON n.ClaveUnidadNino = u.ClaveUnidad;

--  ¿Cuántos tutores tienen niños en las unidades de cada club?
SELECT c.Nombre, COUNT(DISTINCT n.CurpTutor) AS TotalTutores
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Niño n ON u.ClaveUnidad = n.ClaveUnidadNino
GROUP BY c.Nombre;

--  ¿A cuántas reuniones asistió cada niño en el último mes?
SELECT p.Nombres, COUNT(r.ClaveReunion) AS ReunionesUltimoMes
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP
JOIN Unidad u ON n.ClaveUnidadNino = u.ClaveUnidad
JOIN Reunion r ON u.ClaveUnidad = r.ClaveUnidadReunion
WHERE r.Fecha >= DATEADD(MONTH, -1, GETDATE())
GROUP BY p.Nombres;

--  ¿Qué niños dados de baja tenía cada tutor?
SELECT t.CURP, p.Nombres AS Tutor, pn.Nombres AS Nino
FROM Tutor t
JOIN Persona p ON t.CURP = p.CURP
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Historial h ON n.CURP = h.CurpPersona
JOIN Persona pn ON n.CURP = pn.CURP;

--  ¿Cuántos niños con enfermedades graves hay en las unidades de cada club?
SELECT c.Nombre, COUNT(n.CURP) AS NinosGraves
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Niño n ON u.ClaveUnidad = n.ClaveUnidadNino
WHERE n.Enfermedad IN ('Epilepsia', 'Diabetes', 'Problemas cardíacos')
GROUP BY c.Nombre;

--  ¿Cuántos niños tiene actualmente y cuántos han sido dados de baja cada tutor?
SELECT t.CURP, p.Nombres, 
  (SELECT COUNT(*) FROM Niño n WHERE n.CurpTutor = t.CURP) AS NinosActuales,
  (SELECT COUNT(*) FROM Historial h JOIN Niño n ON h.CurpPersona = n.CURP WHERE n.CurpTutor = t.CURP) AS NinosBaja
FROM Tutor t
JOIN Persona p ON t.CURP = p.CURP;

-- ¿Cuántos niños han cambiado de unidad en las unidades de cada club?
SELECT c.Nombre, COUNT(DISTINCT a.CURP) AS NinosConCambios
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN AuditoriaCambioUnidadNino a ON u.ClaveUnidad = a.UnidadNueva
GROUP BY c.Nombre;

--  ¿Cuántas especialidades avanzadas ha cursado cada niño?
SELECT p.Nombres, COUNT(e.ClaveEspecialidad) AS EspecialidadesAvanzadas
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP
JOIN Especialidad e ON n.CURP = e.CurpInstructor
WHERE e.Nivel = 3
GROUP BY p.Nombres;

--  ¿Cuándo fue la última vez que se actualizó la información de cada tutor?
SELECT t.CURP, p.Nombres, MAX(a.Fecha) AS UltimaActualizacion
FROM Tutor t
JOIN Persona p ON t.CURP = p.CURP
JOIN AuditoriaTutor a ON t.CURP = a.CURP
GROUP BY t.CURP, p.Nombres;

-- ¿Cuántos niños han cambiado de tutor en las unidades de cada club?
SELECT c.Nombre, COUNT(DISTINCT a.CURP_Nino) AS NinosConCambioTutor
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Niño n ON u.ClaveUnidad = n.ClaveUnidadNino
JOIN AuditoriaCambioTutorNino a ON n.CURP = a.CURP_Nino
GROUP BY c.Nombre;

--  ¿A cuántas reuniones con uniforme completo asistió cada niño?
SELECT p.Nombres, COUNT(r.ClaveReunion) AS ReunionesUniforme
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP
JOIN Unidad u ON n.ClaveUnidadNino = u.ClaveUnidad
JOIN Reunion r ON u.ClaveUnidad = r.ClaveUnidadReunion
WHERE r.Uniforme = 1
GROUP BY p.Nombres;

--  ¿Cuántos niños con cada enfermedad tiene cada tutor?
SELECT t.CURP, n.Enfermedad, COUNT(*) AS Total
FROM Tutor t
JOIN Niño n ON t.CURP = n.CurpTutor
GROUP BY t.CURP, n.Enfermedad
ORDER BY t.CURP, n.Enfermedad;

--  ¿Cuántos niños han sido dados de baja en las unidades de cada club?
SELECT c.Nombre, COUNT(h.CurpPersona) AS NinosBaja
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Niño n ON u.ClaveUnidad = n.ClaveUnidadNino
JOIN Historial h ON n.CURP = h.CurpPersona
GROUP BY c.Nombre;

-- ¿Cuántos niños tiene cada tutor por rango de edad?
SELECT t.CURP,
  SUM(CASE WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 1 ELSE 0 END) AS Menor10,
  SUM(CASE WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN 1 ELSE 0 END) AS De10a14,
  SUM(CASE WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) >= 15 THEN 1 ELSE 0 END) AS Mayor14
FROM Tutor t
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Persona p ON n.CURP = p.CURP
GROUP BY t.CURP;

--  ¿Cuántos niños han cambiado de clase en las unidades de cada club?
SELECT c.Nombre, COUNT(DISTINCT a.CURP) AS NinosConCambioClase
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN AuditoriaPromocionClase a ON u.ClaveUnidad = a.ClaseNueva
GROUP BY c.Nombre;

--  ¿Cuántas especialidades por área ha cursado cada niño?
SELECT n.CURP, e.Area, COUNT(*) AS Total
FROM Niño n
JOIN Especialidad e ON n.CURP = e.CurpInstructor
GROUP BY n.CURP, e.Area;

--  ¿Cuántos niños de cada sexo tiene cada tutor?
SELECT t.CURP,
  SUM(CASE WHEN p.Sexo = 'Masculino' THEN 1 ELSE 0 END) AS Masculinos,
  SUM(CASE WHEN p.Sexo = 'Femenino' THEN 1 ELSE 0 END) AS Femeninos
FROM Tutor t
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Persona p ON n.CURP = p.CURP
GROUP BY t.CURP;

-- ¿Cuántos niños han cambiado de unidad y de tutor en las unidades de cada club?
SELECT c.Nombre, 
  COUNT(DISTINCT acu.CURP) AS NinosCambioUnidad,
  COUNT(DISTINCT act.CURP_Nino) AS NinosCambioTutor
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
LEFT JOIN AuditoriaCambioUnidadNino acu ON u.ClaveUnidad = acu.UnidadNueva
LEFT JOIN AuditoriaCambioTutorNino act ON acu.CURP = act.CURP_Nino
GROUP BY c.Nombre;

-- ¿A cuántas reuniones asistió cada niño por mes?
SELECT p.Nombres, MONTH(r.Fecha) AS Mes, COUNT(*) AS TotalReuniones
FROM Niño n
JOIN Persona p ON n.CURP = p.CURP
JOIN Unidad u ON n.ClaveUnidadNino = u.ClaveUnidad
JOIN Reunion r ON u.ClaveUnidad = r.ClaveUnidadReunion
GROUP BY p.Nombres, MONTH(r.Fecha)
ORDER BY p.Nombres, Mes;

-- ¿Cuántos niños de cada clase tiene cada tutor?
SELECT t.CURP, c.Color AS Clase, COUNT(*) AS Total
FROM Tutor t
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Clase c ON n.ClaveClaseNino = c.NumeroClase
GROUP BY t.CURP, c.Color;

--  ¿Cuántos niños han cambiado de clase y de unidad en las unidades de cada club?
SELECT c.Nombre, 
  COUNT(DISTINCT apc.CURP) AS NinosCambioClase,
  COUNT(DISTINCT acu.CURP) AS NinosCambioUnidad
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
LEFT JOIN AuditoriaPromocionClase apc ON u.ClaveUnidad = apc.ClaseNueva
LEFT JOIN AuditoriaCambioUnidadNino acu ON u.ClaveUnidad = acu.UnidadNueva
GROUP BY c.Nombre;

--  ¿Cuántos niños de cada unidad tiene cada tutor?
SELECT t.CURP, u.NombreUnidad, COUNT(*) AS Total
FROM Tutor t
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Unidad u ON n.ClaveUnidadNino = u.ClaveUnidad
GROUP BY t.CURP, u.NombreUnidad;

-- 66. ¿Cuántas veces ha cambiado de tutor, unidad y clase cada niño?
SELECT n.CURP, 
  (SELECT COUNT(*) FROM AuditoriaCambioTutorNino a WHERE a.CURP_Nino = n.CURP) AS CambiosTutor,
  (SELECT COUNT(*) FROM AuditoriaCambioUnidadNino a WHERE a.CURP = n.CURP) AS CambiosUnidad,
  (SELECT COUNT(*) FROM AuditoriaPromocionClase a WHERE a.CURP = n.CURP) AS CambiosClase
FROM Niño n;

-- ¿Cuántos niños han cambiado de tutor, unidad y clase en las unidades de cada club?
SELECT c.Nombre, 
  COUNT(DISTINCT act.CURP_Nino) AS NinosCambioTutor,
  COUNT(DISTINCT acu.CURP) AS NinosCambioUnidad,
  COUNT(DISTINCT apc.CURP) AS NinosCambioClase
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
LEFT JOIN AuditoriaCambioTutorNino act ON u.ClaveUnidad = act.CURP_Nino
LEFT JOIN AuditoriaCambioUnidadNino acu ON u.ClaveUnidad = acu.UnidadNueva
LEFT JOIN AuditoriaPromocionClase apc ON u.ClaveUnidad = apc.ClaseNueva
GROUP BY c.Nombre;

-- ¿Cuántos niños tiene cada tutor por rango de edad y sexo?
SELECT t.CURP,
  SUM(CASE WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 AND p.Sexo = 'Masculino' THEN 1 ELSE 0 END) AS Menor10_M,
  SUM(CASE WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 AND p.Sexo = 'Femenino' THEN 1 ELSE 0 END) AS Menor10_F,
  SUM(CASE WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 AND p.Sexo = 'Masculino' THEN 1 ELSE 0 END) AS De10a14_M,
  SUM(CASE WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 AND p.Sexo = 'Femenino' THEN 1 ELSE 0 END) AS De10a14_F,
  SUM(CASE WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) >= 15 AND p.Sexo = 'Masculino' THEN 1 ELSE 0 END) AS Mayor14_M,
  SUM(CASE WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) >= 15 AND p.Sexo = 'Femenino' THEN 1 ELSE 0 END) AS Mayor14_F
FROM Tutor t
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Persona p ON n.CURP = p.CURP
GROUP BY t.CURP;

-- ¿Cuántos niños con cada tipo de enfermedad han cambiado de tutor, unidad y clase en las unidades de cada club?
SELECT c.Nombre, n.Enfermedad, COUNT(*) AS Total
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Niño n ON u.ClaveUnidad = n.ClaveUnidadNino
JOIN AuditoriaCambioTutorNino act ON n.CURP = act.CURP_Nino
JOIN AuditoriaCambioUnidadNino acu ON n.CURP = acu.CURP
JOIN AuditoriaPromocionClase apc ON n.CURP = apc.CURP
GROUP BY c.Nombre, n.Enfermedad;

-- ¿Cuántos niños tiene cada tutor por rango de edad, sexo y tipo de enfermedad?
SELECT t.CURP,
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END AS RangoEdad,
  p.Sexo,
  n.Enfermedad,
  COUNT(*) AS Total
FROM Tutor t
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Persona p ON n.CURP = p.CURP
GROUP BY t.CURP, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END,
  p.Sexo, n.Enfermedad;

-- ¿Cuántos niños por rango de edad han cambiado de tutor, unidad y clase en las unidades de cada club?
SELECT c.Nombre, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END AS RangoEdad,
  COUNT(*) AS Total
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Niño n ON u.ClaveUnidad = n.ClaveUnidadNino
JOIN Persona p ON n.CURP = p.CURP
JOIN AuditoriaCambioTutorNino act ON n.CURP = act.CURP_Nino
JOIN AuditoriaCambioUnidadNino acu ON n.CURP = acu.CURP
JOIN AuditoriaPromocionClase apc ON n.CURP = apc.CURP
GROUP BY c.Nombre, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END;

-- ¿Cuántos niños tiene cada tutor por rango de edad, sexo, tipo de enfermedad y clase?
SELECT t.CURP,
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END AS RangoEdad,
  p.Sexo,
  n.Enfermedad,
  c.Color AS Clase,
  COUNT(*) AS Total
FROM Tutor t
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Persona p ON n.CURP = p.CURP
JOIN Clase c ON n.ClaveClaseNino = c.NumeroClase
GROUP BY t.CURP, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END,
  p.Sexo, n.Enfermedad, c.Color;

-- ¿Cuántos niños por rango de edad, sexo y tipo de enfermedad han cambiado de tutor, unidad y clase en las unidades de cada club?
SELECT c.Nombre, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END AS RangoEdad,
  p.Sexo,
  n.Enfermedad,
  COUNT(*) AS Total
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Niño n ON u.ClaveUnidad = n.ClaveUnidadNino
JOIN Persona p ON n.CURP = p.CURP
JOIN AuditoriaCambioTutorNino act ON n.CURP = act.CURP_Nino
JOIN AuditoriaCambioUnidadNino acu ON n.CURP = acu.CURP
JOIN AuditoriaPromocionClase apc ON n.CURP = apc.CURP
GROUP BY c.Nombre, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END,
  p.Sexo, n.Enfermedad;

--¿Cuántos niños tiene cada tutor por rango de edad, sexo, tipo de enfermedad, clase y unidad?
SELECT t.CURP,
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END AS RangoEdad,
  p.Sexo,
  n.Enfermedad,
  c.Color AS Clase,
  u.NombreUnidad,
  COUNT(*) AS Total
FROM Tutor t
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Persona p ON n.CURP = p.CURP
JOIN Clase c ON n.ClaveClaseNino = c.NumeroClase
JOIN Unidad u ON n.ClaveUnidadNino = u.ClaveUnidad
GROUP BY t.CURP, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END,
  p.Sexo, n.Enfermedad, c.Color, u.NombreUnidad;

-- ¿Cuántos niños por rango de edad, sexo, tipo de enfermedad, clase y unidad han cambiado de tutor, unidad y clase en las unidades de cada club?
SELECT c.Nombre, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END AS RangoEdad,
  p.Sexo,
  n.Enfermedad,
  cl.Color AS Clase,
  u.NombreUnidad,
  COUNT(*) AS Total
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Niño n ON u.ClaveUnidad = n.ClaveUnidadNino
JOIN Persona p ON n.CURP = p.CURP
JOIN Clase cl ON n.ClaveClaseNino = cl.NumeroClase
JOIN AuditoriaCambioTutorNino act ON n.CURP = act.CURP_Nino
JOIN AuditoriaCambioUnidadNino acu ON n.CURP = acu.CURP
JOIN AuditoriaPromocionClase apc ON n.CURP = apc.CURP
GROUP BY c.Nombre, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END,
  p.Sexo, n.Enfermedad, cl.Color, u.NombreUnidad;

-- ¿Cuántos niños tiene cada tutor por rango de edad, sexo, tipo de enfermedad, clase, unidad y club?
SELECT t.CURP,
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END AS RangoEdad,
  p.Sexo,
  n.Enfermedad,
  c.Color AS Clase,
  u.NombreUnidad,
  cl.Nombre AS Club,
  COUNT(*) AS Total
FROM Tutor t
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Persona p ON n.CURP = p.CURP
JOIN Clase c ON n.ClaveClaseNino = c.NumeroClase
JOIN Unidad u ON n.ClaveUnidadNino = u.ClaveUnidad
JOIN Club cl ON u.ClaveUnidad = cl.ClaveClub
GROUP BY t.CURP, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END,
  p.Sexo, n.Enfermedad, c.Color, u.NombreUnidad, cl.Nombre;

-- ¿Cuántos niños por rango de edad, sexo, tipo de enfermedad, clase, unidad y club han cambiado de tutor, unidad y clase en las unidades de cada club?
SELECT c.Nombre, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END AS RangoEdad,
  p.Sexo,
  n.Enfermedad,
  cl.Color AS Clase,
  u.NombreUnidad,
  clb.Nombre AS Club,
  COUNT(*) AS Total
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Niño n ON u.ClaveUnidad = n.ClaveUnidadNino
JOIN Persona p ON n.CURP = p.CURP
JOIN Clase cl ON n.ClaveClaseNino = cl.NumeroClase
JOIN Club clb ON u.ClaveUnidad = clb.ClaveClub
JOIN AuditoriaCambioTutorNino act ON n.CURP = act.CURP_Nino
JOIN AuditoriaCambioUnidadNino acu ON n.CURP = acu.CURP
JOIN AuditoriaPromocionClase apc ON n.CURP = apc.CURP
GROUP BY c.Nombre, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END,
  p.Sexo, n.Enfermedad, cl.Color, u.NombreUnidad, clb.Nombre;

-- ¿Cuántos niños tiene cada tutor por rango de edad, sexo, tipo de enfermedad, clase, unidad, club y área de especialidad?
SELECT t.CURP,
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END AS RangoEdad,
  p.Sexo,
  n.Enfermedad,
  c.Color AS Clase,
  u.NombreUnidad,
  cl.Nombre AS Club,
  e.Area,
  COUNT(*) AS Total
FROM Tutor t
JOIN Niño n ON t.CURP = n.CurpTutor
JOIN Persona p ON n.CURP = p.CURP
JOIN Clase c ON n.ClaveClaseNino = c.NumeroClase
JOIN Unidad u ON n.ClaveUnidadNino = u.ClaveUnidad
JOIN Club cl ON u.ClaveUnidad = cl.ClaveClub
JOIN Especialidad e ON n.CURP = e.CurpInstructor
GROUP BY t.CURP, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END,
  p.Sexo, n.Enfermedad, c.Color, u.NombreUnidad, cl.Nombre, e.Area;

-- ¿Cuántos niños por rango de edad, sexo, tipo de enfermedad, clase, unidad, club y área de especialidad han cambiado de tutor, unidad y clase en las unidades de cada club?
SELECT c.Nombre, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END AS RangoEdad,
  p.Sexo,
  n.Enfermedad,
  cl.Color AS Clase,
  u.NombreUnidad,
  clb.Nombre AS Club,
  e.Area,
  COUNT(*) AS Total
FROM Club c
JOIN Unidad u ON c.ClaveClub = u.ClaveUnidad
JOIN Niño n ON u.ClaveUnidad = n.ClaveUnidadNino
JOIN Persona p ON n.CURP = p.CURP
JOIN Clase cl ON n.ClaveClaseNino = cl.NumeroClase
JOIN Club clb ON u.ClaveUnidad = clb.ClaveClub
JOIN Especialidad e ON n.CURP = e.CurpInstructor
JOIN AuditoriaCambioTutorNino act ON n.CURP = act.CURP_Nino
JOIN AuditoriaCambioUnidadNino acu ON n.CURP = acu.CURP
JOIN AuditoriaPromocionClase apc ON n.CURP = apc.CURP
GROUP BY c.Nombre, 
  CASE 
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 10 THEN 'Menor10'
    WHEN DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) BETWEEN 10 AND 14 THEN '10a14'
    ELSE '15omas'
  END,
  p.Sexo, n.Enfermedad, cl.Color, u.NombreUnidad, clb.Nombre, e.Area;

/* SP Y TRIGGERS */

-- PROCEDIMIENTOS ALMACENADOS 

--  Cambia de unidad a todos los niños de una clase 
CREATE PROCEDURE SP_CambiarUnidadNinosPorClase
    @NumeroClase INT, @NuevaUnidad INT
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        UPDATE Niño SET ClaveUnidadNino = @NuevaUnidad WHERE ClaveClaseNino = @NumeroClase
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

--  Lista de tutores y la cantidad de niños asignados
CREATE PROCEDURE SP_ListarTutoresConCantidadNinos
AS
BEGIN
    DECLARE @CurpTutor CHAR(18), @Cantidad INT
    DECLARE cur CURSOR FOR SELECT CURP FROM Tutor
    OPEN cur
    FETCH NEXT FROM cur INTO @CurpTutor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @Cantidad = COUNT(*) FROM Niño WHERE CurpTutor = @CurpTutor
        PRINT 'Tutor: ' + @CurpTutor + ' - Niños asignados: ' + CAST(@Cantidad AS VARCHAR)
        FETCH NEXT FROM cur INTO @CurpTutor
    END
    CLOSE cur
    DEALLOCATE cur
END
GO

--  Registra un club y primer directivo 
CREATE PROCEDURE SP_RegistrarClubYDirectivo
    @ClaveClub VARCHAR(15), @Nombre VARCHAR(50), @Direccion VARCHAR(80),
    @CurpDirectivo CHAR(18), @Rol VARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        INSERT INTO Club (ClaveClub, Nombre, Direccion) VALUES (@ClaveClub, @Nombre, @Direccion);
        INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo) VALUES (@CurpDirectivo, @Rol, @ClaveClub);
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

--  Asigna consejero a unidad
CREATE PROCEDURE SP_AsignarConsejeroUnidad
    @ClaveUnidad INT, @CurpConsejero CHAR(18)
AS
BEGIN
    UPDATE Unidad SET CurpConsejero = @CurpConsejero WHERE ClaveUnidad = @ClaveUnidad
END
GO

--  Cambia el tutor de un niño 
CREATE PROCEDURE SP_CambiarTutorNino
    @CurpNino CHAR(18), @NuevoTutor CHAR(18)
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        UPDATE Niño SET CurpTutor = @NuevoTutor WHERE CURP = @CurpNino
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

--  Lista de niños por unidad
CREATE PROCEDURE SP_ListarNinosPorUnidad
    @ClaveUnidad INT
AS
BEGIN
    SELECT p.Nombres, p.ApellidoPaterno, p.ApellidoMaterno
    FROM Niño n
    JOIN Persona p ON n.CURP = p.CURP
    WHERE n.ClaveUnidadNino = @ClaveUnidad
END
GO

--  Lista de especialidades por área
CREATE PROCEDURE SP_ListarEspecialidadesPorArea
    @Area VARCHAR(50)
AS
BEGIN
    SELECT * FROM Especialidad WHERE Area = @Area
END
GO

--  Registra una reunión para una unidad
CREATE PROCEDURE SP_RegistrarReunion
    @ClaveReunion VARCHAR(15), @Fecha DATE, @Puntualidad BIT, @Asistencia BIT, @Uniforme BIT, @Limpieza BIT, @Tareas BIT, @ClaveUnidad INT
AS
BEGIN
    INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
    VALUES (@ClaveReunion, @Fecha, @Puntualidad, @Asistencia, @Uniforme, @Limpieza, @Tareas, @ClaveUnidad)
END
GO

--  Cambiar club de un directivo 
CREATE PROCEDURE SP_CambiarClubDirectivo
    @CurpDirectivo CHAR(18), @NuevoClub VARCHAR(15)
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        UPDATE Directivo SET ClaveClubDirectivo = @NuevoClub WHERE CURP = @CurpDirectivo
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

--  Lista de tutores con más de N niños 
CREATE PROCEDURE SP_TutoresConMasDeNinos
    @MinNinos INT
AS
BEGIN
    DECLARE @CurpTutor CHAR(18), @Cantidad INT
    DECLARE cur CURSOR FOR SELECT CURP FROM Tutor
    OPEN cur
    FETCH NEXT FROM cur INTO @CurpTutor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @Cantidad = COUNT(*) FROM Niño WHERE CurpTutor = @CurpTutor
        IF @Cantidad > @MinNinos
            PRINT 'Tutor: ' + @CurpTutor + ' - Niños asignados: ' + CAST(@Cantidad AS VARCHAR)
        FETCH NEXT FROM cur INTO @CurpTutor
    END
    CLOSE cur
    DEALLOCATE cur
END
GO

--  Elimina un niño y lo registra en auditoría 
CREATE PROCEDURE SP_EliminarNino
    @CurpNino CHAR(18)
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        DELETE FROM Niño WHERE CURP = @CurpNino
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

--  Lista de niños con enfermedades específicas
CREATE PROCEDURE SP_ListarNinosPorEnfermedad
    @Enfermedad VARCHAR(50)
AS
BEGIN
    SELECT p.Nombres, p.ApellidoPaterno, p.ApellidoMaterno
    FROM Niño n
    JOIN Persona p ON n.CURP = p.CURP
    WHERE n.Enfermedad = @Enfermedad
END
GO

-- Lista de reuniones por unidad y fecha
CREATE PROCEDURE SP_ListarReunionesPorUnidadYFecha
    @ClaveUnidad INT, @FechaInicio DATE, @FechaFin DATE
AS
BEGIN
    SELECT * FROM Reunion
    WHERE ClaveUnidadReunion = @ClaveUnidad AND Fecha BETWEEN @FechaInicio AND @FechaFin
END
GO

CREATE PROCEDURE SP_ReasignarNinosUnidad
    @UnidadOrigen INT,
    @UnidadDestino INT
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        DECLARE @CurpNino CHAR(18)
        DECLARE cur CURSOR FOR
            SELECT CURP FROM Niño WHERE ClaveUnidadNino = @UnidadOrigen
        OPEN cur
        FETCH NEXT FROM cur INTO @CurpNino
        WHILE @@FETCH_STATUS = 0
        BEGIN
            INSERT INTO AuditoriaCambioUnidadNino (CURP, UnidadAnterior, UnidadNueva, FechaCambio, Usuario)
            VALUES (@CurpNino, @UnidadOrigen, @UnidadDestino, GETDATE(), SYSTEM_USER)
            UPDATE Niño SET ClaveUnidadNino = @UnidadDestino WHERE CURP = @CurpNino
            FETCH NEXT FROM cur INTO @CurpNino
        END
        CLOSE cur
        DEALLOCATE cur
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

-- Asigna un tutor a varios niños solo si el tutor no supera 5 niños y ninguno tiene enfermedad grave 
CREATE PROCEDURE SP_AsignarTutorAMultiplesNinos
    @CurpTutor CHAR(18),
    @ListaNinos NVARCHAR(MAX) -- Coma separada: 'CURP1,CURP2,...'
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        DECLARE @TotalActual INT
        SELECT @TotalActual = COUNT(*) FROM Niño WHERE CurpTutor = @CurpTutor

        DECLARE @CurpNino CHAR(18)
        DECLARE @Pos INT = 1
        DECLARE @NextPos INT
        DECLARE @NinoCount INT = 0

        WHILE @Pos > 0
        BEGIN
            SET @NextPos = CHARINDEX(',', @ListaNinos, @Pos)
            IF @NextPos > 0
                SET @CurpNino = SUBSTRING(@ListaNinos, @Pos, @NextPos - @Pos)
            ELSE
                SET @CurpNino = SUBSTRING(@ListaNinos, @Pos, LEN(@ListaNinos) - @Pos + 1)

            IF EXISTS (SELECT 1 FROM Niño WHERE CURP = @CurpNino AND Enfermedad IN ('Epilepsia', 'Problemas cardíacos', 'Diabetes'))
            BEGIN
                RAISERROR('No se puede asignar tutor a un niño con enfermedad grave.', 16, 1)
                ROLLBACK TRANSACTION
                RETURN
            END

            SET @NinoCount = @NinoCount + 1
            IF @NextPos > 0
                SET @Pos = @NextPos + 1
            ELSE
                SET @Pos = 0
        END

        IF @TotalActual + @NinoCount > 5
        BEGIN
            RAISERROR('El tutor tendría más de 5 niños asignados.', 16, 1)
            ROLLBACK TRANSACTION
            RETURN
        END

        -- Asignar tutor
        SET @Pos = 1
        WHILE @Pos > 0
        BEGIN
            SET @NextPos = CHARINDEX(',', @ListaNinos, @Pos)
            IF @NextPos > 0
                SET @CurpNino = SUBSTRING(@ListaNinos, @Pos, @NextPos - @Pos)
            ELSE
                SET @CurpNino = SUBSTRING(@ListaNinos, @Pos, LEN(@ListaNinos) - @Pos + 1)

            UPDATE Niño SET CurpTutor = @CurpTutor WHERE CURP = @CurpNino

            IF @NextPos > 0
                SET @Pos = @NextPos + 1
            ELSE
                SET @Pos = 0
        END

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

-- Cambiar el club de un directivo solo si el club destino tiene menos de 4 directivos y auditar el cambio
CREATE TABLE IF NOT EXISTS AuditoriaCambioClubDirectivo (
    CURP CHAR(18),
    ClubAnterior VARCHAR(15),
    ClubNuevo VARCHAR(15),
    FechaCambio DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE PROCEDURE SP_CambiarClubDirectivoSeguro
    @CurpDirectivo CHAR(18),
    @NuevoClub VARCHAR(15)
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        DECLARE @ClubAnterior VARCHAR(15)
        SELECT @ClubAnterior = ClaveClubDirectivo FROM Directivo WHERE CURP = @CurpDirectivo

        IF (SELECT COUNT(*) FROM Directivo WHERE ClaveClubDirectivo = @NuevoClub) >= 4
        BEGIN
            RAISERROR('El club destino ya tiene 4 directivos.', 16, 1)
            ROLLBACK TRANSACTION
            RETURN
        END

        UPDATE Directivo SET ClaveClubDirectivo = @NuevoClub WHERE CURP = @CurpDirectivo

        INSERT INTO AuditoriaCambioClubDirectivo (CURP, ClubAnterior, ClubNuevo, FechaCambio, Usuario)
        VALUES (@CurpDirectivo, @ClubAnterior, @NuevoClub, GETDATE(), SYSTEM_USER)

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

--  Registra una reunión y actualiza automáticamente la asistencia promedio de la unidad 
CREATE TABLE IF NOT EXISTS EstadisticaUnidad (
    ClaveUnidad INT,
    AsistenciaPromedio DECIMAL(5,2),
    UltimaActualizacion DATETIME
)
GO

CREATE PROCEDURE SP_RegistrarReunionYActualizarEstadistica
    @ClaveReunion VARCHAR(15), @Fecha DATE, @Puntualidad BIT, @Asistencia BIT, @Uniforme BIT, @Limpieza BIT, @Tareas BIT, @ClaveUnidad INT
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
        VALUES (@ClaveReunion, @Fecha, @Puntualidad, @Asistencia, @Uniforme, @Limpieza, @Tareas, @ClaveUnidad)

        DECLARE @Promedio DECIMAL(5,2)
        SELECT @Promedio = AVG(CAST(Asistencia AS FLOAT)) FROM Reunion WHERE ClaveUnidadReunion = @ClaveUnidad

        IF EXISTS (SELECT 1 FROM EstadisticaUnidad WHERE ClaveUnidad = @ClaveUnidad)
            UPDATE EstadisticaUnidad SET AsistenciaPromedio = @Promedio, UltimaActualizacion = GETDATE() WHERE ClaveUnidad = @ClaveUnidad
        ELSE
            INSERT INTO EstadisticaUnidad (ClaveUnidad, AsistenciaPromedio, UltimaActualizacion) VALUES (@ClaveUnidad, @Promedio, GETDATE())

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

--  Promociona los niños a la siguiente clase según edad y auditar el cambio 
CREATE TABLE IF NOT EXISTS AuditoriaPromocionClase (
    CURP CHAR(18),
    ClaseAnterior INT,
    ClaseNueva INT,
    FechaPromocion DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE PROCEDURE SP_PromocionarNinosPorEdad
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        DECLARE @CurpNino CHAR(18), @Edad INT, @ClaseActual INT, @NuevaClase INT
        DECLARE cur CURSOR FOR
            SELECT n.CURP, c.EdadMinima, n.ClaveClaseNino
            FROM Niño n
            JOIN Persona p ON n.CURP = p.CURP
            JOIN Clase c ON n.ClaveClaseNino = c.NumeroClase
        OPEN cur
        FETCH NEXT FROM cur INTO @CurpNino, @Edad, @ClaseActual
        WHILE @@FETCH_STATUS = 0
        BEGIN
            SELECT TOP 1 @NuevaClase = NumeroClase FROM Clase WHERE EdadMinima > @Edad ORDER BY EdadMinima ASC
            IF @NuevaClase IS NOT NULL AND @NuevaClase <> @ClaseActual
            BEGIN
                UPDATE Niño SET ClaveClaseNino = @NuevaClase WHERE CURP = @CurpNino
                INSERT INTO AuditoriaPromocionClase (CURP, ClaseAnterior, ClaseNueva, FechaPromocion, Usuario)
                VALUES (@CurpNino, @ClaseActual, @NuevaClase, GETDATE(), SYSTEM_USER)
            END
            FETCH NEXT FROM cur INTO @CurpNino, @Edad, @ClaseActual
        END
        CLOSE cur
        DEALLOCATE cur
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

--  Registra la especialidad y asignar automáticamente a todos los instructores del área 
CREATE PROCEDURE SP_RegistrarEspecialidadYAsignarInstructores
    @ClaveEspecialidad VARCHAR(15), @Nombre NVARCHAR(50), @Area VARCHAR(50), @FechaAceptacion DATE, @Nivel INT
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)
        VALUES (@ClaveEspecialidad, @Nombre, @Area, @FechaAceptacion, @Nivel, NULL)

        DECLARE @CurpInstructor CHAR(18)
        DECLARE cur CURSOR FOR SELECT CURP FROM Instructor
        OPEN cur
        FETCH NEXT FROM cur INTO @CurpInstructor
        WHILE @@FETCH_STATUS = 0
        BEGIN
            UPDATE Especialidad SET CurpInstructor = @CurpInstructor WHERE ClaveEspecialidad = @ClaveEspecialidad AND CurpInstructor IS NULL
            FETCH NEXT FROM cur INTO @CurpInstructor
        END
        CLOSE cur
        DEALLOCATE cur
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

-- Registraa la baja de niño y dejar registro en historial 
CREATE PROCEDURE SP_BajaNinoConHistorial
    @CurpNino CHAR(18), @FechaFin DATE
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        INSERT INTO Historial (NumeroHistorial, FechaInicio, FechaFin, CurpPersona)
        VALUES ((SELECT ISNULL(MAX(NumeroHistorial),0)+1 FROM Historial), GETDATE(), @FechaFin, @CurpNino)
        DELETE FROM Niño WHERE CURP = @CurpNino
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

-- Cambia el consejero de unidad y auditar el cambio 
CREATE TABLE IF NOT EXISTS AuditoriaCambioConsejeroUnidad (
    ClaveUnidad INT,
    ConsejeroAnterior CHAR(18),
    ConsejeroNuevo CHAR(18),
    FechaCambio DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE PROCEDURE SP_CambiarConsejeroUnidad
    @ClaveUnidad INT, @NuevoConsejero CHAR(18)
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        DECLARE @ConsejeroAnterior CHAR(18)
        SELECT @ConsejeroAnterior = CurpConsejero FROM Unidad WHERE ClaveUnidad = @ClaveUnidad
        UPDATE Unidad SET CurpConsejero = @NuevoConsejero WHERE ClaveUnidad = @ClaveUnidad
        INSERT INTO AuditoriaCambioConsejeroUnidad (ClaveUnidad, ConsejeroAnterior, ConsejeroNuevo, FechaCambio, Usuario)
        VALUES (@ClaveUnidad, @ConsejeroAnterior, @NuevoConsejero, GETDATE(), SYSTEM_USER)
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

--Registra a un directivo y si es presidente, actualizar lema del club 
CREATE PROCEDURE SP_RegistrarDirectivoYActualizarLema
    @CurpDirectivo CHAR(18), @Rol VARCHAR(50), @ClaveClub VARCHAR(15), @NuevoLema VARCHAR(100)
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo) VALUES (@CurpDirectivo, @Rol, @ClaveClub)
        IF @Rol = 'Presidente'
            UPDATE Club SET Lema = @NuevoLema WHERE ClaveClub = @ClaveClub
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

-- Cambia el instructor de especialidad y auditar el cambio 
CREATE TABLE IF NOT EXISTS AuditoriaCambioInstructorEspecialidad (
    ClaveEspecialidad VARCHAR(15),
    InstructorAnterior CHAR(18),
    InstructorNuevo CHAR(18),
    FechaCambio DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE PROCEDURE SP_CambiarInstructorEspecialidad
    @ClaveEspecialidad VARCHAR(15), @NuevoInstructor CHAR(18)
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        DECLARE @InstructorAnterior CHAR(18)
        SELECT @InstructorAnterior = CurpInstructor FROM Especialidad WHERE ClaveEspecialidad = @ClaveEspecialidad
        UPDATE Especialidad SET CurpInstructor = @NuevoInstructor WHERE ClaveEspecialidad = @ClaveEspecialidad
        INSERT INTO AuditoriaCambioInstructorEspecialidad (ClaveEspecialidad, InstructorAnterior, InstructorNuevo, FechaCambio, Usuario)
        VALUES (@ClaveEspecialidad, @InstructorAnterior, @NuevoInstructor, GETDATE(), SYSTEM_USER)
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

-- Si se intenta cambiar el tutor de un niño con enfermedad grave, revierte el cambio y audita
CREATE PROCEDURE SP_CambiarTutorConValidacion
    @CurpNino CHAR(18), @NuevoTutor CHAR(18)
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Niño WHERE CURP = @CurpNino AND Enfermedad IN ('Epilepsia', 'Diabetes', 'Problemas cardíacos'))
        BEGIN
            INSERT INTO AuditoriaCambioTutorNino (CURP_Nino, TutorAnterior, TutorNuevo, FechaCambio, Usuario)
            SELECT CURP, CurpTutor, @NuevoTutor, GETDATE(), SYSTEM_USER FROM Niño WHERE CURP = @CurpNino
            RAISERROR('No se puede cambiar el tutor de un niño con enfermedad grave.', 16, 1)
            ROLLBACK TRANSACTION
            RETURN
        END
        UPDATE Niño SET CurpTutor = @NuevoTutor WHERE CURP = @CurpNino
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

-- Si un tutor supera 5 niños, lo marca como "Sobrecargado" en una tabla de control
CREATE TABLE IF NOT EXISTS ControlSobrecargaTutor (
    CURP_Tutor CHAR(18),
    Sobrecargado BIT,
    FechaActualizacion DATETIME
)
GO

CREATE PROCEDURE SP_MarcarTutorSobrecargado
AS
BEGIN
    DECLARE @CurpTutor CHAR(18)
    DECLARE cur CURSOR FOR SELECT CURP FROM Tutor
    OPEN cur
    FETCH NEXT FROM cur INTO @CurpTutor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @Total INT
        SELECT @Total = COUNT(*) FROM Niño WHERE CurpTutor = @CurpTutor
        IF @Total > 5
        BEGIN
            IF EXISTS (SELECT 1 FROM ControlSobrecargaTutor WHERE CURP_Tutor = @CurpTutor)
                UPDATE ControlSobrecargaTutor SET Sobrecargado = 1, FechaActualizacion = GETDATE() WHERE CURP_Tutor = @CurpTutor
            ELSE
                INSERT INTO ControlSobrecargaTutor (CURP_Tutor, Sobrecargado, FechaActualizacion) VALUES (@CurpTutor, 1, GETDATE())
        END
        ELSE
        BEGIN
            IF EXISTS (SELECT 1 FROM ControlSobrecargaTutor WHERE CURP_Tutor = @CurpTutor)
                UPDATE ControlSobrecargaTutor SET Sobrecargado = 0, FechaActualizacion = GETDATE() WHERE CURP_Tutor = @CurpTutor
        END
        FETCH NEXT FROM cur INTO @CurpTutor
    END
    CLOSE cur
    DEALLOCATE cur
END
GO

-- Si se elimina un niño con enfermedad grave, además de auditar, envía alerta (simulada con PRINT)
CREATE PROCEDURE SP_EliminarNinoConAlerta
    @CurpNino CHAR(18)
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        DECLARE @Enfermedad VARCHAR(50)
        SELECT @Enfermedad = Enfermedad FROM Niño WHERE CURP = @CurpNino
        DELETE FROM Niño WHERE CURP = @CurpNino
        IF @Enfermedad IN ('Epilepsia', 'Diabetes', 'Problemas cardíacos')
            PRINT 'ALERTA: Se eliminó un niño con enfermedad grave: ' + @CurpNino
        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END
GO

-- TRIGGERS


-- un tutor no tenga más de 5 niños asignados
CREATE TRIGGER trg_MaxNinosPorTutor
ON Niño
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT CurpTutor
        FROM Niño
        GROUP BY CurpTutor
        HAVING COUNT(*) > 5
    )
    BEGIN
        ROLLBACK TRANSACTION
        RAISERROR('Un tutor no puede tener más de 5 niños asignados.', 16, 1)
    END
END
GO

-- Registra en una auditoría cada vez que se elimina un niño
CREATE TABLE IF NOT EXISTS AuditoriaEliminacionNino (
    CURP CHAR(18),
    FechaEliminacion DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaEliminacionNino
ON Niño
AFTER DELETE
AS
BEGIN
    INSERT INTO AuditoriaEliminacionNino (CURP, FechaEliminacion, Usuario)
    SELECT d.CURP, GETDATE(), SYSTEM_USER
    FROM deleted d
END
GO

-- omitir que se cambie la especialidad de nivel 3 a un nivel menor
CREATE TRIGGER trg_OmitirBajaNivelEspecialidad
ON Especialidad
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.ClaveEspecialidad = d.ClaveEspecialidad
        WHERE d.Nivel = 3 AND i.Nivel < 3
    )
    BEGIN
        ROLLBACK TRANSACTION
        RAISERROR('No se puede bajar el nivel de una especialidad avanzada.', 16, 1)
    END
END
GO

-- cuida que un niño tenga una enfermedad vacía
CREATE TRIGGER trg_EnfermedadNoVacia
ON Niño
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Enfermedad IS NULL OR Enfermedad = '')
    BEGIN
        ROLLBACK TRANSACTION
        RAISERROR('El campo Enfermedad no puede estar vacío.', 16, 1)
    END
END
GO

--Registra en una auditoría cada vez que se actualiza el tutor de un niño
CREATE TABLE IF NOT EXISTS AuditoriaCambioTutor (
    CURP_Nino CHAR(18),
    TutorAnterior CHAR(18),
    TutorNuevo CHAR(18),
    FechaCambio DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaCambioTutor
ON Niño
AFTER UPDATE
AS
BEGIN
    IF UPDATE(CurpTutor)
    BEGIN
        INSERT INTO AuditoriaCambioTutor (CURP_Nino, TutorAnterior, TutorNuevo, FechaCambio, Usuario)
        SELECT d.CURP, d.CurpTutor, i.CurpTutor, GETDATE(), SYSTEM_USER
        FROM deleted d
        JOIN inserted i ON d.CURP = i.CURP
        WHERE d.CurpTutor <> i.CurpTutor
    END
END
GO

-- Previene que se elimine un club si tiene directivos asignados
CREATE TRIGGER trg_PrevenirEliminacionClubConDirectivos
ON Club
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Directivo d WHERE d.ClaveClubDirectivo IN (SELECT ClaveClub FROM deleted))
    BEGIN
        RAISERROR('No se puede eliminar un club con directivos asignados.', 16, 1)
        RETURN
    END
    DELETE FROM Club WHERE ClaveClub IN (SELECT ClaveClub FROM deleted)
END
GO

-- Previene que se elimine un tutor si tiene niños asignados
CREATE TRIGGER trg_PrevenirEliminacionTutorConNinos
ON Tutor
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Niño n WHERE n.CurpTutor IN (SELECT CURP FROM deleted))
    BEGIN
        RAISERROR('No se puede eliminar un tutor con niños asignados.', 16, 1)
        RETURN
    END
    DELETE FROM Tutor WHERE CURP IN (SELECT CURP FROM deleted)
END
GO

-- Auditoría hace cambios en la tabla Persona
CREATE TABLE IF NOT EXISTS AuditoriaPersona (
    CURP CHAR(18),
    Accion NVARCHAR(10),
    Fecha DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaPersona
ON Persona
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted)
        INSERT INTO AuditoriaPersona (CURP, Accion, Fecha, Usuario)
        SELECT CURP, 'INSERT/UPDATE', GETDATE(), SYSTEM_USER FROM inserted
    IF EXISTS (SELECT 1 FROM deleted)
        INSERT INTO AuditoriaPersona (CURP, Accion, Fecha, Usuario)
        SELECT CURP, 'DELETE', GETDATE(), SYSTEM_USER FROM deleted
END
GO

--Previene que se elimine una unidad si tiene niños asignados
CREATE TRIGGER trg_PrevenirEliminacionUnidadConNinos
ON Unidad
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Niño n WHERE n.ClaveUnidadNino IN (SELECT ClaveUnidad FROM deleted))
    BEGIN
        RAISERROR('No se puede eliminar una unidad con niños asignados.', 16, 1)
        RETURN
    END
    DELETE FROM Unidad WHERE ClaveUnidad IN (SELECT ClaveUnidad FROM deleted)
END
GO

--  Auditoría de cambios en la tabla Especialidad
CREATE TABLE IF NOT EXISTS AuditoriaEspecialidad (
    ClaveEspecialidad VARCHAR(15),
    Accion NVARCHAR(10),
    Fecha DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaEspecialidad
ON Especialidad
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted)
        INSERT INTO AuditoriaEspecialidad (ClaveEspecialidad, Accion, Fecha, Usuario)
        SELECT ClaveEspecialidad, 'INSERT/UPDATE', GETDATE(), SYSTEM_USER FROM inserted
    IF EXISTS (SELECT 1 FROM deleted)
        INSERT INTO AuditoriaEspecialidad (ClaveEspecialidad, Accion, Fecha, Usuario)
        SELECT ClaveEspecialidad, 'DELETE', GETDATE(), SYSTEM_USER FROM deleted
END
GO

--  Previene que se elimine un directivo si es el único del club
CREATE TRIGGER trg_PrevenirEliminacionUnicoDirectivo
ON Directivo
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM deleted d
        WHERE (SELECT COUNT(*) FROM Directivo WHERE ClaveClubDirectivo = d.ClaveClubDirectivo) = 1
    )
    BEGIN
        RAISERROR('No se puede eliminar el único directivo de un club.', 16, 1)
        RETURN
    END
    DELETE FROM Directivo WHERE CURP IN (SELECT CURP FROM deleted)
END
GO

--  Previene que se elimine una especialidad si está asignada a requisitos
CREATE TRIGGER trg_PrevenirEliminacionEspecialidadConRequisito
ON Especialidad
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Requisito r WHERE r.ClaveEspecialidadRequisito IN (SELECT ClaveEspecialidad FROM deleted))
    BEGIN
        RAISERROR('No se puede eliminar una especialidad asignada a requisitos.', 16, 1)
        RETURN
    END
    DELETE FROM Especialidad WHERE ClaveEspecialidad IN (SELECT ClaveEspecialidad FROM deleted)
END
GO

-- 13. Previene que se elimine un consejero si tiene unidades asignadas
CREATE TRIGGER trg_PrevenirEliminacionConsejeroConUnidades
ON Consejero
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Unidad u WHERE u.CurpConsejero IN (SELECT CURP FROM deleted))
    BEGIN
        RAISERROR('No se puede eliminar un consejero con unidades asignadas.', 16, 1)
        RETURN
    END
    DELETE FROM Consejero WHERE CURP IN (SELECT CURP FROM deleted)
END
GO

--  Auditoría de cambios en la tabla Reunion
CREATE TABLE IF NOT EXISTS AuditoriaReunion (
    ClaveReunion VARCHAR(15),
    Accion NVARCHAR(10),
    Fecha DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaReunion
ON Reunion
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted)
        INSERT INTO AuditoriaReunion (ClaveReunion, Accion, Fecha, Usuario)
        SELECT ClaveReunion, 'INSERT/UPDATE', GETDATE(), SYSTEM_USER FROM inserted
    IF EXISTS (SELECT 1 FROM deleted)
        INSERT INTO AuditoriaReunion (ClaveReunion, Accion, Fecha, Usuario)
        SELECT ClaveReunion, 'DELETE', GETDATE(), SYSTEM_USER FROM deleted
END
GO

--  Previene que se elimine una clase si hay niños asignados
CREATE TRIGGER trg_PrevenirEliminacionClaseConNinos
ON Clase
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Niño n WHERE n.ClaveClaseNino IN (SELECT NumeroClase FROM deleted))
    BEGIN
        RAISERROR('No se puede eliminar una clase con niños asignados.', 16, 1)
        RETURN
    END
    DELETE FROM Clase WHERE NumeroClase IN (SELECT NumeroClase FROM deleted)
END
GO

--  Previene que se elimine un instructor si tiene especialidades asignadas
CREATE TRIGGER trg_PrevenirEliminacionInstructorConEspecialidades
ON Instructor
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Especialidad e WHERE e.CurpInstructor IN (SELECT CURP FROM deleted))
    BEGIN
        RAISERROR('No se puede eliminar un instructor con especialidades asignadas.', 16, 1)
        RETURN
    END
    DELETE FROM Instructor WHERE CURP IN (SELECT CURP FROM deleted)
END
GO

--  Auditoría de cambios en la tabla Tutor
CREATE TABLE IF NOT EXISTS AuditoriaTutor (
    CURP CHAR(18),
    Accion NVARCHAR(10),
    Fecha DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaTutor
ON Tutor
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted)
        INSERT INTO AuditoriaTutor (CURP, Accion, Fecha, Usuario)
        SELECT CURP, 'INSERT/UPDATE', GETDATE(), SYSTEM_USER FROM inserted
    IF EXISTS (SELECT 1 FROM deleted)
        INSERT INTO AuditoriaTutor (CURP, Accion, Fecha, Usuario)
        SELECT CURP, 'DELETE', GETDATE(), SYSTEM_USER FROM deleted
END
GO

--  Previene que se elimine un niño si tiene historial
CREATE TRIGGER trg_PrevenirEliminacionNinoConHistorial
ON Niño
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Historial h WHERE h.CurpPersona IN (SELECT CURP FROM deleted))
    BEGIN
        RAISERROR('No se puede eliminar un niño con historial.', 16, 1)
        RETURN
    END
    DELETE FROM Niño WHERE CURP IN (SELECT CURP FROM deleted)
END
GO

--  Previene que se elimine un directivo si es presidente
CREATE TRIGGER trg_PrevenirEliminacionPresidente
ON Directivo
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted WHERE ROL = 'Presidente')
    BEGIN
        RAISERROR('No se puede eliminar un presidente de club directamente.', 16, 1)
        RETURN
    END
    DELETE FROM Directivo WHERE CURP IN (SELECT CURP FROM deleted)
END
GO

-- Previene que se elimine una reunión si es la única de la unidad
CREATE TRIGGER trg_PrevenirEliminacionUnicaReunionUnidad
ON Reunion
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM deleted d
        WHERE (SELECT COUNT(*) FROM Reunion WHERE ClaveUnidadReunion = d.ClaveUnidadReunion) = 1
    )
    BEGIN
        RAISERROR('No se puede eliminar la única reunión de una unidad.', 16, 1)
        RETURN
    END
    DELETE FROM Reunion WHERE ClaveReunion IN (SELECT ClaveReunion FROM deleted)
END
GO


-- Auditar cambio de unidad de un niño
CREATE TRIGGER trg_AuditoriaCambioUnidadNino
ON Niño
AFTER UPDATE
AS
BEGIN
    IF UPDATE(ClaveUnidadNino)
    BEGIN
        INSERT INTO AuditoriaCambioUnidadNino (CURP, UnidadAnterior, UnidadNueva, FechaCambio, Usuario)
        SELECT d.CURP, d.ClaveUnidadNino, i.ClaveUnidadNino, GETDATE(), SYSTEM_USER
        FROM deleted d
        JOIN inserted i ON d.CURP = i.CURP
        WHERE d.ClaveUnidadNino <> i.ClaveUnidadNino
    END
END
GO

-- Validar que un niño no sea asignado a una clase para la que no cumple la edad mínima
CREATE TRIGGER trg_ValidarEdadClaseNino
ON Niño
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted i
        JOIN Clase c ON i.ClaveClaseNino = c.NumeroClase
        JOIN Persona p ON i.CURP = p.CURP
        WHERE DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < c.EdadMinima
    )
    BEGIN
        ROLLBACK TRANSACTION
        RAISERROR('El niño no cumple la edad mínima para la clase asignada.', 16, 1)
    END
END
GO

--Auditar cambio de tutor de un niño
CREATE TABLE IF NOT EXISTS AuditoriaCambioTutorNino (
    CURP_Nino CHAR(18),
    TutorAnterior CHAR(18),
    TutorNuevo CHAR(18),
    FechaCambio DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaCambioTutorNino
ON Niño
AFTER UPDATE
AS
BEGIN
    IF UPDATE(CurpTutor)
    BEGIN
        INSERT INTO AuditoriaCambioTutorNino (CURP_Nino, TutorAnterior, TutorNuevo, FechaCambio, Usuario)
        SELECT d.CURP, d.CurpTutor, i.CurpTutor, GETDATE(), SYSTEM_USER
        FROM deleted d
        JOIN inserted i ON d.CURP = i.CURP
        WHERE d.CurpTutor <> i.CurpTutor
    END
END
GO

--  Auditar cambio de consejero en unidad
CREATE TRIGGER trg_AuditoriaCambioConsejeroUnidad
ON Unidad
AFTER UPDATE
AS
BEGIN
    IF UPDATE(CurpConsejero)
    BEGIN
        INSERT INTO AuditoriaCambioConsejeroUnidad (ClaveUnidad, ConsejeroAnterior, ConsejeroNuevo, FechaCambio, Usuario)
        SELECT d.ClaveUnidad, d.CurpConsejero, i.CurpConsejero, GETDATE(), SYSTEM_USER
        FROM deleted d
        JOIN inserted i ON d.ClaveUnidad = i.ClaveUnidad
        WHERE d.CurpConsejero <> i.CurpConsejero
    END
END
GO

-- Auditar cambio de instructor en especialidad
CREATE TRIGGER trg_AuditoriaCambioInstructorEspecialidad
ON Especialidad
AFTER UPDATE
AS
BEGIN
    IF UPDATE(CurpInstructor)
    BEGIN
        INSERT INTO AuditoriaCambioInstructorEspecialidad (ClaveEspecialidad, InstructorAnterior, InstructorNuevo, FechaCambio, Usuario)
        SELECT d.ClaveEspecialidad, d.CurpInstructor, i.CurpInstructor, GETDATE(), SYSTEM_USER
        FROM deleted d
        JOIN inserted i ON d.ClaveEspecialidad = i.ClaveEspecialidad
        WHERE d.CurpInstructor <> i.CurpInstructor
    END
END
GO

-- Si se elimina un directivo presidente, dejar registro en auditoría
CREATE TABLE IF NOT EXISTS AuditoriaEliminacionPresidente (
    CURP CHAR(18),
    ClaveClub VARCHAR(15),
    FechaEliminacion DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaEliminacionPresidente
ON Directivo
AFTER DELETE
AS
BEGIN
    INSERT INTO AuditoriaEliminacionPresidente (CURP, ClaveClub, FechaEliminacion, Usuario)
    SELECT d.CURP, d.ClaveClubDirectivo, GETDATE(), SYSTEM_USER
    FROM deleted d
    WHERE d.ROL = 'Presidente'
END
GO

-- Si se elimina una reunión, registrar en auditoría
CREATE TABLE IF NOT EXISTS AuditoriaEliminacionReunion (
    ClaveReunion VARCHAR(15),
    FechaEliminacion DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaEliminacionReunion
ON Reunion
AFTER DELETE
AS
BEGIN
    INSERT INTO AuditoriaEliminacionReunion (ClaveReunion, FechaEliminacion, Usuario)
    SELECT d.ClaveReunion, GETDATE(), SYSTEM_USER
    FROM deleted d
END
GO

-- Si se actualiza el nivel de una especialidad, registrar en auditoría
CREATE TABLE IF NOT EXISTS AuditoriaCambioNivelEspecialidad (
    ClaveEspecialidad VARCHAR(15),
    NivelAnterior INT,
    NivelNuevo INT,
    FechaCambio DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaCambioNivelEspecialidad
ON Especialidad
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Nivel)
    BEGIN
        INSERT INTO AuditoriaCambioNivelEspecialidad (ClaveEspecialidad, NivelAnterior, NivelNuevo, FechaCambio, Usuario)
        SELECT d.ClaveEspecialidad, d.Nivel, i.Nivel, GETDATE(), SYSTEM_USER
        FROM deleted d
        JOIN inserted i ON d.ClaveEspecialidad = i.ClaveEspecialidad
        WHERE d.Nivel <> i.Nivel
    END
END
GO

-- Si se elimina un niño, registrar en auditoría
CREATE TABLE IF NOT EXISTS AuditoriaEliminacionNinoAvanzada (
    CURP CHAR(18),
    FechaEliminacion DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaEliminacionNinoAvanzada
ON Niño
AFTER DELETE
AS
BEGIN
    INSERT INTO AuditoriaEliminacionNinoAvanzada (CURP, FechaEliminacion, Usuario)
    SELECT d.CURP, GETDATE(), SYSTEM_USER
    FROM deleted d
END
GO

-- Si se elimina un club, registrar en auditoría
CREATE TABLE IF NOT EXISTS AuditoriaEliminacionClub (
    ClaveClub VARCHAR(15),
    FechaEliminacion DATETIME,
    Usuario NVARCHAR(100)
)
GO

CREATE TRIGGER trg_AuditoriaEliminacionClub
ON Club
AFTER DELETE
AS
BEGIN
    INSERT INTO AuditoriaEliminacionClub (ClaveClub, FechaEliminacion, Usuario)
    SELECT d.ClaveClub, GETDATE(), SYSTEM_USER
    FROM deleted d
END
GO

-- Solo audita si el directivo es Presidente o Tesorero
CREATE TRIGGER trg_AuditoriaCambioDirectivoCritico
ON Directivo
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted i
        JOIN deleted d ON i.CURP = d.CURP
        WHERE (i.ROL IN ('Presidente', 'Tesorero') OR d.ROL IN ('Presidente', 'Tesorero'))
          AND (i.ClaveClubDirectivo <> d.ClaveClubDirectivo)
    )
    BEGIN
        INSERT INTO AuditoriaCambioClubDirectivo (CURP, ClubAnterior, ClubNuevo, FechaCambio, Usuario)
        SELECT d.CURP, d.ClaveClubDirectivo, i.ClaveClubDirectivo, GETDATE(), SYSTEM_USER
        FROM inserted i
        JOIN deleted d ON i.CURP = d.CURP
        WHERE (i.ROL IN ('Presidente', 'Tesorero') OR d.ROL IN ('Presidente', 'Tesorero'))
          AND (i.ClaveClubDirectivo <> d.ClaveClubDirectivo)
    END
END
GO

-- Si un club supera 3 directivos, registra en auditoría y envía alerta (simulada con PRINT)
CREATE TRIGGER trg_AuditoriaClubDirectivosExceso
ON Directivo
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT ClaveClubDirectivo FROM Directivo
        GROUP BY ClaveClubDirectivo
        HAVING COUNT(*) > 3
    )
    BEGIN
        DECLARE @Club VARCHAR(15)
        SELECT TOP 1 @Club = ClaveClubDirectivo FROM Directivo
        GROUP BY ClaveClubDirectivo
        HAVING COUNT(*) > 3

        INSERT INTO AuditoriaCambioClubDirectivo (CURP, ClubAnterior, ClubNuevo, FechaCambio, Usuario)
        SELECT i.CURP, NULL, @Club, GETDATE(), SYSTEM_USER FROM inserted i WHERE i.ClaveClubDirectivo = @Club

        PRINT 'ALERTA: El club ' + @Club + ' tiene más de 3 directivos.'
    END
END
GO

-- Si se cambia la edad mínima de una clase, recalcula y actualiza la edad promedio de los niños en esa clase
CREATE TABLE IF NOT EXISTS EstadisticaClase (
    NumeroClase INT,
    EdadPromedio DECIMAL(5,2),
    FechaActualizacion DATETIME
)
GO

CREATE TRIGGER trg_AuditoriaYRecalculoEdadClase
ON Clase
AFTER UPDATE
AS
BEGIN
    IF UPDATE(EdadMinima)
    BEGIN
        DECLARE @Clase INT
        SELECT @Clase = i.NumeroClase FROM inserted i

        DECLARE @Promedio DECIMAL(5,2)
        SELECT @Promedio = AVG(DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()))
        FROM Niño n
        JOIN Persona p ON n.CURP = p.CURP
        WHERE n.ClaveClaseNino = @Clase

        IF EXISTS (SELECT 1 FROM EstadisticaClase WHERE NumeroClase = @Clase)
            UPDATE EstadisticaClase SET EdadPromedio = @Promedio, FechaActualizacion = GETDATE() WHERE NumeroClase = @Clase
        ELSE
            INSERT INTO EstadisticaClase (NumeroClase, EdadPromedio, FechaActualizacion) VALUES (@Clase, @Promedio, GETDATE())
    END
END
GO


-- Si se intenta bajar el nivel de una especialidad avanzada, audita y bloquea solo si el instructor es nuevo (menos de 1 año)
CREATE TRIGGER trg_BloqueaBajaNivelInstructorNuevo
ON Especialidad
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.ClaveEspecialidad = d.ClaveEspecialidad
        JOIN Instructor ins ON i.CurpInstructor = ins.CURP
        JOIN Persona p ON ins.CURP = p.CURP
        WHERE d.Nivel = 3 AND i.Nivel < 3
          AND DATEDIFF(YEAR, p.FechaNacimiento, GETDATE()) < 1
    )
    BEGIN
        RAISERROR('No se puede bajar el nivel de una especialidad avanzada si el instructor es nuevo.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END
END
GO

-- Si se elimina un niño, recalcula y actualiza el total de niños por tutor
CREATE TABLE IF NOT EXISTS EstadisticaTutor (
    CURP_Tutor CHAR(18),
    TotalNinos INT,
    FechaActualizacion DATETIME
)
GO

CREATE TRIGGER trg_AuditoriaYRecalculoTutor
ON Niño
AFTER DELETE
AS
BEGIN
    DECLARE @Tutor CHAR(18)
    DECLARE cur CURSOR FOR SELECT CurpTutor FROM deleted
    OPEN cur
    FETCH NEXT FROM cur INTO @Tutor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @Total INT
        SELECT @Total = COUNT(*) FROM Niño WHERE CurpTutor = @Tutor
        IF EXISTS (SELECT 1 FROM EstadisticaTutor WHERE CURP_Tutor = @Tutor)
            UPDATE EstadisticaTutor SET TotalNinos = @Total, FechaActualizacion = GETDATE() WHERE CURP_Tutor = @Tutor
        ELSE
            INSERT INTO EstadisticaTutor (CURP_Tutor, TotalNinos, FechaActualizacion) VALUES (@Tutor, @Total, GETDATE())
        FETCH NEXT FROM cur INTO @Tutor
    END
    CLOSE cur
    DEALLOCATE cur
END
GO

-- Audita y bloquea si se intenta cambiar el club de un Presidente a un club que ya tiene Presidente
CREATE TRIGGER trg_BloqueaDosPresidentes
ON Directivo
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.CURP = d.CURP
        WHERE i.ROL = 'Presidente'
          AND i.ClaveClubDirectivo <> d.ClaveClubDirectivo
          AND EXISTS (
              SELECT 1 FROM Directivo
              WHERE ClaveClubDirectivo = i.ClaveClubDirectivo AND ROL = 'Presidente'
          )
    )
    BEGIN
        RAISERROR('No puede haber dos presidentes en el mismo club.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END
    -- Si no hay conflicto, audita el cambio
    IF UPDATE(ClaveClubDirectivo)
    BEGIN
        INSERT INTO AuditoriaCambioClubDirectivo (CURP, ClubAnterior, ClubNuevo, FechaCambio, Usuario)
        SELECT d.CURP, d.ClaveClubDirectivo, i.ClaveClubDirectivo, GETDATE(), SYSTEM_USER
        FROM inserted i
        JOIN deleted d ON i.CURP = d.CURP
        WHERE d.ClaveClubDirectivo <> i.ClaveClubDirectivo
    END
END
GO
