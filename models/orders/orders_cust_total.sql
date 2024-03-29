 {{ config(materialized='table') }}
 WITH ORD AS (SELECT A.C_CUSTKEY,A.C_NAME,A.N_NAME,B.L_SHIPMODE,C.O_ORDERSTATUS,SUM(C.O_TOTALPRICE) AS TOTAL_COST
  FROM {{ref('customers')}} AS A LEFT JOIN {{ref('lineitems')}} AS B ON A.S_SUPPKEY=B.PS_SUPPKEY AND B.L_ORDERKEY IS NOT NULL
INNER JOIN ORDERS AS C ON A.C_CUSTKEY=C.O_CUSTKEY
GROUP BY A.C_CUSTKEY,A.C_NAME,A.N_NAME,B.L_SHIPMODE,C.O_ORDERSTATUS)
SELECT * FROM ORD
--dbt build --select orders_cust_total.sql dbt build --models +orders_cust_total