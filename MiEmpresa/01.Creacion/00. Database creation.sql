-- Replace 'New_Database' with your database name
IF NOT EXISTS 
    ( SELECT name FROM master.dbo.sysdatabases WHERE name = N'New_Database' ) 
    CREATE DATABASE [CONQUISTADORES]
ELSE
    BEGIN
        DROP DATABASE [CONQUISTADORES]
    END
go

USE CONQUISTADORES

CREATE TABLE Persona(
    CURP CHAR(18) PRIMARY KEY,
    ApellidoPaterno NVARCHAR(50),
    ApellidoMaterno NVARCHAR(50),
    Nombres NVARCHAR(50),
    sexo VARCHAR(10),
    FechaNacimiento DATE,
    Direccion VARCHAR(80),
    Tipo VARCHAR(20)
)

CREATE TABLE Niño(
    CURP CHAR(18) PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP),
    Enfermedad VARCHAR(50),
    ContactoEmergencia VARCHAR(25),
    ClaveClaseNino CHAR(15) FOREIGN KEY REFERENCES Clase(ClaveClase),
    CurpTutor CHAR(18) FOREIGN KEY REFERENCES Tutor(CURP),
    ClaveUnidadNino VARCHAR(15) FOREIGN KEY REFERENCES Unidad(ClaveUnidad)
)

CREATE TABLE Directivo(
    CURP CHAR(18) PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP),
    ROL VARCHAR(50),
    ClaveClubDirectivo VARCHAR(15) FOREIGN KEY REFERENCES Club(ClaveClub)
)

CREATE TABLE Consejero(
    CURP CHAR(18) PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP),
    Aspiracion VARCHAR(50),
    ClaveClubConsejero VARCHAR(15) FOREIGN KEY REFERENCES Club(ClaveClub)
)

CREATE TABLE Instructor(
    CURP CHAR(18) PRIMARY KEY FOREIGN key REFERENCES Persona(CURP),
    ClaveClubInstructor VARCHAR(15) FOREIGN KEY REFERENCES Club(ClaveClub)
)

CREATE TABLE Tutor(
    CURP CHAR(18) NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP),
    Telefono VARCHAR(10)
)

CREATE TABLE Historial(
    NumeroHistorial INT PRIMARY KEY, 
    FechaInicio DATE,
    FechaFin Date,
    CurpPersona CHAR(18) FOREIGN KEY REFERENCES Persona(CURP)
)

CREATE TABLE Clase (
    NumeroClase INT NOT NULL PRIMARY KEY,
    Color VARCHAR(15),
    Logo VARCHAR(50),
    EdadMinima INT
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
    Nombre VARCHAR(50),
    Lema VARCHAR(100),
    Logo VARCHAR(50),
    Direccion VARCHAR(80),
)

CREATE TABLE Especialidad(
    ClaveEspecialidad VARCHAR(15)NOT NULL PRIMARY KEY,
    Nombre NVARCHAR(50),
    Area VARCHAR(50),
    FechaAceptacion DATE,
    Nivel INT,
    CurpInstructor CHAR(18) FOREIGN KEY REFERENCES Instructor(CURP)
)

CREATE TABLE Reunion(
    ClaveReunion VARCHAR(15) NOT NULL PRIMARY KEY,
    Fecha DATE,
    Puntualidad boolean,
    Asistencia boolean,
    Uniforme boolean,
    Limpieza boolean,
    Tareas boolean,
    ClaveUnidadReunion CHAR(15) FOREIGN KEY REFERENCES Unidad(ClaveUnidad)
)

CREATE TABLE Requisito(
    ClaveRequisito char(15) PRIMARY KEY,
    ClaveEspecialidadRequisito VARCHAR(15) FOREIGN KEY REFERENCES Especialidad(ClaveEspecialidad)
)