-- Many To Many Relationship --
create table orders (
                        id          INT         NOT NULL    AUTO_INCREMENT,
                        total       INT         NOT NULL,
                        order_date  DATETIME    NOT NULL    DEFAULT CURRENT_TIMESTAMP,
                        PRIMARY KEY (id)
)ENGINE = InnoDB;

describe orders;

create table orders_detail(
                              id_product  varchar(10) not null,
                              id_order    int not null,
                              price       int not null,
                              quantity    int not null ,
                              PRIMARY KEY (id_product, id_order) -- digabung primary key nya --
)

    describe orders_detail;

ALTER table orders_detail
    ADD constraint fk_orders_detail_product
        foreign key (id_product) references products(id);

ALTER table orders_detail
    ADD constraint fk_orders_detail_orders
        foreign key (id_order) references orders(id);

show create table orders_detail;

insert into orders (total) values(50000);

select * from orders;

insert into orders_detail(id_product, id_order, price, quantity)
values ('P0001', 1, 25000, 1),
       ('P0002', 1, 25000, 1);

insert into orders_detail(id_product, id_order, price, quantity)
values ('P0003', 2, 25000, 1),
       ('P0004', 3, 25000, 1);

insert into orders_detail(id_product, id_order, price, quantity)
values ('P0001', 2, 25000, 1),
       ('P0003', 3, 25000, 1);

select * from orders_detail;

select * from orders
                  join orders_detail on (orders_detail.id_order = orders.id)
                  join products on (products.id = orders_detail.id_product);

select orders.id, products.id, products.name, orders_detail.quantity, orders_detail.price from orders
                                                                                                   join orders_detail on (orders_detail.id_order = orders.id)
                                                                                                   join products on (products.id = orders_detail.id_product);
