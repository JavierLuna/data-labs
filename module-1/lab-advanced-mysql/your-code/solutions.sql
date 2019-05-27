-- Challenge nº1
-- STEP nº1: Calculate the royalties of each sales for each author. But the output should be: Title ID, Author ID, RoyaltievsAuthor.

CREATE TABLE IF NOT EXISTS (SELECT title_id AS "Title ID", au_id AS "Author ID"
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN sales ON titles.title_id = sales.title_id);

