CREATE TABLE IF NOT EXISTS animals (

     id                 int primary key not null,
     name               varchar(100) not null,
     date_of_birth      date,
     escape_attempts    int,
     neutered           boolean,
     weight_kg          decimal(10, 2)
);

ALTER TABLE animals ADD COLUMN species varchar(100);

CREATE TABLE IF NOT EXISTS owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(200),
    age INTEGER
);

CREATE TABLE IF NOT EXISTS species (
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals
    ADD COLUMN species_id INTEGER REFERENCES species(id),
    ADD COLUMN owner_id INTEGER REFERENCES owners(id);

CREATE TABLE VETS(ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, NAME VARCHAR(200), AGE INT, DATE_OF_GRADUATION DATE);
CREATE TABLE IF NOT EXISTS specialization (
    species_id INT, 
    vet_id INT, PRIMARY KEY(species_id, vet_id) 
);
CREATE TABLE IF NOT EXISTS visit (
    animal_id INT, 
    vet_id INT, PRIMARY KEY(animal_id, vet_id) 
);
ALTER TABLE visit ADD COLUMN date_of_visit DATE;
ALTER TABLE visit DROP CONSTRAINT visit_pkey;

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
CREATE INDEX INX_O ON OWNERS(EMAIL);