-- STANDALONE STORED PROCEDURE
-- Departments tablosuna haftasonlari kayit girisini engelleyen bir Procedure yazalim.
CREATE OR REPLACE PROCEDURE proc_ins_dept (
          d_id      in departments.department_id%type,
          d_name    in departments.department_name%type, -- default 145,
          d_mng_id  in departments.manager_id%type,
          d_lctn_id in departments.location_id%type,
          d_result  out varchar2
       )IS
       Begin
         Begin
          IF TO_CHAR(sysdate, 'DAY') IN ('CUMARTESI', 'PAZAR') THEN
              d_result := 'PAZAR ve PAZARTSÝ KAYIT GÝRÝLEMEZ!';
          ELSE 
              INSERT INTO departments VALUES (d_id, d_name, d_mng_id, d_lctn_id);
              d_result := 'KAYIT ISLEMI BASARILI.';
              commit;
          END IF;
          Exception when others then
           d_result := sqlcode || ' ' || sqlerrm; 
         End;
       END proc_ins_dept;
/

DECLARE
  wresult varchar2(3000);
BEGIN 
  proc_ins_dept(d_id => 310, d_name => 'SCHOOL', d_mng_id => null, d_lctn_id => 1700, d_result => wresult);
  dbms_output.put_line(wresult);
END;

/
DROP PROCEDURE proc_ins_dept;
