CREATE TABLE activity
(
      id          ${ACTIVITY_ID_TYPE}          NOT NULL
    , category_id ${ACTIVITY_CATEGORY_ID_TYPE} NOT NULL
    , CONSTRAINT fk_activity_category_id
        FOREIGN KEY (category_id) REFERENCES activity_category (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT 
    , CONSTRAINT pk_activity 
        PRIMARY KEY (id)
)
;
