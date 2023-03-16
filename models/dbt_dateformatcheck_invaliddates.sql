-- models/dbt_DateFormatCheck_invalidDates.sql
{{
  config(
    materialized='table'
  )
}}

with tmp as
(select transaction_id, cast(transaction_date as string) as transaction_date, cast(process_date as string) as process_date from `eda-at-project.dawn_datalake.etl_tx_txn_re`)

SELECT transaction_id, transaction_date, process_date
FROM tmp
WHERE not REGEXP_CONTAINS(transaction_date,r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\+\d{2}$' ) --YYYY-MM-DD HH:MM:SS TZ)