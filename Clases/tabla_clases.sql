USE IronStrongFitness;
GO

CREATE TABLE Clases (
    IdClase INT IDENTITY(1,1) PRIMARY KEY,
    NombreClase NVARCHAR(150) NOT NULL,
    IdEntrenador INT NOT NULL,
    Horario TIME NOT NULL,
    CupoMaximo INT NOT NULL,
    FOREIGN KEY (IdEntrenador) REFERENCES Entrenadores(IdEntrenador)
);
GO
