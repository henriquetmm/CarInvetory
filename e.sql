/*
Author: Henrique Tolentino da Motta Mesquita
UserName: S11_tolenhen
Assignment: Final Project
Date: August 8, 2018
Description: 
e.sql
**-----------------------------------------Code Start Bellow--------------------*/
SET SERVEROUTPUT ON;
SET VER OFF;
SET FEEDBACK OFF;

ACCEPT p_cname PROMPT 'Enter buyers name: '
ACCEPT p_salesman PROMPT 'Enter salesman name: '
ACCEPT p_serial PROMPT 'Enter serial number: '
ACCEPT p_totalprice PROMPT 'Enter total price: '
ACCEPT p_discount PROMPT 'Enter discount: '
ACCEPT p_net PROMPT 'Enter net: '
ACCEPT p_tax PROMPT 'Enter tax: '
ACCEPT p_licfee PROMPT 'Enter license fee: '
ACCEPT p_commission PROMPT 'Enter commission: '
ACCEPT p_tradeserial PROMPT 'Enter trade in car serial number: '
ACCEPT p_tradeallow PROMPT 'Enter trade in allowance: '
ACCEPT p_fire PROMPT 'Insurance for fire (Y/N) '
ACCEPT p_collision PROMPT 'Insurance for colision (Y/N) '
ACCEPT p_liability PROMPT 'Insurance for liability (Y/N) '
ACCEPT p_property PROMPT 'Insurance for property (Y/N) '
ACCEPT p_ocode PROMPT 'Enter option code to be purchased: '
ACCEPT p_saleprice PROMPT 'Enter option cost: '


BEGIN

        insertInv('&p_cname','&p_salesman','&p_serial','&p_totalprice','&p_discount','&p_net','&p_tax','&p_licfee','&p_commission','&p_tradeserial','&p_tradeallow','&p_fire','&p_collision','&p_liability','&p_property','&p_ocode','&p_saleprice');


END;
/
COMMIT;
exit

