CREATE VIEW view_page_sections AS
SELECT 
      page.id           AS page_id
    , section.id        AS section_id 
    , section.type_id   AS section_type_id
    , section_type.meta AS section_type_meta
    , section.meta      AS section_meta
FROM article AS page
    JOIN article_type AS page_type    ON page.type_id        = page_type.id 
    JOIN subarticle                   ON page.id             = subarticle.parent_id 
    JOIN article      AS section      ON subarticle.child_id = section.id
    JOIN article_type AS section_type ON section.type_id     = section_type.id
WHERE LOWER(page_type.meta) = 'page'
;
