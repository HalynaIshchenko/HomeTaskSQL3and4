/* Для цього ДЗ потрібно працювати з базою даних та таблицею, які були створені у ДЗ до 2-го заняття.
Потрібно написати наступні запити:
- витягнути всі книжки
- змінити прізвище автора в 2х книжках
- підрахувати кількість книжок, в яких автори мають нагороди
- вивести інформацію про книжку з найменшою кількістю сторінок
- вивести максимальну кількість сторінок
- вивести середню ціну книжки
- порахувати суму книжок за категорією
- вивести мінімальну ціну книжки
- вивести інформацію про книжку з найменшою ціною
- написати 3 запити, використавши різні види пошуку за співпадіннями(like)
- вивести книжки де ціна на проміжку: 1. 50-120, 2. не включаючи проміжок 200-600.
- 3 запити на видалення книжки(за id, name, isbn)
 Cпробувати змінити назву колонок, деякі записи з бази даних
 Спробувати видалити деякі записати з БД.
 */
DROP DATABASE library;
CREATE DATABASE library;
USE library;
CREATE TABLE book (
id integer NOT NULL primary key auto_increment,
name_book varchar(120) NOT NULL,
description_book mediumtext DEFAULT ("there is no description"),
date_book date NOT NULL default ("2018-01-01"),
category char (30) NOT NULL,
isbn  char (20) NOT NULL UNIQUE,
number_of_pages integer NOT NULL,
name_author char(45) NOT NULL,
last_name char (45) NOT NULL,
e_mail char (50) NOT NULL,
age_author integer NOT NULL,
date_of_birth_author date NOT NULL,
awards_author char(120) DEFAULT ("NULL")
);

insert into book (name_book, category, isbn, number_of_pages, name_author, last_name, e_mail, age_author, date_of_birth_author)
values ("Book1","Category1","34","345","Name_author1", "Last_name_author1","e_mail_author1@gmail.com", "31", "1991-05-07" ),
("Book2","Category2","35","380","Name_author2", "Last_name_author2","e_mail_author2@gmail.com", "41", "1981-08-04" ),
("Book3","Category3","36","250","Name_author2", "Last_name_author2","e_mail_author2@gmail.com", "41", "1981-08-04" ),
("Book4","Category2","37","376","Name_author3", "Last_name_author3","e_mail_author3@gmail.com", "70", "1952-07-04" ),
("Book5","Category1","38","143","Name_author4", "Last_name_author4","e_mail_author4@gmail.com", "72", "1950-05-01" ),
("Book6","Category2","39","415","Name_author2", "Last_name_author2","e_mail_author2@gmail.com", "41", "1981-08-04" ),
("Book7","Category4","40","380","Name_author5", "Last_name_author5","e_mail_author5@gmail.com", "34", "1989-08-04" ),
("Book8","Category1","41","752","Name_author6", "Last_name_author6","e_mail_author6@gmail.com", "41", "1981-10-12" ),
("Book9","Category5","42","671","Name_author7", "Last_name_author7","e_mail_author7@gmail.com", "41", "1981-11-07" ),
("Book10","Category5","43","250","Name_author5", "Last_name_author5","e_mail_author5@gmail.com", "34", "1989-08-04");


SELECT * FROM library.book;
update library.book set name_author = "New_name_author" where name_book in ( "Book8", "Book9");
select count(*) from library.book where awards_author != "NUll";
select * from book where number_of_pages = (select min(number_of_pages) from book);
select max(number_of_pages) from book;
-- add price because it isn't exist in my table
alter table library.book add price integer;
update library.book set price = 50 where id in (1,2,3,4,5);
update library.book set price = 100 where id in (6,7,8,9,10);
--
select avg(price) from library.book;
select sum(price) from library.book where category = "category2";
select min(price) from library.book;
select * from book where price = (select min(price) from book);
select * from library.book where name_book like '%10';
select * from library.book where name_book like 'Book1%';
select * from library.book where name_book like '%0';
select name_book from library.book where price between 10 and 60;
delete from book where id = 1;
delete from book where name_book = "Book4";
delete from book where isbn = 39;
alter table book rename column last_name to last_name_author;
ALTER TABLE book DROP COLUMN price;




