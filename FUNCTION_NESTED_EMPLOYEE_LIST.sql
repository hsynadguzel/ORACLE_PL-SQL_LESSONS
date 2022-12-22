-- Function
-- 1.Nested Function: Unnamed Bloklarda yazilan fonksiyonlar. Veritabaninda saklanmaz.
-- 2.Developer Defined Function: Standalone ya da Package icinde yazilir. Veritabaninda saklanir.


--- Nested Function ---
-- Bu ornekte PROCEDURE ve FUNCTION bir arada kullanarak calisanlari listeleyecegiz.
-- Numarasi verilen departmanin ismini ardindan departmanda calisanlari listeleyecegiz.

Declare

   FUNCTION dept_name (p_dept DEPARTMENTS.DEPARTMENT_ID%Type) RETURN DEPARTMENTS.DEPARTMENT_NAME%TYPE IS
     wdeptname DEPARTMENTS.DEPARTMENT_NAME%TYPE;
   Begin
     select departments.department_name into wdeptname from departments where departments.department_id = p_dept;
     RETURN wdeptname;
   End;  
   
   PROCEDURE emp_oku (p_dept DEPARTMENTS.DEPARTMENT_ID%Type) IS
   Begin
     dbms_output.put_line(p_dept || ' '  || dept_name(p_dept));
     for i in (select employees.first_name, employees.last_name from employees where employees.department_id = p_dept) loop
       dbms_output.put_line(i.first_name|| ' ' || i.last_name);
     End Loop;     
   End;
   
Begin
  
   emp_oku(60);
   
End;
