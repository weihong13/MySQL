# 五、多表查询
# 5.1 连接查询

# 5.1.1 内连接

select * from emp,dept; #56行
select * from emp,dept where emp.deptno = dept.deptno;

select * from emp join dept on emp.deptno = dept.deptno;

# 自连接
select emp.ename,emp_mgr.ename as boss from emp join emp as emp_mgr on emp.mgr = emp_mgr.empno;


# 5.1.2 外连接
# 左外连接
select * from emp left join dept on emp.deptno = dept.deptno;
# 右外连接
select * from emp right join dept on emp.deptno = dept.deptno;


select emp.sal,salgrade.grade from emp join salgrade, on emp.sal between salgrade.losal and salgrade.hisal;

select emp.ename,emp_mgr.ename from emp join emp emp_mgr on emp.empno = emp_mgr.mgr;

select emp.ename,dept.dname from emp right join dept on emp.deptno=dept.deptno;



select emp.ename,dept.dname from emp left join dept on emp.deptno=dept.deptno;

select emp.ename,emp_mgr.ename,salgrade.grade from emp join salgrade on emp.sal between salgrade.losal and salgrade.hisal join emp emp_mgr on emp.empno = emp_mgr.mgr;



# 5.2子查询

# 5.2.1 子查询做过滤

# 查询员工所在 部门的部门名称中 有 e 的员工信息
select * from emp where deptno  in (select deptno from dept where dname like "%e%");

# 查询每个部门对应的人数
select dname,(select count(*) from emp where dept.deptno = emp.deptno) from dept;
