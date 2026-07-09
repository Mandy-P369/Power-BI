Select * from hdata ;
Select patient_race,patient_gender,shift from hdata ;
Select patient_first_initial from hdata ;
Select column_name ,data_type from information_schema.columns where table_name='hdata';

-- Single row Query 
-- Single Row query which compare one values with other values
Select patient_id,
	patient_last_name,
	patient_waittime,
	AVG(patient_waittime) OVER () AS avg_waittime
from hdata where patient_waittime >(select avg(patient_waittime) from hdata);

-- Multiple row Query
-- match against multiple rows 
Select patient_id,
	patient_last_name,
	(Select min(patient_satisfaction_score) from hdata )
	from hdata ;

-- Multiple Column sub query 
select column_name,data_type from information_schema.columns where table_name='hdata';
-- Compare comnbination of values 
Select patient_id,patient_name,patient_waittime
from hdata where 
(patient_satisfaction_score,patient_age) in
(Select patient_satisfaction_score,patient_age from hdata 
where (patient_race,shift) in 
(
	select patient_race,shift from hdata where patient_gender = 'M'
))
order by patient_waittime asc;


alter table hdata rename column patient_last_name to patient_name;
"Find all female patients who have the same race and shift as at least one male patient."
Select h1.patient_id,h1.patient_name,h1.patient_gender
	from hdata h1 
	where h1.patient_gender='F' 
	and exists
	(
		Select 1,h2.patient_name from hdata h2
		where h1.patient_gender = 'M' 
		and h2.patient_race = h1.patient_race
		or h1.shift = h2.shift 
	);


 

