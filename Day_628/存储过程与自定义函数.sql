drop procedure if exists mypro1;
create procedure mypro(in a int, out b int, inout c int)
begin
  declare max_sal int default 0;
  select a;
  set a = 2;
  select a;
  
  select b;
  set b = 20;
  select b;
  
  select c;
  set c = 200;
  select c;
  
  select max(sal) into max_sal from emp;
  select max_sal;
  
  if max_sal > 3000 then
    select "high";
  else 
    select "low";
  end if;
end;

set @a = 1;
set @b = 10;
set @c = 100;

select @a;
select @b;
select @c;

call mypro(@a,@b,@c);

# 前n项和
create procedure mypro1(in a int)
begin
  declare sum_n int default 0;
  declare n int default 1;
  while n <= a do
    set sum_n = sum_n+n;
    set n = n+1;
  end while;
  select sum_n;
end;

set @a = 5;
select @a;


call mypro1(@a);



#练习
#	创建函数:实现检验登录的账号密码是否正常
#		1.创建账号信息表:(id,name,password)并存入数据
#		2.创建一个函数:传入两个参数
#		3.函数返回结果:(1)用户不存在(2)密码错误(3)登录成功



# 创建账号信息表
create table if not exists userdata(
  id int primary key auto_increment,
  username varchar(20) not null,
  pwd varchar(20) not null
)

# 插入数据
insert into userdata(username,pwd)
values
("weihong1","weihong1223"),
("weihong2","weihong1224"),
("weihong3","weihong1225");


# 函数
create procedure mypro2(in a varchar(20), in b varchar(20))
begin
  declare uname varchar(20);
  declare upwd varchar(20);
  select username into uname from userdata where username = a;
  select uname;
  if uname = null then
    select "用户不存在";
  else
    select pwd into upwd from userdata where pwd = b && username = a;
    if upwd = null then
      select "密码错误！";
    elseif upwd = b then
      select "登陆成功！";
    end if;
  end if;
end;



drop procedure if exists mypro2;

# 设置变量
set @uname = "weihong4";
set @pwd = "weihong1224";
select @uname;
select @pwd;

# 调用函数
call mypro2(@uname,@pwd);


















