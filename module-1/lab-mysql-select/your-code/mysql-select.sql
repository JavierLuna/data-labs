 -- CHALLENGE 1 --

SELECT 
authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME', 
titles.title AS 'TITLE', 
publishers.pub_name AS 'PUBLISHER'

FROM 
Publi.authors

JOIN 
Publi.titleauthor ON authors.au_id = titleauthor.au_id

JOIN
Publi.titles ON titleauthor.title_id = titles.title_id

JOIN 
Publi.publishers ON publishers.pub_id = titles.pub_id

ORDER BY 
authors.au_id ASC;

-- CHALLENGE 2 --

SELECT 
authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME', 
publishers.pub_name AS 'PUBLISHER',
COUNT(titles.title) AS 'TITLE COUNT'

FROM 
Publi.authors

JOIN
Publi.titleauthor ON authors.au_id = titleauthor.au_id

JOIN
Publi.titles ON titleauthor.title_id = titles.title_id

JOIN
Publi.publishers ON publishers.pub_id = titles.pub_id

GROUP BY 
authors.au_id, publishers.pub_name

ORDER BY
authors.au_id DESC , publishers.pub_name DESC;

-- CHALLENGE 3 --

SELECT 
authors.au_id AS 'AUTHOR ID',
authors.au_lname AS 'LAST NAME',
authors.au_fname AS 'FIRST NAME',
sum(sales.qty) AS 'TOTAL'

FROM 
Publi.authors

JOIN 
Publi.titleauthor ON authors.au_id = titleauthor.au_id

JOIN 
Publi.titles ON titleauthor.title_id = titles.title_id

JOIN 
Publi.sales ON titles.title_id = sales.title_id
