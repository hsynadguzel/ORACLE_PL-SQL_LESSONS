-- CURSOR
-- IMPLICIT CURSOR: ROWCOUNT, NOTFOUND, FOUND
-- EXPLICIT CURSOR: DEVELOPER DEFINED CURSOR

DECLARE
  wname employees2%rowtype;
BEGIN
  select * into wname from employees2 where employee_id = 100;
  dbms_output.put_line('BULUNAN KAYIT SAYISI' || sql%rowcount);
  
  if sql%notfound then
    dbms_output.put_line('KAYIT BULUNAMADI!');
  else
    dbms_output.put_line('KAYIT BULUNDU.');
  end if;
  
  if sql%found then
    dbms_output.put_line('KAYIT BULUNDU.');
  else
    dbms_output.put_line('KAYIT BULUNAMADI!');
  end if;
  
  exception when others then
    dbms_output.put_line(sqlcode || sqlerrm);
END;
