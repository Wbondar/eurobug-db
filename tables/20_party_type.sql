CREATE TABLE party_type
(
      id               ${PARTY_TYPE_ID_TYPE} NOT NULL AUTO_INCREMENT
    , title_article_id ${ARTICLE_ID_TYPE}    NOT NULL
    , CONSTRAINT fk_party_type_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_party_type
        PRIMARY KEY (id)
)
;
