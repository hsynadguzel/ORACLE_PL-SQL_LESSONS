-- Function
-- 1.Nested Function: Unnamed Bloklarda yazilan fonksiyonlar. Veritabaninda saklanmaz.
-- 2.Developer Defined Function: Standalone ya da Package icinde yazilir. Veritabaninda saklanir.


--- Nested Function ---
-- Bu ornekte CURSOR, PROCEDURE ve FUNCTION bir arada kullanarak calisanlari listeleyecegiz.
-- Numarasi verilen departmanin ismini ardindan departmanda calisanlari listeleyecegiz.

Declare
   
   CURSOR c_dept IS select departments.department_id from departments;
   r_dept departments.department_id%Type;
   
   FUNCTION dept_name (p_dept DEPARTMENTS.DEPARTMENT_ID%Type) RETURN DEPARTMENTS.DEPARTMENT_NAME%TYPE IS
     wdeptname DEPARTMENTS.DEPARTMENT_NAME%TYPE;
   Begin
     select departments.department_name into wdeptname from departments where departments.department_id = p_dept;
     RETURN wdeptname;
   End;  
   
   PROCEDURE emp_oku (p_dept DEPARTMENTS.DEPARTMENT_ID%Type) IS
   Begin
     dbms_output.put_line('----------------------------------------------------------------');
     dbms_output.put_line(p_dept || ' '  || dept_name(p_dept));
     for i in (select employees.first_name, employees.last_name from employees where employees.department_id = p_dept) loop
       dbms_output.put_line(i.first_name|| ' ' || i.last_name);
     End Loop; 
     dbms_output.put_line('----------------------------------------------------------------');    
   End;
   
Begin
  open c_dept;
  Loop
    fetch c_dept into r_dept;
    exit when c_dept%notfound;
    emp_oku(r_dept);
  end loop;
  close c_dept;
End;
