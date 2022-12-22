-- CURSOR
-- IMPLICIT CURSOR: ROWCOUNT, NOTFOUND, FOUND
-- EXPLICIT CURSOR: DEVELOPER DEFINED CURSOR

DECLARE
   -- Cursor c_emp IS select * from employees2;
   i number := 0;
BEGIN

  /*for r_oku in c_emp loop
    dbms_output.put_line('SIRA NUMARASI: ' || c_emp%rowcount
                                || ', SICIL NUMARASI: ' || r_oku.department_id
                                || ', SOYADI: ' || r_oku.last_name
                                || ', MAAS: ' || r_oku.salary
                                );
  end loop;*/
  
  for r_oku in (select * from employees2) loop
    i := i + 1;
    dbms_output.put_line('SIRA NUMARASI: ' || i
                                || ', SICIL NUMARASI: ' || r_oku.department_id
                                || ', SOYADI: ' || r_oku.last_name
                                || ', MAAS: ' || r_oku.salary
                                );
  end loop;
  
  exception when others then
    dbms_output.put_line(sqlcode || ' ' || sqlerrm);
END;

