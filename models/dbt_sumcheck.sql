-- models/dbt_SumCheck.sql
{{
  config(
    materialized='table'
  )
}}

select round(sum(spend_value),2) as sum_spend_value, sum(bonus_points) as sum_bonus_points, sum(standard_points) as sum_standard_points
from `eda-at-project.dawn_datalake.etl_tx_txn_re`