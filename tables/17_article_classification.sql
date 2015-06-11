CREATE TABLE article_classification 
(
      article_category_id ${ARTICLE_CATEGORY_ID_TYPE} NOT NULL
    , article_id          ${ARTICLE_ID_TYPE}          NOT NULL
    , CONSTRAINT fk_article_classification_article_category_id
        FOREIGN KEY (article_category_id) REFERENCES article_category (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_article_classification_article_id
        FOREIGN KEY (article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_article_classification_article_category_id
        PRIMARY KEY (article_category_id, article_id)
)
;
