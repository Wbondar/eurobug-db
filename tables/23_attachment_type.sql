CREATE TABLE attachment_type
(
      id               ${ATTACHMENT_TYPE_ID_TYPE} NOT NULL AUTO_INCREMENT
    , title_article_id ${ARTICLE_ID_TYPE}    NOT NULL
    , CONSTRAINT fk_attachment_type_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_attachment_type
        PRIMARY KEY (id)
)
;
