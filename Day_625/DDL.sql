# DDL 数据定义语言

# 创建文章表article
create table if not exists article(
  id int,
  title varchar(30),
  author varchar(20),
  content text
);

# 创建订单表 orders
create table if not exists orders(
  id int,
  customer_id int,
  date datetime,
  money decimal(10,3) # 共10位，小数点后3位
);

# 创建 users表
create table if not exists users(
  id int,
  name varchar(20)
);

# 创建产品表 product
create table if not exists product(
  id int,
  name varchar(50),
  price decimal(10,2),
  is_null boolean,
  pro_desc text
);

# 查看表

# 查看数据库中的表
show tables;

# 查看表的基本结构 desc 表名；
desc emp;

# 查看创建数据库/表 的创建语句
# show create database 数据库名;
show create database mydb2311;
# show create database 表名;
show create table emp;


# 更改表名
alter table product rename to product2;

# 添加字段--在某个字段后添加新的字段
alter table product2 add column size int after price;

# 添加字段--在开始添加新的字段
alter table product2 add column size2 int first;

# 修改字段类型
alter table product2 modify column size2 decimal(10,2);

# 修改字段位置
alter table product2 modify column size2 decimal(10,2) after is_null;

# 修改字段名
alter table product2 change column size2 size3 decimal(10,2);

# 删除字段
alter table product2 drop column size3;

# 删除表
drop table if exists users;



# 练习1
# 1、员工 emp 表
# 添加字段 emp_bonus 奖金数据类型为decimal(10,2)
# emp_bonus 字段数据类型改为decimal(12,2)
# 修改 emp_bonus 字段名为 bonus
#　删除字段 bonus

alter table emp add column emp_donus decimal(10,2);

alter table emp modify column emp_donus decimal(12,2);

alter table emp change column emp_donus bonus decimal(12,2);

alter table emp drop column bonus;

# 练习2 
# 2.练习学生信息表的创建与修改
# 建立学生信息表，字段包括:学号、姓名、年龄、出生日期
# 在姓名字段后加电话字段，字段名 telno，类型为 varchar 类型
# 将电话字段修改为 char 类型
# 将出生日期字段放在学号字段之前
# 将电话字段名 tel no 修改为 phone_number
# 删除字段 phone_number
# 将表名修改为另外的名字
# 删除表

# 建立学生信息表，字段包括:学号、姓名、年龄、出生日期
create table if not exists StuInfo(
  id int,
  name varchar(20),
  age int,
  brithday date
);

# 在姓名字段后加电话字段，字段名 telno，类型为 varchar 类型
alter table StuInfo add column telno varchar(11) after name;

# 将电话字段修改为 char 类型
alter table stuinfo modify column telno char;

# 将出生日期字段放在学号字段之前
alter table stuinfo modify brithday date first;

# 将电话字段名 tel no 修改为 phone_number
alter table stuinfo change column telno phone_number varchar(11);

# 将表名修改为另外的名字
alter table stuinfo rename to student;

# 删除表
drop table if exists student;




# 添加约束条件


drop table if exists users;
# 创建表时添加非空约束 not null
create table users(
  id int not null,
  name varchar(20)
);

insert into users(name) values("张三"); # 报错：id没有默认值（不能为空）

# 创建表后修改非空约束
alter table users modify column name varchar(20) not null;
insert into users(id) values(1); # 报错：name没有默认值（不能为空）
alter table users modify column name varchar(20) null; # null可以不写，默认可以为空


# 默认约束 - default
# 创建表时添加默认值
create table users(
  id int not null default 555,
  name varchar(20)
);

insert into users(name) values("张三"); # 不报错：有默认值（就不为空了）


alter table users modify column id int not null;

# 唯一约束 --- unique
# 创建表时添加默认值
create table users(
  id int not null default 555,
  name varchar(20)
);




