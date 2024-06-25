# DML 数据操作语言

# 创建users表

create table if not exists users(
  id int,
  name varchar(20)
);

# 插入一条数据
insert into users
values(100,"张三");

select * from users;

# 插入多条数据
insert into users
values
(101,"张三1"),
(102,"张三2"),
(103,"张三3"),
(104,"张三4");

# 在某个字段插入数据，其他字段为NULL
insert into users
values
(105,NULL);

# 在某个字段插入数据，其他字段为NULL，指定字段
insert into users(id)
values
(106);


# 更新数据-----必须加where限制，否则将更新整个表
update users 
set 
id = 110,
name = "张三5"
where id = 105;


# 删除数据---必须加where限制，不然会全部删除
# 在对 update delete使用where前，必须使用 select对where进行验证

delete from users where id = 106;

# 一般不会使用delete进行删除，一般是添加一个 is_delete 的字段，
# 如果用户删除，会使用update将该条记录的 is_delete 的数值改为 1，
# 然后在查询部分 在where 部分添加 只能查看is_delete = 0 的限制，
# 这样的操作称之为软删除


# 练习
# 建立学生信息表，字段包括:学号、姓名、年龄、 出生日期
# 为学生信息表添加三条记录(张三、李四、王五)
# 学号  姓名 年龄  出生日期 
#   1   张三  20   2002/5/8
#   2   李四  21   2001/9/6
#   3   王五  19   2003/12/15

# 将张三的年龄改为 21，出生日期改为 2001/5/8
# 删除不到 21 岁的学生

# 创建表
create table if not exists student(
 id int,
 name varchar(20),
 age int,
 birthday date
);

# 插入数据
insert into student
values
(1,"张三",20,"2002-5-8"),
(2,"李四",21,"2001-9-6"),
(3,"王五",19,"2003-12-15");

select * from student;


# 将张三的年龄改为 21，出生日期改为 2001/5/8
update student
set age = 21, birthday = "2001-5-8" where id = 1;
# 删除不到 21 岁的学生
delete from student where age < 21;





