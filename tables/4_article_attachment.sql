CREATE TABLE article_attachment 
(
      article_id  ${ARTICLE_ID_TYPE}                     NOT NULL
    , id          ${ARTICLE_ATTACHMENT_ID_TYPE}          NOT NULL
    , category_id ${ARTICLE_ATTACHMENT_CATEGORY_ID_TYPE} NOT NULL
    , meta        ${ARTICLE_ATTACHMENT_META_TYPE}        NOT NULL
    , content     ${ARTICLE_ATTACHMENT_CONTENT_TYPE}     NOT NULL
    , language_id ${LANGUAGE_ID_TYPE}                        NULL
    , CONSTRAINT fk_article_attachment_article_id 
        FOREIGN KEY (article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_article_attachment_category_id 
        FOREIGN KEY (category_id) REFERENCES article_attachment_category(id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT uk_article_attachment_meta
        UNIQUE KEY (meta)
    , CONSTRAINT fk_article_attachment_language_id
        FOREIGN KEY (language_id) REFERENCES language (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT uk_article_attachment_article_id_id_language_id
        UNIQUE KEY (article_id, id, language_id)
    , CONSTRAINT pk_article_attachment
        PRIMARY KEY (article_id, id)
)
;
