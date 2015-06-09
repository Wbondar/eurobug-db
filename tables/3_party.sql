CREATE TABLE party
(
      id               ${PARTY_ID_TYPE}   NOT NULL
    , title_article_id ${ARTICLE_ID_TYPE} NOT NULL
    , CONSTRAINT fk_party_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT uk_party_title_article_id
        UNIQUE KEY (title_article_id)
    , CONSTRAINT pk_party 
        PRIMARY KEY (id)
)
;
