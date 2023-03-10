-- TEST ADINDA VE ??FRES? TEST OLAN B?R KULLANICI OLU?TURULACAK. 
-- VARSAYILAN TABLESPACE'S? USERS, GEC?C? TABLESPACE'S? TEMP OLACAK.
-- OLU?TURULAN KULLANICI HESABINA ?LK G?R?? YAPARKEN ??DRES?N? DE???T?RECEK.
-- KULLANICININ K?L?D? KAPALI OLACAK.
CREATE USER TEST IDENTIFIED BY TEST
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
PASSWORD EXPIRE
ACCOUNT LOCK
;

-- TEST KULLANICISININ K?L?D? A?ILDI.
ALTER USER TEST ACCOUNT UNLOCK;

-- TEST KULLANICISINA VER?TABANINA BA?LLANMA YETK?S? VERME.
GRANT CONNECT TO TEST;

-- TEST KULLANICISINA KAYNAK KULLANMA VE DBA YETK?S? VERME.
GRANT RESOURCE, DBA TO TEST;

-- TEST KULLANICISINDAN VER?TABANINA BA?LANMA YETK?S?N? GER? ALMA.
REVOKE CONNECT FROM TEST;

-- TEST KULLANICISINDAN KAYNAK KULLANMA VE DBA YETK?S?N? GER? ALMA.
REVOKE RESOURCE, DBA FROM TEST;

-- TEST KULLANICISINI S?LME.
DROP USER TEST CASCADE;
