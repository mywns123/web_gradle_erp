select * from employee;
select * from department;

-- title dao
select titleNo, titleName from title;

select titleNo, titleName from title where titleNo=1;

insert into title values(6,'인턴');

update title set titleName = '인턴1' where titleNo = 6;

delete from title where titleNo = 6;