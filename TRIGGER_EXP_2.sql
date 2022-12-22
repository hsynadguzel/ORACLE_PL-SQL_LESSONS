-- TRIGGER
-- DML TRIGGER: Insert Update Delete
-- SYSTEM TRIGGER: Create Drop Alter Logon Logoff Shutdown Startup

-- Mesai saatleri disinda DML islemleri yapilmasini onleyen trigger yazalim.
-- Standalone Procedure ve Trigger birlikte kullanalim.

CREATE OR REPLACE PROCEDURE dml_guvenlik_kontrol IS
BEGIN
  IF TO_CHAR (sysdate, 'HH24:MI') not between '08:00' and '18:00'
    or TO_CHAR (sysdate, 'DAY') in ('CUMARTESI', 'PAZAR') then
    raise_application_error(-20205, 'Mesai saatleri dýþýnda veri iþlemi yapýlamaz.');
  END IF;
END dml_guvenlik_kontrol;
/

CREATE OR REPLACE TRIGGER dml_dept 
       BEFORE INSERT OR UPDATE OR DELETE ON departments    
BEGIN
  dml_guvenlik_kontrol;
END;
/



delete from departments where department_id = 60;
/

DROP TRIGGER dml_dept;
/

ALTER TRIGGER dml_dept DISABLE;
ALTER TRIGGER dml_dept ENABLE;
/
