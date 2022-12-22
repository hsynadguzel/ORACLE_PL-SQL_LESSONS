select
SYSDATE
,SYS_CONTEXT('USERENV','TERMINAL') TERMINAL
,SYS_CONTEXT('USERENV','SESSIONID') SESSIONID
,SYS_CONTEXT('USERENV','INSTANCE') INSTANCE
,SYS_CONTEXT('USERENV','ENTRYID') ENTRYID
,SYS_CONTEXT('USERENV','ISDBA') ISDBA
,SYS_CONTEXT('USERENV','CURRENT_USER') CURRENT_USER
,SYS_CONTEXT('USERENV','CURRENT_USERID') CURRENT_USERID
,SYS_CONTEXT('USERENV','SESSION_USER') SESSION_USER
,SYS_CONTEXT('USERENV','SESSION_USERID') SESSION_USERID
,SYS_CONTEXT('USERENV','PROXY_USER') PROXY_USER
,SYS_CONTEXT('USERENV','PROXY_USERID') PROXY_USERID
,SYS_CONTEXT('USERENV','DB_NAME') DB_NAME
,SYS_CONTEXT('USERENV','HOST') HOST
,SYS_CONTEXT('USERENV','OS_USER') OS_USER
,SYS_CONTEXT('USERENV','EXTERNAL_NAME') EXTERNAL_NAME
,SYS_CONTEXT('USERENV','IP_ADDRESS') IP_ADDRESS
,SYS_CONTEXT('USERENV','NETWORK_PROTOCOL') NETWORK_PROTOCOL
,SYS_CONTEXT('USERENV','AUTHENTICATION_TYPE') AUTHENTICATION_TYPE
from dual;
