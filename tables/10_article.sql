CREATE TABLE article
(
      id          ${ARTICLE_ID_TYPE}          NOT NULL
    , category_id ${ARTICLE_CATEGORY_ID_TYPE} NOT NULL
    , meta        ${ARTICLE_META_TYPE}        NOT NULL
    , parent_id   ${ARTICLE_ID_TYPE}              NULL
    , CONSTRAINT fk_article_category_id 
        FOREIGN KEY (category_id) REFERENCES article_category (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT uk_article_meta 
        UNIQUE KEY (meta)
    , CONSTRAINT fk_article_parent_id
        FOREIGN KEY (parent_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_article 
        PRIMARY KEY (id)
)
;
