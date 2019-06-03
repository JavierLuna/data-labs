-- Challenge 1 - Most Profiting Authors --
-- Step 1: Calculate the royalties of each sales for each author --

SELECT 
authors.au_id AS 'Author ID',
titleauthor.title_id AS 'Title ID',
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS 'Sales royalty'

FROM 
Publi.authors

JOIN 
Publi.titleauthor ON authors.au_id = titleauthor.au_id

JOIN 
Publi.titles ON titleauthor.title_id = titles.title_id

JOIN
Publi.sales ON titleauthor.title_id = sales.title_id;

-- Step 2: Aggregate the total royalties for each title for each author --

SELECT 
authors.au_id AS 'Author ID',
titleauthor.title_id AS 'Title ID',
SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'Aggregated royalties'

FROM 
Publi.authors

JOIN 
Publi.titleauthor ON authors.au_id = titleauthor.au_id

JOIN 
Publi.titles ON titleauthor.title_id = titles.title_id

JOIN
Publi.sales ON titleauthor.title_id = sales.title_id

GROUP BY
authors.au_id,
titles.title_id;

-- Step 3: Calculate the total profits of each author --

SELECT 
authors.au_id AS 'Author ID',
SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'Total profits'

FROM
Publi.authors

JOIN 
Publi.titleauthor ON authors.au_id = titleauthor.au_id

JOIN 
Publi.titles ON titleauthor.title_id = titles.title_id

JOIN
Publi.sales ON titleauthor.title_id = sales.title_id

GROUP BY
authors.au_id

ORDER BY
'Total profits' DESC

LIMIT 3;