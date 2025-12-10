USE IronStrongFitness;
GO

CREATE TABLE Miembros (
    IdMiembro INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(150) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Email NVARCHAR(200) UNIQUE,
    Estado CHAR(1) NOT NULL DEFAULT('A')
);
GO
