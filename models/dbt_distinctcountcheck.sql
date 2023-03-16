-- models/dbt_DistinctCountCheck.sql
{{
  config(
    materialized='table'
  )
}}
--This check EXCLUDES null values for distinct check
SELECT 
  COUNT(*) AS row_count,
  COUNT(DISTINCT transaction_id) AS distinct_transaction_id,
  case
  when COUNT(*) = COUNT(DISTINCT transaction_id) then 'pass'
  else null
  end as CheckStatus
  FROM `eda-at-project.dawn_datalake.etl_tx_txn_re`
