-- models/dbt_UniquenessCheck_overview.sql
{{
  config(
    materialized='table'
  )
}}

with table1 as (
  select transaction_id, count(*) as Number_of_Occurrences
  from `eda-at-project.dawn_datalake.etl_tx_txn_re`
  group by 1
  having count(*) >= 1
)

select sum(case when Number_of_Occurrences = 1 then 1 else 0 end) as non_duplicate_rows,
sum(case when Number_of_Occurrences > 1 then 1 else 0 end) as duplicate_rows
 from table1

