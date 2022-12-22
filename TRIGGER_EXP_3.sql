-- TRIGGER
-- DML TRIGGER: Insert Update Delete
-- SYSTEM TRIGGER: Create Drop Alter Logon Logoff Shutdown Startup

-- Audit - LOG trigger yazalim.
-- Regions tablosu üzerinde yapýlan dml iþlemlerinin log'unu tutalým.

CREATE TABLE regions_log(
     region_id number
    ,region_name varchar2(25)
    ,kim varchar2(30)
    ,ne_zaman date
    ,ne_yapti varchar2(10)
);
commit;
/

CREATE OR REPLACE TRIGGER regions_audit_trg
       AFTER INSERT OR UPDATE OR DELETE ON regions 
       FOR EACH ROW
DECLARE
  wislem varchar2(10);
BEGIN
  wislem := case
            when INSERTING  then 'INSERT'
            when UPDATING  then 'UPDATE'
            when DELETING then 'DELETE'
            END;
            
  If INSERTING then
    insert into regions_log (region_id, region_name, kim, ne_zaman, ne_yapti) 
           values (:NEW.region_id, :NEW.region_name, USER, sysdate, wislem );
  end if;
  
  If UPDATING then
    insert into regions_log (region_id, region_name, kim, ne_zaman, ne_yapti) 
           values (:OLD.region_id, :OLD.region_name, USER, sysdate, wislem );
    
    insert into regions_log (region_id, region_name, kim, ne_zaman, ne_yapti) 
           values (NVL(:NEW.region_id, :OLD.region_id), 
                   NVL(:NEW.region_name, :OLD.region_name), USER, sysdate, wislem || ' NEW');
  end if;
  
  If DELETING then
    insert into regions_log (region_id, region_name, kim, ne_zaman, ne_yapti) 
           values (:OLD.region_id, :OLD.region_name, USER, sysdate, wislem );
  end if;
END;
/

update regions set region_name = 'Europe' where region_id = 1;
/


