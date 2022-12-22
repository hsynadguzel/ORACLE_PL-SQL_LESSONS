-- CURSOR
-- IMPLICIT CURSOR: ROWCOUNT, NOTFOUND, FOUND
-- EXPLICIT CURSOR: DEVELOPER DEFINED CURSOR

DECLARE
   Cursor c_emp IS select employee_id, last_name from employees2;
   cw_id employees2.employee_id%type;
   cw_lname employees2.last_name%type;
BEGIN
  open c_emp;
  loop
    fetch c_emp into cw_id, cw_lname;
    exit when c_emp%notfound;
    dbms_output.put_line('SICIL NUMARASI: ' || cw_id || ', SOYADI: ' || cw_lname);
  end loop;
  close c_emp;
  
  exception when others then
    dbms_output.put_line(sqlcode || ' ' || sqlerrm);
END;

