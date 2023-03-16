-- models/dbt_DateFormatCheck_overview.sql
{{
  config(
    materialized='table'
  )
}}

with tmp as
(select cast(transaction_date as string) as transaction_date, cast(process_date as string) as process_date from `eda-at-project.dawn_datalake.etl_tx_txn_re`),

tmp2 as
(SELECT transaction_date, process_date
FROM tmp
WHERE not REGEXP_CONTAINS(transaction_date,r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\+\d{2}$' ) --YYYY-MM-DD HH:MM:SS TZ)
or not REGEXP_CONTAINS(process_date,r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\+\d{2}$' )) --YYYY-MM-DD HH:MM:SS TZ)

SELECT case when count(*) = 0 then 'Pass' else null end as CheckStatus from tmp2