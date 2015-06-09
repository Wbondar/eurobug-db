CREATE TABLE article_category 
(
      id               ${ARTICLE_CATEGORY_ID_TYPE} NOT NULL
    , title_article_id ${ARTICLE_ID_TYPE}          NOT NULL
    , CONSTRAINT uk_article_category_title_article_id
        UNIQUE KEY (title_article_id)
    , CONSTRAINT pk_article_category 
        PRIMARY KEY (id)
)
;
