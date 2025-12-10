
/* =============================================================================
   OBJETIVO:
     - Calcular la EDAD PROMEDIO de los asistentes a una clase (@IdClase).
   CÁLCULO DE EDAD (exacto):
     - DATEDIFF(YEAR, FechaNac, GETDATE())
       - 1 si aún no ha cumplido años este año (ajuste por aniversario).
   RETORNO:
     - Promedio en DECIMAL(10,2); 0.00 si no hay asistentes.
============================================================================= */

CREATE OR ALTER FUNCTION dbo.fn_EdadPromedioClase (@IdClase INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Prom DECIMAL(10,2);

    ;WITH edades AS (
        SELECT 
            DATEDIFF(YEAR, m.FechaNacimiento, GETDATE())
            - CASE
                WHEN DATEADD(YEAR, DATEDIFF(YEAR, m.FechaNacimiento, GETDATE()), m.FechaNacimiento) > GETDATE()
                     THEN 1
                ELSE 0
              END AS Edad
        FROM dbo.Asistencias a
        INNER JOIN dbo.Miembros m ON m.IdMiembro = a.IdMiembro
        WHERE a.IdClase = @IdClase
    )
    SELECT @Prom = AVG(CAST(Edad AS DECIMAL(10,2)))
    FROM edades;

    RETURN ISNULL(@Prom, 0.00);
END;
