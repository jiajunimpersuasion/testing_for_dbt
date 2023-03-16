-- models/dbt_RowCountCheck.sql
{{
  config(
    materialized='table'
  )
}}

select count(*) as Row_Count
from `eda-at-project.dawn_datalake.etl_tx_txn_re`