-- PROCEDURE
-- NESTED PROCEDURE: Unnamed bloklarda yazilirlar. Veritabani icinde saklanmazlar.
-- STORED PROCEDURE: Standalone ya da Package icinde yazilabilir. Veritabani icinde saklanir.

-- 101 nolu calisanin adini listeleyen ve sonra sayadini buyuk harflere donusturen Nested Procedure yazalim.

Declare 
   Procedure emp_name
     IS wname employees.first_name%type;
        wlname employees.last_name%type;
     Begin
       Select employees.first_name, employees.last_name into wname, wlname
       from employees
       where employee_id = 101;
       Dbms_Output.put_line('Var Olan: ' || wname || ' ' || wlname);
       Exception
         when others then
           Dbms_output.put_line('Hata oluþtu!');
     End emp_name;
     
   Procedure change_lname
     IS wname employees.last_name%type;
     Begin
       Update employees
       set last_name = upper(last_name)
       where employee_id = 101
       returning last_name into wname;
       Dbms_Output.put_line('Güncel Soyad: ' || wname);
       Exception
         when others then
           Dbms_output.put_line('Hata oluþtu!');
       End change_lname;
Begin
  emp_name();
  change_lname();
End;
/
rollback;
