CREATE TABLE locale
(
      id               ${LOCALE_ID_TYPE}  NOT NULL AUTO_INCREMENT
    , title_article_id ${ARTICLE_ID_TYPE} NOT NULL
    , CONSTRAINT fk_locale_title_article_id 
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_locale
        PRIMARY KEY (id)
)
;
