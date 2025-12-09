USE IronStrongFitness;
GO



DECLARE @i INT = 1;
WHILE @i <= 30
BEGIN
    INSERT INTO Asistencias (IdClase, IdMiembro)
    VALUES ((@i % 15) + 1, (@i % 20) + 1);
    SET @i = @i + 1;
END
GO
