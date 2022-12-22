-- PROCEDURE
-- NESTED PROCEDURE: Unnamed bloklarda yazilirlar. Veritabani icinde saklanmazlar.
-- STORED PROCEDURE: Standalone ya da Package icinde yazilabilir. Veritabani icinde saklanir.

-- imlec olusturarak 90 nolu bolumde calisanlarin adini listeleyen Nested Procedure yazalim.
-- call procedure name natosyon get_info(a => x)
Declare 
   Cursor c_emp IS select * from employees where department_id = 90;
   c_adi c_emp%rowtype;
   
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
  open c_emp;
  loop
    fetch c_emp into c_adi;
    exit when c_emp%notfound;
    emp_name(c_adi.employee_id);
  end loop;
  close c_emp;
End;
