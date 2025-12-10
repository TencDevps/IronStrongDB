USE IronStrongFitness;
GO

CREATE TABLE Membresias (
    IdMembresia INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Costo DECIMAL(10,2) NOT NULL,
    DuracionDias INT NOT NULL
);
GO
