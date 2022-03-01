**FREE
ctl-opt nomain;

/include "/home/CLV/orders/qrpglesrc/orders_h.rpgle"


// ------------------------------------------------------------------------------------
// Orders_IsOK - Returns if last operation was ok.
// ------------------------------------------------------------------------------------
dcl-proc Orders_IsOk export;

    dcl-pi Orders_IsOk ind end-pi;

    return (sqlstate = '00000');

end-proc;

// ------------------------------------------------------------------------------------
// getNumOfCustomerCustomers - Retrieve the number of orders for a customer in table ORDERS
// ------------------------------------------------------------------------------------
dcl-proc getNumofCustomerOrders export;

    dcl-pi getNumofCustomerOrders zoned(9);
        customerid like(order_t.customerid) const;
    end-pi;

    dcl-s numOfOrders zoned(9); 

    // Retrieving number of records in table ORDERS for
    // a customer id.
    exec sql
        select count(*) into :numOfOrders 
        from clv1.orders
        where customerid = :customerid;

    return numOfOrders;

end-proc;

// ------------------------------------------------------------------------------------
// getNumOfCustomers - Retrieve the number of orders (of any customer)
// ------------------------------------------------------------------------------------
dcl-proc getNumofOrders export;

    dcl-pi getNumofOrders zoned(9) end-pi;

    dcl-s numOfOrders zoned(9); 

    // Retrieving number of records in table ORDERS 
    exec sql
        select count(*) into :numOfOrders 
        from clv1.orders;
        
    return numOfOrders;

end-proc;

