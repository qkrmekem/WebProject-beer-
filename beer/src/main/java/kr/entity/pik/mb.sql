select * from beer;

select * from member;

create table member(
    idnum number(4) not null primary key,
    id varchar2(20) not null,
    password varchar2(20) not null,
    name varchar2(30) not null,
    birthday date not null,
    gender number(1) not null,
    email varchar2(30)
);


CREATE TABLE beer (
    b_num      NUMBER(10) NOT NULL primary key,
    b_name     VARCHAR2(100) NOT NULL,
    b_score    NUMBER(10,2) NOT NULL,
    b_aroma    VARCHAR2(100) NOT NULL,
    b_taste    VARCHAR2(100) NOT NULL,
    b_finish   VARCHAR2(100) NOT NULL,
    b_category VARCHAR2(100) NOT NULL,
    b_ml       VARCHAR2(100) NOT NULL,
    b_abv      VARCHAR2(100) NOT NULL,
    b_country  VARCHAR2(100) NOT NULL
);

alter table member add mb_num number(30);

alter table member
add constraint mb_num_fk foreign key(mb_num) references beer (b_num);
