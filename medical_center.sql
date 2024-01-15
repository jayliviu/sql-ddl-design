DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
   id SERIAL PRIMARY KEY,  
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL,
   specialty TEXT NOT NULL
);

CREATE TABLE patients (
   id SERIAL PRIMARY KEY,
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL,
   last_visit DATE
);

CREATE TABLE evaluations (
   id SERIAL PRIMARY KEY,
   evaluation TEXT NOT NULL,
   doc_id INTEGER REFERENCES doctors ON DELETE CASCADE,
   pat_id INTEGER REFERENCES patients ON DELETE CASCADE
);


INSERT INTO doctors 
   (first_name, last_name, specialty)
VALUES
   ('Liviu', 'Grozav', 'Dermatology'),
   ('Isabella', 'Riolo', 'Emergency Medicine'),
   ('Kameron', 'Qualls', 'Family Medicine'),
   ('Julia', 'Boboc', 'Neurosurgeon'),
   ('Jared', 'Dominos', 'Heart Surgeon');


INSERT INTO patients 
   (first_name, last_name, last_visit)
VALUES
   ('Joe', 'Shmo', '2022-08-25'),
   ('Bob', 'Build', '2023-10-5'),
   ('Sith', 'Lord', '2023-12-19'),
   ('Mike', 'Pence', '2022-03-12'),
   ('Donald', 'Trump', '2024-01-03');


INSERT INTO evaluations 
   (evaluation, doc_id, pat_id)
VALUES
   ('Dementia', 1, 5),
   ('Flu', 2, 1),
   ('Heart Palpatations', 3, 4),
   ('Food Poisoning', 4, 2),
   ('eczema', 5, 3),
   ('acne', 1, 2);



