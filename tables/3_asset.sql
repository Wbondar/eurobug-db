CREATE TABLE asset
(
      id               ${ASSET_ID_TYPE}          NOT NULL
    , title_article_id ${ARTICLE_ID_TYPE}        NOT NULL
    , category_id      ${ASSET_CATEGORY_ID_TYPE} NOT NULL
    , CONSTRAINT fk_asset_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT uk_asset_title_article_id
        UNIQUE KEY (title_article_id)
    , CONSTRAINT fk_asset_category_id
        FOREIGN KEY (category_id) REFERENCES asset_category (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_asset 
        PRIMARY KEY (id)
)
;
