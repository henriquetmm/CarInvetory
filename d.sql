/*
Author: Henrique Tolentino da Motta Mesquita
UserName: S11_tolenhen
Assignment: Final Project
Date: August 8, 2018
Description: 
d.sql
**-----------------------------------------Code Start Bellow--------------------*/

SET VER OFF;
SET FEEDBACK OFF;
SET SERVEROUTPUT ON;

ACCEPT p_serial PROMPT 'Enter Car Serial: '

BEGIN

        printCar('&p_serial');



END;
/
exit
