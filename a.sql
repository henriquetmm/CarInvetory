/*
Author: Henrique Tolentino da Motta Mesquita
UserName: S11_tolenhen
Assignment: Final Project
Date: August 8, 2018
Description: 
a.sql
**-----------------------------------------Code Start Bellow--------------------*/


SET SERVEROUTPUT ON;
SET VER OFF;
SET FEEDBACK OFF;

ACCEPT p_cname PROMPT 'Enter Customer name: '

ACCEPT p_cstreet PROMPT 'Enter Customer Street Address: '

ACCEPT p_ccity PROMPT 'Enter Customer City: '

ACCEPT p_cprov PROMPT 'Enter Customer Province: '

ACCEPT p_cpostal PROMPT 'Enter Customer Postal code: '

ACCEPT p_chphone PROMPT 'Enter Customer Home phone: '

ACCEPT p_cbphone PROMPT 'Enter Customer Business Phone: '



BEGIN


       insertcustomer('&p_cname','&p_cstreet','&p_ccity','&p_cprov','&p_cpostal','&p_chphone','&p_cbphone');

END;
/
COMMIT;
exit

