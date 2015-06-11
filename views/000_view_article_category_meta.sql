CREATE VIEW view_article_category_meta AS 
SELECT 
	  article_category.id 
	, article.meta
FROM article_category JOIN article ON article_category.title_article_id = article.id
;
