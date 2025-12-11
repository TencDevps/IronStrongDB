BEGIN TRANSACTION;

-- 1. Insertar pago
INSERT INTO Pagos (id_miembro, monto, fecha)
VALUES (1, 25000, GETDATE());

-- 2. Actualizar contrato
UPDATE Contratos
SET FechaFin = DATEADD(MONTH, 1, FechaFin)
WHERE id_miembro = 1;

-- 3. Validación (ejemplo)
DECLARE @costo INT = 25000;
DECLARE @monto INT = (SELECT monto FROM Pagos WHERE id_miembro = 1 ORDER BY fecha DESC OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY);

IF @monto < @costo
BEGIN
    ROLLBACK;
END
ELSE
BEGIN
    COMMIT;
END;
