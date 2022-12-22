-- DROP Function

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

DROP FUNCTION d_name;
