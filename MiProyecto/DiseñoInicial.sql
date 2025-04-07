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

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)
VALUES ('CURP12345678901234', 'Ninguna', '555-1234', 1, 'CURP12345678901239', 1);

INSERT INTO Niño (CURP, Enfermedad, ContactoEmergencia, ClaveClaseNino, CurpTutor, ClaveUnidadNino)
VALUES ('CURP12345678901238', 'Asma', '555-6789', 2, 'CURP12345678901239', 2);

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)
VALUES ('CURP12345678901234', 'Presidente', 'CLUB001');

INSERT INTO Directivo (CURP, ROL, ClaveClubDirectivo)
VALUES ('CURP12345678901238', 'Vicepresidente', 'CLUB002');

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)
VALUES ('CURP12345678901244', 'Liderazgo', 'CLUB002');

INSERT INTO Consejero (CURP, Aspiracion, ClaveClubConsejero)
VALUES ('CURP12345678901245', 'Educación', 'CLUB005');

INSERT INTO Instructor (CURP, ClaveClubInstructor)
VALUES ('CURP12345678901238', 'CLUB005');

INSERT INTO Instructor (CURP, ClaveClubInstructor)
VALUES ('CURP12345678901243', 'CLUB002');


INSERT INTO Tutor (CURP, Telefono)
VALUES ('CURP12345678901239', '555-5678');

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
VALUES ('CLUB005', 'Águilas Reales', 'Calle Real 456');

INSERT INTO Club (ClaveClub, Nombre, Direccion)
VALUES ('CLUB006', 'Beta Crucis', 'Calle Verde 123');

INSERT INTO Club (ClaveClub, Nombre, Direccion)
VALUES ('CLUB003', 'Delfines', 'Calle Lomas 912');

INSERT INTO Club (ClaveClub, Nombre, Direccion)
VALUES ('CLUB004', 'Polaris', 'Calle Rojo 637');

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)
VALUES ('ESP001', 'Nudos', 'Supervivencia', '2025-01-01', 1, 'CURP12345678901238');

INSERT INTO Especialidad (ClaveEspecialidad, Nombre, Area, FechaAceptacion, Nivel, CurpInstructor)
VALUES ('ESP002', 'Primeros Auxilios', 'Salud', '2025-02-01', 2, 'CURP12345678901243');

INSERT INTO Reunion (ClaveReunion, Fecha, Puntualidad, Asistencia, Uniforme, Limpieza, Tareas, ClaveUnidadReunion)
VALUES ('REU001', '2025-03-09', 1, 1, 1, 1, 1, 001);

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

---- 02. Consultas ----
-- para saber la información de los papás y de los niños
select n.CURP, p.Nombres, p.ApellidoPaterno, p.ApellidoMaterno, t.Telefono
from Niño n
join Persona p on n.CURP = p.CURP
join Tutor t on n.CurpTutor = t.CURP


-- para saber sobre los instructores junto con el nombre de club
select i.CURP, p.Nombres, p.ApellidoPaterno, p.ApellidoMaterno, cl.Nombre as NombreClub
from Instructor i
join Persona p ON i.CURP = p.CURP
join Club cl ON i.ClaveClubInstructor = cl.ClaveClub;

-- consulta para nombres de los tutores que tienen niños con asma
select Nombres
from Persona
where CURP IN (SELECT CurpTutor FROM Niño WHERE Enfermedad = 'Asma');

-- conocer cuantos niños hay 
select ClaveClaseNino, COUNT(*) AS NumeroNiños
from Niño
group BY ClaveClaseNino;

-- cuantos tutores
select COUNT(*) AS NumeroTutores
from Tutor;

-- niños y sus tutores
with NinosTutores AS (
    select n.CURP, p.Nombres, p.ApellidoPaterno, p.ApellidoMaterno, t.Telefono
    from Niño n
    join Persona p ON n.CURP = p.CURP
    join Tutor t ON n.CurpTutor = t.CURP
) select * from NinosTutores

-- variable CURP del niño 
declare @CurpNino CHAR(18) = 'CURP12345678901234';
select p.Nombres, p.ApellidoPaterno, p.ApellidoMaterno, n.Enfermedad
from Persona p
join Niño n ON p.CURP = n.CURP
where p.CURP = @CurpNino;

-- nombres completos de  tutores
select CURP, Nombres + ' ' + ApellidoPaterno + ' ' + ApellidoMaterno AS NombreCompleto
from Persona
where Tipo = 'Tutor';

--conocer la edad de los consejeros
select CURP, Nombres, DATEDIFF(YEAR, FechaNacimiento, GETDATE()) AS Edad
from Persona
where CURP in (SELECT CURP FROM Consejero);

-- niños que pertenecen a la clase 1
select Nombres
from Persona
where CURP in (select CURP from Niño 
where ClaveClaseNino = 1);