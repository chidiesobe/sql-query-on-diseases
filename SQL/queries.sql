
1.
SELECT
    locations.entity AS location,
    years.year,
    infectious_diseases.d_lower_respiratory_infections
FROM
    infectious_diseases
INNER JOIN years ON infectious_diseases.year = years.year
INNER JOIN locations ON infectious_diseases.code = locations.code
ORDER BY
     locations.entity, years.year;

2. 
SELECT
    locations.entity AS locations_entity,
    years.year,
    AVG(noncommunicable_diseases.d_cardiovascular_diseases) AS avg_cardiovascular_prevalence
FROM
    noncommunicable_diseases
INNER JOIN years ON noncommunicable_diseases.year = years.year
INNER JOIN locations ON noncommunicable_diseases.code = locations.code
GROUP BY
    locations.entity, years.year
ORDER BY
    locations.entity, years.year;

3. 
SELECT i.year, l.entity AS location, 
       i.d_malaria, i.d_tuberculosis, i.d_meningitis -- Add more diseases as needed
FROM infectious_diseases i
JOIN locations l ON i.code = l.code
WHERE i.year BETWEEN 2010 AND 2020 -- Change the year range
ORDER BY i.year, l.entity;


4. 
CREATE VIEW correlation_view AS
SELECT
    l.entity AS location,
    COUNT(*) AS num_samples,
    SUM(m.d_hiv_aids) AS sum_hiv_aids,
    SUM(e.d_drowning) AS sum_drowning,
    SUM(m.d_hiv_aids * e.d_drowning) AS sum_product_hiv_drowning,
    SUM(m.d_hiv_aids * m.d_hiv_aids) AS sum_squared_hiv_aids,
    SUM(e.d_drowning * e.d_drowning) AS sum_squared_drowning
FROM
    mental_health_and_substance_abuse m
JOIN
    external_causes e ON m.year = e.year AND m.code = e.code
JOIN
    locations l ON m.code = l.code
WHERE
    m.year = 2018
GROUP BY
    location;

5. 
SELECT
    l.entity AS location,
    SUM(CASE WHEN i.d_malaria  > 100 THEN 1 ELSE 0 END) AS high_malaria_prevalence_locations,
    SUM(CASE WHEN i.d_tuberculosis > 50 THEN 1 ELSE 0 END) AS high_tb_prevalence_locations,
    -- Add more diseases and conditions for categorization as needed
    COUNT(*) AS total_locations
FROM
    infectious_diseases i
JOIN
    locations l ON i.code = l.code
WHERE
    i.year = 2018
GROUP BY
    location;