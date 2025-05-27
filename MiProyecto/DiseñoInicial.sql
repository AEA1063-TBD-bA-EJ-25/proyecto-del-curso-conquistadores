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

--