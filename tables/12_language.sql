CREATE TABLE language
(
      id   ${LANGUAGE_ID_TYPE}            NOT NULL AUTO_INCREMENT
    , code ${LANGUAGE_CODE_TYPE}          NOT NULL
    , title_article_id ${ARTICLE_ID_TYPE} NOT NULL
    , placeholder ${ARTICLE_LOCALIZED_MESSAGE_TYPE} NOT NULL
    , CONSTRAINT fk_language_title_article_id 
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_language
        PRIMARY KEY (id)
)
;
