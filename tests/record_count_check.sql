--define the expected record count for each table
{% set expected_counts = {'EMP_S':11,'EMP_D':1} %}
--Test the count record in each table
{% for table,expected_count in expected_counts.items() %}
select '{{ table }}' as table_name,
       (select count(*) from {{source('landing', table )}}) as record_count,{{expected_count}} as expected_count
       where (select count(*)  from {{source('landing', table )}} ) < {{expected_count}}
       {%if not loop.last %} UNION ALL {% endif %}
{% endfor %}