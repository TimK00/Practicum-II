select  
     prj.name                    as 'ProjectName'
    ,pa.name                     as 'SSISPackageName'
    ,op.parameter_name           as 'ParmaterName'
    ,op.design_default_value     as 'ConnectionString'
	,op.referenced_variable_name
from    
     catalog.object_parameters   op
join catalog.projects            prj
  on op.project_id               = prj.project_id
join [catalog].[packages]        pa 
  on pa.project_id               = prj.project_id
where op.parameter_name          like '%ConnectionString%'
-- and convert(varchar(1000),op.design_default_value) like '%Application%'
-- and pa.name like '%PS_CF_ATTRIB_TBL%'
and pa.package_guid = '{6A2EA4F7-F419-4083-BB39-BA9673222ECF}'
and op.parameter_name like '%f92%'


-- look at ConnnectionString fields with "Application Name = {%}"