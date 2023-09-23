# Table of Contents
- [Project Title](#project-title)
- [Project Objectives](#project-objectives)
- [Technologies](#technologies)
- [Installation](#installation)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Contributing](#contributing)
- [License](#license)
- [Questions](#project-questions)

# [ANALYSIS OF ANNUAL NUMBER OF DEATHS AND CAUSES](#project-title)
Analysis of the Annual Number of Deaths and Causes, HIV/AIDS emerges as one of the world's deadliest infectious diseases. This is particularly evident in Sub-Saharan Africa, where the disease has significantly impacted health outcomes and life expectancy in recent decades. Analysis of this records can provide insight and answer questionable areas exisiting to the world. In this project we use SQL to showcase the type of information that can be gotten from querying a database and also the possiblity of taking raw .CSV data and converting it into database tables for better management and administration. 


# [Technologies](#technologies)
The project utilizes the following technologies:

1. **MySQL**: Database system for storing and managing structured data.
2. **Sequel Pro**: Tool for interacting with and managing MySQL databases.
3. **SQL**: Language for querying and managing databases.
4. **Python**: Versatile programming language used for various tasks, including data analysis.
5. **Pandas**: Python library for data manipulation and analysis, especially with tabular data.

These technologies are fundamental in performing data analysis, preprocessing, and evaluation within the project.

# [Installation](#installation)
The installation is straightforward and will require you only to run the command below if you decide to run it within a virtual environment (if you do not wish to overwrite existing installations) or in the global environment of your computer's system.
 
 `pip install -r requirements.txt`

This command will read the **requirements.txt** file and install all the listed dependencies, including joblib, matplotlib, numpy, pandas, seaborn, and sklearn since the time module is a fundamental part of Python. The installation will be done using the most recent version of the libraries at the time of installation since versions are not included in the **requirement.txt**.

There is an option to install each library in the requirements.txt file individually by typing **pip install** followed by the library name as shown below. 

`pip install pandas`

# [Usage](#usage)
The fastest way to get this preprocessing script of this project running would be to install [Anacoda](https://www.anaconda.com/). After the installation, you open the Jupyter Notebook and open the folder containing the .ipynb file.

# [Folder Structure](#folder-structure)
- **disease/**
  - preprocessing/
    - split_dataset/
    - dataset/
    - precessing.ipynb
  - README.md  
  - SQL/
    - create_db_table.sql
    - disease.sql
  - md/ 
    - CODE_OF_CONDUCT.md    
  - requirements.txt
  - quries.sql

# [Contributing](#contributing)
We welcome contributions to improve this project! To contribute, follow these steps:
1. Fork this repository.
2. Create a new branch: `git checkout -b feature/your-feature-name`.
3. Make and commit your changes: `git commit -m 'Add feature'`.
4. Push to the branch: `git push origin feature/your-feature-name`.
5. Submit a pull request.

## Pull Request Guidelines
- Ensure your code follows the project's style and conventions.
- Explain the changes you've made and briefly overview the problem you're solving.
- Ensure your commits have clear messages.

## Code of Conduct
We have a [Code of Conduct](md/CODE_OF_CONDUCT.md). Please follow it in all your interactions with the project.

## Reporting Issues
If you encounter any issues with the project or would like to suggest enhancements, please open an issue on GitHub or contact me via my social media handles, Twitter (X): @chidiesobe or Instagram @ceesobe. The case will be reviewed and addressed accordingly.

## Contact
If you have any questions, need further assistance, or are just passing by, please contact me via my social media handles, Twitter (X): @chidiesobe or Instagram @ceesobe.

## [License](#license)
This project is licensed under the [MIT License](https://opensource.org/license/mit/).

# [Questions](#project-questions)
1. What are the trends in lower respiratory infections (d_lower_respiratory_infections) over the years for specific locations (code) in the database?
```sql
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
```
This query selects the location code, year, and the number of lower respiratory infections for each year and location from the infectious_diseases table, joining it with the years and locations tables.

**Sample result:**
| Location     | Year | Lower Respiratory Infections |
|--------------|------|------------------------------|
| Afghanistan  | 1990 | 23741                        |
| Afghanistan  | 1991 | 24504                        |
| Afghanistan  | 1992 | 27404                        |
| Afghanistan  | 1993 | 31116                        |
| Afghanistan  | 1994 | 33390                        |


2. How has the prevalence of cardiovascular diseases (d_cardiovascular_diseases) changed over the years in different locations?
```sql
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
```
This query calculates the average prevalence of cardiovascular diseases (d_cardiovascular_diseases) for each year and location, using the noncommunicable_diseases table. The results are grouped by location entity and year, and the average prevalence is computed for each group. The results are then ordered by location entity and year.

**Sample result**
| Location              | Year | Average Cardiovascular Prevalence |
|-----------------------|------|-----------------------------------|
| African Region (WHO)  | 2017 | 2,942,417.83                      |
| African Region (WHO)  | 2018 | 3,013,553.67                      |
| African Region (WHO)  | 2019 | 3,086,453.50                      |
| Albania               | 1990 | 6,701.00                          |
| Albania               | 1991 | 6,903.00                          |
| Albania               | 1992 | 6,699.00                          |
| Albania               | 1993 | 6,480.00                          |


3. What is the trend in reported cases of infectious diseases (malaria, tuberculosis, meningitis, etc.) across different locations for the years 2010 to 2020?
```sql
SELECT i.year, l.entity AS location, 
       i.d_malaria, i.d_tuberculosis, i.d_meningitis -- Add more diseases as needed
FROM infectious_diseases i
JOIN locations l ON i.code = l.code
WHERE i.year BETWEEN 2010 AND 2020 -- Change the year range
ORDER BY i.year, l.entity;
```
This query will provide a table showing the reported cases of infectious diseases (malaria, tuberculosis, meningitis, etc.) for each location in the years 2010 to 2020.

**Sample result**
| Year | Location              | Malaria | Tuberculosis | Meningitis |
|------|-----------------------|---------|--------------|------------|
| 2010 | Afghanistan           | 377     | 4,416        | 2,410      |
| 2010 | African Region (WHO)  | 804,031 | 422,921      | 182,351    |
| 2010 | African Region (WHO)  | 2,675   | 22,379       | 9,484      |
| 2010 | African Region (WHO)  | 3,304   | 128,188      | 14,772     |
| 2010 | African Region (WHO)  | 16,540  | 107,765      | 39,024     |
| 2010 | African Region (WHO)  | 83,267  | 643,285      | 74,963     |
| 2010 | African Region (WHO)  | 1       | 40,118       | 6,089      |
| 2010 | Albania               | 0       | 10           | 16         |
| 2010 | Algeria               | 0       | 499          | 399        |
| 2010 | American Samoa        | 0       | 1            | 1          |


4. What is the correlation between reported cases of HIV/AIDS and drowning incidents in different locations for the year 2018? How does this correlation vary across different regions?

```sql
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
```
The code creates a view that calculates various statistics (counts, sums, products, and squared values) related to HIV/AIDS and drowning incidents for each location in the year 2018. The view is named correlation_view and can be used to easily access and analyze these calculated statistics.

**Sample Result**
| Location              | Num Samples | Sum HIV/AIDS | Sum Drowning | Sum Product HIV Drowning | Sum Squared HIV/AIDS | Sum Squared Drowning |
|-----------------------|-------------|--------------|--------------|--------------------------|-----------------------|----------------------|
| Afghanistan           | 1           | 291          | 1,669        | 485,679                  | 84,681                | 2,785,561            |
| African Region (WHO)  | 36          | 5,352,282    | 1,440,360    | 214,144,802,820           | 2,695,475,363,706      | 86,725,292,352       |
| Albania               | 1           | 2            | 37           | 74                       | 4                     | 1,369                |
| Algeria               | 1           | 275          | 534          | 146,850                  | 75,625                | 285,156              |
| American Samoa        | 1           | 0            | 4            | 0                        | 0                     | 16                   |
| Andorra               | 1           | 3            | 0            | 0                        | 9                     | 0                    |
| Angola                | 1           | 16,728       | 797          | 13,332,216               | 279,825,984           | 635,209              |
| Antigua and Barbuda   | 1           | 8            | 4            | 32                       | 64                    | 16                   |
| Argentina             | 1           | 1,796        | 570          | 1,023,720                | 322,561               | 324,900              |
| Armenia               | 1           | 20           | 44           | 880                      | 400                   | 1,936                |
| Australia             | 1           | 71           | 196          | 13,916                   | 5,041                 | 38,416               |
| Austria               | 1           | 36           | 55           | 1,980                    | 1,296                 | 3,025                |


5. How does the prevalence of infectious diseases (e.g., malaria, tuberculosis, meningitis) vary in different locations for the year 2018? Can we categorize the locations based on disease prevalence?

```sql
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
```
We are using a CASE statement to categorize locations based on disease prevalence thresholds (e.g., high malaria prevalence if reported cases are greater than 100). Adjust the thresholds and conditions based on your actual data and research requirements.

| Location              | High Malaria Prevalence Locations | High TB Prevalence Locations | Total Locations |
|-----------------------|-----------------------------------|-------------------------------|-----------------|
| Afghanistan           | 1                                 | 1                             | 1               |
| African Region (WHO)  | 5                                 | 6                             | 6               |
| Albania               | 0                                 | 0                             | 1               |
| Algeria               | 0                                 | 1                             | 1               |
| American Samoa        | 0                                 | 0                             | 1               |
| Andorra               | 0                                 | 0                             | 1               |
| Angola                | 1                                 | 1                             | 1               |
| Antigua and Barbuda   | 0                                 | 0                             | 1               |
| Argentina             | 0                                 | 1                             | 1               |
| Armenia               | 0                                 | 1                             | 1               |



*DATASOURCE: https://ourworldindata.org/hiv-aids*