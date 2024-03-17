#use PROJECT1;

#Develop Joins to get the full tables
select * from absent_at_work A
left join salary_table B
on A.ID = B.ID
left join reasons_table C
on A.Reason_for_absence = C.Number;

#Find the healthiest
select * from PROJECT1.absent_at_work
where Social_drinker = 0 and Social_smoker = 0
and Body_mass_index < 25 and 
Absenteeism_time_in_hours < (select avg (Absenteeism_time_in_hours) from absent_at_work);

#Compensation rate increase for non-smokers
select count(*) from absent_at_work 
where Social_smoker = 0;

select count(*) as Non_Smokers from absent_at_work 
where Social_smoker = 0;

#optimize this query/budget $983,221/8(hrs/day)*5(days/week)*52(weeks/year)=2080
#2080*686=1426880
#983221/1426800 = 0.68 increase per hour
select count(*) as Non_Smokers from absent_at_work 
where Social_smoker = 0;

#optimize query
select A.ID, C.Reason,Month_of_absence,Body_mass_index,

case when Body_mass_index <  18.5 then 'Underweight'
	 when Body_mass_index between 18.5 and 25 then 'Healthyweight'
	 when Body_mass_index between 25 and 30 then 'Overweight'
     when Body_mass_index > 30 then 'Obese'
     ELSE 'Unknown' end as BMI_Category,

case when Month_of_absence IN(12,1,2) then 'Winter'
	 when Month_of_absence IN(3,4,5) then 'Spring'
     when Month_of_absence IN(6,7,8) then 'Summer'
     when Month_of_absence IN(9,10,11) then 'Fall'
     else 'Unknown' END as Season_Names,
Month_of_Absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_perday,
Absenteeism_time_in_hours
from absent_at_work A
left join salary_table B
on A.ID = B.ID
left join reasons_table C
on A.Reason_for_absence = C.Number;
















