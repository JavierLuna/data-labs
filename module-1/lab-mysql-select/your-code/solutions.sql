 -- challengue1
 
SELECT
 authors.au_id AS 'Author ID',
 authors.au_lname AS 'LAST NAME',
 authors.au_fname AS 'FIRST NAME',
 titles.title AS 'Titles',
 publishers.pub_name AS 'PUBLISHER'
 
 FROM
 authors
 INNER JOIN
 titleauthor
 ON 
 authors.au_id = titleauthor.au_id
 INNER JOIN
 titles
 ON
 titleauthor.title_id = titles.title_id
 INNER JOIN
 publishers
 ON 
 titles.pub_id = publishers.pub_id
 
 ORDER BY
authors.au_id 

 
  -- challengue2
 
 SELECT
 authors.au_id AS 'Author ID',
 authors.au_lname AS 'LAST NAME',
 authors.au_fname AS 'FIRST NAME',
 publishers.pub_name AS 'PUBLISHER',
 COUNT(titles.title) AS 'TITLES COUNT'
 
 FROM
 authors
 INNER JOIN
 titleauthor
 ON 
 authors.au_id = titleauthor.au_id
 INNER JOIN
 titles
 ON
 titleauthor.title_id = titles.title_id
 INNER JOIN
 publishers
 ON 
 titles.pub_id = publishers.pub_id

 GROUP BY
authors.au_id, publishers.pub_name

ORDER BY
count(titles.title) DESC, authors.au_id desc, publishers.pub_id desc

-- challengue 3
SELECT
 authors.au_id AS 'Author ID',
 authors.au_lname AS 'LAST NAME',
 authors.au_fname AS 'FIRST NAME',
 sum(sales.qty) AS 'Total'
 
 FROM
 authors
 INNER JOIN
 titleauthor
 ON 
 authors.au_id = titleauthor.au_id
 INNER JOIN
 titles
 ON
 titleauthor.title_id = titles.title_id
 INNER JOIN
 sales
 ON 
 sales.title_id = titles.title_id
 
 GROUP BY
 authors.au_id
 
 ORDER BY
sum(sales.qty) DESC

LIMIT 3

-- challengue 4
SELECT  
 authors.au_id AS 'Author ID',
 authors.au_lname AS 'LAST NAME',
 authors.au_fname AS 'FIRST NAME',
 sum(sales.qty) AS 'Total'
 
 FROM
 sales
 RIGHT JOIN
 titles
 ON 
 sales.title_id = titles.title_id
 RIGHT JOIN
 titleauthor
 ON
titles.title_id = titleauthor.title_id
RIGHT JOIN
authors
 ON 
 authors.au_id = titleauthor.au_id

GROUP BY
authors.au_id

order by
sum(sales.qty) desc

-- bonus challengue, me falta algo, lo sé, seguiré intentando el tema de calcular el PROFIT
SELECT  
 authors.au_id AS 'Author ID',
 authors.au_lname AS 'LAST NAME',
 authors.au_fname AS 'FIRST NAME',
 sum(titles.advance)+sum(titles.royalty) AS 'PROFIT'
 
 FROM
 authors
 INNER JOIN
 titleauthor
 ON 
 authors.au_id = titleauthor.au_id
 INNER JOIN
 titles
 ON
 titleauthor.title_id = titles.title_id
 
 
 GROUP BY
 authors.au_id
 
 ORDER BY
sum(titles.advance)+sum(titles.royalty) DESC

LIMIT 3

