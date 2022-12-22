-- DROP PROCEDURE

CREATE OR REPLACE PROCEDURE proc_emp_oku (p_dept departments.department_id%type)
       IS wdeptadi departments.department_name%type;
       BEGIN 
         For i in (SELECT employee_id, first_name from employees where department_id = p_dept) Loop
           dbms_output.put_line('--------------------------------------------------');
           dbms_output.put_line(p_dept || '-' || d_name(p_dept));
           dbms_output.put_line(i.employee_id || ' ' || i.first_name);
         End Loop;
       END;
/

DROP PROCEDURE proc_emp_oku;
