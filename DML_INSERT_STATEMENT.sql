-- DATA MANIPULATION LANGUAGE
-- INSERT STATEMENT
-- INSERT INTO <TABLE_NAME> VALUES (VAL1, VAL2, VAL3, ...);
-- INSTER INTO <TABLE_NAME> (COL1, COL2, COL3, ...) VALUES (VAL1, VAL2, VAL3, ...);

INSERT INTO REGIONS VALUES (1, 'EUROPE');

INSERT INTO REGIONS (REGION_ID, REGION_NAME) VALUES (2, 'ASIA');

INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES ('TR', 'TURKIYE', 1);
