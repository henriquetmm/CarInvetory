/*
Author: Henrique Tolentino da Motta Mesquita
UserName: S11_tolenhen
Assignment: Final Project
Date: August 8, 2018
Description: 
f.sql
**-----------------------------------------Code Start Bellow--------------------*/
SET VER OFF;
SET FEEDBACK OFF;
SET SERVEROUTPUT ON;


ACCEPT p_saleinv PROMPT 'Enter Invoice No: '

BEGIN

        printInvoice('&p_saleinv');


END;
/

exit
