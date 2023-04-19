--Показать работников у которых нет почты или почта не в корпоративном домене (домен dualbootpartners.com)
SELECT * FROM employees e
WHERE email NOT LIKE '%@dualbootpartners.com%';

--Получить список работников нанятых в последние 30 дней
SELECT * FROM employees e 
WHERE hire_date > (current_date - INTERVAL '1 month');

--Найти максимальную и минимальную зарплату по каждому департаменту
SELECT MAX(e.salary) max_salary, MIN(e.salary) min_salary, d."name" department  FROM employees e
JOIN departments d ON e.department_id = d.id
GROUP BY d."name";

--Посчитать количество работников в каждом регионе
SELECT count(e.*) , r."name" region FROM employees e
JOIN departments d ON e.department_id = d.id 
JOIN locations l ON d.location_id = l.id 
JOIN regions r ON l.region_id = r.id
GROUP BY region;

--Показать сотрудников у которых фамилия длиннее 10 символов
SELECT e."name", e.last_name, character_length(e.last_name) surname_length FROM employees e
WHERE character_length(e.last_name) > 10; 


--Показать сотрудников с зарплатой выше средней по всей компании
SELECT id, "name", last_name, salary FROM employees
WHERE salary > (SELECT avg(salary) FROM employees);
