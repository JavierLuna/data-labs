----------------------------------------------------------------------
--STEP 1
----------------------------------------------------------------------
SELECT
	ta.title_id,
    	ta.au_id,
    	t.price*s.qty*(t.royalty/100)*(ta.royaltyper/100)
    
FROM 
	sales s
    JOIN
	titles t
    	on
	s.title_id=t.title_id
    JOIN
	titleauthor ta
    	on
	ta.title_id=t.title_id
    join 
	authors a 
    on ta.au_id=a.au_id

