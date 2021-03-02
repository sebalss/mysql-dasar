insert into products (id, name, price, quantity)
values  ('X0001', 'X Satu', 25000, 200),
        ('X0002', 'X Dua', 10000, 300),
        ('X0003', 'X Tiga', 15000, 500);

select * from products;

-- SUBQUERY --

select * from products where price > (SELECT avg(price) from products);

select MAX(price) from products;

select * from products;

update products set price = 1000000 where id = 'X0001';

select max(cp.price) from (select price from categories
                                                 join products on (products.id_category = categories.id)) as cp;