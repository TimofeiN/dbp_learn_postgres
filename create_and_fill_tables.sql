CREATE TABLE "regions" (
  id serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE locations (
  id serial PRIMARY KEY,
  address varchar,
  region_id bigint REFERENCES regions (id)
);

CREATE TABLE managers (
  id serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE departments (
  id serial PRIMARY KEY,
  "name" varchar,
  location_id bigint REFERENCES locations (id),
  manager_id bigint REFERENCES managers (id)
);

CREATE TABLE departments (
  id serial PRIMARY KEY,
  "name" varchar,
  location_id bigint REFERENCES locations (id),
  manager_id bigint REFERENCES managers (id)
);

CREATE TABLE employees (
  id serial PRIMARY KEY,
  "name" varchar, 
  last_name varchar,
  hire_date date,
  salary integer,
  email varchar,
  manager_id bigint REFERENCES managers (id),
  department_id bigint REFERENCES departments (id)
);

INSERT INTO regions ("name") VALUES
 ('Europe'),
 ('USA');

INSERT INTO locations (address, region_id) VALUES
 ('Saint-Petersburg', 1),
 ('London', 1),
 ('New-York', 2);

INSERT INTO managers ("name") VALUES ('David'), ('Susan'), ('Igor');

INSERT INTO departments ("name", location_id, manager_id) VALUES
 ('Design', 1, 1),
 ('Dev', 1, 1),
 ('PR', 2, 2),
 ('Sales', 3, 3);

INSERT INTO employees VALUES
(1,'Jordane','Batz','2016-12-08',8881,'boyd.kirlin@dualbootpartners.com',1,1),
(2,'Elyssa','Adams','2016-12-21',1118,'qbogan@dualbootpartners.com',1,1),
(3,'Amira','Haleyberdyeva','2005-03-18',3233,'harber.oran@dualbootpartners.com',1,1),
(4,'Micheal','Bashirian','2018-09-25',3089,'jeromy42@example.org',1,2),
(5,'Elyssa','Kovacek','2023-04-15',4477,'elenora.tremblay@example.net',1,2),
(6,'Jaunita','Herzogshvilli','2023-04-10',4362,'linnea97@dualbootpartners.com',2,3),
(7,'Anastasia','Price','2023-03-29',5594,'everardo.rosenbaum@dualbootpartners.com',2,3),
(8,'Dario','Hessel','2022-02-03',1252,'ortiz.rahsaan@dualbootpartners.com',3,4),
(9,'Cooper','Kassulke','2018-11-27',9971,'',3,4),
(10,'Bernadette','Adams','2022-10-22',9794,'schroeder.germaine@example.net',1,2);
