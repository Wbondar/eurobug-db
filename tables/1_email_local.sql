CREATE TABLE email_local
(
	  domain_id ${EMAIL_DOMAIN_ID_TYPE}   NOT NULL
    , id        ${EMAIL_LOCAL_ID_TYPE}    NOT NULL
    , value     ${EMAIL_LOCAL_VALUE_TYPE} NOT NULL
    , CONSTRAINT fk_email_local_domain_id
        FOREIGN KEY (domain_id) REFERENCES email_domain (id)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT
    , CONSTRAINT uk_email_local 
        UNIQUE KEY (domain_id, value)
    , CONSTRAINT pk_email_local
        PRIMARY KEY (domain_id, id)
)
;
