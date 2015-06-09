CREATE TABLE project
(
	  id               ${PROJECT_ID_TYPE}          NOT NULL
	, title_article_id ${ARTICLE_ID_TYPE}          NOT NULL
	, category_id      ${PROJECT_CATEGORY_ID_TYPE} NOT NULL
	, CONSTRAINT uk_project_title_article_id
	    UNIQUE KEY (title_article_id)
	, CONSTRAINT fk_project_title_article_id
	    FOREIGN KEY (title_article_id) REFERENCES article (id)
	        ON DELETE RESTRICT
	        ON UPDATE RESTRICT 
	, CONSTRAINT pk_project
	    PRIMARY KEY (id)
)
;
