
/* =============================================================================
   OBJETIVO:
     - Auditoría: cuando se BORRA un registro de dbo.Pagos, insertar los datos
       en dbo.LogPagosEliminados (IdPago, IdContrato, Monto, FechaPago, Usuario).
   EVENTO:
     - AFTER DELETE en dbo.Pagos.
   TÉCNICA:
     - Tabla virtual "deleted" trae las filas borradas durante el trigger.
     - SUSER_SNAME() captura el usuario que ejecutó el DELETE.
============================================================================= */

CREATE OR ALTER TRIGGER dbo.tr_Pagos_Auditoria_Delete
ON dbo.Pagos
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.LogPagosEliminados (IdPago, IdContrato, Monto, FechaPago, Usuario)
    SELECT d.IdPago, d.IdContrato, d.Monto, d.FechaPago, SUSER_SNAME()
    FROM deleted d;
END;
GO
