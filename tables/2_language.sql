CREATE TABLE language
(
	  id   ${LANGUAGE_ID_TYPE}   NOT NULL
	, code ${LANGUAGE_CODE_TYPE} NOT NULL
    , CONSTRAINT uk_language_code
        UNIQUE KEY (code)
	, CONSTRAINT pk_language 
	    PRIMARY KEY (id)
)
;
