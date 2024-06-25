# DDL 数据定义语言

drop table if exists student;

# 创建 student表
create table if not exists student(
  id int  primary key,
  name varchar(20) not null,
  sex char(2) not null,
  birthday date,
  class char(5)
);

# 创建 course表 
create table if not exists course(
  id char(5) primary key,
  name varchar(20) not null,
  teacher_id int not null,
  foreign key(teacher_id) references teacher(id)
);

# 创建 score表 
create table if not exists score(
  id int primary key auto_increment,
  student_id int not null,
  course_id char(5) not null,
  degree decimal(4,1),
  foreign key(student_id) references student(id),
  foreign key(course_id) references course(id)
);

# 创建 teacher表 
create table if not exists teacher(
  id int  primary key,
  name varchar(20) not null,
  sex char(2) not null,
  birthday date,
  prof varchar(20),
  depart varchar(10) not null
);

insert into student(id, name, sex, birthday, class) 
values
(108,"曾华","男","1977-09-01","95033"),
(105,"匡明","男","1975-10-02","95031"),
(107,"王丽","女","1976-01-23","95033"),
(101,"李军","男","1976-02-20","95033"),
(109,"王芳","女","1975-02-10","95031"),
(103,"陆君","男","1974-06-03","95031");


insert into course(id, name, teacher_id) 
values
("3-105","计算机导论",825),
("3-245","操作系统",804),
("6-166","数字电路",856),
("9-888","高等数学",831);


insert into score(id, student_id, course_id,degree)
values
(1	,103	,"3-245",	86),
(2	,105	,"3-245",	75),
(3	,109	,"3-245",	68),
(4	,103	,"3-105",	92),
(5	,105	,"3-105",	88),
(6	,109	,"3-105",	76),
(7	,101	,"3-105",	64),
(8	,107	,"3-105",	91),
(9	,108	,"3-105",	78),
(10	,101	,"6-166",	85),
(11	,107	,"6-166",	79),
(12	,108	,"6-166",	81);



insert into teacher(id, name, sex, birthday, prof,depart)
values
(804,"李诚","男","1958-12-02","副教授","计算机系"),
(856,"张旭","男","1969-03-12","讲师","电子工程系"),
(825,"王萍","女","1972-05-05","助教","计算机系"),
(831,"刘冰","女","1977-08-14","助教","电子工程系");



select * from emp;

select * from emp order by hiredate limit 1,13;

select * from emp order by hiredate desc,sal limit 0,13;






select * from student;

select * from student order by birthday desc;

select * from emp order by deptno asc,sal desc;








select * from emp where job = "MANAGER" order by sal desc;

select * from emp where sal between 2000 and 3000 order by sal desc;


select * from emp  limit 5;

select * from emp order by sal desc limit 3;


select * from emp order by sal desc limit 4,3;





select abs(-10);

select ceil(-1.01);

select floor(2.8);

select round(2.6)

select lower("WEIHONG");

select upper("weihong");

select length("weihong");

select 















