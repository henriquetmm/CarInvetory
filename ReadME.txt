The files in this directory provide a the items on the DBAS32100 final assignment.
The directory contains 10 scripts, 1 of which are procedures and one for views.
Procedures must be executed before in order to create objects in user's schema.
To execute the program the user must be in the same directory where the scrips reside, 
or provide the appropriate path to the main shell script called program.exe:
./program.txt is the code to run it.
Upon running it the user will have the following selection displayed:

SPECIALTY IMPORTS VEHICLE SALES

Select one of the following options:
 a: Enter a new Customer
 b: Lookup a Customer
 c: Enter a new Vehicle Inventory Record
 d: Lookup a Vehicle Inventory Record
 e: Enter a new Sales Invoice
 f: Lookup a Sales Invoice
 x: Exit


If the user selects 'a' the menu shell script calls a.sql script insert a new customer. 
a.sql prompts the user for all the fields necessary to populate the form and  uses the 
customerProcedure procedure to actually updatethe database, the input to that file being all 
the fields the user filled initially. The procedure has error handling for non null fields and 
for duplicate primary key insertion with the appropiate error messages displayed. Error handling is 
present for input data that exceeds field size.
The procedure then lets the user know if the input was successfull.

The ouput of a successfull insertion will be this:

Enter Customer name: TIMMY HORTONS
Enter Customer Street Address: 30 Street St.
Enter Customer City: Brantford
Enter Customer Province: ON
Enter Customer Postal code: n3t6a7
Enter Customer Home phone: 6473234556
Enter Customer Business Phone: 6478991223
Record added



If the user selects 'b' the menu shell script calls b.sql script to look up for a customer. 
b.sql uses the printCustomer procedure by passing and input in the form of the customer name. 
The procedure will do error handling for for null or non existant records and will print out the 
formatted output. This is an example of an output:


Enter your option here: b
Enter Customer Name: TIMMY HORTONS
Customer Information
+--------------------------------------------------+
|TIMMY HORTONS       30 Street St.                 |
|Brantford           ON                  N376a7    |
|Phone:                                            |
|Home: 6473234556    Business: 6478991223          |
+--------------------------------------------------+


If the user selects 'c' the menu shell script calls c.sql script to create a new vehicle inventory record. 
c.sql uses vehicleProcedure to insert into the car table. All the fields to populate a row are requested by the 
c.sql script and used as inputs to the vehicleProcedure. The procedure then insterts into the car table, handling 
errors if needed.The procedure will aslo add an option code to the baseoption code with the foreing key as the serial
the user just added, ideally this would be a loop to let the user input as many options as possible but I couldn't 
implement it. Error handling is present for input data that exceeds field size, for null values and for referential
integrity.

The output will look like this(Fields left empty are fields that accept NULL values in this example):
 

 Enter your option here: c
Enter Car serial: H17SRL99
Enter Car Owner: LUNA TOLENTINO
Enter Car Make: FORD
Enter Car Model: FOCUS
Enter Car year: 1977
Enter Car color: BLUE
Enter Car trim: XXl
Enter Car engine type: FWD
Enter Car purchase invoice:
Enter Car purchase date (YYYY-MM-DD):
Enter from whom the car was purchased from:
Enter purchase cost
Enter freight cost:
Enter the total cost:
Enter list price:
Enter option code: CD2
Car succefully inserted to database



If the user selects 'd' the menu shell script calls d.sql script to look up for a vehicle inventory record.
d.sql uses the printCar procedure by passing and input in the form of the a serial number. The procedure will do error handling for
for null or non existant records and will print out the formatted output for the record, also including all options linked to that car.
This is done by looping through all the results gathered from the serial number entered on the baseoption table(used the baseoption options 
only because the form specifies factory options). 
This is an example of an output:

Enter Car Serial: A92RNSX1
Vehicle Inventory Record
+------------------------------------------------------------------+
|SerialNO    Make    Model     Year   Color       Trim             |
|A92RNSX1  ACURA     NSX       1992  red         leather           |
|PurchasedFrom   PurchInv.No   PurchDate  PurchCost  ListBasePrice |
|plaff auto         120303   09-SEP-15   10000           15000     |
+------------------------------------------------------------------+
Optional Equipment and Accessories - Factory
+------------------------------------------------------------------+
|Code  Description                                  ListPrice      |
|CD2   CD PLAYER                                              195  |
|M24   TAPE DECK                                              285  |
|R41   RECLINING BUCKET SEATS                                 420  |
|M14   STEREO RADIO                                           350  |
|R14   STEREO RADIO                                           295  |
|W11   ALUMINUM WHEELS                                        664  |
|R00   TINY RADIO W/1 SPEAKER                                 84.22  |
+------------------------------------------------------------------+

If the user selects 'e' the menu shell script calls e.sql script to create a new invoice inventory record. 
e.sql uses InvoiceProcedure to insert into the saleinv table. All the fields to populate a row are requested
 by the e.sql script and used as inputs to the InvoiceProcedure, except for date and invoice number. The date 
is retrieved form the system and the invoice number is generated using a sequence.The procedure then inserts 
into the invoice table, with error handling for null values, referential integrity and data too big for a field.
The procedure will aslo add an option code to the invoption code with the foreing key as the invoice number the 
system created, ideally this would be a loop to let the user input as many options as possible but I couldn't implement it.
This procedure will also update the car record, now to have the name  of the buyer and the tradein car record
will aslo be updated, removing the current owner (ideally the fields pruchasedFrom and costs would be updated too, but the
database design made this fields incompatible). 
The output will look like this(Fields left empty are fields that accept NULL values in this example): 


Enter your option here: e
Enter buyers name: HENRIQUE TOLENTINO
Enter salesman name:
Enter serial number: A17BTLX4
Enter total price: 25000
Enter discount: 2000
Enter net: 23000
Enter tax: 500
Enter license fee: 200
Enter commission:
Enter trade in car serial number:
Enter trade in allowance:
Insurance for fire (Y/N)
Insurance for colision (Y/N) N
Insurance for liability (Y/N) Y
Insurance for property (Y/N) N
Enter option code to be purchased: CD2
Enter option cost: 200
Created invoice No:I01001


If the user selects 'f' the menu shell script calls f.sql script to look up for a invoice record.
f.sql uses the printInvoice procedure by passing and input in the form of the a invoice number. 
The procedure will do error handling for for null or non existant records and will print out the formatted
output for the record, also including all options linked to that car,and trade in cars related to that purchase.
The procedure will use a view to get the information of the from the saleinv, car and customer tables.
The procedure will also print any options related to that sale by searching for the invoice number on 
invoptions table and looping through all possible options.
 
This is an example of an output with options:
 Enter your option here: f
Enter Invoice No: I00149
Sales Invoice
+------------------------------------------------------------------+
|InvoiceNo I00149                            Date     20-JAN-17   |
|SoldTo:     Name: JOSHUA PINKNEY                                  |
|         Address: 2381 Baxter Crescent                            |
|            City: Burlington                                      |
|           State: ON                  Postal Code:L7M 4C9         |
|           Telephones: (905)331-0690 - (289)259-0885              |
|Salesman:  DEADBEAT DAN                                           |
|SerialNO        Make      Model     Year         Color            |
|M16GE-C0       MERCEDES     E-CLASS    2016           Green       |
+------------------------------------------------------------------+
Insurance Coverage Includes
Fire and Theft[N]        liability[Y]
Collision[Y]  Property Damage[Y]
Options
+------------------------------------------------------------------+
|Code  Description                                  ListPrice      |
|CD2   CD PLAYER                                              195|
|N43   Navigator                                              485|
+------------------------------------------------------------------+
Trade In
+------------------------------------------------------------------+
|SerialNO        Make          Model       Year         Color      |
|A17DRLX0       ACURA        RLX          2017         Dark Blue   |
+------------------------------------------------------------------+
TotalPrice: 54825
Trade in Allowance: 14000
Discount: 4250
Net: 36575
Taxes: 4754.75
Total Payback: 41329.75




