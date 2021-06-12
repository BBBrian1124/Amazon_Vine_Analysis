# Amazon_Vine_Analysis
UofT Data Analytics Bootcamp - Module 16 

# Overview of the analysis: Explain the purpose of this analysis.
* Provided with approximately 50 datasets, each containing reviews of a specific product, pick a dataset and use PySpark to perform the ETL process to extract the dataset, transform the data, connect to an AWS RDS instance, and load the transformed data into pgAdmin. These datasets contain Amazon reviews written by members of the paid Amazon Vine program. The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies like SellBy pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review. Using SQL we will determine if there is any bias toward favorable reviews from Vine members in your dataset. 

# Results: Using bulleted lists and images of DataFrames as support, address the following questions:

## How many Vine reviews and non-Vine reviews were there?
* Total reviews = 40565
  * SQL code: SELECT COUNT (review_id) FROM table2
* Vine reviews = 94
  * SELECT COUNT (review_id) FROM table2 WHERE vine = 'Y'
* non-Vine reviews = 40471
  * SELECT COUNT (review_id) FROM table2 WHERE vine = 'N'    
  
## How many Vine reviews were 5 stars? How many non-Vine reviews were 5 stars?
* Total 5 star reviews  15711
  * SQL code: SELECT COUNT(review_id) FROM table2 WHERE star_rating = 5
* Vine 5 star reviews = 48
  * SQL code: SELECT COUNT(review_id) FROM table2 WHERE star_rating = 5 AND vine = 'Y'  
* non-Vine 5 star reviews = 15663 
  * SQL code: SELECT COUNT(review_id) FROM table2 WHERE star_rating = 5 AND vine = 'N'
 
## What percentage of Vine reviews were 5 stars? What percentage of non-Vine reviews were 5 stars?
* 51.06% of vine reviews were 5 stars 
  * SQL code: SELECT CAST((SELECT COUNT(review_id) FROM table2 WHERE star_rating = 5 AND vine = 'Y') AS FLOAT) / CAST((SELECT COUNT (review_id) FROM table2 WHERE vine =      'Y') AS FLOAT) AS five_star_vines 
* 38.70% of non-Vine reviews were 5 stars 
  * SQL code: SELECT CAST((SELECT COUNT(review_id) FROM table2 WHERE star_rating = 5 AND vine = 'N') AS FLOAT) / CAST((SELECT COUNT (review_id) FROM table2 WHERE vine =      'N') AS FLOAT AS five_star_non 

# Summary: In your summary, state if there is any positivity bias for reviews in the Vine program. Use the results of your analysis to support your statement. Then, provide one additional analysis that you could do with the dataset to support your statement.
* Based on this analysis, it seems there is not enough evidence to suggest that there is a positivity bias for reviews in the Vine program. There are only 94 reviews which is a small number of reviews in comparison to non-vine reviews. A look at the fact that 51% of Vine reviews were 5 stars compared to 39% of non-vine reviews being 5 stars may be some suggestion that Vine reviews are more likely to be rated higher, however, a larger dataset of Vine reviews will help to see if this is currently skewed (i.e. 1 vote/5 star review would increase the 51% of 5 star reviews more than it would the 39% of non-vine), similar to the central limit theorm, we'd want to see if this break down is consistent as we obtain more reviews. We would also like to see the % breakdown of each rating score (i.e. 1 to 5) to see if they are similar accross vine and non-vine, this can also help us identify skewness (i.e. if there are no 1 or 2 star ratings for vine products).

# Appendix
[Deliverable 1] https://github.com/BBBrian1124/Amazon_Vine_Analysis/blob/main/Challenge/D1_Amazon_Reviews_ETL.ipynb
* ETL process of the database 

[Deliverable 2] https://github.com/BBBrian1124/Amazon_Vine_Analysis/blob/main/Challenge/D2_Vine_Review_Analysis.sql
* SQL queries to obtain results 

[Resources] https://github.com/BBBrian1124/Amazon_Vine_Analysis/tree/main/Challenge/Resources

[Repository Link] https://github.com/BBBrian1124/Amazon_Vine_Analysis
