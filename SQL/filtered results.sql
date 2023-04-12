/****** Script for SelectTopNRows command from SSMS  ******/
declare @lastwo datetime
declare @now datetime
set @now = getdate()
set @lastwo = dateadd(day,-2,@now)

SELECT

	ei.execution_id
	,ei.folder_name
	,ei.project_name
	,ei.package_name
	,ei.environment_folder_name
	,epv.parameter_data_type
	,epv.parameter_name
	,epv.parameter_value
	,ex.executable_name
	,ex.executable_guid
	,ex.package_path
	,ei.project_lsn
	,ei.executed_as_name
	,ei.object_type
	,ei.object_id as obj_id
	,ei.status
	,ei.process_id
	,ei.start_time
	,ei.end_time


  FROM [SSISDB].[internal].[execution_info] ei
  join [SSISDB].[catalog].[execution_parameter_values] epv
  on ei.execution_id = epv.execution_id
  join [SSISDB].[catalog].[executables] ex
  on ei.execution_id = ex.execution_id

  where ei.end_time BETWEEN @lastwo and @now
  and epv.parameter_value <> ''
  and epv.parameter_value <> 0
  and ex.executable_name like '%HSP_ACCESS_CONTROL%'
  -- where ei.package_name like '%Common%' and parameter_name like '%String%'

  --connections in [parameter_name] and [parameter_value] verify with [package_path]
  --look at [internal].[packages]
  --should find a way to group these by tabular model they support