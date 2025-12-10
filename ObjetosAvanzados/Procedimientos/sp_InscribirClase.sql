
/* =============================================================================
     - Inscribir a un miembro (@IdMiembro) en una clase (@IdClase) SI hay cupo.
   REGLAS:
     1) Validar existencia de Miembro y Clase.
     2) Cupo disponible: COUNT(asistencias) < Clases.CupoMaximo.
     3) Evitar doble inscripción en el mismo día (opcional).
   ERRORES:
     - Se usa THROW para interrumpir con mensaje controlado, recomendado en T‑SQL.
============================================================================= */

CREATE OR ALTER PROCEDURE dbo.sp_InscribirClase
    @IdMiembro INT,
    @IdClase   INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1) Validaciones de existencia
    IF NOT EXISTS (SELECT 1 FROM dbo.Miembros   WHERE IdMiembro = @IdMiembro)
        THROW 50001, 'El miembro no existe.', 1;

    IF NOT EXISTS (SELECT 1 FROM dbo.Clases     WHERE IdClase   = @IdClase)
        THROW 50002, 'La clase no existe.', 1;

    -- 2) Cupo disponible: CupoMaximo vs inscritos actuales
    DECLARE @CupoMaximo INT, @Inscritos INT;

    SELECT @CupoMaximo = c.CupoMaximo
    FROM dbo.Clases c
    WHERE c.IdClase = @IdClase;

    SELECT @Inscritos = COUNT(*)
    FROM dbo.Asistencias a
    WHERE a.IdClase = @IdClase;

    IF @Inscritos >= @CupoMaximo
        THROW 50003, 'No hay cupo disponible para esta clase.', 1;

    -- 3) Evitar doble registro mismo día (opcional, buena práctica)
    IF EXISTS (
        SELECT 1
        FROM dbo.Asistencias
        WHERE IdClase   = @IdClase
          AND IdMiembro = @IdMiembro
          AND CAST(FechaRegistro AS DATE) = CAST(GETDATE() AS DATE)
    )
        THROW 50004, 'El miembro ya está inscrito hoy en esta clase.', 1;

    -- 4) Inserción
    INSERT INTO dbo.Asistencias (IdClase, IdMiembro, FechaRegistro)
    VALUES (@IdClase, @IdMiembro, GETDATE());
END;
GO
