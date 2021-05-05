--Consultas

--1

SELECT g.nombre FROM guerreros; 

--2

SELECT nombre_dios FROM dioses_guerreros;

--3

SELECT descripcion FROM dioses;

--4

SELECT codigo_org_militar FROM caballeria;

--5

SELECT id_lider, nombre FROM lider;



--Consultas 1 WHERE y 1 JOIN

--WHERE

SELECT nombre_dios, a.nombre 
FROM dioses_guerreros , armas a
WHERE id_guerrero = 1;


--JOIN

SELECT a.nombre_asentamiento,g.nombre 
FROM asentamiento a
INNER JOIN guerreros g;


--SUBCONSULTA
select nombre 
from armas 
where id_guerrero = (select id 
		     from guerreros
		     where nombre_asentamiento like 'Augusta Emerita');