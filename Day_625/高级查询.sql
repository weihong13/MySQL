# 四、高级查询

# 4.1 查询处理

# 4.1.1 排序
select * from emp;

# 按照empno升序查询(asc),默认升序
select * from emp order by empno asc;
# 降序查询
select * from order by empno desc;

drop table if exists users;
create table if not exists users
(
  id int primary key,
  name varchar(20)
);

insert into users values(1,"zhangsan"),(2,"lisi"),(3,"wangwu");
select * from users; # 默认不是按照主键排序的
alter table users add age int; # 添加一个字段
select * from users; # 排序方式会改变


# 按照多个字段排序
select * from emp order by deptno,sal desc; # 按照deptno升序，deptno相同的话，按照sal降序

# 4.1.2 限制数量 limit


# 显示几条数据
select * from emp order by empno asc limit 5;
# 从第3+1条开始，显示5条数据
select * from emp order by empno asc limit 3,5;


# 4.1.3 去重 distinct
# 查询 有几种工作
select distinct job from emp;
# 同时作用两列，不能查询目标列以外的列
select distinct job,mgr from emp; # 两个字段不能同时重复

# 4.1.4 组合查询 union

# 组合查询，按照行排列
select empno,ename from emp
union
select deptno,dname from dept;

# 4.2 函数
	
# 4.2.1 数值函数

# abs(x):返回x的绝对值
select abs(-20); # 20
# ceil(x):向上取整，返回大于等于x的最小整数值
select ceil(5.3); # 6
# floor(x):向下取整，返回小于等于x的最大整数值
select floor(5.99); # 5
# round(x,y=0):四舍五入，将x四舍五入y位小数，y不传返回整数，y为负数时，保留 x值到小数点左边 y位
select round(5.5);
# truncate(x,y):截断函数，返回被舍去至小数点后y位的数字x，y为负数时截断小数点左边y位
select truncate(5.23,1);
# mod(x,y):返回x除以y的余数
select mod(5,2);
# rand():生成 0-1 的随机数
select rand();
# rand():生成 1-10 的随机数
select truncate(rand()*10+1,0);


# 4.2.2 字符函数

# concat(s1,s2,...):字符串连接，如果任何一个参数为 nul，则返回值为 null
select concat("hello ","world");
# concat_ws(x,s1,s2,….):指定分隔符的字符连接函数，x是连接分隔符，如果分隔符为null，则结果为 null。
select concat_ws("xxx","hello ","world");
# lower(str):大写转小写
select lower("WeiHong");
#	upper(str):小写转大写
select upper("weihong");
#	length(str):字符串长度
#	ltrim(str):删除字符串左侧空格
#	rtrim(str):删除字符串右侧空格
#	trim(str):删除字符串两侧空格
#	substr(str,n,len):截取子字符串，字符串 str 从n的位置截取长度为 len 的字符串，如果	n为负数，则子字符串的位置起始于字符串结尾的n个字符
#	left(str, n):返回字符串 str 的最左边n个字符
#	right(str,n): 返回字符串 str 的最右边 n个字符
#	replace(str,from str,to str):替换函数，字符串 str 中所有的字符串 from str均被 to str	替换，然后返回这个字符串
#	format (x,n):将数字x格式化，并以四舍五入的方式保留小数点后n位，结果以字符串的	形式返回。若n为0，则返回结果不含小数部分。



# 4.2.3 日期时间函数

#	(1) curdate()/current_date():获取当前日期，YYYY-MM-DD 格式
#	(2) curtime()/current_time():获取当前时间，HH:MM:SS 格式
#	(3) week(date):返回 date 为一年中的第几周
#	(4) now()/sysdate():获取当前日期和时间，YYYY-MM-DD HH:MM:SS 格式
#	(5) date_add(date,interval expr type):执行日期的加运算，date 是一个 datetime 或 date
#	    值，指定起始时间。expr是时间间隔。type为关键词，如YEAR,MONTH,DAY,WEEK
#	    HOUR等。
#	(6) datediff(date1,date2):计算两个日期之间的间隔天数
#	(7) unix_timestamp(date):返回 date 的 UNIX 时间戳
#	(8) form_unixtime(unix):返回 unix 时间戳的日期值
#	(9) date_format(date,format):日期格式化，按 format 格式化 date 值
# (10) str_to_date(date,format):将字符串转换成 date 类型


#	(9) date_format(date,format):日期格式化，按 format 格式化 date 值
select date_format('2024/6/25','%Y年%m月%d日');

# (10) str_to_date(date,format):将字符串转换成 date 类型
select str_to_date('2024年6月+++++++++25日','%Y年%m月+++++++++%d日');

# 4.2.4 聚合函数（分组函数）

# avg(expression):返回某列的平均值
select avg(sal) from emp;
# sum(expression):返回某列值的和
select sum(sal) from emp;
# count(expression):返回某列的行数
select count(sal) from emp;
# max(expression):返回某列的最大值
select max(sal) from emp;
# min(expression):返回某列的最小值
select min(sal) from emp;


# 流程函数
# 任何数 + null = null
select sal + comm from emp; # 这样的结果大多都是null

select sal + ifnull(comm,0) from emp;

select ename,empno,if(sal >3000,"sal_high","sal_low") from emp;






select deptno,count(*) from emp group by deptno having count(*)>5;


select job,count(job) from emp group by job;



select job,max(sal) as max_sal from emp group by job order by max_sal;


select deptno,avg(sal) from emp group by deptno having avg(sal);

select deptno,sal from emp  group by deptno having max(sal);


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


