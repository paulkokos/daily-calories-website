create schema if not exists daily_calories_website_test;
use daily_calories_website_test;
create user if not exists 'daily_calories_website_test_user'@'localhost' identified by 'testpassword';
GRANT ALL PRIVILEGES ON daily_calories_website_test TO 'daily_calories_website_test_user'@localhost;

create schema if not exists daily_calories_website_production;
use daily_calories_website_production;
create user if not exists 'daily_calories_website_prod_user'@'localhost' identified by 'testpassword';
GRANT ALL PRIVILEGES ON daily_calories_website_production TO 'daily_calories_website_prod_user'@localhost;


create schema if not exists daily_calories_website_development;
use daily_calories_website_development;
create user if not exists 'daily_calories_website_dev_user'@'localhost' identified by 'testpassword';
GRANT ALL PRIVILEGES ON daily_calories_website_development TO 'daily_calories_website_dev_user'@localhost;








drop database if exists daily_calories_website_development;
drop database if exists daily_calories_website_production;
drop database if exists daily_calories_website_test;

drop user if exists daily_calories_website_test_user@localhost;
drop user if exists daily_calories_website_prod_user@localhost;
drop user if exists daily_calories_website_dev_user@localhost;