-- CURSOR
-- IMPLICIT CURSOR: ROWCOUNT, NOTFOUND, FOUND
-- EXPLICIT CURSOR: DEVELOPER DEFINED CURSOR

-- MAASI 5000 DEN AZ OLALARA ZAM YAPILACAK.
DECLARE
   Cursor c_emp IS select * from employees2 FOR UPDATE of SALARY;

BEGIN

  for r_oku in c_emp loop
    dbms_output.put_line(r_oku.employee_id || ' UPDATE EDILDI.');
    if r_oku.salary < 5000 then
       update employees2 set 
              salary = salary * 1.20 
       where employee_id = r_oku.employee_id;  
    end if;
    
    dbms_output.put_line('SIRA NUMARASI: ' || c_emp%rowcount
                                || ', SICIL NUMARASI: ' || r_oku.department_id
                                || ', SOYADI: ' || r_oku.last_name
                                || ', MAAS: ' || r_oku.salary
                                );
  end loop;
  commit;
  
  exception when others then
    dbms_output.put_line(sqlcode || ' ' || sqlerrm);
END;

