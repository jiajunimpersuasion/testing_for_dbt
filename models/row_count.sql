{{ config(materialized='table') }}


select count(*) as total_row_count
from `test-jiajun-project.horangi_testing.horangi_all_data`
