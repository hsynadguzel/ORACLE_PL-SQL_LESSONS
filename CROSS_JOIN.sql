-- JOINS
-- CROSS JOIN - KARTEZYEN ?ARPPIM DEMEK S(A) = N, S(B) = M ?SE S(AXB) = N*M

-- KLAS?K FORMAT
SELECT LAST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS;

-- ANSI FORMAT
SELECT LAST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES JOIN DEPARTMENTS;
