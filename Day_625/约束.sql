# 约束
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
  name varchar(20),
  constraint id_name unique(id,name) #（联合唯一约束）,可以给联合唯一约束起名字
);

drop table if exists users;

select * from users;

insert into users(id,name) values(1,"张三");
insert into users(id,name) values(1,"李四");
insert into users(id,name) values(2,"张三");

insert into users(name) values("张三");
insert into users(name) values("张三"); # 报错 id 默认555，名字张三 都重复了

insert into users(id) values(1);
insert into users(id) values(1); # 不报错，name无默认值，默认为null，null可以重复

# 已有字段添加唯一约束
alter table users modify id int unique;

alter table users add constraint id_name unique(id,name);

# 删除唯一约束
# 唯一约束又是索引，因此可以安装删除索引的方式来删除
alter table users drop index id_name;

alter table users drop key id_name;


# 主键约束 -- primary key
drop table if exists users;

select * from users;

# 创建表时，设置主键
create table if not exists users(
  id int primary key,
  name varchar(20) not null
);
# 插入数据
insert into users(id,name) values(1,"张三");
insert into users(id,name) values(1,"张三"); # 报错，id是主键，唯一
insert into users(id,name) values(2,"张三");

insert into users(name) values("李四"); # 报错，插入值时必须给主键赋值


# 删除主键
alter table users drop primary key;


# 自动递增 -- auto_increment
drop table if exists users;

select * from users;

# 创建表时，对主键添加 自动递增
create table if not exists users
(
  id int primary key auto_increment,
  name varchar(20) not null
);

# 插入数据
insert into users(name) values("张三");
insert into users(name) values("张三"); # 不报错，id从一开始自动递增

insert into users(id,name) values(7,"张三"); # 也可以自己设置id不存在的数据

insert into users(name) values("张三"); # 再次插入的时候，就从8开始


# 外键 -- foreign key
drop table if exists student;

select * from student;

# 创建父表--student
create table if not exists student
(
  id int primary key auto_increment,
  name varchar(20) not null
);
# 创建子表 -- score，并连接外键
create table if not exists score
( 
  id int primary key auto_increment,
  student_id int,
  class_name varchar(20) not null,
  score int not null,
  #         外键名           子表的字段             父表的字段
  constraint fk1 foreign key (student_id) references student(id) 
);


insert into score values(1,1,"数学",88); # 报错，主键中没有 id为1 的学生

insert into student(name) values("张三");
insert into score values(1,1,"数学",88); # 成功添加

# 可以不给 student_id 赋值，在父表里无对应数据，称之为孤儿数据
insert into score(id,class_name,score) values(2,"数学",88); 

# 报错，子表外键还有链接的数据，得先删除子表中的数据，才能删除主表中的数据
delete from student where id =1; 

delete from score where id =1; # 删除主表数据

delete from student where id =1; # 成功











