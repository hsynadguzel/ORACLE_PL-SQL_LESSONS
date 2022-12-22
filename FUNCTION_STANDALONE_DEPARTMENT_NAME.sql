-- Function
-- 1.Nested Function: Unnamed Bloklarda yazilan fonksiyonlar. Veritabaninda saklanmaz.
-- 2.Developer Defined Function: Standalone ya da Package icinde yazilir. Veritabaninda saklanir.


--- Standalone Function ---
-- Numarasi verilen departmanin ismini listeleyecegiz.
CREATE OR REPLACE FUNCTION d_name(p_dept departments.department_id%type)
       RETURN departments.department_name%type
       IS wname departments.department_name%type;
       Begin
         select departments.department_name into wname
         from departments
         where departments.department_id = p_dept;

         RETURN wname;
       End;
/
SELECT d_name(60) FROM DUAL;
