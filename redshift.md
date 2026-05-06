# REDSHIFT
create schema if not exists sagemaker_ml_outputs;

create role role_sagemaker_ml_outputs;

grant usage, create on schema sagemaker_ml_outputs to role role_sagemaker_ml_outputs;

grant select, insert, update, delete on all tables in schema sagemaker_ml_outputs to role role_sagemaker_ml_outputs;

alter default privileges in schema sagemaker_ml_outputs
grant select, insert, update, delete on tables
to role role_sagemaker_ml_outputs;






grant usage on schema emrg to role role_sagemaker_ml_outputs;
grant select on all tables in schema emrg to role role_sagemaker_ml_outputs;

alter default privileges in schema emrg
grant select on tables
to role role_sagemaker_ml_outputs;




CREATE USER "IAM:prosper-ai-sagemaker-role" PASSWORD DISABLE;
GRANT ROLE role_sagemaker_ml_outputs TO "IAM:prosper-ai-sagemaker-role";



--to see database roles
SELECT * FROM SVV_ROLES WHERE role_name = 'role_sagemaker_ml_outputs';

--to see rol assigned users
 SELECT * FROM SVV_USER_GRANTS WHERE role_name = 'role_sagemaker_ml_outputs';


--to see database users
SELECT * FROM PG_USER;




CREATE TABLE sagemaker_ml_outputs.test_connection (id int, status varchar(20));
insert into sagemaker_ml_outputs.test_connection(id, status) values (1, 'sagemaker-text-1');
select * from sagemaker_ml_outputs.test_connection tc ;