{% test positive_values(model, column_name) %}      --Jinja test statement to check if values in a column are positive
  SELECT *
  FROM {{ model }}
  WHERE {{ column_name }} <= 0
{% endtest %}