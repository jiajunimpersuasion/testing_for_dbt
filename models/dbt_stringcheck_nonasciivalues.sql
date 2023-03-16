-- models/dbt_StringCheck_nonASCIIvalues.sql
{{
  config(
    materialized='table'
  )
}}

SELECT participant_name, outlet_name
FROM `eda-at-project.dawn_datalake.etl_tx_txn_re`
WHERE REGEXP_CONTAINS(participant_name, r"\P{ASCII}")
OR REGEXP_CONTAINS(outlet_name, r"\P{ASCII}")  --check for non-ascii characters