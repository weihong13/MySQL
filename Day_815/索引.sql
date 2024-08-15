# 索引

# 创建索引
create index index_sal on emp(sal);
create index index_ename on emp(ename);

# 显示表中的索引
show index from emp;

# 删除索引
drop index index_sal on emp;

# 查看是否使用索引
explain select * from emp where empno > 7788;
desc select * from emp where sal = 3100;
explain select * from emp where ename = 'smith';

# 索引失效的情况

# or 一个是索引、一个不是索引
explain select * from emp where sal = 5000 or ename = 'smith';

# 前缀是模糊的
explain select * from emp where ename like "%s"; # 前缀模糊 索引失效
explain select * from emp where ename like "s%"; # 后缀模糊 索引有效

# 索引放入表达式 或者函数中，索引也会失效
explain select * from emp where sal > 3000; # 不会失效
explain select * from emp where sal+1 > 3001; # 索引在表达式，会失效


# 类型转换也会导致失效
explain select * from emp where ename = 3000; # 字符串转数字（索引类型转换，失效）
explain select * from emp where sal = "3000"; # 字符串转数字（索引没有类型换行，有效）

