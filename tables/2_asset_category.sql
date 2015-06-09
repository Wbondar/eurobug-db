CREATE TABLE asset_category 
(
      id               ${ASSET_CATEGORY_ID_TYPE} NOT NULL
    , title_article_id ${ARTICLE_ID_TYPE}        NOT NULL
    , CONSTRAINT fk_asset_category_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT uk_asset_category_title_article_id
        UNIQUE KEY (title_article_id)
    , CONSTRAINT pk_asset_category
        PRIMARY KEY (id)
)
;
