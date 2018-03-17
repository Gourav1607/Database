-- Table 1
create table data1 (
    rno number(3) primary key,
    name varchar2(30),
    city varchar2(30) foreign key(rno),
    subject varchar2(3),
    doj date,
    percent number(6,2));

create table data2 (
    name varchar2(30) not null,
    marks number(6,2));
    
select *from data1;
select *from data2;
alter table data2 add primary key(rno);
update data2 set grade= 'A' where percent>90;
update data2 set grade= 'B' where percent>80 and percent<=90;
update data2 set grade= 'C' where percent>70 and percent<=80;
update data2 set grade= 'D' where percent>40 and percent<=70;
update data2 set grade= 'F' where percent<=40;
update data2 set phy=99 where rno=7;
update data2 set che=98 where rno=7;
update data2 set percent= (phy + che+mat)/300*100;
insert into data2(rno,name,phy,che,mat) values(&rno,'&name',&phy,&che,&mat);
update data2 set total=phy+che+mat;
alter table data2 add qualify varchar2(7) in('yes','no');

-- Table 2
create table assign(
    rno number(2) primary key,
    name varchar2(30),
    marks number(3) check(marks <= 100),
    grade varchar2(1),
    doj date);

insert into assign values(1,'Raj',56,'B','02-oct-1985');
insert into assign values(2,'Ajay',60,'B','23-nov-1982');
insert into assign values(3,'Vijay',70,'C','16-jul-1985');
insert into assign values(4,'Gourav',50,'D','02-oct-1985');
insert into assign values(5,'Niharika',93,'A','02-oct-1985');
insert into assign values(6,'Suyash',54,'D','02-oct-1985');
insert into assign values(7,'Disha',69,'B','02-oct-1985');
insert into assign values(8,'Nivedita',52,'B','02-oct-1985');
insert into assign values(9,'Shanti',58,'B','02-oct-1985');
insert into assign values(10,'Tulsi',64,'B','02-oct-1985');
insert into assign values(&rno,'&name',&marks,'&grade','&doj');
alter table assign add remarks varchar2(20);
update assign set remarks =NULL;
update assign set remarks='good' where grade ='A';

-- Table 3
create table data (
    rno number(3) primary key,
    name varchar2(30),
    city varchar2(30),
    subject varchar2(3),
    doj date,
    percent number(6,2));

insert into data (rno ,name,city) values (&rno,'&name','&city');
update data set percent=99 where rno=1;
update data set doj='16/jul/1995' where (rno=1 and percent =99);
alter table data drop column subject;
desc data;
alter table data add grade varchar2(2);
update data set grade='A' where percent>90;
alter table data add unique(name);
