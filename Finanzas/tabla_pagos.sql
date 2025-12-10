USE IronStrongFitness;
GO
---
CREATE TABLE Pagos (
    IdPago INT IDENTITY(1,1) PRIMARY KEY,
    IdContrato INT NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    FechaPago DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (IdContrato) REFERENCES Contratos(IdContrato)
);
GO
