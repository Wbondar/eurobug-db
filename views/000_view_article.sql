CREATE VIEW view_article AS
SELECT 
      article_type.id           AS article_type_id
    , article.id                AS article_id 
    , article_type.meta         AS article_type_meta
    , article.meta              AS article_meta 
    , COALESCE(language.id, (SELECT id FROM language WHERE LOWER(code) = 'eng')) AS language_id 
    , COALESCE(language.code, 'eng')                                             AS language_code
    , COALESCE(article_localized.message, (SELECT l.placeholder FROM language AS l WHERE l.id = language.id), 'This message is not yet available in given language. Please try another language or contact the developers.') AS article_message
FROM article 
    CROSS JOIN language 
    LEFT JOIN article_localized ON (CONCAT(article.id, language.id) = CONCAT(article_localized.article_id, article_localized.language_id))
    LEFT JOIN article_type      ON article.type_id = article_type.id
;
