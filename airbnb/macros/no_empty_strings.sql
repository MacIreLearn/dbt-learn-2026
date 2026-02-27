{% macro no_empty_strings(model) %}
{% set string_cols = [] %}
{%- for col in adapter.get_columns_in_relation(ref(model)) -%}
  {%- if col.is_string() -%}
    {%- do string_cols.append(col.name) -%}
  {%- endif -%}
{%- endfor -%}
--SELECT * FROM {{ ref(model) }}
--WHERE
{%- for col_name in string_cols %}
  {{ col_name }} is not null and {{ col_name }} <> ''{{ " and" if not loop.last else "" }}
{%- endfor %}
{% endmacro %}