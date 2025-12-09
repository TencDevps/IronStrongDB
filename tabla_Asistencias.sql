USE IronStrongFitness;
GO

CREATE TABLE Asistencias (
    IdAsistencia INT IDENTITY(1,1) PRIMARY KEY,
    IdClase INT NOT NULL,
    IdMiembro INT NOT NULL,
    FechaRegistro DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (IdClase) REFERENCES Clases(IdClase),
    FOREIGN KEY (IdMiembro) REFERENCES Miembros(IdMiembro)
);
GO
