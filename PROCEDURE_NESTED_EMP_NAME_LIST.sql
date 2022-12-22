-- PROCEDURE
-- NESTED PROCEDURE: Unnamed bloklarda yazilirlar. Veritabani icinde saklanmazlar.
-- STORED PROCEDURE: Standalone ya da Package icinde yazilabilir. Veritabani icinde saklanir.

-- Calisanlari adini listeleyen Nested Procedure yazalim.

Declare 
   Procedure emp_name
     IS wname employees.first_name%type;
     Begin
       for i in (Select employees.first_name into wname 
       from employees
       where employee_id > 100) loop
       Dbms_Output.put_line(i.first_name);
       end loop;
       Exception
         when others then
           Dbms_output.put_line('Hata oluþtu!');
     End;
Begin
  emp_name();
End;
