/*
Author: Henrique Tolentino da Motta Mesquita
UserName: S11_tolenhen
Assignment: Final Project
Date: August 8, 2018
Description: 
Procedures
**-----------------------------------------Code Start Bellow--------------------*/
SET SERVEROUTPUT ON;
SET VER ON;
SET FEEDBACK ON;

CREATE OR REPLACE PROCEDURE insertInv (
p_cname saleinv.cname%TYPE,
p_salesman saleinv.salesman%TYPE,
p_serial saleinv.serial%TYPE,
p_totalprice saleinv.totalprice%TYPE,
p_discount saleinv.discount%TYPE,
p_net saleinv.net%TYPE,
p_tax saleinv.tax%TYPE,
p_licfee saleinv.licfee%TYPE,
p_commission saleinv.commission%TYPE,
p_tradeserial saleinv.tradeserial%TYPE,
p_tradeallow saleinv.tradeallow%TYPE,
p_fire saleinv.fire%TYPE,
p_collision saleinv.collision%TYPE,
p_liability saleinv.liability%TYPE,
p_property saleinv.property%TYPE,
p_ocode invoption.ocode%TYPE,
p_saleprice invoption.saleprice%TYPE
)
AS
    e_nullname EXCEPTION;
    e_nullsdate EXCEPTION;
    e_nullserial EXCEPTION;
    e_invalidkey EXCEPTION;
    CONSTRAINT_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(CONSTRAINT_VIOLATED, -2291);
    SIZE_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(SIZE_VIOLATED, -12899);
BEGIN
  IF
        p_cname IS NULL
    THEN
        RAISE e_nullname;
   ELSIF p_serial IS NULL THEN
        RAISE e_nullserial;
    ELSIF p_totalprice <= 0 OR p_totalprice <= 0 OR p_discount <= 0 OR p_net <= 0 OR p_tax <= 0 THEN
        RAISE e_invalidkey;
    ELSE
        INSERT INTO saleinv
        VALUES (('I' || TO_CHAR(saleinv_seq.NEXTVAL, 'FM00000')),p_cname,p_salesman,SYSDATE,p_serial, p_totalprice,
        p_discount,p_net,p_tax,p_licfee,p_commission ,p_tradeserial ,p_tradeallow,
        p_fire,p_collision,p_liability,p_property);
        IF p_ocode IS NOT NULL THEN
            INSERT INTO invoption
            VALUES (('I' || TO_CHAR(saleinv_seq.CURRVAL, 'FM00000')),p_ocode,p_saleprice);
            END IF;
        dbms_output.put_line('Created invoice No:' || 'I' || TO_CHAR(saleinv_seq.CURRVAL, 'FM00000') );

UPDATE car 
    SET cname = p_cname
    WHERE serial = p_serial;
 IF   
    p_tradeserial IS NOT NULL THEN
UPDATE car
    SET cname = NULL
    WHERE serial = p_tradeserial;
END IF;
END IF;
EXCEPTION
    WHEN CONSTRAINT_VIOLATED THEN  
    DBMS_OUTPUT.PUT_LINE('Operation Failed,
    car or user do not currently exist on the system.
    ');
    WHEN e_nullname THEN
        dbms_output.put_line('Invalid null name value entered');
    WHEN e_nullserial THEN
        dbms_output.put_line('Invalid Null Serial');
    WHEN e_invalidkey THEN
        dbms_output.put_line('Invalid negative value entered');
    WHEN  SIZE_VIOLATED THEN
         DBMS_OUTPUT.PUT_LINE('A value entered exceeded the field size');
    WHEN OTHERS THEN
       dbms_output.put_line('Error occured'); 
     
END;
 
/




SET SERVEROUTPUT ON;
SET VER ON;
SET FEEDBACK ON;

CREATE OR REPLACE PROCEDURE insertCustomer (
p_cname customer.cname%TYPE,
p_cstreet customer.cstreet%TYPE,
p_ccity customer.ccity%TYPE,
p_cprov customer.cprov%TYPE,
p_cpostal customer.cpostal%TYPE,
p_chphone customer.chphone%TYPE,
p_cbphone customer.cbphone%TYPE
)
AS
 e_nullname EXCEPTION;
    e_nullcstreet EXCEPTION;
    e_nullccity EXCEPTION;
    e_nullcprov EXCEPTION;
    CONSTRAINT_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(CONSTRAINT_VIOLATED, -1);
    SIZE_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(SIZE_VIOLATED, -12899);
BEGIN
IF
       p_cname IS NULL
    THEN
        RAISE e_nullname;
    ELSIF p_cstreet IS NULL THEN
        RAISE e_nullcstreet;
    ELSIF p_ccity IS NULL THEN
        RAISE e_nullccity;
    ELSIF p_cprov IS NULL THEN
        RAISE e_nullcprov;
  ELSE
        INSERT INTO Customer(cname,cstreet, ccity, cprov, cpostal,chphone, cbphone)
        VALUES (p_cname,p_cstreet,p_ccity,p_cprov,p_cpostal,p_chphone,p_cbphone);
        dbms_output.put_line('Record added');
END IF;
EXCEPTION  
    WHEN CONSTRAINT_VIOLATED THEN  
    DBMS_OUTPUT.PUT_LINE('Invalid Name, user already exists!');
 
    WHEN e_nullname THEN
        dbms_output.put_line('Invalid null name value entered');
    WHEN e_nullcstreet THEN
        dbms_output.put_line('Invalid null street value entered');
    WHEN e_nullccity THEN
        dbms_output.put_line('Invalid null city value entered');
    WHEN e_nullcprov THEN
        dbms_output.put_line('Invalid null province value entered');
    WHEN  SIZE_VIOLATED THEN
         DBMS_OUTPUT.PUT_LINE('A value entered exceeded the field size');
END;
/
SET SERVEROUTPUT ON;
SET VER ON;
SET FEEDBACK ON;

CREATE OR REPLACE PROCEDURE insertCar (
p_serial car.serial%TYPE,
p_cname car.cname%TYPE,
p_make car.make%TYPE,
p_model car.model%TYPE,
p_cyear car.cyear%TYPE,
p_color car.color%TYPE,
p_trim car.trim%TYPE,
p_enginetype car.enginetype%TYPE,
p_purchinv car.purchinv%TYPE,
p_purchdate car.purchdate%TYPE,
p_purchfrom car.purchfrom%TYPE,
p_purchcost car.purchcost%TYPE,
p_freightcost car.freightcost%TYPE,
p_totalcost car.totalcost%TYPE,
p_listprice car.listprice%TYPE,
p_ocode    options.ocode%TYPE
)
AS

    e_nullserial EXCEPTION;
    e_nullmake EXCEPTION;
    e_nullmodel EXCEPTION;
    e_nullcyear EXCEPTION;
    e_nullcolor EXCEPTION;
    e_nulltrim EXCEPTION;
    e_nullengine EXCEPTION;
     CONSTRAINT_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(CONSTRAINT_VIOLATED, -2291);
        SIZE_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(SIZE_VIOLATED, -12899);
BEGIN
  IF
        p_serial IS NULL
    THEN
        RAISE e_nullserial;
    ELSIF p_make IS NULL THEN
        RAISE e_nullmake;
    ELSIF p_model IS NULL THEN
        RAISE e_nullmodel;
    ELSIF p_cyear NOT BETWEEN 1880 AND 2018 THEN
        RAISE e_nullcyear;
    ELSIF p_color IS NULL THEN
        RAISE e_nullcolor;
    ELSIF p_trim IS NULL THEN
        RAISE e_nulltrim;
    ELSIF p_enginetype IS NULL THEN
        RAISE e_nullengine;
    ELSIF p_ocode IS NULL THEN
        INSERT INTO car
        VALUES (p_serial,p_cname,p_make,p_model,p_cyear,p_color,p_trim,p_enginetype,p_purchinv,
        p_purchdate,p_purchfrom,p_purchcost,p_freightcost,p_totalcost,p_listprice);
         dbms_output.put_line('Car succefully inserted to database');
    ELSE
         INSERT INTO car
        VALUES (p_serial,p_cname,p_make,p_model,p_cyear,p_color,p_trim,p_enginetype,p_purchinv,
        p_purchdate,p_purchfrom,p_purchcost,p_freightcost,p_totalcost,p_listprice
        );
         INSERT INTO baseoption(serial,ocode)
         VALUES (p_serial,p_ocode);
        dbms_output.put_line('Car succefully inserted to database');
END IF;
EXCEPTION
    WHEN  SIZE_VIOLATED THEN
         DBMS_OUTPUT.PUT_LINE('A value entered exceeded the field size');
    WHEN CONSTRAINT_VIOLATED THEN  
         DBMS_OUTPUT.PUT_LINE('Operation Failed, user do not currently exist on the system '); 
    WHEN e_nullserial THEN
        dbms_output.put_line('Invalid null serial value entered');
    WHEN e_nullmake THEN
        dbms_output.put_line('Invalid null make value entered');
    WHEN e_nullmodel THEN
        dbms_output.put_line('Invalid null model value entered');
    WHEN e_nullcyear THEN
        dbms_output.put_line('Invalid  year value entered');
    WHEN e_nullcolor THEN
        dbms_output.put_line('Invalid null color value entered');
    WHEN e_nulltrim THEN
        dbms_output.put_line('Invalid null trim value entered');
    WHEN e_nullengine THEN
        dbms_output.put_line('Invalid null engine value entered');
    WHEN OTHERS THEN
       dbms_output.put_line('Error occured'); 
END;
/



SET SERVEROUTPUT ON;
SET VER ON;
SET FEEDBACK ON;

CREATE OR REPLACE PROCEDURE printCar (
p_serial car.serial%TYPE
)
AS
 e_nullserial EXCEPTION;
 e_norec      EXCEPTION;
 CURSOR car IS
    SELECT *
    FROM car
    WHERE serial = p_serial;
    
 CURSOR opt IS
    SELECT o.ocode,o.odesc,o.olist
    FROM baseoption b
    INNER JOIN options o
    ON b.ocode = o.ocode
    WHERE serial = p_serial;
 x NUMBER;
BEGIN
    IF
       p_serial IS NULL
    THEN
        RAISE e_nullserial;
    ELSE
x:=0;
   FOR i IN car LOOP
   x:= x +1;
      dbms_output.put_line('                     Vehicle Inventory Record                       ');
      dbms_output.put_line('+------------------------------------------------------------------+');
      dbms_output.put_line('|SerialNO    Make    Model     Year   Color       Trim             |');
      dbms_output.put_line('|' || i.serial || '  ' || i.make ||  i.model || i.cyear ||'  '|| i.color || i.trim || '  |');
      dbms_output.put_line('|PurchasedFrom   PurchInv.No   PurchDate  PurchCost  ListBasePrice |');
      dbms_output.put_line('|' || i.purchfrom ||'       ' ||i.purchinv ||'   ' ||  i.purchdate ||'   ' || i.purchcost ||'           ' || i.listprice || '      |');
      dbms_output.put_line('+------------------------------------------------------------------+');
      dbms_output.put_line('           Optional Equipment and Accessories - Factory             ');
      dbms_output.put_line('+------------------------------------------------------------------+');
      dbms_output.put_line('|Code  Description                                  ListPrice      |');
       END LOOP;
      FOR j IN opt LOOP
      dbms_output.put_line('|' || j.ocode || '  ' || j.odesc || '                         ' ||  j.olist || '  |');
      END LOOP;
      dbms_output.put_line('+------------------------------------------------------------------+');
 
    IF(x = 0) THEN
    RAISE e_norec;
    END IF;
    END IF;
    EXCEPTION
    WHEN e_norec THEN
        dbms_output.put_line('No record found!'); 
    WHEN e_nullserial THEN
        dbms_output.put_line('Invalid null serial value entered');
    WHEN OTHERS THEN
       dbms_output.put_line('Error occured'); 

END;
/

SET SERVEROUTPUT ON;
SET VER ON;
SET FEEDBACK ON;

CREATE OR REPLACE PROCEDURE printcust (
    p_cname customer.cname%TYPE
) AS
    e_norec    EXCEPTION;
    e_nullname EXCEPTION;
    x   NUMBER;
    CURSOR cus IS 
    SELECT        *
    FROM
        customer
    WHERE
        cname = p_cname;

BEGIN
    x := 0;
    IF
        p_cname IS NULL
    THEN
        RAISE e_nullname;
    ELSE
        FOR i IN cus LOOP
            x := x + 1;
            dbms_output.put_line('Customer Information');
            dbms_output.put_line('+--------------------------------------------------+');
            dbms_output.put_line('|'
            || i.cname
            || i.cstreet
            || '          |');

            dbms_output.put_line('|'
            || i.ccity
            || i.cprov
            || i.cpostal
            || '|');

            dbms_output.put_line('|Phone:                                            |');
            dbms_output.put_line('|Home: '
            || i.chphone
            || ' Business: '
            || i.cbphone
            || '       |');

            dbms_output.put_line('+--------------------------------------------------+');
        END LOOP;

        IF
            ( x = 0 )
        THEN
            RAISE e_norec;
        END IF;
    END IF;

EXCEPTION
    WHEN e_nullname THEN
        dbms_output.put_line('Invalid null name value entered');
        
    WHEN e_norec THEN    
        dbms_output.put_line('No Record found');
    WHEN OTHERS THEN
       dbms_output.put_line('Error occured'); 
END;
/


SET SERVEROUTPUT ON;
SET VER ON;
SET FEEDBACK ON;


CREATE OR REPLACE PROCEDURE printInvoice (
p_saleinv saleinv.saleinv%TYPE
)
AS
 e_norec   EXCEPTION;
 e_nullinv EXCEPTION;
l_trade   car%ROWTYPE;
x         NUMBER;
y         NUMBER;
 CURSOR saleinv IS
    SELECT *
    FROM    invoice_view
    WHERE saleinv = p_saleinv;
    
CURSOR opt IS
    SELECT o.ocode,o.odesc,o.olist
    FROM invoption i
    INNER JOIN options o
    ON i.ocode = o.ocode
    WHERE saleinv = p_saleinv;

BEGIN
    IF
       p_saleinv IS NULL
    THEN
        RAISE e_nullinv;
    ELSE
    y:=0;
   FOR i IN saleinv LOOP
   y := y + 1;
   x := i.net + i.tax;
   IF i.tradeserial IS NOT NULL THEN
      SELECT * 
      INTO l_trade
      FROM car c
      WHERE c.serial = i.tradeserial;
     END IF;
      
      dbms_output.put_line('                     Sales Invoice                                  ');
      dbms_output.put_line('+------------------------------------------------------------------+');
      dbms_output.put_line('|InvoiceNo ' || i.saleinv || '                            Date     ' || i.saledate || '   |');
      dbms_output.put_line('|SoldTo:     Name: ' || i.cname  ||'                            |');
      dbms_output.put_line('|         Address: ' || i.cstreet  ||'                            |');
      dbms_output.put_line('|            City: ' || i.ccity  ||'                            |');
      dbms_output.put_line('|           State: ' || i.cprov ||'Postal Code:' || i.cpostal ||  '      |');
      dbms_output.put_line('|           Telephones: ' || i.chphone ||' - ' || i.cbphone ||  '              |');
      dbms_output.put_line('|Salesman:  ' || i.salesman || '                                   |');
      dbms_output.put_line('|SerialNO        Make      Model     Year         Color            |');
      dbms_output.put_line('|' || i.serial ||'       ' ||i.make||'   ' ||  i.model ||' ' || i.cyear ||'           ' || i.color || '|');
      dbms_output.put_line('+------------------------------------------------------------------+');
      dbms_output.put_line('                     Insurance Coverage Includes                    ');
      dbms_output.put_line('      Fire and Theft[' || i.fire || ']        liability[' || i.liability|| ']                        ');
      dbms_output.put_line('           Collision[' || i.collision || ']  Property Damage[' || i.property|| ']                        ');
      dbms_output.put_line('                              Options                                         ');
      dbms_output.put_line('+------------------------------------------------------------------+');
      dbms_output.put_line('|Code  Description                                  ListPrice      |');
      FOR j IN opt LOOP
         dbms_output.put_line('|' || j.ocode || '  ' || j.odesc || '                         ' ||  j.olist || '|');
      END LOOP;
      dbms_output.put_line('+------------------------------------------------------------------+');
      dbms_output.put_line('                             Trade In                                        ');
      dbms_output.put_line('+------------------------------------------------------------------+');
      dbms_output.put_line('|SerialNO        Make          Model       Year         Color      |');
        IF i.tradeserial IS NOT NULL THEN
      dbms_output.put_line('|' || l_trade.serial ||'       ' ||l_trade.make||'   ' ||  l_trade.model ||'   ' || l_trade.cyear ||'         ' || l_trade.color || '|');
         END IF;
      dbms_output.put_line('+------------------------------------------------------------------+');
      dbms_output.put_line(' ');
      dbms_output.put_line('         TotalPrice: ' || i.totalprice ||'                             ');
      dbms_output.put_line(' Trade in Allowance: ' || i.tradeallow ||'                             ');
      dbms_output.put_line('           Discount: ' || i.discount   ||'                            ');
      dbms_output.put_line('                Net: ' || i.net   ||'                            ');
      dbms_output.put_line('              Taxes: ' || i.tax   ||'                            ');
      dbms_output.put_line('      Total Payback: ' || x  ||'                            ');
      END LOOP;
      IF y=0 THEN
      RAISE e_norec;
      END IF;  
      END IF;
EXCEPTION
    WHEN e_nullinv THEN
        dbms_output.put_line('Invalid null invoice number entered');
    WHEN e_norec THEN
        dbms_output.put_line('No record found');
    WHEN OTHERS THEN
       dbms_output.put_line('Error occured'); 
END;
/