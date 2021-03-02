create table guestbooks (
                            id      int not null auto_increment,
                            email   varchar(100) not null ,
                            title   varchar(200) not null ,
                            content text,
                            primary key(id)
)Engine = InnoDB;

select * from customers;

insert into guestbooks (email, title, content)
values ('guest@gmail.com', 'Hello', 'Hello'),
       ('guest2@gmail.com', 'Hello', 'Hello'),
       ('guest3@gmail.com', 'Hello', 'Hello'),
       ('muhammadiqbaliskandar345@gmail.com', 'Hello', 'Hello'),
       ('muhammadiqbaliskandar345@gmail.com', 'Hello', 'Hello'),
       ('muhammadiqbaliskandar345@gmail.com', 'Hello', 'Hello');

select * from guestbooks;
-- SET OPERATOR --

-- UNION
select distinct email from customers
union
select distinct email from guestbooks;

-- UNION ALL --
select distinct email from customers
union all
select distinct email from guestbooks;

select  email from customers
union all
select  email from guestbooks;

select emails.email, count(emails.email) from (select email from customers
                                               union all
                                               select email from guestbooks) as emails
group by emails.email;

-- INTERSECT --
select distinct email from customers
where email in (select distinct email from  guestbooks);

select distinct customers.email from customers
                                         inner join guestbooks on (guestbooks.email = customers.email);

-- MINUS --

select distinct customers.email, guestbooks.email from customers
                                                           left join guestbooks ON (customers.email = guestbooks.email)
where guestbooks.email IS NULL


-- TRANSACTION --
-- 1. --
    START TRANSACTION;

insert into guestbooks (email, title, content)
values ('contoh@gmail.com', 'contoh', 'contoh'),
       ('contoh2@gmail.com', 'contoh', 'contoh'),
       ('contoh3@gmail.com', 'contoh', 'contoh');

SELECT * FROM guestbooks;

COMMIT;

-- 2. --
START TRANSACTION;

DELETE
from guestbooks;

SELECT * FROM guestbooks;

ROLLBACK ;

-- LOCKING --



