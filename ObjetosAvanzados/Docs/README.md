# 

# \# Punto 7 – Objetos avanzados de BD (IronStrongFitness)

# 

# \## Qué incluye

# \- \*\*Procedimientos:\*\* `sp\_InscribirClase`, `sp\_ReporteVentasEntrenador`

# \- \*\*Funciones:\*\* `fn\_EstadoMembresia`, `fn\_EdadPromedioClase`

# \- \*\*Vistas:\*\* `vw\_OcupacionGimnasio`, `vw\_Deudores`

# \- \*\*Triggers:\*\* `tr\_Pagos\_Auditoria\_Delete`, `tr\_Asistencias\_ValidaMembresia`

# \- \*\*CTE:\*\* `cte\_Top3ClasesPopulares`

# \- \*\*Tabla de soporte:\*\* `LogPagosEliminados`

# 

# \## Orden recomendado de ejecución (SSMS 21)

# 1\. `TablasSoporte\\tbl\_LogPagosEliminados.sql`

# 2\. `Procedimientos\\sp\_InscribirClase.sql`

# 3\. `Procedimientos\\sp\_ReporteVentasEntrenador.sql`

# 4\. `Funciones\\fn\_EstadoMembresia.sql`

# 5\. `Funciones\\fn\_EdadPromedioClase.sql`

# 6\. `Vistas\\vw\_OcupacionGimnasio.sql`

# 7\. `Vistas\\vw\_Deudores.sql`

# 8\. `Triggers\\tr\_Pagos\_Auditoria\_Delete.sql`

# 9\. `Triggers\\tr\_Asistencias\_ValidaMembresia.sql`

# 10\. `CTEs\\cte\_Top3ClasesPopulares.sql` (consulta)

# 

# \## Ejemplos de uso rápidos

# \- Inscribir: `EXEC dbo.sp\_InscribirClase @IdMiembro=1, @IdClase=10;`

# \- Ventas entrenador: `EXEC dbo.sp\_ReporteVentasEntrenador @IdEntrenador=3, @FechaInicio='2025-11-01', @FechaFin='2025-12-31';`

# \- Estado membresía: `SELECT dbo.fn\_EstadoMembresia('2025-12-31');`

# \- Edad promedio clase: `SELECT dbo.fn\_EdadPromedioClase(10);`

# \- Ocupación: `SELECT \* FROM dbo.vw\_OcupacionGimnasio;`

# \- Deudores: `SELECT \* FROM dbo.vw\_Deudores;`

# \- Top 3: ejecutar `CTEs\\cte\_Top3ClasesPopulares.sql`.

# 

# \## Notas para exposición

# \- `THROW` controla reglas de negocio (cupo y membresía vigente).

# \- `deleted/inserted` (triggers) son tablas virtuales propias de SQL Server.

# \- CTE mejora legibilidad en reportes.



