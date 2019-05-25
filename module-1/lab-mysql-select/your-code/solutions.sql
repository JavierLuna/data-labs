-- Challenge nº1
-- Create the inner join section from Tables(authors, titles and publishers) and then FILTER the columns required on the challenge and orderer properly.

SELECT authors.au_id AS "Authors ID", authors.au_lname AS "Last Name", authors.au_lname AS "First Name", titles.title AS "Title", publishers.pub_name AS "Publisher"
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id

ORDER BY authors.au_id ASC;

-- Challenge nº2
-- Now we need to count how many titles each author has publish with each Publisher.

SELECT authors.au_id AS "Authors ID", authors.au_lname AS "Last Name", authors.au_fname AS "First Name", publishers.pub_name AS "Publisher", 
COUNT(titles.title_id) AS "Title Count" 
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id

-- We now group by the columms but the COUNT, and we ordered by the COUNT in Desc order.
GROUP BY authors.au_id, authors.au_lname, authors.au_fname,publishers.pub_name
ORDER BY COUNT(titles.title_id) DESC;

-- Challenge nº3
-- Now the query should give as the authors with the highest number of titles.

SELECT authors.au_id AS "Authors ID", authors.au_lname AS "Last Name", authors.au_fname AS "First Name", publishers.pub_name AS "Publisher", 
COUNT(titles.title_id), COUNT(titles.pub_id) 
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id

-- 
GROUP BY authors.au_id, authors.au_lname, authors.au_fname,publishers.pub_name
ORDER BY COUNT(titles.title_id) DESC;

