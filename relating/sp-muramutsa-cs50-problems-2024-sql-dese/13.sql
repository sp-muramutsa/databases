SELECT schools.type,
       AVG(graduation_rates.graduated) AS avg_graduation_rate
FROM schools
JOIN graduation_rates ON schools.id = graduation_rates.school_id
WHERE schools.state = 'Massachusetts'
GROUP BY schools.type;
