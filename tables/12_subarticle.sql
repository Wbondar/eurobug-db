CREATE TABLE subarticle
(
      parent_id ${ARTICLE_ID_TYPE} NOT NULL
    , child_id  ${ARTICLE_ID_TYPE} NOT NULL
    , CONSTRAINT fk_subarticle_parent_id
        FOREIGN KEY (parent_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_subarticle_child_id
        FOREIGN KEY (child_id) REFERENCES article (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_subarticle
        PRIMARY KEY (parent_id, child_id)
)
;
