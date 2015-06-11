CREATE TABLE article_attachment
(
      article_id ${ARTICLE_ID_TYPE} NOT NULL
    , attachment_id  ${ATTACHMENT_ID_TYPE} NOT NULL
    , CONSTRAINT fk_article_attacment_article_id
        FOREIGN KEY (article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_article_attacment_attachment_id
        FOREIGN KEY (attachment_id) REFERENCES attachment (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_article_attacment
        PRIMARY KEY (article_id, attachment_id)
)
;
