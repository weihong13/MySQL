# 高级查询--分组查询

select * from emp;

# 查看公司有几个部门
select deptno from emp group by deptno;

# 查看部门编号 为 20 的员工人数
select count(*) from emp where deptno = 20;

# 查看每个部门的人数
select deptno,count(*) from emp group by deptno;

# 查看每个部门的人数,并保留部门人数大于5的分组
select deptno,count(*) from emp group by deptno having count(*)>5;


# 查看每个部门工资大于1000的人数,并保留部门人数大于2的分组
select deptno,count(*) from emp where sal > 1000 group by deptno having count(*)>2;






# 过滤分组查询练习

# 查询出该公司有哪几种岗位及每个岗位的人数
select job,count(job) from emp group by job;


# 计算每个工作岗位的最高薪水，并且由低到高进行排序
select job,max(sal) as max_sal from emp group by job order by max_sal;

# 计算每个部门的平均薪水
select deptno,avg(sal) from emp group by deptno having avg(sal);

# 计算出不同部门不同岗位的最高薪水
select deptno,sal from emp  group by deptno having max(sal);

# 找出每个工作岗位的最高薪水，除manager 之外
select job,sal from emp where job != "manager" group by job having max(sal);

# 找出每个工作岗位的平均薪水，显示平均薪水大于2000的
select job,avg(sal) from emp group by job having avg(saL) > 2000;



# 正则表达式
select * from emp where ename regexp "a|s";


select * from emp where ename regexp "[a|s]m";


select * from emp where ename regexp "s.*t";

select * from emp where ename regexp "s...t";

select *from dept;
select * from emp;
select emp.ename,dept.dname from emp join dept on emp.deptno=dept.deptno;



select emp.sal,salgrade.grade from emp join salgrade, on emp.sal between salgrade.losal and salgrade.hisal;

select emp.ename,emp_mgr.ename from emp join emp emp_mgr on emp.empno = emp_mgr.mgr;

select emp.ename,dept.dname from emp right join dept on emp.deptno=dept.deptno;



select emp.ename,dept.dname from emp left join dept on emp.deptno=dept.deptno;

select emp.ename,emp_mgr.ename,salgrade.grade from emp join salgrade on emp.sal between salgrade.losal and salgrade.hisal join emp emp_mgr on emp.empno = emp_mgr.mgr;


