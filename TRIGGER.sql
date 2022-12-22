-- TRIGGER
-- DML TRIGGER: Insert Update Delete
-- SYSTEM TRIGGER: Create Drop Alter Logon Logoff Shutdown Startup

-- Mesai saatleri disinda DML islemleri yapilmasini onleyen trigger yazalim.

CREATE OR REPLACE TRIGGER dml_dept 
       BEFORE INSERT OR UPDATE OR DELETE ON departments
       
BEGIN
  IF TO_CHAR (sysdate, 'HH24:MI') not between '08:00' and '18:00'
    or TO_CHAR (sysdate, 'DAY') in ('CUMARTESI', 'PAZAR') then
    raise_application_error(-20205, 'Mesai saatleri dýþýnda veri iþlemi yapýlamaz.');
  END IF;
END;
/

delete from departments where department_id = 60;
