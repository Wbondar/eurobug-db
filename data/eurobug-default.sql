CALL sequence_create ('seq_article_id', @seq_article_id)
;
CALL sequence_create ('seq_article_type_id', @seq_article_type_id)
;
CALL sequence_create ('seq_article_category_id', @seq_article_category_id)
;


INSERT INTO article_type (id, meta) VALUES 
  (1, 'title_language')
, (2, 'title_locale')
, (3, 'title_party')
, (4, 'title_nationality')
, (5, 'title_asset_type')
, (6, 'title_asset')
, (8, 'resume')
, (9, 'resume_field')
, (10, 'preferred_locale')
;


INSERT INTO article (id, type_id, meta) VALUES
(1, 1, 'pol'), (2, 1, 'rus'), (3, 1, 'bel'), (4, 1, 'ukr')
;
INSERT INTO article (id, type_id, meta) VALUES
(13, 2, 'poland'), (14, 2, 'russia'), (15, 2, 'belarussia'), (16, 2, 'ukraine')
;
INSERT INTO article (id, type_id, meta) VALUES
(8, 4, 'polish'), (9, 4, 'russian'), (10, 4, 'belarussian'), (11, 4, 'ukrainian')
;
INSERT INTO article (id, type_id, meta) VALUES
(12, 5, 'resume')
;
INSERT INTO article (id, type_id, meta) VALUES
(5, 10, 'at_my_place'), (6, 10, 'another_place'), (7, 10, 'poland')
;


INSERT INTO language (id, code, title_article_id) VALUES
(1, 'pol', 1), (2, 'rus', 2), (3, 'bel', 3), (4, 'ukr', 4)
;


INSERT INTO article_localized (article_id, language_id, message) VALUES
(1, 1, 'Polski'), (1, 2, 'Польский'), (1, 4, 'Польска')
;
INSERT INTO article_localized (article_id, language_id, message) VALUES
(2, 1, 'Rosyjski'), (2, 2, 'Русский'), (2, 4, 'Росiйська')
;

INSERT INTO article_localized (article_id, language_id, message) VALUES
(5, 1, 'W miejscu zamieszkania.'), (5, 2, 'На месте жительства.'), (5, 4, 'В мiсцi мешкання.')
;
INSERT INTO article_localized (article_id, language_id, message) VALUES
(6, 1, 'Za granica.'), (6, 2, 'За гранией.'), (6, 4, 'За кордоном.')
;
INSERT INTO article_localized (article_id, language_id, message) VALUES
(7, 1, 'W Polsce.'), (7, 2, 'В Польше.'), (7, 4, 'В Польшi.')
;

INSERT INTO article_localized (article_id, language_id, message) VALUES
(8, 1, 'Polska.'), (8, 2, 'Польша.'), (8, 4, 'Польша.')
;
INSERT INTO article_localized (article_id, language_id, message) VALUES
(9, 1, 'Rosja.'), (9, 2, 'Россия.'), (9, 4, 'Росiя.')
;
INSERT INTO article_localized (article_id, language_id, message) VALUES
(10, 1, 'Belarosja.'), (10, 2, 'Белорусия.'), (10, 4, 'Белорусiя.')
;
INSERT INTO article_localized (article_id, language_id, message) VALUES
(11, 1, 'Ukraina.'), (11, 2, 'Украина.'), (11, 4, 'Украiна.')
;

INSERT INTO article_localized (article_id, language_id, message) VALUES
(12, 1, 'Curriculum vitae.'), (12, 2, 'Резюме.'), (12, 4, 'Резюме.')
;


INSERT INTO locale (id, title_article_id) VALUES
(1, 13), (2, 14), (3, 15), (4, 16)
;
INSERT INTO locale_language (locale_id, language_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4)
;


INSERT INTO nationality (id, title_article_id) VALUES
(1, 8),(2, 9),(3, 10),(4, 11)
;


INSERT INTO asset_type (id, title_article_id) VALUES
(1, 12)
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
CALL article_localization_create_with_code (@page_home_id, 'pol', 'Strona domowa.')
;
CALL article_localization_create_with_code (@page_home_id, 'rus', 'Домашняя страница.')
;
CALL page_update_section_add (@page_home_id, @form_login_id)
;
CALL page_update_section_add (@page_home_id, @form_signup_id)
;

COMMIT;