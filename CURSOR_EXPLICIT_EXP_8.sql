-- CURSOR
-- IMPLICIT CURSOR: ROWCOUNT, NOTFOUND, FOUND
-- EXPLICIT CURSOR: DEVELOPER DEFINED CURSOR

-- locations --> departments --> employees
DECLARE
   Cursor c_loc IS select location_id, city from locations order by city;
   r_loc c_loc%rowtype;
   
   Cursor c_dept (p_loc_id departments.LOCATION_ID%type) IS 
           select department_id, department_name 
           from departments 
           where LOCATION_ID = p_loc_id 
           order by department_name;
   r_dept c_dept%rowtype;
   
   Cursor c_emp (p_dept_id employees.department_id%type) IS 
          select employee_id, first_name || ' ' || last_name as AdSoyad, hire_date, job_id
          from employees
          where department_id = p_dept_id
          order by employee_id;
   r_emp c_emp%rowtype;
BEGIN
  open c_loc;
  loop
    fetch c_loc into r_loc;
    exit when c_loc%notfound;
    dbms_output.put_line('LOCATION_ID: ' || r_loc.location_id || ' , CITY: ' || r_loc.city);
  
    open c_dept(r_loc.location_id);
    loop
      fetch c_dept into r_dept;
      exit when c_dept%notfound;
      dbms_output.put_line(' ' || 'DEPARTMEN_ID: ' || r_dept.department_id || ' , DEPARTMENT NAME: ' || r_dept.department_name);
    
      open c_emp(r_dept.department_id);
      loop
        fetch c_emp into r_emp;
        exit when c_emp%notfound;
        dbms_output.put_line('  '   || 'EMPLOYEE_ID: ' || r_emp.employee_id 
                                    || ' , ADI SOYADI: ' || r_emp.AdSoyad
                                    || ' , GIRIS TARIHI: ' || r_emp.hire_date
                                    || ' , JOB_ID: ' || r_emp.job_id);
        
      end loop;
      close c_emp;
    
    end loop;
    close c_dept;
      
  end loop;
  close c_loc;
   
  exception when others then
    dbms_output.put_line(sqlcode || ' ' || sqlerrm);
END;

 
