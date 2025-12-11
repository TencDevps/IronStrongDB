
/* =============================================================================
     - Calcular el monto generado por pagos de contratos de miembros que
       asistieron a clases impartidas por un entrenador específico.

   DISEÑO:
     - CTE: "MiembrosDelEntrenador" reúne los IdMiembro que asistieron a clases
       dictadas por @IdEntrenador (filtradas por FechaRegistro si se indica rango).
     - Join con Pagos ↔ Contratos para sumar p.Monto (filtrado por FechaPago).
============================================================================= */

CREATE OR ALTER PROCEDURE dbo.sp_ReporteVentasEntrenador
    @IdEntrenador INT,
    @FechaInicio  DATE = NULL,
    @FechaFin     DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM dbo.Entrenadores WHERE IdEntrenador = @IdEntrenador)
        THROW 50005, 'El entrenador no existe.', 1;

    ;WITH MiembrosDelEntrenador AS (
        SELECT DISTINCT a.IdMiembro
        FROM dbo.Asistencias a
        INNER JOIN dbo.Clases c ON c.IdClase = a.IdClase
        WHERE c.IdEntrenador = @IdEntrenador
          AND (@FechaInicio IS NULL OR CAST(a.FechaRegistro AS DATE) >= @FechaInicio)
          AND (@FechaFin    IS NULL OR CAST(a.FechaRegistro AS DATE) <= @FechaFin)
    )
    SELECT 
        @IdEntrenador AS IdEntrenador,
        ISNULL(SUM(p.Monto), 0.00) AS TotalGenerado
    FROM dbo.Pagos p
    INNER JOIN dbo.Contratos ct ON ct.IdContrato = p.IdContrato
    INNER JOIN MiembrosDelEntrenador mde ON mde.IdMiembro = ct.IdMiembro
    WHERE (@FechaInicio IS NULL OR CAST(p.FechaPago AS DATE) >= @FechaInicio)
      AND (@FechaFin    IS NULL OR CAST(p.FechaPago AS DATE) <= @FechaFin);
END;
GO
