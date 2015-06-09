CREATE TABLE email_domain
(
      id    ${EMAIL_DOMAIN_ID_TYPE}    NOT NULL
    , value ${EMAIL_DOMAIN_VALUE_TYPE} NOT NULL
    , CONSTRAINT uk_email_domain 
        UNIQUE KEY (value)
    , CONSTRAINT pk_email_domain
        PRIMARY KEY (id)
)
;
