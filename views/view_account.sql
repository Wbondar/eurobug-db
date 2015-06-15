CREATE VIEW view_account AS 
SELECT party.id, article.meta AS name, account.password_hash 
FROM party 
	JOIN article ON party.title_article_id = article.id 
	JOIN account ON party.id = account.party_id
;
