-- CHALLENGE 1
-- En primer lugar teníamos que crear un database e importarnos la base de datos de publications, pero ya la tenía de antes.
-- Partiendo de publications nos piden:
-- "¿Qué títulos de cada autor ha publicado cada editorial?"
-- 1.- Pensamos en la estructura SELECT, FROM
-- 2.- Seleccionamos todas las columnas que nos piden y les asignamos nombres identificativos.
-- 3.- A continuación queremos buscar las relaciones existentes entre las columnas de distintas tablas:
--  a) desde authors buscamos el nexo en titleauthors (a través de la columna au_id)
--  b) desde titleauthors buscamos el nexo en titles (a través de la columna title_id)
--  c) desde titles buscamos el nexo en publishers (a través de la columna pub_id)
-- 4.- Y presentamos los datos desde el apellido del autor o autora.


SELECT authors.au_id AS "Author_ID", authors.au_lname AS "Last_Name", 
authors.au_fname AS "First_Name", titles.title AS "Title", 
publishers.pub_name AS "Publisher"
from authors
INNER Join titleauthor ON authors.au_id = titleauthor.au_id
INNER Join titles ON titleauthor.title_id = titles.title_id
INNER join publishers ON titles.pub_id = publishers.pub_id

ORDER BY authors.au_lname;

-- CHALENGE 2
-- "¿Cuántos títulos de cada autor o autora han sido publicados por cada editorial?
-- Para ello, podemos partir de la selección anterior porque la única diferencia existente es
-- que en lugar de dar el nombre de los títulos vamos a dar el número de título de cada autor por editorial.
-- Ahora vamos a seleccionar la columnsa de title_id para evitar posibles duplicados en los nombres de los títulos
-- Como nos piden el número de títulos de cada autor o autora por editorial, lo que nos interesa es ver cuántos 
-- títulos existen por la combinación de autor o autora, su nombre, su apellido y una editorial concreta. Así que lo
-- agrupamos con GROUP BY y lo ordenamos por COUNT(titles.title_id)
-- NOTA: es muy importante que si lo que vamos a dar es el número de títulos, hagamos un count()
-- NOTA 2: si no lo ordenamos también se ejecuta la consulta
SELECT authors.au_id AS "Author_ID", authors.au_lname AS "Last_Name", 
authors.au_fname AS "First_Name", publishers.pub_name AS "Publisher",
count(titles.title_id) AS "Title_Count"

from authors
INNER Join titleauthor ON authors.au_id = titleauthor.au_id
INNER Join titles ON titleauthor.title_id = titles.title_id
INNER join publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name

ORDER BY count(titles.title_id);