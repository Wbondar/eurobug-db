CREATE TABLE article_type
(
      id   ${ARTICLE_TYPE_ID_TYPE}   NOT NULL
    , meta ${ARTICLE_TYPE_META_TYPE} NOT NULL
    , UNIQUE KEY (meta)
    , CONSTRAINT pk_article_type
        PRIMARY KEY (id)
)
;
