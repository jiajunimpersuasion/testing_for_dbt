-- models/dbt_FreshnessCheck.sql
{{
  config(
    materialized='table'
  )
}}

SELECT MAX(process_date) as Latest_Timestamp_Data,
  CASE
    WHEN MAX(process_date) IS NULL THEN null
    WHEN TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), MAX(process_date), SECOND) <= 86400 THEN 'Pass'
    ELSE null
  END as CheckStatus
FROM
  `eda-at-project.dawn_datalake.etl_tx_txn_re`