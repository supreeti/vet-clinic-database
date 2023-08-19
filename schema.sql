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
