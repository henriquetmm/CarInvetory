/*
Author: Henrique Tolentino da Motta Mesquita
UserName: S11_tolenhen
Assignment: Final Project
Date: August 8, 2018
Description: 
c.sql
**-----------------------------------------Code Start Bellow--------------------*/
SET VER OFF;
SET FEEDBACK OFF;
SET SERVEROUTPUT ON;

ACCEPT p_serial PROMPT 'Enter Car serial: '
ACCEPT p_cname PROMPT 'Enter Car Owner: '
ACCEPT p_make PROMPT 'Enter Car Make: '
ACCEPT p_model PROMPT 'Enter Car Model: '
ACCEPT p_cyear PROMPT 'Enter Car year: '
ACCEPT p_color PROMPT 'Enter Car color: '
ACCEPT p_trim PROMPT 'Enter Car trim: '
ACCEPT p_enginetype PROMPT 'Enter Car engine type: '
ACCEPT p_purchinv PROMPT 'Enter Car purchase invoice: '
ACCEPT p_purchdate PROMPT 'Enter Car purchase date (YYYY-MM-DD): '
ACCEPT p_purchform PROMPT 'Enter from whom the car was purchased from: '
ACCEPT p_purchcost PROMPT 'Enter purchase cost '
ACCEPT p_frieghtcost PROMPT 'Enter freight cost: '
ACCEPT p_totalcost PROMPT 'Enter the total cost: '
ACCEPT p_listprice PROMPT 'Enter list price: '
ACCEPT p_ocode PROMPT 'Enter option code: '




BEGIN

        insertcar('&p_serial','&p_cname','&p_make','&p_model','&p_cyear','&p_color','&p_trim','&p_enginetype','&p_purchinv','&p_purchdate'
,'&p_purchform','&p_purchcost','&p_frieghtcost','&p_totalcost','&p_listprice', '&p_ocode');



END;
/
COMMIT;
exit

