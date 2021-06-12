/* Using your knowledge of PySpark, Pandas, or SQL, you’ll determine 
if there is any bias towards reviews that were written as part of the Vine program. 
For this analysis, you'll determine if having a paid Vine review makes a difference 
in the percentage of 5-star reviews.*/

/* Create the table in the database then import the file into this table */
CREATE TABLE vine_table ( 
	review_id TEXT PRIMARY KEY, 
	star_rating INTEGER, 
	helpful_votes INTEGER, 
	total_votes INTEGER, 
	vine TEXT, 
	verified_purchase TEXT );

/* 1. Filter the data and create a new DataFrame or table to retrieve all the rows where 
the total_votes count is equal to or greater than 20 to pick reviews that are more 
likely to be helpful and to avoid having division by zero errors later on */ 
SELECT * 
INTO table1 
FROM vine_table 
WHERE total_votes >= 20;
/* view results */
SELECT * FROM table1

/* 2. Filter the new DataFrame or table created in Step 1 and create a new DataFrame 
or table to retrieve all the rows where the number of helpful_votes divided by total_votes 
is equal to or greater than 50 */
SELECT * 
INTO table2
FROM table1
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;
/* view results */
SELECT * FROM table2

/* 3. Filter the DataFrame or table created in Step 2, and create a new DataFrame 
or table that retrieves all the rows where a review was written as part of the 
Vine program (paid), vine == 'Y' */
SELECT * 
INTO table3
FROM table2
WHERE vine = 'Y'
/* view results */
SELECT * FROM table3

/* 4. Repeat Step 3, but this time retrieve all the rows where the review 
was not part of the Vine program (unpaid), vine == 'N' */
SELECT * 
INTO table4
FROM table2
WHERE vine = 'N'
/* view results */
SELECT * FROM table4

/* 5. Determine the following: */
/* the total number of reviews */
/* How many Vine reviews and non-Vine reviews were there? */
SELECT COUNT (review_id) FROM table2 
SELECT COUNT (review_id) FROM table2 WHERE vine = 'Y'
SELECT COUNT (review_id) FROM table2 WHERE vine = 'N'
/* the number of 5-star reviews */
SELECT COUNT (review_id) FROM table2 WHERE star_rating = 5 
/* the percentage of 5-star reviews for the two types of review (paid) */
/* How many Vine reviews were 5 stars? How many non-Vine reviews were 5 stars? */
SELECT 
	CAST((SELECT COUNT(review_id) FROM table2 WHERE star_rating = 5 AND vine = 'Y') AS FLOAT)
	/
	CAST((SELECT COUNT(review_id) FROM table2 WHERE star_rating = 5) AS FLOAT)
AS paid_5_stars
/* (unpaid) */
SELECT 
	CAST((SELECT COUNT(review_id) FROM table2 WHERE star_rating = 5 AND vine = 'N') AS FLOAT)
	/
	CAST((SELECT COUNT(review_id) FROM table2 WHERE star_rating = 5) AS FLOAT)
AS unpaid_5_stars

/* Additonal Queries */
/* What percentage of Vine reviews were 5 stars? */
SELECT 
	CAST((SELECT COUNT(review_id) FROM table2 WHERE star_rating = 5 AND vine = 'Y') AS FLOAT)
	/
	CAST((SELECT COUNT (review_id) FROM table2 WHERE vine = 'Y') AS FLOAT)
AS five_star_vines
/* What percentage of non-Vine reviews were 5 stars? */
SELECT 
	CAST((SELECT COUNT(review_id) FROM table2 WHERE star_rating = 5 AND vine = 'N') AS FLOAT)
	/
	CAST((SELECT COUNT (review_id) FROM table2 WHERE vine = 'N') AS FLOAT)
AS five_star_non