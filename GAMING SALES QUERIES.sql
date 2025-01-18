SELECT *
FROM gamingsales

SELECT 
		COUNT (*) as Totalrecords,
		COUNT (DISTINCT title) AS [Unique games],
		COUNT (DISTINCT console) AS [Unique consoles],
		COUNT (DISTINCT genre) AS [Unique genres]
FROM gamingsales

SELECT DISTINCT console FROM gamingsales

SELECT DISTINCT genre FROM gamingsales

--Top selling games globally

SELECT TOP 10 
		title, 
		console, 
	    genre, 
	    publisher, 
	    total_sales
FROM GamingSales
ORDER BY total_sales DESC;

--Sales distribution by region

SELECT 
    SUM (na_sales) AS [North America sales],
    SUM (jp_sales) AS [Japan sales],
    SUM (pal_sales) AS [Europe sales],
    SUM (other_sales) AS [Other region Sales],
    SUM (total_sales) AS [Global sales]
FROM GamingSales;

--Best selling games by region

SELECT TOP 10 
		title, 
		console, 
		genre, 
		na_sales, 
		jp_sales, 
		pal_sales, 
		other_sales
FROM GamingSales
ORDER BY na_sales DESC; -- swap regions for relevance

-- Top genres by global Sales

SELECT 
    genre, 
    SUM (total_sales) AS [Total sales],
    COUNT (*) AS [Total games]
FROM GamingSales
GROUP BY genre
ORDER BY [total sales] DESC;

--Console trends

SELECT 
    console, 
    SUM (total_sales) AS [Total sales],
    COUNT (*) AS GameCount
FROM GamingSales
GROUP BY console
ORDER BY [Total sales] DESC;

--Average sales by critic score range

SELECT 
    FLOOR (critic_score) AS [Critic score range],
    AVG (total_sales) AS [Avarage sales],
    COUNT (*) AS [Total games]
FROM GamingSales
WHERE critic_score IS NOT NULL
GROUP BY FLOOR(critic_score)
ORDER BY [Critic score range];

--Year sales trends

SELECT 
    YEAR (release_date) AS [Release year],
    SUM (total_sales) AS [Total sales],
    COUNT (*) AS [Total games]
FROM GamingSales
GROUP BY YEAR (release_date)
ORDER BY [Release year];

--monthly sales trends

SELECT 
    MONTH (release_date) AS [Release month],
    SUM (total_sales) AS [Total sales],
    COUNT (*) AS [Total games]
FROM GamingSales
GROUP BY MONTH (release_date)
ORDER BY [Release month];


