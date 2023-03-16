-- models/dbt_notNullCheck_nullValues.sql
{{
  config(
    materialized='table'
  )
}}
SELECT *
FROM `eda-at-project.dawn_datalake.etl_tx_txn_re`
where transaction_id is null
or spend_value is null
or bonus_points is null
or outlet_id is null