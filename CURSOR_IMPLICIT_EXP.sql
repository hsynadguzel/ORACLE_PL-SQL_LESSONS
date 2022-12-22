-- CURSOR
-- IMPLICIT CURSOR: ROWCOUNT, NOTFOUND, FOUND
-- EXPLICIT CURSOR: DEVELOPER DEFINED CURSOR

DECLARE
  wname employees2%rowtype;
BEGIN
  update employees2 set salary = salary * 1.20 where department_id > 90;
  if sql%notfound then
    dbms_output.put_line('GUNCELLEME BASARISIZ.');
  else
    dbms_output.put_line(sql%rowcount || ' KISI GUNCELLENDI.');
  end if;
  
  if sql%found then
    dbms_output.put_line(sql%rowcount || ' KISI GUNCELLENDI. (2)');
  else
    dbms_output.put_line('GUNCELLEME BASARISIZ. (2)');
  end if;
  
  
  delete from employees2 where department_id in (100, 110);
  /*
  if sql%rowcount <> 0 then
    dbms_output.put_line(sql%rowcount || ' KISI SILINDI.');
  else
    dbms_output.put_line('SILME BASARISIZ. (2)');
  end if;
  */
  if sql%notfound then
    dbms_output.put_line('SILME BASARISIZ.');
  else
    dbms_output.put_line(sql%rowcount || ' KISI SILINDI.');
  end if;
  
  if sql%found then
    dbms_output.put_line(sql%rowcount || ' KISI SILINDI. (2)');
  else
    dbms_output.put_line('SILME BASARISIZ. (2)');
  end if;
  
  
  exception when others then
    dbms_output.put_line(sqlcode || ' ' || sqlerrm);
END;
/
