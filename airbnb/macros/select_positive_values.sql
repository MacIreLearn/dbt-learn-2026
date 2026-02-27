{% macro select_positive_values(model_name, column_name) %}
SELECT *
FROM {{ ref(model_name) }}
WHERE {{ column_name }} > 0
{% endmacro %}