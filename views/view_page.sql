CREATE VIEW view_page AS 
SELECT 
	  article.id                    AS page_id
	, article.meta                  AS page_meta
	, article_localized.language_id AS language_id
	, language.code                 AS language_code
	, article_localized.message     AS page_message
FROM article 
	JOIN article_type      ON article.type_id               = article_type.id 
	JOIN article_localized ON article.id                    = article_localized.article_id 
	JOIN language          ON article_localized.language_id = language.id 
WHERE LOWER(article_type.meta) = LOWER('page')
;
