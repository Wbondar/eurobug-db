CREATE TABLE article_category
(
      id               ${ARTICLE_CATEGORY_ID_TYPE} NOT NULL
    , title_article_id ${ARTICLE_ID_TYPE}          NOT NULL
    , CONSTRAINT fk_article_category_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_article_category
        PRIMARY KEY (id)
)
;
