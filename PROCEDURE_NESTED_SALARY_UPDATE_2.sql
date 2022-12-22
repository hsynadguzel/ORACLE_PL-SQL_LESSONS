-- PROCEDURE
-- NESTED PROCEDURE: Unnamed bloklarda yazilirlar. Veritabani icinde saklanmazlar.
-- STORED PROCEDURE: Standalone ya da Package icinde yazilabilir. Veritabani icinde saklanir.

-- personelin maasina belirli oranda artýs yapan Nested Procedure yazalim.
-- call procedure name natosyon get_info(a => x)
Declare 
   wmaas employees.salary%type;
   wmaas_zamli employees.salary%type := 1.25;
   Procedure get_info (
     p_id in employees.employee_id%type,
     p_salary out employees.salary%type,
     p_new_salary in out employees.salary%type
     )IS 
     Begin
       Select employees.salary into p_salary 
       from employees
       where employee_id = p_id; 
       p_new_salary := p_new_salary * p_salary;
       --Dbms_Output.put_line(wname);
       Exception
         when others then
           Dbms_output.put_line('Hata oluþtu!');
     End get_info;
Begin
  get_info(p_id => 145, p_salary => wmaas, p_new_salary => wmaas_zamli);
  Dbms_output.put_line('Sicil No: ' || 145 || ' Mevcut Maas: ' || wmaas || ' Zamli Maas: ' || wmaas_zamli);
End;
