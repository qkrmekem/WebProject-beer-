create table member(
    idnum number not null primary key,
    id varchar2(30) not null unique,
    password varchar2(30) not null,
    name varchar2(30) not null,
    birthdate date not null,
    gender number not null,
    email varchar2(30) not null
);

create sequence member_idnum;

drop sequence member_idnum;

drop table member;

insert into member values(member_idnum.nextval, 'microcosmos0906', '1q2w3w4r', '�鱸��', '2009/09/06', 1, 'cloud@google.com');

select * from member;