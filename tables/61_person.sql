CREATE TABLE person
(
      id                    ${PERSON_ID_TYPE}      NOT NULL AUTO_INCREMENT
    , name_first_article_id ${PERSON_NAME_FIRST_TYPE}     NOT NULL
    , name_last_article_id  ${PERSON_NAME_LAST_TYPE}     NOT NULL
    , sex                   ${PERSON_SEX_TYPE}     NOT NULL
    , nationality_id        ${NATIONALITY_ID_TYPE} NOT NULL
    , CONSTRAINT pk_person PRIMARY KEY (id)
)
;
