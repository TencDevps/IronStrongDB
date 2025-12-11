-- 1. UNION: correos unificados
SELECT correo FROM Miembros
UNION
SELECT correo FROM Entrenadores;

-- 2. INTERSECT: miembros con contrato activo y asistencia esta semana
SELECT M.id
FROM Miembros M
INTERSECT
SELECT A.id_miembro
FROM Asistencias A
WHERE A.fecha >= DATEADD(WEEK, -1, GETDATE());

-- 3. EXCEPT: entrenadores sin clases asignadas
SELECT id, nombre
FROM Entrenadores
EXCEPT
SELECT E.id, E.nombre
FROM Entrenadores E
JOIN Clases C ON E.id = C.id_entrenador;
