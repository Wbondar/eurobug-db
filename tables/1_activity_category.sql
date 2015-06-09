CREATE TABLE activity_category
(
      id               ${ACTIVITY_CATEGORY_ID_TYPE} NOT NULL
    , title_article_id ${ARTICLE_ID_TYPE}  NOT NULL
    , CONSTRAINT fk_activity_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT 
    , CONSTRAINT uk_activity_category_title_article_id
        UNIQUE KEY (title_article_id)
    , CONSTRAINT pk_activity 
        PRIMARY KEY (id)
)
;
