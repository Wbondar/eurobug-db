CREATE TABLE article_content
(
      article_id          ${ARTICLE_ID_TYPE}              NOT NULL
    , language_id         ${LANGUAGE_ID_TYPE}             NOT NULL
    , content             ${ARTICLE_CONTENT_CONTENT_TYPE} NOT NULL
    , CONSTRAINT fk_article_content_article_id
        FOREIGN KEY (article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_article_content_language_id
        FOREIGN KEY (language_id) REFERENCES language (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_article_content
        PRIMARY KEY (article_id, language_id)
)
;
