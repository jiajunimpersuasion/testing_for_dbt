-- models/dbt_SchemaCheck.sql
{{
  config(
    materialized='table'
  )
}}

SELECT column_name,data_type
FROM `eda-at-project.dawn_datalake.INFORMATION_SCHEMA.COLUMNS`
where table_name = 'etl_tx_txn_re'