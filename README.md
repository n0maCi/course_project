# Разработка базы данных для информационный системы по учету кадров
![Скриншот](https://github.com/n0maCi/course_project/blob/main/erd.png?raw=true)
## Типовые запросы

## Типовые Запросы
**1. Вывести сотрдника, который получает больше всех в компании**
```sql
SELECT employees.id, firstname, secondname, patronymic, depatments.title, salary_per_hour FROM employees
JOIN job_title ON job_title.id = employees.job_title_id
JOIN depatments ON depatments.id = job_title.depatments_id
ORDER BY salary_per_hour DESC
LIMIT 1;
```

**2. Уволить сотрудника с именем 'Екатерина Владимирова Александровна', дата рождения '1993-08-20'**
```sql
DELETE FROM employees
WHERE id = (SELECT * FROM (SELECT id FROM employees WHERE firstname = 'Екатерина' AND secondname = 'Владимирова' AND patronymic = 'Александровна' AND birthday = '1993-08-20') AS tmp);
```

**3. Получить информацию о количестве отработанных часов за определенный период с 2024-04-01 до 2024-04-15. Сотрудника с именем 'Иван Иванов Иванович', а дата рождения '1990-01-01'**
```sql
SELECT date, amount FROM time_tracking
WHERE employees_id = (SELECT id FROM employees WHERE firstname = 'Иван' AND secondname = 'Иванов' AND patronymic = 'Иванович' AND birthday = '1990-01-01')
                                                                                                         AND date >= '2024-04-01' AND date <= '2024-04-15';
```

**4. Вывести количество сотрудников по отделам**
```sql
SELECT depatments.title, COUNT(*) FROM employees
JOIN job_title ON job_title.id = employees.job_title_id
JOIN depatments ON depatments.id = job_title.depatments_id
GROUP BY depatments.title;
```

**5. Вывести среднюю заработную плату по отделам**
```sql
SELECT depatments.title, AVG(salary_per_hour) FROM job_title
JOIN depatments ON depatments.id = job_title.depatments_id
GROUP BY depatments.title;
```

## Хранимые процедуры
1. Процедура добавления нового сотрудника
``` sql
call mdk1601.AddEmployee('Егор', 'Рожков', 'Иванович', 'male', '1999-12-24', 'ул. Калинина 23', '89234657473', 'egorroj@n0maci.ru', '2024-05-23', '2818383232', '393689360719', '22342342333', '6546554', '6743456', 1);
```
Процедура добавит в таблицу employees имя `Егор`, фамилию `Рожков`, отчество `Иванович`, пол `male`, дата рождения `1999-12-24`, адрес проживания `ул. Калинина 23`, номер телефона `89234657473`, почту `egorroj@n0maci.ru` и дата принятия, а в таблицу personal_documents добавит номер паспорта `2818383232`, валижный ИНН `393689360719`, снилс `22342342333`, друдовая книжка `6546554`, военный билет `6743456` и ID должности нового сотрудника `1`

2. Процедура формирования отчета по заработной плате за определенный период
``` sql
   call mdk1601.SalaryReport(1, '2024-04-1', '2024-04-15');
```
Процедура принимает входные параметры: ID сотрудника `1`, период с `2024-04-1` и период до `2024-04-15`. Данная процедура считает количество отработанных часов за данный период и умножает на ставку сотрудника, а также добовляет в таблицу salary отчет: salary_date - ставит дату, когда была выполнена процедура, number_of_hours_worked - добавляет количетсво отработанных часов за период, а final_salary показывает заработную плату за данный период

## Тригер
**`before_employee_delete`** осуществляет свою деятельность после удаления записи в таблицу `employees`, а именно, удаления связующей записи в таблице `personal_documents`

## Функция
**`CheckINN`** вызывается хранимой процедурой, выполняет валидацию вводимого ИНН. Если ИНН валидный, то выведет `True`, а если нет, то `False`

## Представление
``` sql
SELECT * FROM mdk1601.all_employees;
```
Это представление показывает основную информацию об сотрудниках
