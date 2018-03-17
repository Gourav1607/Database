create table g_stud(rno number(3),name varchar2(20),sname varchar2(20));

insert into g_stud values(1,'gourav','siddhad');
insert into g_stud values(2,'akriti','goenka');
insert into g_stud values(3,'anant','sharma');
insert into g_stud values(4,'prateek','khare');

select * from g_stud;
desc g_stud;

create table gou (
    roll number(4),
    name varchar2(10),
    sname varchar2(10),
    city varchar2(20),
    email varchar2(50));

alter table gou add primary key(roll);
insert into gou  values (&roll,'&name','&sname','&city','&email');
drop table  gou;
