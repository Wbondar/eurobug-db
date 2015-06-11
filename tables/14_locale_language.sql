CREATE TABLE locale_language
(
      locale_id   ${LOCALE_ID_TYPE}   NOT NULL
    , language_id ${LANGUAGE_ID_TYPE} NOT NULL
    , CONSTRAINT fk_locale_language_locale_id
        FOREIGN KEY (locale_id) REFERENCES locale (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_locale_language_language_id
        FOREIGN KEY (language_id) REFERENCES language (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT fk_locale_language_locale_id
        PRIMARY KEY (locale_id, language_id)
)
;
