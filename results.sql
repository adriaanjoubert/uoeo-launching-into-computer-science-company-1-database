-- Scripts for arriving the exercise results (output documented in the README.md)

-- Exercise 1

SELECT ename, dept.dname, sal FROM emp JOIN dept ON emp.deptno = dept.deptno WHERE sal > 1000 AND sal < 2000;

-- Exercise 2

SELECT COUNT(*) FROM emp WHERE comm > 0;

-- Exercise 2 (alternative interpretation):

SELECT COUNT(*) FROM emp WHERE comm IS NOT NULL;

-- Exercise 3

SELECT ename, sal FROM emp JOIN dept ON emp.deptno = dept.deptno WHERE emp.sal >= 1000 AND dept.loc = 'DALLAS';

-- Exercise 4

SELECT dept.dname FROM dept WHERE (SELECT COUNT(*) FROM emp WHERE emp.deptno = dept.deptno) = 0;

-- Exercise 5

SELECT dept.deptno, AVG(emp.sal) AS avg_sal, COUNT(emp.empno) AS count_emp FROM dept JOIN emp ON emp.deptno = dept.deptno GROUP BY dept.deptno ORDER BY dept.deptno;
