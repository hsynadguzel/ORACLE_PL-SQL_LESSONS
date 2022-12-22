-- CURSOR
-- IMPLICIT CURSOR: ROWCOUNT, NOTFOUND, FOUND
-- EXPLICIT CURSOR: DEVELOPER DEFINED CURSOR

DECLARE
   Cursor c_emp IS select employee_id, last_name from employees2;
   cw_id employees2.employee_id%type;
   cw_lname employees2.last_name%type;
BEGIN
  if not c_emp%isopen then
     open c_emp;
  end if;
  loop
    fetch c_emp into cw_id, cw_lname;
    exit when c_emp%notfound;
    -- exit when not c_emp%found;
    -- exit when c_emp%notfound or c_emp%rowcount > 10;
    dbms_output.put_line('SICIL NUMARASI: ' || cw_id /* c_emp%rowcount */ || ', SOYADI: ' || cw_lname);
  end loop;
  if c_emp%isopen then
     close c_emp;
  end if;
  
  exception when others then
    dbms_output.put_line(sqlcode || ' ' || sqlerrm);
END;

