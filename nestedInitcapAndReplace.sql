--- the following statements do the same thing, but nesting them for quicker code
select * 
from directory(@sweatsuits);

select REPLACE(relative_path, '_', ' ') as no_underscores_filename
, REPLACE(no_underscores_filename, '.png') as just_words_filename
, INITCAP(just_words_filename) as product_name
from directory(@sweatsuits);

select REPLACE(REPLACE(relative_path, '_', ' '), '.png') as just_words_filename
, INITCAP(just_words_filename) as product_name
from directory(@sweatsuits) ;

select INITCAP(REPLACE(REPLACE(relative_path, '_', ' '), '.png')) as product_name
from directory(@sweatsuits) ;
