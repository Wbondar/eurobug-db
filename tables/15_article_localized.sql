CREATE TABLE article_localized
(
      article_id   ${ARTICLE_ID_TYPE}                NOT NULL
    , language_id  ${LANGUAGE_ID_TYPE}               NOT NULL
    , message      ${ARTICLE_LOCALIZED_MESSAGE_TYPE} NOT NULL
    , CONSTRAINT fk_article_localized_article_id
        FOREIGN KEY (article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_article_localized_language_id
        FOREIGN KEY (language_id) REFERENCES language (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_article_localized
        PRIMARY KEY (article_id, language_id)
)
;
