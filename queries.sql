SELECT
    *
from
    animals
WHERE
    name Like '%mon';

SELECT
    *
from
    animals
WHERE
    date_of_birth between '2016-01-01'
    and '2019-12-31';

SELECT
    *
from
    animals
WHERE
    neutered = true
    and escape_attempts < 3;

SELECT
    *
from
    animals
WHERE
    name in ('Agumon', 'Pikachu');

SELECT
    name,
    escape_attempts
from
    animals
WHERE
    weight_kg > 10.5;

SELECT
    *
from
    animals
WHERE
    neutered = true;

SELECT
    *
from
    animals
WHERE
    name <> 'Gabumon';

SELECT
    *
from
    animals
WHERE
    weight_kg >= 10.4
    and weight_kg <= 17.3;

BEGIN;

UPDATE
    animals
SET
    species = 'unspecified';

SELECT
    *
FROM
    animals;

ROLLBACK;

SELECT
    *
FROM
    animals;

BEGIN;

UPDATE
    animals
SET
    species = 'digimon'
WHERE
    name LIKE '%mon';

UPDATE
    animals
SET
    species = 'pokemon'
WHERE
    species IS NULL;

SELECT
    *
FROM
    animals;

COMMIT;

SELECT
    *
FROM
    animals;

BEGIN;

DELETE FROM
    animals;

ROLLBACK;

SELECT
    *
FROM
    animals;

BEGIN;

DELETE FROM
    animals
WHERE
    date_of_birth > '2022-01-01';

SAVEPOINT deleted_record;

UPDATE
    animals
SET
    weight_kg = weight_kg * -1;

ROLLBACK TO deleted_record;

UPDATE
    animals
SET
    weight_kg = weight_kg * -1
WHERE
    weight_kg < 0;

COMMIT;

SELECT
    COUNT(*)
FROM
    animals;

SELECT
    COUNT(*)
FROM
    animals
WHERE
    escape_attempts = 0;

SELECT
    AVG(weight_kg)
FROM
    animals;

SELECT
    neutered,
    AVG(escape_attempts)
FROM
    animals
GROUP BY
    neutered;

SELECT
    species,
    MAX(weight_kg),
    MIN(weight_kg)
FROM
    animals
GROUP BY
    species;

SELECT
    species,
    AVG(escape_attempts)
FROM
    animals
WHERE
    date_of_birth BETWEEN '1990-01-01'
    AND '2000-12-31'
GROUP BY
    species;

SELECT
    species,
    MIN(weight_kg) AS min_weight,
    MAX(weight_kg) AS max_weight
FROM
    animals
GROUP BY
    species;

SELECT
    species,
    AVG(escape_attempts) AS avg_escape_attempts
FROM
    animals
WHERE
    date_of_birth BETWEEN '1990-01-01'
    AND '2000-12-31'
GROUP BY
    species;

SELECT
    animals.name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.id
WHERE
    owners.full_name = 'Melody Pond';

SELECT
    animals.name
FROM
    animals
    JOIN species ON animals.species_id = species.id
WHERE
    species.name = 'Pokemon';

SELECT
    owners.full_name,
    animals.name
FROM
    owners
    LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT
    species.name,
    COUNT(*) AS animal_count
FROM
    animals
    LEFT JOIN species ON animals.species_id = species.id
GROUP BY
    species.name;

SELECT
    animals.name
FROM
    animals
    JOIN species ON animals.species_id = species.id
    JOIN owners ON animals.owner_id = owners.id
WHERE
    owners.full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';

SELECT
    animals.name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.id
WHERE
    owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;

SELECT
    owners.full_name,
    COUNT(animals.id) AS animal_count
FROM
    owners
    JOIN animals ON owners.id = animals.owner_id
GROUP BY
    owners.full_name
ORDER BY
    animal_count DESC
LIMIT
    1;

SELECT
    animals.name AS last_seen_by_William,
    vets.name,
    MAX(date_of_visit) AS last_visit
FROM
    visit
    JOIN animals ON visit.animal_id = animals.id
    JOIN vets ON visit.vet_id = vets.id
WHERE
    vets.name = 'William Tatcher'
GROUP BY
    animals.name,
    vets.name
ORDER BY
    last_visit DESC
LIMIT
    1;

SELECT
    animals.name AS seen_by_StephanieMendez,
    vets.name,
    COUNT(visit.animal_id)
FROM
    visit
    JOIN animals ON visit.animal_id = animals.id
    JOIN vets ON vets.id = visit.vet_id
WHERE
    vets.id = 3
GROUP BY
    animals.name,
    vets.name;

SELECT
    vets.name AS Vets_names,
    species.name AS Specialities,
    specialization.species_id
FROM
    SPECIALIZATION FULL
    JOIN vets ON specialization.vet_id = vets.id FULL
    JOIN species ON species.id = specialization.species_id
GROUP BY
    specialization.species_id,
    vets.name,
    species.name;

SELECT
    animals.name AS animals_visited,
    visit.date_of_visit,
    vets.name
FROM
    VISIT
    JOIN ANIMALS ON animals.id = visit.animal_id
    JOIN vets ON vets.id = visit.vet_id
WHERE
    vets.id = 3
    AND date_of_visit BETWEEN '2020-04-1'
    AND '2020-08-30'
GROUP BY
    animals.name,
    vets.name,
    visit.date_of_visit;

SELECT
    animals.name AS most_visits,
    COUNT(visit.animal_id) AS Animal_visits
FROM
    visit
    JOIN animals ON animals.id = animal_id
    JOIN vets ON vets.id = visit.vet_id
GROUP BY
    animals.name
ORDER BY
    Animal_visits desc;

SELECT
    animals.name AS most_visits,
    COUNT(visit.animal_id) AS Animal_visits
FROM
    visit
    JOIN animals ON animals.id = animal_id
    JOIN vets ON vets.id = visit.vet_id
GROUP BY
    animals.name
ORDER BY
    Animal_visits desc
limit
    2;

SELECT
    animals.name AS visit_Maisy,
    vets.name,
    MIN(visit.date_of_visit)
FROM
    VISIT
    JOIN animals ON animals.id = visit.animal_id
    JOIN vets ON vets.id = visit.vet_id
WHERE
    vets.name = 'Maisy Smith'
group by
    animals.name,
    vets.name,
    visit.date_of_visit
limit
    1;

SELECT
    *
FROM
    visit
    JOIN animals ON visit.animal_id = animals.id
    JOIN vets ON vets.id = visit.vet_id
ORDER BY
    visit.date_of_visit desc
limit
    1;

SELECT
    COUNT(*) AS visits_no_specialize
FROM
    visit
    JOIN (
        SELECT
            vets.id
        FROM
            vets FULL
            JOIN specialization ON vets.id = specialization.vet_id FULL
            JOIN species ON species.id = specialization.species_id
        WHERE
            specialization.species_id IS NULL
    ) AS vet ON vet.id = visit.vet_id;

SELECT
    s.name AS Maisy_should_consider,
    COUNT(vis.date_of_visit) AS t_visit
FROM
    visit AS vis
    JOIN animals AS a ON vis.animal_id = a.id
    JOIN species AS s ON a.species_id = s.id
    JOIN vets AS v ON vis.vet_id = v.id
WHERE
    v.name = 'Maisy Smith'
GROUP BY
    s.name
ORDER BY
    t_visit DESC
LIMIT
    1;

-- EXPLAIN ANALYZE with Query
EXPLAIN ANALYZE
SELECT
    COUNT(*)
FROM
    visit
where
    animal_id = 4;

EXPLAIN ANALYZE
SELECT
    *
FROM
    visit
where
    vet_id = 2;

EXPLAIN ANALYZE
SELECT
    *
FROM
    owners
where
    email = 'owner_18327@mail.com';