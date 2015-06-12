 SELECT 
      article.id AS article_id
    , article.type_id AS aritcle_type_id
    , article_type.meta AS article_type_meta 
 FROM article 
    JOIN article_type ON article.type_id = article_type.id
 ;
 