CREATE VIEW view_form_element AS
SELECT 
	  form.id AS form_id
	, form.meta AS form_meta
	, form_element.id AS element_id
	, form_element_type.id AS element_type_id
	, form_element_type.meta AS element_type_meta
	, form_element.meta AS element_meta
	, language.id AS language_id
	, language.code AS language_code
	, form_element_localized.message AS message
FROM article AS form 
	JOIN article_type AS form_type ON form.type_id = form_type.id
	JOIN subarticle ON form.id = subarticle.parent_id
	JOIN article AS form_element ON subarticle.child_id = form_element.id
	JOIN article_type AS form_element_type ON form_element.type_id = form_element_type.id
	JOIN article_localized AS form_element_localized ON form_element.id = form_element_localized.article_id
	JOIN language ON form_element_localized.language_id = language.id
WHERE LOWER(form_type.meta) = 'form'
;
