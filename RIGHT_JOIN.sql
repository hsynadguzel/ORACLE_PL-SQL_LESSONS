-- JOINS
-- RIGHT JOIN 

-- KLAS?K FORMAT
SELECT R.REGION_ID, R.REGION_NAME, C.COUNTRY_ID, C.COUNTRY_NAME, L.CITY
FROM REGIONS R, COUNTRIES C, LOCATIONS L
WHERE R.REGION_ID(+) = C.REGION_ID
AND C.COUNTRY_ID(+) = L.COUNTRY_ID;


-- ANSI FORMAT
SELECT R.REGION_ID, R.REGION_NAME, C.COUNTRY_ID, C.COUNTRY_NAME, L.CITY
FROM REGIONS R RIGHT OUTHER JOIN COUNTRIES C ON R.REGION_ID = C.REGION_ID(+)
RIGHT JOIN LOCATIONS L ON C.COUNTRY_ID = L.COUNTRY_ID(+);
