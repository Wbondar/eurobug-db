CREATE TABLE activity_dependency
(
      dependent_activity_id ${ACTIVITY_ID_TYPE} NOT NULL
    , relied_activity_id    ${ACTIVITY_ID_TYPE} NOT NULL
    , CONSTRAINT fk_activity_dependency_dependent_id
        FOREIGN KEY (dependent_activity_id) REFERENCES activity (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_activity_dependency_relied_id
        FOREIGN KEY (dependent_activity_id) REFERENCES activity (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT pk_activity_dependency
        PRIMARY KEY (dependent_activity_id, relied_activity_id)
)
;
