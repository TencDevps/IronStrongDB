
/* =============================================================================
     - Crear la tabla de auditoría "LogPagosEliminados" para registrar los datos
       de un pago cuando sea borrado (será usada por el trigger de auditoría).
     - Evidencia de cambios y cumplimiento de integridad/auditoría.
============================================================================= */

IF OBJECT_ID('dbo.LogPagosEliminados', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.LogPagosEliminados (
        LogId          INT IDENTITY(1,1) PRIMARY KEY,      -- PK autoincremental
        IdPago         INT       NOT NULL,                  -- Id del pago borrado
        IdContrato     INT       NOT NULL,                  -- Contrato del pago
        Monto          DECIMAL(18,2) NOT NULL,             -- Monto del pago borrado
        FechaPago      DATETIME  NOT NULL,                 -- Fecha original del pago
        Usuario        NVARCHAR(128) NOT NULL,             -- Usuario que ejecutó el DELETE
        FechaEliminado DATETIME  NOT NULL DEFAULT(GETDATE()) -- Fecha/hora del registro
    );
END;
GO
