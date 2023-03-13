SELECT distinct(scan_name) as project_name, 
    count(title) as title_encounter,
    sum(case when severity = 'critical' then 1 else 0 end) as critical_severity, 
    sum(case when severity = 'high' then 1 else 0 end) as high_severity,
    sum(case when severity = 'medium' then 1 else 0 end) as medium_severity,
    sum(case when severity = 'low' then 1 else 0 end) as low_severity
FROM `test-jiajun-project.horangi_testing.horangi_all_data`
group by project_name 
order by project_name

