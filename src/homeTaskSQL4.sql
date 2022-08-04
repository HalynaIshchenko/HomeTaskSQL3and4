-- Описати БД на тему "Бібліотека»
-- Зв’язати між собою таблиці.  Типи даних - подумайте і проставте самі.
-- Таблиці:
-- книжка( назва, опис, ціна, isbn)
-- жанр_книжки(назва)
-- автор (ім`я, прізвище, емейл, адрес, дата народження)
-- Отже, потрібно об`єднати між собою книжку і жанр книжки.
-- Умова - книжка може належати до одного жанру.
-- Подумати, як правильно і зробити об`єднання таблиць автор і книжка.
-- Умови - книжку може писати багато авторів
DROP DATABASE library;
CREATE DATABASE library;
USE library;

CREATE TABLE book (
id_book integer unique,
book_name varchar(120) NOT NULL ,
description_book mediumtext DEFAULT ("there is no description"),
price integer,
isbn  char (20) NOT NULL UNIQUE);

create table book_genre(
id_genre integer NOT NULL primary KEY,
genre varchar(120) not null,
FOREIGN KEY (id_genre) REFERENCES book(id_book)
);

create table author (
 id_author integer NOT NULL primary KEY,
 name_author varchar(50),
 last_name varchar(50),
 e_mail char (50) NOT NULL,
 adress varchar (120),
 date_of_birth_author date NOT NULL
 );


CREATE TABLE author_book (
   fk_author_id INTEGER NOT NULL,
   fk_book_id INTEGER NOT NULL,
   FOREIGN KEY (fk_author_id) REFERENCES author(id_author),
   FOREIGN KEY (fk_book_id) REFERENCES book(id_book),
   PRIMARY KEY (fk_author_id, fk_book_id)
);
