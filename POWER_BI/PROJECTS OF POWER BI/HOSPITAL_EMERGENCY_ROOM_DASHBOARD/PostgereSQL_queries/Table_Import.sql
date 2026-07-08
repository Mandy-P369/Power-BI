CREATE TABLE hdata (
    Patient_id VARCHAR(20) PRIMARY KEY,
    Patient_admission_date DATE NOT NULL,
    Patient_admission_time TIME NOT NULL,
    Patient_first_initial CHAR(1),
    Patient_last_name VARCHAR(40),
    Patient_gender VARCHAR(10),
    Patient_age SMALLINT,
    Patient_race VARCHAR(50), 
    Department_referral VARCHAR(50), 
    Patient_admission_flag BOOLEAN,
    Patient_satisfaction_score SMALLINT,
    Patient_waittime INTEGER,
    Patients_CM NUMERIC(10,2)
);

drop table hdata;

Select * from hdata;

Select * from hdata where extract(hour from patient_admission_time) = 8 ;

Select distinct department_referral,round(avg(patient_satisfaction_score)::numeric,2) as satisfaction_score
from hdata group by department_referral order by satisfaction_score desc ;


-- If hospital have * hours of shift then :
Select * from hdata limit 10; 
alter table hdata add column shift varchar(40);
Select distinct patient_admission_time from hdata ;

Select  column_name,data_type from information_schema.columns where table_name = 'hdata';

update hdata set shift = 
	case 
		when patient_admission_time >= '06:00:00' and patient_admission_time <='14:00:00'
		then 'Morning'
		when patient_admission_time >= '14:00:00' and patient_admission_time<='20:00:00'
		then 'Evening'
		else 'Night'
		end;

Select * from hdata;

select distinct shift as patient_shift,round(avg(Patient_satisfaction_score)::numeric,2) AS average_satisfaction_score
from hdata group by patient_shift;

Select patient_admission_time from hdata ;

Select distinct patient_admission_time, count(patient_id) as Total_patients from hdata
group by patient_admission_time order by Total_patients ; 

create table patient_shift as (
Select
	case 
	when patient_admission_time>='04:00:00' and  patient_admission_time<='10:00:00'
	then  'morning'
	when patient_admission_time>='10:00:00' and  patient_admission_time<='16:00:00'
	then 'Noon'
	when patient_admission_time>='16:00:00' and patient_admission_time<='22:00:00'
	then 'evening'
	else 'night'
	end as patient_shift,count(*) as Total_patients
from hdata group by patient_shift order by Total_patients);

Select * from patient_shift ; 

Select patient_shift ,total_patients,
dense_rank() over(order by total_patients) as "dense_rank",
lag(total_patients) over(order by total_patients),
(total_patients-lag(total_patients) over(order by total_patients)) as "Current_shift_vs_previous_patients"
from patient_shift ;

Select patient_shift ,total_patients,
dense_rank() over(order by total_patients) as "dense_rank",
lag(total_patients,1) over(order by total_patients)
from patient_shift ;

select 








