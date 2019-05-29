--CHALLENGE-1
--Partimos de la solución del bonus de lab-mysql-select


SELECT authors.au_id AS "Author_ID", titles.title_id AS "Title_ID", 
sum(sales.qty * titles.price  * titles.royalty / 100 * titleauthor.royaltyper / 100) AS "Sales_Royalty"

from authors
INNER Join titleauthor ON authors.au_id = titleauthor.au_id
INNER Join titles ON titleauthor.title_id = titles.title_id
INNER Join sales ON titles.title_id = sales.title_id
 GROUP BY authors.au_id, titles.title_id
ORDER by Sales_Royalty desc;