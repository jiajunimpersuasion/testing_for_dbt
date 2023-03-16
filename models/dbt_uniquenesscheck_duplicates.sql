-- models/dbt_UniquenessCheck_duplicates.sql
{{
  config(
    materialized='table'
  )
}}

  select transaction_id, count(*) as Number_of_Occurrences
  from `eda-at-project.dawn_datalake.etl_tx_txn_re`
  group by 1
  having count(*) > 1
