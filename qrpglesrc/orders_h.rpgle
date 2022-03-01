**FREE

dcl-ds order_t qualified template;
    id zoned(10);
    customerid zoned(5);
    otherdata char(250);
end-ds;

// ------------------------------------------------------------------------------------
// Orders_IsOK - Returns if last operation was ok.
// ------------------------------------------------------------------------------------
dcl-pr Orders_IsOk ind extproc;
end-pr;

// ------------------------------------------------------------------------------------
// getNumOfCustomerOrders - Retrieve the number of orders in table ORDERS for a CUSTOMER
// ------------------------------------------------------------------------------------
dcl-pr getNumofCustomerOrders zoned(9) extproc;
    customerid like(order_t.customerid) const;
end-pr;

// ------------------------------------------------------------------------------------
// getNumOfOrders - Retrieve the number of orders in table ORDERS (of any customer)
// ------------------------------------------------------------------------------------
dcl-pr getNumofOrders zoned(9) extproc;
end-pr;

