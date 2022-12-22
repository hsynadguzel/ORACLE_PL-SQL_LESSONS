-- PROCEDURE
-- NESTED PROCEDURE: Unnamed bloklarda yazilirlar. Veritabani icinde saklanmazlar.
-- STORED PROCEDURE: Standalone ya da Package icinde yazilabilir. Veritabani icinde saklanir.

-- kullanicinin girdigi calisani adini listeleyen Nested Procedure yazalim.

Declare 
   Procedure emp_name (p_id in employees.employee_id%type)
     IS wname employees.first_name%type;
     Begin
       Select employees.first_name into wname 
       from employees
       where employee_id = p_id; 
       Dbms_Output.put_line(wname);
       Exception
         when others then
           Dbms_output.put_line('Hata oluþtu!');
     End;
Begin
  emp_name(101);
End;
