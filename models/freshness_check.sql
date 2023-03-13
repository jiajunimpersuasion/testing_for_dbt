{{ config(materialized='table') }}


SELECT * except(creation_time, last_modified_time), 
FORMAT_TIMESTAMP('%Y-%m-%d %r', TIMESTAMP_MILLIS(creation_time)) as creation_time, 
FORMAT_TIMESTAMP('%Y-%m-%d %r', TIMESTAMP_MILLIS(last_modified_time)) as last_modified_time
FROM `test-jiajun-project.horangi_testing.__TABLES__`