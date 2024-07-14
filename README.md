We start by creating the database and tables and inserting the datasets.

# Open a MySQL shell
```bash
sudo mysql
```

# Create database
```sql
CREATE DATABASE company_1;
```

# Connect to the database
```
connect company_1
```

# Create tables
```sql
CREATE TABLE dept (
  deptno integer PRIMARY KEY,
  dname varchar(256) NOT NULL,
  loc varchar(256) NOT NULL
);

CREATE TABLE emp (
  empno integer PRIMARY KEY,
  ename varchar(256) NOT NULL,
  job varchar(64) NOT NULL,
  mgr integer DEFAULT NULL REFERENCES emp(empno),
  hiredate date NOT NULL,
  sal integer NOT NULL CHECK (sal > 0),
  comm integer DEFAULT NULL,
  deptno integer NOT NULL REFERENCES dept(deptno)
);
```

# Populate the tables with data
## dept table
```sql
INSERT INTO dept (deptno, dname, loc) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept (deptno, dname, loc) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept (deptno, dname, loc) VALUES (30, 'SALES', 'CHICAGO');
```

## emp table
```sql
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, null, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, null, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, null, 10);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000, null, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, null, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100, null, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, null, 20);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, null, 30);
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, null, 10);
```

# Check our tables are correct
## dept table
```sql
SELECT * FROM dept;
```

Output:

```
+--------+------------+----------+
| deptno | dname      | loc      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
+--------+------------+----------+
```

## emp table
```sql
SELECT * FROM emp;
```

Output:

```
+-------+--------+-----------+------+------------+------+------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal  | comm | deptno |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  500 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1987-04-19 | 3000 | NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000 | NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500 |    0 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1987-05-23 | 1100 | NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 | NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+
```

# SQL programming exercises
1. List all Employees whose salary is greater than 1,000 but not 2,000. Show the Employee Name, Department and Salary (4 marks)

```sql
SELECT ename, dept.dname, sal FROM emp JOIN dept ON emp.deptno = dept.deptno WHERE sal > 1000 AND sal < 2000;
```

Output:

```
+--------+------------+------+
| ename  | dname      | sal  |
+--------+------------+------+
| ALLEN  | SALES      | 1600 |
| WARD   | SALES      | 1250 |
| MARTIN | SALES      | 1250 |
| TURNER | SALES      | 1500 |
| ADAMS  | RESEARCH   | 1100 |
| MILLER | ACCOUNTING | 1300 |
+--------+------------+------+
```

2. Count the number of people in department 30 who receive a salary and a commission. (4 marks)

If we are interested in the employees who were paid commission, we may use the following query:


```sql
SELECT COUNT(*) FROM emp WHERE comm > 0;
```

Output:

```
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
```

However, we may be interested in all employees who are eligible to earn commission, even if they did not earn any commission during the period under investigation. We may differentiate such cases from non-commission based employees by populating the `comm` column for non-commission based employees with `null` and by populating the `comm` column for commission-based employees who weren't paid any commission during the period with `0`. In this case, we may use the following query to count the number of employees who were commission-based:

```sql
SELECT COUNT(*) FROM emp WHERE comm IS NOT NULL;
```

Output:

```
+----------+
| COUNT(*) |
+----------+
|        4 |
+----------+
```

In this case we are counting 1 more employee, namely TURNER, who may have been eligible to earn commission but who wasn't paid any during this period (perhaps they missed a minimum sales target).

3. Find the name and salary of the employees that have a salary greater or equal to 1,000 and live in Dallas.

```sql
SELECT ename, sal FROM emp JOIN dept ON emp.deptno = dept.deptno WHERE emp.sal >= 1000 AND dept.loc = 'DALLAS';
```

Output:

```
+-------+------+
| ename | sal  |
+-------+------+
| JONES | 2975 |
| SCOTT | 3000 |
| ADAMS | 1100 |
| FORD  | 3000 |
+-------+------+
```

4. Find all departments that do not have any current employees.

```sql
SELECT dept.dname FROM dept WHERE (SELECT COUNT(*) FROM emp WHERE emp.deptno = dept.deptno) = 0;
```

Output:

```
Empty set
```

So there are no departments without any employees. We can check that this query actually works by adding a test department without adding any employees to it and then re-running the query.

Add test department:

```sql
INSERT INTO dept (deptno, dname, loc) VALUES (40, 'TEST', 'TEST');
```

Re-run the query:

```sql
SELECT dept.dname FROM dept WHERE (SELECT COUNT(*) FROM emp WHERE emp.deptno = dept.deptno) = 0;
```

Output:

```
+-------+
| dname |
+-------+
| TEST  |
+-------+
```

5. List the department number, the average salary, and the number/count of employees of each department.

```sql
SELECT dept.deptno, AVG(emp.sal) AS avg_sal, COUNT(emp.empno) AS count_emp FROM dept JOIN emp ON emp.deptno = dept.deptno GROUP BY dept.deptno ORDER BY dept.deptno;
```

Output:

```
+--------+-----------+-----------+
| deptno | avg_sal   | count_emp |
+--------+-----------+-----------+
|     10 | 2916.6667 |         3 |
|     20 | 2175.0000 |         5 |
|     30 | 1566.6667 |         6 |
+--------+-----------+-----------+
```

Note: the `ORDER BY` clause is not strictly necessary, but I am including it because otherwise the departments appear in random order.

