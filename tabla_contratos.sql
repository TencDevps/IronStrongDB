USE IronStrongFitness;
GO

CREATE TABLE Contratos (
    IdContrato INT IDENTITY(1,1) PRIMARY KEY,
    IdMiembro INT NOT NULL,
    IdMembresia INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    FOREIGN KEY (IdMiembro) REFERENCES Miembros(IdMiembro),
    FOREIGN KEY (IdMembresia) REFERENCES Membresias(IdMembresia)
);
GO
