{% test minimum_row_count(model, min_row_count) %} --Dosent have column name as input, instead takes minimum row count as input and checks if the model has at least that many rows
{{config(severity='warn')}}  --This test will not fail the dbt run, but will give a warning if it fails. This is useful for tests that are not critical, but we still want to be aware of if they fail.
  SELECT COUNT(*) AS cnt
  FROM {{ model }}
  HAVING COUNT(*) < {{ min_row_count }}
{% endtest %}