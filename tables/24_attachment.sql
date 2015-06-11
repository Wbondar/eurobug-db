CREATE TABLE attachment
(
      id               ${ATTACHMENT_ID_TYPE}      NOT NULL AUTO_INCREMENT
    , title_article_id ${ARTICLE_ID_TYPE}         NOT NULL
    , type_id          ${ATTACHMENT_TYPE_ID_TYPE} NOT NULL
    , content          ${ATTACHMENT_CONTENT_TYPE} NOT NULL
    , CONSTRAINT fk_attachment_type_id_attachment_type_id
        FOREIGN KEY (type_id) REFERENCES attachment_type (id) 
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_attachment_category_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_attachment
        PRIMARY KEY (id)
)
;
