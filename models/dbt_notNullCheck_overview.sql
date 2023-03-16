-- models/dbt_notNullCheck_overview.sql
{{
  config(
    materialized='table'
  )
}}
with tmp as
(SELECT *
FROM `eda-at-project.dawn_datalake.etl_tx_txn_re`
where transaction_id is null
or spend_value is null
or bonus_points is null
or outlet_id is null)

SELECT case when count(*) = 0 then 'Pass' else null end as CheckStatus from tmp