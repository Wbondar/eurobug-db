CREATE USER ${USER_MEMBER_NAME} IDENTIFIED BY '${USER_MEMBER_PASSWORD}'
;
GRANT SELECT ON ${DATABASE_SCHEMA}.* TO ${USER_MEMBER_NAME}
;