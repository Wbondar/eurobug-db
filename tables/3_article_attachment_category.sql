CREATE TABLE article_attachment_category
(
      id               ${ARTICLE_ATTACHMENT_CATEGORY_ID_TYPE} NOT NULL
    , title_article_id ${ARTICLE_ID_TYPE}                     NOT NULL
    , CONSTRAINT fk_article_attachment_title_article_id
        FOREIGN KEY (title_article_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
	, CONSTRAINT uk_article_attachment_title_article_id
	    UNIQUE KEY (title_article_id)
    , CONSTRAINT pk_article_attachment_category 
        PRIMARY KEY (id)
)
;
