-- CHALLENGE 1
-- En orimer lugar teníamos que crear un database e importarnos la base de datos de publications, pero ya la tenía de antes.
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