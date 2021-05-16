-- 1. Muestra los nombres de los guerros.
SELECT nombre FROM guerreros;

-- 2. Muestra los nombres de los dioses.
SELECT nombre_dios FROM dioses_guerreros;

-- 3. Muestra la descripción de los diozes
SELECT descripcion FROM dioses;

-- 4. Muestra los codigos de las organizaciones militares de la caballería.
SELECT codigo_org_militar FROM caballeria

-- 5. Muestra el id asignado al lider y el nombre del lider.
SELECT id_lider, nombre FROM lider;


-- WHERE y JOIN

-- 1. Muestra el nombre del arma, y nombre y primer apellido de todos los guerreros.
SELECT a.nombre, concat_ws(" ", g.nombre, g.apellido1) "Nombre guerrero"
FROM guerreros g, armas a
WHERE g.id = a.id_guerrero;

-- 2. Muestra la localización y el nombre de todos los guerreros que pertenece a ella.
SELECT a.localizacion, concat_ws(" ", g.nombre, g.apellido1) "Nombre guerrero"
FROM asentamiento a INNER JOIN guerreros g 
ON a.nombre = g.nombre_asentamiento;

-- SUBCONSULTA

-- 1. Nombre de arma de los guerreros que pertenecen a Augusta Emerita
select nombre 
from armas 
where id_guerrero = (select id 
		     from guerreros
		     where nombre_asentamiento like 'Augusta Emerita');