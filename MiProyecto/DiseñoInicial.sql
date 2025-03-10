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
    ClaveClaseNino CHAR(15) FOREIGN KEY REFERENCES Clase(ClaveClase),
    CurpTutor CHAR(18) FOREIGN KEY REFERENCES Tutor(CURP),
    ClaveUnidadNino VARCHAR(15) FOREIGN KEY REFERENCES Unidad(ClaveUnidad)
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
    ClaveUnidadReunion CHAR(15) FOREIGN KEY REFERENCES Unidad(ClaveUnidad)
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

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)
VALUES ('CURP12345678901234', 'Ninguna', '555-1234', 'CLASE001', 'CURPTUTOR12345678', 'UNIDAD001');

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)
VALUES ('CURP12345678901238', 'Asma', '555-6789', 'CLASE002', 'CURP12345678901239', 'UNIDAD002');

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)
VALUES ('CURP12345678901235', 'Presidente', 'CLUB001');

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)
VALUES ('CURP12345678901240', 'Vicepresidente', 'CLUB002');

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)
VALUES ('CURP12345678901236', 'Liderazgo', 'CLUB002');

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)
VALUES ('CURP12345678901241', 'Educación', 'CLUB003');

INSERT INTO Tutor (CURP, Telefono)
VALUES ('CURPTUTOR12345678', '555-5678');

INSERT INTO Tutor (CURP, Telefono)
VALUES ('CURP12345678901242', '555-9876');

INSERT INTO Clase (NumeroClase, Color, EdadMinima)
VALUES (1, 'Rojo', 10);

INSERT INTO Clase (NumeroClase, Color, EdadMinima)
VALUES (2, 'Azul', 12);

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)
VALUES (1, 'Unidad Alfa');

INSERT INTO Unidad (ClaveUnidad, NombreUnidad)
VALUES (2, 'Unidad Beta');

INSERT INTO Club (ClaveClub, Nombre, Direccion)
VALUES ('CLUB001', 'Club de Aventureros', 'Calle Real 456');

INSERT INTO Club (ClaveClub, Nombre, Direccion)
VALUES ('CLUB002', 'Club de Exploradores', 'Calle Verde 123');

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)
VALUES ('ESP001', 'Nudos', 'Supervivencia', '2025-01-01', 1, 'CURP12345678901237');

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)
VALUES ('ESP002', 'Primeros Auxilios', 'Salud', '2025-02-01', 2, 'CURP12345678901243');

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU001', '2025-03-09', 1, 1, 1, 1, 1, 'UNIDAD001');

ALTER TABLE Persona
ADD CONSTRAINT CHK_Sexo CHECK (Sexo IN ('Masculino', 'Femenino'));

ALTER TABLE Niño
ADD CONSTRAINT CHK_Enfermedad CHECK (Enfermedad IS NOT NULL OR Enfermedad = 'Ninguna');


SELECT * FROM Niño;

SELECT * FROM Directivo;

SELECT * FROM Persona;

SELECT * FROM Especialidad WHERE CurpInstructor = 'CURP12345678901237';

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
