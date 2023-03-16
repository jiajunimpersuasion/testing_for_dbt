-- models/dbt_StringCheck_overview.sql
{{
  config(
    materialized='table'
  )
}}

with tmp as
(SELECT participant_name, outlet_name
FROM `eda-at-project.dawn_datalake.etl_tx_txn_re`
WHERE REGEXP_CONTAINS(participant_name, r"\P{ASCII}")
OR REGEXP_CONTAINS(outlet_name, r"\P{ASCII}"))  --check for non-ascii characters)

SELECT case when count(*) = 0 then 'Pass' else null end as CheckStatus from tmp