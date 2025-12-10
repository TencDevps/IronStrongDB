USE IronStrongFitness;
GO

CREATE TABLE Entrenadores (
    IdEntrenador INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(150) NOT NULL,
    Especialidad NVARCHAR(100)
);
GO
