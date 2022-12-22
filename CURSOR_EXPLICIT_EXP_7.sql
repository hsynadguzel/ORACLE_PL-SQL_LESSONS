-- CURSOR
-- IMPLICIT CURSOR: ROWCOUNT, NOTFOUND, FOUND
-- EXPLICIT CURSOR: DEVELOPER DEFINED CURSOR

-- KULLANICININ GIRDIGI DEPARTMANDAKI CALISANLARI LISTELEYEN PROGRAM YAZALIM.
DECLARE
   Cursor c_emp (wdept_id employees2.manager_id%type) IS select * from employees2 
                            where department_id = wdept_id;
   r_emp c_emp%rowtype;
BEGIN
  open c_emp (30);
  loop
    fetch c_emp into r_emp;
    exit when c_emp%notfound;
    dbms_output.put_line('SICIL NO: ' || r_emp.employee_id || ' , SOYADI: ' || r_emp.last_name);
  end loop;
  close c_emp;
   
  exception when others then
    dbms_output.put_line(sqlcode || ' ' || sqlerrm);
END;

