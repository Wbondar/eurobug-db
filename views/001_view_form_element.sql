CREATE VIEW view_form_element AS
SELECT 
	  article.id AS element_id
	, article_type.meta AS element_type_meta
	, view_article_category_meta.id AS form_id
	, view_article_category_meta.meta AS form_meta
	, language.id AS language_id
	, language.code AS language_code
	, article_localized.message AS message
FROM article JOIN article_localized ON article.id = article_localized.article_id
    JOIN article_type ON article.type_id = article_type.id
	JOIN language ON article_localized.language_id = language.id
	JOIN article_classification ON article.id = article_classification.article_id
	JOIN view_article_category_meta ON view_article_category_meta.id = article_classification.article_category_id  
;
