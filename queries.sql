SELECT * from animals WHERE   name Like '%mon';
SELECT * from animals WHERE   date_of_birth between '2016-01-01' and '2019-12-31';
SELECT * from animals WHERE   neutered = true and escape_attempts < 3;
SELECT * from animals WHERE   name in ('Agumon', 'Pikachu');
SELECT  name, escape_attempts from animals WHERE   weight_kg > 10.5;
SELECT * from animals WHERE   neutered = true;
SELECT * from animals WHERE   name <> 'Gabumon';
SELECT * from animals WHERE  weight_kg >= 10.4 and weight_kg  <= 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT deleted_record;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO deleted_record;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species; 