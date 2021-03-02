show databases;

use belajar_mysql;

create table products(
                         id          VARCHAR(100) not null,
                         name        VARCHAR(100) not null,
                         description TEXT,
                         price       INT unsigned not null,
                         quantity    INT unsigned not null default 0,
                         created_at  TIMESTAMP not null default current_timestamp
)ENGINE = InnoDB;

Show TABLES;

describe products;

insert into products(id, name, price, quantity)
values ('P0001', 'Mie Ayam Original', 15000, 100);

insert into products(id, name, description, price, quantity)
values ('P0002', 'Mie Ayam Baso Tahu', 'Mie Ayam Original + Bakso Tahu', 20000, 100);

select * from products where id = 'P0003';

select name, price, id from products;

select * from products;

ALTER TABLE products ADD PRIMARY KEY (id);

select * from products;

select  * from products where quantity = 100;

select  * from products where price = 15000;

select  * from products where name = 'mie ayam original';

ALTER TABLE products ADD COLUMN category ENUM ('Makanan', 'Minuman', 'Lain-lain') AFTER name;

UPDATE products
SET category = 'Lain-lain',
    description = 'Rokok bermerek Magnum Filter'
WHERE id = 'P0021' ;

insert into products(id, name, price, quantity) values
('P00022', 'Magnum Filter', 30000, 67);

UPDATE products
SET category = 'Minuman'
WHERE id = 'P00021' ;

-- Delete Data --

DELETE
FROM products
WHERE id = 'P0010';

-- Alias --

select id       AS 'Kode',
       name     AS 'Nama',
       category AS 'Kategori',
       price    AS 'harga',
       quantity AS 'Stok' from products;

select p.id       AS 'Kode',
       p.name     AS 'Nama',
       p.category AS 'Kategori',
       p.price    AS 'harga',
       p.quantity AS 'Stok'
from products AS p;

-- Where Operator --

SELECT * From products
WHERE quantity = 67;

SELECT * From products
WHERE quantity >= 10;

SELECT * From products
WHERE category != 'Makanan';

SELECT * From products
WHERE quantity > 100 AND price > 20000;

SELECT * From products
WHERE products.category = 'Makanan' AND price < 20000;

SELECT * From products
WHERE quantity < 100 OR price > 20000;

-- Priority --

SELECT id, name, price, quantity
FROM products
WHERE (category = 'Makanan' OR quantity < 100)
  AND price > 25000;

-- Like --

SELECT * FROM products
WHERE name NOT LIKE '%mie%';

SELECT * FROM products
WHERE name LIKE '%mie%';

-- NULL / NOT NULL --

SELECT * FROM products WHERE description IS NULL ;

SELECT * FROM products WHERE description IS NOT NULL ;

-- BETWEEN --
SELECT * FROM products WHERE price BETWEEN 0 AND 15000;

-- IN --
SELECT * From products
WHERE category IN ('Lain-lain', 'Minuman');

SELECT * From products
WHERE category NOT IN ('Makanan', 'Minuman');


-- ORDER --

SELECT id, category, price, name
FROM  products
ORDER BY price ASC , id DESC ;

-- LIMIT --

SELECT * FROM products
WHERE price > 0
ORDER BY id
    LIMIT 5;

SELECT * FROM products
WHERE price > 0
ORDER BY id DESC
    LIMIT 2, 5;

-- Select Distinct Data --

SELECT DISTINCT category FROM products;

-- Numeric Function --

-- 1. Aritmethic Operator

SELECT 10 * 10 AS 'Hasil';

SELECT id, price DIV 1000 AS 'Price in K' FROM products;

-- 2. Mathematical Function

SELECT PI();

SELECT POWER(10, 2);

SELECT COS(10);

SELECT SIN(10);

SELECT TAN(10);

SELECT id, COS(price), sin(price), tan(price) from products;

SELECT id, name, price
from products
where price div 1000 > 15;

-- AUTO INCREMENT --

-- 1 to 1 relationshhip --

create table wallet (
                        id          INT NOT NULL AUTO_INCREMENT,
                        id_customer INT NOT NULL,
                        balance     INT NOT NULL DEFAULT 0,
                        PRIMARY KEY (id),
                        UNIQUE KEY id_customer_unique (id_customer),
                        CONSTRAINT fk_wallet_customer
                            FOREIGN KEY (id_customer) REFERENCES customers(id)
)ENGINE = InnoDB;

drop table wallet;

describe wallet;

select * from customers;

insert into wallet(id_customer) values (3), (1) ;

select customers.email, wallet.balance from wallet join customers ON (wallet.id_customer = customers.id);

select * from wallet;
select * from customers;

show tables;

-- One To Many Relationship --

create table categories (
                            id  VARCHAR(10) NOT NULL,
                            name VARCHAR(100) NOT NULL,
                            primary key(id)
)ENGINE = InnoDB;

alter table products
drop column category;

describe categories;

alter table products
    add column id_category varchar(10);

alter table products
    add constraint fk_products_category
        foreign key (id_category) references categories (id);

show create table products;

select * from products;
select * from categories;

insert into categories(id, name) values ('C0001', 'Makanan'),
                                        ('C0002', 'Minuman'),
                                        ('C0003', 'Lain-lain');

update products set id_category = 'C0001' where id IN ('P0001', 'P00010', 'P00011', 'P00012', 'P00013', 'P00014', 'P00015', 'P00016', 'P00017', 'P00018', 'P00019', 'P00020', 'P0002', 'P0003', 'P0004', 'P0005', 'P0006', 'P0007', 'P0008','P0009');
update products set id_category = 'C0002' where id IN ('P00021', 'P00023');
update products set id_category = 'C0003' where id IN ('P00022');


select products.id, products.name, categories.name
from products
         join categories on (categories.id = products.id_category);


create user 'eko'@'localhost';
create user 'khannedy'@'%';

grant select, insert, update, delete on belajar_mysql.* to 'eko'@'localhost';
grant select on belajar_mysql.* to 'khannedy'@'%';

show grants for 'eko'@'localhost';
show grants for 'khannedy'@'%';

revoke select, insert, update, delete on belajar_mysql.* from 'eko'@'localhost';
revoke select on belajar_mysql.* from 'khannedy'@'%';

set password for 'eko'@'localhost' = 'rahasia';
set password for 'khannedy'@'%' = 'rahasia';

drop user 'eko'@'localhost';
drop user 'khannedy'@'%';

mysqldump belajar_mysql --user root --password --result-file=/Users/Iqbal/Desktop/belajar_mysql.sql