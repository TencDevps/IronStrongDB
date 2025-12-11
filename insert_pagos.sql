USE IronStrongFitness;
GO
----
INSERT INTO Pagos (IdContrato, Monto, FechaPago)
SELECT IdContrato, 30, GETDATE()
FROM Contratos;
GO
