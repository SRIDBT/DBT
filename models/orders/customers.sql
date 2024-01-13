 --{{ config(materialized='table') }}
WITH CUT AS (SELECT A.C_CUSTKEY,A.C_NAME,A.C_ADDRESS,A.C_NATIONKEY,A.C_PHONE,A.C_ACCTBAL,B.N_NATIONKEY,B.N_REGIONKEY,B.N_NAME
,C.R_REGIONKEY,C.R_NAME,D.S_SUPPKEY,D.S_NAME
FROM CUSTOMER AS A INNER JOIN NATION AS B ON A.C_NATIONKEY=B.N_NATIONKEY
INNER JOIN REGION AS C ON B.N_REGIONKEY=C.R_REGIONKEY
INNER JOIN SUPPLIER AS D WHERE B.N_NATIONKEY=D.S_NATIONKEY LIMIT 6000)
SELECT * FROM CUT
--dbt build --select customers.sql