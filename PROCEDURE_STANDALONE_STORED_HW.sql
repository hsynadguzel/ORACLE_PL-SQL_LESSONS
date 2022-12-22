-- PROCEDURE
-- NESTED PROCEDURE: Unnamed bloklarda yazilirlar. Veritabani icinde saklanmazlar.
-- STORED PROCEDURE: Standalone ya da Package icinde yazilabilir. Veritabani icinde saklanir.
 
-- ekrana hello world yazan Standalone Stored Procedure yazalim.

CREATE OR REPLACE PROCEDURE proc_hw
       IS
       Begin
         Dbms_Output.Put_Line('HELLO WORLD');
       End proc_hw;
       
