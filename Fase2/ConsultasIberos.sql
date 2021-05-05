--1- Muestra los nombres de los guerros.
SELECT nombre FROM guerreros;

--2- Muestra los nombres de los dioses.
SELECT nombre_dios FROM dioses_guerreros;

--3- Muestra la descripción de los diozes
SELECT descripcion FROM dioses;

--4- Muestra los codigos de las organizaciones militares de la caballería.
SELECT codigo_org_militar FROM caballeria

--5- Muestra el id asignado al lider y el nombre del lider.
SELECT id_lider, nombre FROM lider;


--WHERE y JOIN

--1- Muestra el nombre del dios y de las armas donde el id de guerrero sea igual a 1.
SELECT nombre_dios, a.nombre
FROM dioses_guerreros,armas a
WHERE id_guerrero = 1;

--2-Muestra el nombre del asentamiento y el nombre del guerrero .
SELECT a.nombre_asentamiento,g.nombre 
FROM asentamiento a
INNER JOIN guerreros g;

--SUBCONSULTA

--1- Nombre de arma de los guerreros que pertenecen a Augusta Emerita
select nombre 
from armas 
where id_guerrero = (select id 
		     from guerreros
		     where nombre_asentamiento like 'Augusta Emerita');