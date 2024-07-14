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
  mgr integer REFERENCES emp(empno) DEFAULT NULL,
  hiredate date NOT NULL,
  sal integer NOT NULL CHECK > 0),
  comm integer DEFAULT NULL,
  deptno integer REFERENCES dept(deptno) NOT NULL
);
```

