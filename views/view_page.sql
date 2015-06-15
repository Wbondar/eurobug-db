CREATE VIEW view_page AS
SELECT *
FROM view_article_category
WHERE meta LIKE 'page_%'
;
