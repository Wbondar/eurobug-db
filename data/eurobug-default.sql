CALL sequence_create ('seq_article_id', @var_seq_article_id)
;
CALL sequence_create ('seq_article_type_id', @var_seq_article_type_id)
;
CALL sequence_create ('seq_article_category_id', @var_seq_article_category_id)
;
CALL sequence_create ('seq_party_id', @var_seq_party_id)
;
CALL sequence_create ('seq_party_type_id', @var_seq_party_type_id)
;
CALL sequence_create ('seq_person_id', @var_seq_person_id)
;
CALL sequence_create ('seq_language_id', @var_seq_language_id)
;
CALL sequence_create ('seq_asset_id', @var_seq_asset_id)
;
CALL sequence_create ('seq_asset_type_id', @var_seq_asset_type_id)
;
CALL sequence_create ('seq_asset_category_id', @var_seq_asset_category_id)
;

CALL language_create ('pol', 'To zdanie nie jest dostępne w języku polskim. Poprosze obrać innyj język lub skontaktować się z developer\'ami.', @var_pol_id)
;
CALL language_create ('rus', 'Это сообщение не доступно на русском языке. Пожалуйста, выберите другой язык или свяжитесь с разработчиками.', @var_rus_id)
;

CALL form_create ('login', @form_login_id)
;
CALL form_legend_create ('login', 'login_legend', @form_login_legend_login_id)
;
CALL article_localization_create_with_code (@form_login_legend_login_id, 'pol', 'Zalogowac sie.')
;
CALL article_localization_create_with_code (@form_login_legend_login_id, 'rus', 'Авторизация в системе.')
;
CALL form_label_create ('login', 'login_username', @form_login_label_username_id)
;
CALL article_localization_create_with_code (@form_login_label_username_id, 'pol', 'Nazwa konta:')
;
CALL article_localization_create_with_code (@form_login_label_username_id, 'rus', 'Имя учетной записи:')
;
CALL form_label_create ('login', 'login_password', @form_login_label_password_id)
;
CALL article_localization_create_with_code (@form_login_label_password_id, 'pol', 'Haslo:')
;
CALL article_localization_create_with_code (@form_login_label_password_id, 'rus', 'Пароль:')
;
CALL form_button_create ('login', 'Login_submit', @form_login_button_submit_id)
;
CALL article_localization_create_with_code (@form_login_button_submit_id, 'pol', 'Wyslij')
;
CALL article_localization_create_with_code (@form_login_button_submit_id, 'rus', 'Выслать запрос')
;

CALL form_create ('signup', @form_signup_id)
;
CALL form_legend_create ('signup', 'signup_legend', @form_signup_legend_signup_id)
;
CALL article_localization_create_with_code (@form_signup_legend_signup_id, 'pol', 'Zarejestrowac sie.')
;
CALL article_localization_create_with_code (@form_signup_legend_signup_id, 'rus', 'Регистрация в системе.')
;
CALL form_label_create ('signup', 'signup_username', @form_signup_label_username_id)
;
CALL article_localization_create_with_code (@form_signup_label_username_id, 'pol', 'Nazwa konta:')
;
CALL article_localization_create_with_code (@form_signup_label_username_id, 'rus', 'Имя учетной записи:')
;
CALL form_label_create ('signup', 'signup_password', @form_signup_label_password_id)
;
CALL article_localization_create_with_code (@form_signup_label_password_id, 'pol', 'Haslo:')
;
CALL article_localization_create_with_code (@form_signup_label_password_id, 'rus', 'Пароль:')
;
CALL form_button_create ('signup', 'signup_submit', @form_signup_button_submit_id)
;
CALL article_localization_create_with_code (@form_signup_button_submit_id, 'pol', 'Wyslij')
;
CALL article_localization_create_with_code (@form_signup_button_submit_id, 'rus', 'Выслать запрос')
;


CALL page_create ('home', @page_home_id)
;
CALL page_title_localization_create (@page_home_id, 'pol', 'Strona domowa.')
;
CALL page_title_localization_create (@page_home_id, 'rus', 'Домашняя страница.')
;
CALL page_update_article_add (@page_home_id, @form_login_id)
;
CALL page_update_article_add (@page_home_id, @form_signup_id)
;

CALL account_create ('wbond', 'wbond', @var_wbond_id)
;

CALL party_update_email_create_with_domain (@var_wbond_id, 'vladyslavbond', 'protonmail.ch', @var_wbond_email_id)
;
CALL party_update_tel_create (@var_wbond_id, '+480549931', @var_wbond_tel_id)
;

CALL position_create ('sysadmin', @var_position_sysadmin_id)
;
CALL position_title_localization_create (@var_position_sysadmin_id, 'pol', 'Administrator systemowy.')
;
CALL position_title_localization_create (@var_position_sysadmin_id, 'rus', 'Системный администратор.')
;
CALL position_create ('bookkeeper', @var_position_bookkeeper_id)
;
CALL position_title_localization_create (@var_position_bookkeeper_id, 'pol', 'Księgowy.')
;
CALL position_title_localization_create (@var_position_bookkeeper_id, 'rus', 'Бухгалтер.')
;
CALL position_create ('java', @var_position_java_id)
;
CALL position_title_localization_create (@var_position_java_id, 'pol', 'Programista Java.')
;
CALL position_title_localization_create (@var_position_java_id, 'rus', 'Программист Java.')
;

CALL nationality_create_with_meta ('pole', @var_pole_id)
;
CALL nationality_create_with_meta ('ukrainian', @var_ukrainian_id)
;

CALL person_create_for_party (@var_wbond_id, 'M', @var_ukrainian_id, @var_person_wbond_id)
;
/*CALL person_update_name_localization_create (@var_person_wbond_id, 'pol', 'Vladyslav', 'Bondarenko')
;
CALL person_update_name_localization_create (@var_person_wbond_id, 'rus', 'Владислав', 'Бондаренко')
;*/

CALL resume_create (@var_person_wbond_id, @var_resume_id)
;

CALL resume_update_position_add (@var_resume_id, @var_position_sysadmin_id)
;
CALL resume_update_position_add (@var_resume_id, @var_position_bookkeeper_id)
;

CALL educational_institution_create ('vtek', @var_vtek_id)
;
CALL educational_institution_create ('pwsz', @var_pwsz_id)
;
CALL party_create_with_meta ('office', 'eurobug', @var_eurobug_id)
;

CALL resume_update_education_add (@var_resume_id, @var_vtek_id, '2010-01-01', '2013-01-01')
;
CALL resume_update_education_add (@var_resume_id, @var_pwsz_id, '2013-01-01', '2016-01-01')
;

CALL resume_update_experience_add (@var_resume_id, @var_eurobug_id, @var_position_java_id, '2015-07-08')
;

COMMIT;