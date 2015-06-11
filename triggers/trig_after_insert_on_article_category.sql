DELIMITER ENDTRIGGER
CREATE TRIGGER trig_after_insert_on_article_category AFTER INSERT ON article_category
FOR EACH ROW
BEGIN
    CALL setval ('seq_article_category_id', NEW.id)
    ;
END
ENDTRIGGER
DELIMITER ;

