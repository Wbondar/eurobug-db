CREATE TABLE party_category
(
      id               ${PARTY_CATEGORY_ID_TYPE} NOT NULL
    , title_article_id ${ARTICLE_ID_TYPE}        NOT NULL
    , CONSTRAINT fk_party_category_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT uk_party_category_title_article_id
        UNIQUE KEY (title_article_id)
    , CONSTRAINT pk_party_category
        PRIMARY KEY (id)
)
;
