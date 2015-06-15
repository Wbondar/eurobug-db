CREATE VIEW view_article_category AS
SELECT 
	  article_category.id AS id 
	, view_article.article_meta AS meta
	, view_article.language_id
	, view_article.language_code
	, view_article.article_message AS title
FROM article_category
	JOIN view_article ON article_category.title_article_id = view_article.article_id
;
