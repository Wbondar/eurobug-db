CREATE TABLE party_category
(
      id               ${PARTY_CATEGORY_ID_TYPE} NOT NULL AUTO_INCREMENT
    , title_aritcle_id ${ARTICLE_ID_TYPE}        NOT NULL
    , CONSTRAINT fk_party_category_title_article_id
        FOREIGN KEY (title_aritcle_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_party_category
        PRIMARY KEY (id)
)
;
