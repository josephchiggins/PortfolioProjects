--Relational Database Example

--Nurse Data Analyst Technical Screening
 
--Not all facility-posted shifts are eventually requested or completed by a clinician.  A manager wants to know the distribution of pay rates for completed CNA shifts in 2022 for the five metropolitan areas that, in the last six months, posted the greatest number of total nursing shifts in the app.
--1.	Given the below entity-relational diagram, write a SQL query to pull the data from the database.
![image](https://user-images.githubusercontent.com/116229006/201279251-de02fb93-dc11-4a58-806c-04e6940d0666.png)


SELECT dayname(job_posted) AS shifts_day,
COUNT(job_id) AS NumberOfShifts
FROM Job AS a
INNER JOIN Facility AS b
ON a.job_facility_id=b.facility_id
INNER JOIN Metro AS c
ON b.city=c.city
WHERE a.job_license='CNA'
AND job_status='complete'
AND cast(job_posted AS year)=2022
AND job_end BETWEEN CURDATE() - INTERVAL 6 MONTH AND CURDATE()
GROUP BY dayname(job_posted)
ORDER BY COUNT(job_id) DESC;
