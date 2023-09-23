-- Create the 'diseases' database
CREATE DATABASE diseases;

-- Use the 'diseases' database
USE diseases;

-- Create the 'years' table
CREATE TABLE years (
    year INT PRIMARY KEY
);

-- Create the 'locations' table
CREATE TABLE locations (
    entity VARCHAR(255),
    code VARCHAR(10) PRIMARY KEY
);

-- Create the 'infectious_diseases' table
CREATE TABLE infectious_diseases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    year INT,
    d_meningitis INT,
    d_malaria INT,
    d_tuberculosis INT,
    d_acute_hepatitis INT,
    d_lower_respiratory_infections INT,
    FOREIGN KEY (year) REFERENCES years(year),
    FOREIGN KEY (code) REFERENCES locations(code)
);

-- Create the 'external_causes' table
CREATE TABLE external_causes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    year INT,
    d_drowning INT,
    d_interpersonal_violence INT,
    d_exposure_to_forces_of_nature INT,
    d_road_injuries INT,
    d_poisonings INT,
    d_fire_heat_and_hot_substances INT,
    FOREIGN KEY (year) REFERENCES years(year),
    FOREIGN KEY (code) REFERENCES locations(code)
);

-- Create the 'noncommunicable_diseases' table
CREATE TABLE noncommunicable_diseases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    year INT,
    d_alzheimers_disease_and_other_dementias INT,
    d_parkinsons_disease INT,
    d_cardiovascular_diseases INT,
    d_neoplasms INT,
    d_diabetes_mellitus INT,
    d_chronic_kidney_disease INT,
    d_chronic_respiratory_diseases INT,
    d_cirrhosis_and_other_chronic_liver_diseases INT,
    d_digestive_diseases INT,
    FOREIGN KEY (year) REFERENCES years(year),
    FOREIGN KEY (code) REFERENCES locations(code)
);

-- Create the 'malnutrition_and_maternal_health' table
CREATE TABLE malnutrition_and_maternal_health (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    year INT,
    d_nutritional_deficiencies INT,
    d_proteinenergy_malnutrition INT,
    d_maternal_disorders INT,
    FOREIGN KEY (year) REFERENCES years(year),
    FOREIGN KEY (code) REFERENCES locations(code)
);

-- Create the 'mental_health_and_substance_abuse' table
CREATE TABLE mental_health_and_substance_abuse (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    year INT,
    d_hiv_aids INT,
    d_drug_use_disorders INT,
    d_selfharm INT,
    FOREIGN KEY (year) REFERENCES years(year),
    FOREIGN KEY (code) REFERENCES locations(code)
);

-- Create the 'other_causes' table
CREATE TABLE other_causes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    year INT,
    d_alcohol_use_disorders INT,
    d_neonatal_disorders INT,
    d_conflict_and_terrorism INT,
    d_diarrheal_diseases INT,
    d_environmental_heat_and_cold_exposure INT,
    FOREIGN KEY (year) REFERENCES years(year),
    FOREIGN KEY (code) REFERENCES locations(code)
);
