USE Readersaward;

SELECT *
FROM Goodreadsaward;

/* Show authors that have won this the most*/
SELECT Author, COUNT(*) AS Total_Wins
FROM Goodreadsaward
GROUP BY Author
ORDER BY Total_Wins DESC;

/* Show authors that have won the most*/
SELECT Author, COUNT(*) AS Total_Wins
FROM Goodreadsaward
GROUP BY Author
ORDER BY Total_Wins DESC;

/*Show how many years and category the top author Won*/
SELECT Author, Book, Year
FROM Goodreadsaward
WHERE Author = (
    SELECT TOP 1 Author
    FROM Goodreadsaward
    GROUP BY Author
    ORDER BY COUNT(*) DESC
);

/*Show how many years the top and second author Won*/
SELECT Author, Book, Year
FROM Goodreadsaward
WHERE Author IN (
    SELECT TOP 2 Author
    FROM Goodreadsaward
    GROUP BY Author
    ORDER BY COUNT(*) DESC
);


/* Show authors that have only won once */
SELECT Author, COUNT(*) AS Total_Wins
FROM Goodreadsaward
GROUP BY Author
HAVING COUNT(*) = 1
ORDER BY Total_Wins ASC;



