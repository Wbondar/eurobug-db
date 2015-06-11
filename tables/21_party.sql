CREATE TABLE party
(
      id               ${PARTY_ID_TYPE}      NOT NULL AUTO_INCREMENT
    , title_article_id ${ARTICLE_ID_TYPE}    NOT NULL
    , type_id          ${PARTY_TYPE_ID_TYPE} NOT NULL
    , CONSTRAINT fk_party_type_id_party_type_id
        FOREIGN KEY (type_id) REFERENCES party_type (id) 
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_party_title_article_id 
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_party
        PRIMARY KEY (id)
)
;
