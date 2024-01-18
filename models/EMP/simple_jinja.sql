{#This is sample Jinja code to test how it works#}
{% set max_number = 100 %}
{% for i in range(max_number) %}
    SELECT {{i}} AS NUMBER
    {% if not loop.last %}
      UNION
    {% endif %}
{% endfor %}
  