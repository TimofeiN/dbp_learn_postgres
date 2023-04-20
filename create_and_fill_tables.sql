CREATE TABLE "regions" (
  id serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE locations (
  id serial PRIMARY KEY,
  address varchar,
  region_id bigint REFERENCES regions (id)
);

CREATE TABLE employees (
  id serial PRIMARY KEY,
  "name" varchar, 
  last_name varchar,
  hire_date date,
  salary integer,
  email varchar,
  manager_id bigint REFERENCES employees (id),
  department_id bigint
);

CREATE TABLE departments (
  id serial PRIMARY KEY,
  "name" varchar,
  location_id bigint REFERENCES locations (id),
  manager_id bigint REFERENCES employees (id)
 );

ALTER TABLE employees
ADD constraint constraint_employees_department_id
FOREIGN KEY (department_id) 
REFERENCES departments (id);


INSERT INTO regions ("name") VALUES
 ('Europe'),
 ('USA');

INSERT INTO locations (address, region_id) VALUES
 ('Saint-Petersburg', 1),
 ('London', 1),
 ('New-York', 2);

INSERT INTO departments ("name", location_id) VALUES
 ('Design', 1),
 ('Dev', 1),
 ('PR', 2),
 ('Sales', 3);


INSERT INTO employees VALUES
(1,'Jordane','Batz','2016-12-08',8881,'boyd.kirlin@dualbootpartners.com',null,1),
(2,'Elyssa','Adams','2016-12-21',1118,'qbogan@dualbootpartners.com',null,2),
(3,'Amira','Haleyberdyeva','2005-03-18',3233,'harber.oran@dualbootpartners.com',null,3),
(4,'Micheal','Bashirian','2018-09-25',3089,'jeromy42@example.org',null,4),
(5,'Elyssa','Kovacek','2023-04-15',4477,'elenora.tremblay@example.net',1,1),
(6,'Jaunita','Herzogshvilli','2023-04-10',4362,'linnea97@dualbootpartners.com',1,1),
(7,'Anastasia','Price','2023-03-29',5594,'everardo.rosenbaum@dualbootpartners.com',2,2),
(8,'Dario','Hessel','2022-02-03',1252,'ortiz.rahsaan@dualbootpartners.com',2,2),
(9,'Cooper','Kassulke','2018-11-27',9971,null,3,3),
(10,'Bernadette','Adams','2022-10-22',9794,'someemail@example.net',4,4),
(11,'Amanita','Brown','2022-11-22',3794,'amanita.germaine@example.net',4,4);

INSERT INTO departments (manager_id) VALUES
 (1), (2), (3), (4);