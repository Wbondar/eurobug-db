CREATE VIEW view_party AS 
SELECT 
	  party.id AS id 
	, view_article.article_meta AS meta 
	, view_article.language_id 
	, view_article.language_code
	, view_article.article_message
FROM party 
	JOIN view_article ON party.title_article_id = view_article.article_id
;
