-- FUNCTION
-- Faktoriyel n! = 1*2*3*...*n

CREATE OR REPLACE FUNCTION faktoriyel(n integer)
       RETURN integer
       IS f_result integer;
       BEGIN
         IF n = 0 THEN
           f_result := 1;
         ELSIF n = 1 THEN
           f_result := 1;
         ELSIF n < 0 THEN
           f_result := null;
         ELSE 
           f_result := n * faktoriyel(n-1);
         END IF;
         
         RETURN (f_result);
       END;
/

SELECT faktoriyel(5) as "FAK." FROM DUAL;     
