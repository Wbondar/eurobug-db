CREATE TABLE article_type
(
      id   ${ARTICLE_TYPE_ID_TYPE}   NOT NULL AUTO_INCREMENT
    , meta ${ARTICLE_TYPE_META_TYPE} NOT NULL
    , CONSTRAINT pk_article_type
        PRIMARY KEY (id)
)
;
