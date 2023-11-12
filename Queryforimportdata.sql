--create join table
select * from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number;

--find the healthiest employees for the bonus
select * from Absenteeism_at_work 
where Social_drinker = 0 and Social_smoker = 0
and Body_mass_index <25 and
Absenteeism_time_in_hours <(select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)

--compensation rate increases for non smokers employee / budget $983,221 so .68 per hour/ 1,414.4 per year
select count(*) as nonsmokers from Absenteeism_at_work
where Social_smoker =0

--optimize the query
select
a.ID,
r.Reason,
Month_of_absence,
Body_mass_index,
CASE WHEN Body_mass_index <18.5 then 'Underweight'
	 WHEN Body_mass_index between 18.5 and 24.9 then 'Healthy Weight'
	 WHEN Body_mass_index between 25 and 30 then 'Overweight'
	 WHEN Body_mass_index >18.5 then 'Obese'
	 ELSE 'Unknown' end as BMI_Category,
CASE WHEN Month_of_absence IN (12,1,2) Then 'Winter'
     WHEN Month_of_absence IN (3,4,5) Then 'Spring'
	 WHEN Month_of_absence IN (6,7,8) Then 'Summer'
	 WHEN Month_of_absence IN (9,10,11) Then 'Fall'
	 ELSE 'Unknown' END as Season_Names,
Seasons,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number;