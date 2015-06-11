DELIMITER ENDROUTINE

CREATE PROCEDURE article_resume_create
(
      IN  arg_education      ${ARTICLE_LOCALIZED_MESSAGE_TYPE}
    , IN  arg_profession     ${ARTICLE_LOCALIZED_MESSAGE_TYPE}
    , IN  arg_specialization ${ARTICLE_LOCALIZED_MESSAGE_TYPE}
    , IN  arg_qualification  ${ARTICLE_LOCALIZED_MESSAGE_TYPE}
    , IN  arg_experience     ${ARTICLE_LOCALIZED_MESSAGE_TYPE}
    , IN  arg_language_id    ${LANGUAGE_ID_TYPE}
    , OUT arg_article_id     ${ARTICLE_ID_TYPE}
)
LANGUAGE SQL
NOT DETERMINISTIC
MODIFIES SQL DATA
SQL SECURITY DEFINER
BEGIN
    START TRANSACTION
    ;

    CALL article_type_read ('resume', @var_article_type_resume_id)
    ;
    CALL article_type_read ('resume_field_education', @var_article_type_resume_field_education_id)
    ;
    CALL article_type_read ('resume_field_profession', @var_article_type_resume_field_profession_id)
    ;
    CALL article_type_read ('resume_field_specialization', @var_article_type_resume_field_specialization_id)
    ;
    CALL article_type_read ('resume_field_qualification', @var_article_type_resume_field_qualification_id)
    ;
    CALL article_type_read ('resume_field_experience', @var_article_type_resume_field_experience_id)
    ;

    CALL nextval ('seq_resume_id', @var_resume_id)
    ;
    CALL article_create (@var_article_type_resume_id, CONCAT('resume', @var_resume_id), @var_article_resume_id)
    ;
    CALL setval ('seq_resume_id', @var_resume_id)
    ;

    CALL nextval ('seq_resume_field_education_id', @var_resume_field_education_id)
    ;
    CALL article_create (@var_article_type_resume_field_education_id, CONCAT('resume_field_education', @var_resume_field_education_id), @var_article_resume_field_education_id)
    ;
    CALL setval ('seq_resume_field_education_id', @var_resume_field_education_id)
    ;

    CALL nextval ('seq_resume_field_profession_id', @var_resume_field_profession_id)
    ;
    CALL article_create (@var_article_type_resume_field_profession_id, CONCAT('resume_field_profession', @var_resume_field_profession_id), @var_article_resume_field_profession_id)
    ;
    CALL setval ('seq_resume_field_profession_id', @var_resume_field_profession_id)
    ;

    CALL nextval ('seq_resume_field_specialization_id', @var_resume_field_specialization_id)
    ;
    CALL article_create (@var_article_type_resume_field_specialization_id, CONCAT('resume_field_specialization', @var_resume_field_specialization_id), @var_article_resume_field_specialization_id)
    ;
    CALL setval ('seq_resume_field_specialization_id', @var_resume_field_specialization_id)
    ;

    CALL nextval ('seq_resume_field_qualification_id', @var_resume_field_qualification_id)
    ;
    CALL article_create (@var_article_type_resume_field_qualification_id, CONCAT('resume_field_qualification', @var_resume_field_qualification_id), @var_article_resume_field_qualification_id)
    ;
    CALL setval ('seq_resume_field_qualification_id', @var_resume_field_qualification_id)
    ;

    CALL nextval ('seq_resume_field_experience_id', @var_resume_field_experience_id)
    ;
    CALL article_create (@var_article_type_resume_field_experience_id, CONCAT('resume_field_experience', @var_resume_field_experience_id), @var_article_resume_field_experience_id)
    ;
    CALL setval ('seq_resume_field_experience_id', @var_resume_field_experience_id)
    ;

    CALL article_localization_create (@var_article_resume_field_education_id, arg_language_id, arg_education)
    ;
    CALL article_localization_create (@var_article_resume_field_profession_id, arg_language_id, arg_profession)
    ;
    CALL article_localization_create (@var_article_resume_field_specialization_id, arg_language_id, arg_specialization)
    ;
    CALL article_localization_create (@var_article_resume_field_qualification_id, arg_language_id, arg_qualification)
    ;
    CALL article_localization_create (@var_article_resume_field_experience_id, arg_language_id, arg_experience)
    ;

    CALL article_update_subarticle_add (@var_article_resume_id, @var_resume_field_education_id)
    ;
    CALL article_update_subarticle_add (@var_article_resume_id, @var_resume_field_profession_id)
    ;
    CALL article_update_subarticle_add (@var_article_resume_id, @var_resume_field_specialization_id)
    ;
    CALL article_update_subarticle_add (@var_article_resume_id, @var_resume_field_qualification_id)
    ;
    CALL article_update_subarticle_add (@var_article_resume_id, @var_resume_field_experience_id)
    ;

    SELECT @var_article_resume_id INTO arg_article_id
    ;

    COMMIT
    ;
END
ENDROUTINE
DELIMITER ;

