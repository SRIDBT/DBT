with EMP_DPT AS (SELECT EID,EDEPT,CASE WHEN EDEPT='IT' THEN 'DATA ENGINEER' 
                                   WHEN EDEPT='ADMIN' THEN 'OFFICE STAFF'
                                   WHEN EDEPT='SALES' THEN 'SALES EXECUTIVE' END AS DEPT_DESCRIPTION 
                                   FROM  COMP_STG.EMP_DEPT AS B)
SELECT * FROM EMP_DPT
--dbt build --model EMP_DEPT.sql