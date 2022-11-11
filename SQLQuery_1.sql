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
