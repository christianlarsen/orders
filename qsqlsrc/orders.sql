create or replace table clv1.orders (
    order_id for                id          numeric(5) not null generated always as identity (start with 1 , increment by 1), 
    customer_id for             customerid  numeric(5),
    order_data for              otherdata   varchar(250) not null,

    check (id >= 0),
    primary key(id),
    foreign key(customerid) references clv1.customers(id)
)
rcdfmt rorders;

label on table clv1.orders is 'ORDERS';

comment on table clv1.orders is 'Any comments here...';

comment on column clv1.orders (
    id          is 'Order ID',
    customerid  is 'Customer ID',
    otherdata   is 'Order other data'
);

label on column clv1.orders (
    id          is 'ID',
    customerid  is 'Customer ID',
    otherdata   is 'Other Data'
);
