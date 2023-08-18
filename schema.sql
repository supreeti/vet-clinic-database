CREATE TABLE IF NOT EXISTS animals (

     id                 int primary key not null,
     name               varchar(100) not null,
     date_of_birth      date,
     escape_attempts    int,
     neutered           boolean,
     weight_kg          decimal(10, 2)
);
