-- 1. Miembros con membresía VIP
SELECT nombre, correo
FROM Miembros
WHERE tipo_membresia = 'VIP';

-- 2. Calendario de clases con entrenador
SELECT C.nombre AS Clase,
       C.horario,
       E.nombre AS Entrenador
FROM Clases C
JOIN Entrenadores E ON C.id_entrenador = E.id
ORDER BY C.horario, E.nombre;

-- 3. Miembros que nunca han asistido a clases
SELECT M.nombre
FROM Miembros M
LEFT JOIN Asistencias A ON M.id = A.id_miembro
WHERE A.id_miembro IS NULL;

-- 4. Pagos del último mes
SELECT *
FROM Pagos
WHERE fecha >= DATEADD(MONTH, -1, GETDATE());
