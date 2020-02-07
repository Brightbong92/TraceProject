/*
create user trace identified by java;
grant resource, connect to trace;
conn trace/java;
*/
--delete table��--
delete from NOTICE;
delete from EMAIL_AUTH;
delete from MENTOR_LIST;
delete from REFUND_INFO;
delete from PAYMENT_DETAIL_INFO;
delete from PAYMENT_INFO;
delete from MENTORING_QA_REPLY;
delete from MENTORING_QA;


delete from MENTORING_REVIEW_REPLY;
delete from MENTORING_REVIEW_FILE;
delete from MENTORING_REVIEW_LIKE;
delete from MENTORING_REVIEW;




delete from MENTORING_DETAIL_INFO;
delete from MENTORING;
delete from MENTORING_CATEGORY;
delete from CART;

delete from SMS_AUTH;

delete from POINTS;

delete from DISABLED;
delete from MEMBER;


--drop trigger��--
drop trigger PAYMENT_TRI;

drop trigger REFUND_TRI1;
drop trigger REFUND_TRI2;

drop trigger MENTOR_TRI1;
drop trigger MENTOR_TRI2;

--drop table��--
drop table NOTICE;
drop table EMAIL_AUTH;
drop table MENTOR_LIST;

drop table REFUND_INFO;
drop table PAYMENT_DETAIL_INFO;
drop table PAYMENT_INFO;
drop table CART;

drop table MENTORING_QA_REPLY;
drop table MENTORING_QA;


drop table MENTORING_REVIEW_REPLY;
drop table MENTORING_REVIEW_FILE;
drop table MENTORING_REVIEW_LIKE;
drop table MENTORING_REVIEW;

drop table SMS_AUTH;

drop table MENTORING_DETAIL_INFO;
drop table MENTORING;
drop table MENTORING_CATEGORY;

drop table POINTS;
drop table DISABLED;
drop table MEMBER;

--drop sequence ��--
drop sequence NOTICE_SEQ;
drop sequence PAYMENT_INFO_SEQ;
drop sequence REFUND_INFO_SEQ;

drop sequence MENTORING_QA_REPLY_SEQ;
drop sequence MENTORING_QA_SEQ;



drop sequence MENTORING_REVIEW_SEQ;
drop sequence MENTORING_REVIEW_FILE_SEQ;
drop sequence MENTORING_REVIEW_REPLY_SEQ;

drop sequence MENTORING_DETAIL_INFO_SEQ;
drop sequence MENTORING_SEQ;

drop sequence CART_SEQ;

purge recyclebin;

--ȸ��--
create table MEMBER(
MEM_EMAIL varchar2(100) constraint MEMBER_PK primary key,
MEM_PWD varchar2(100),
MEM_NICK varchar2(50) constraint MEMBER_UQ unique,
MEM_AGE varchar2(50),
MEM_GENDER number,
MEM_PROFILE varchar2(500),
MEM_RDATE date,
MEM_POINT number,
MEM_AUTH number(1),
MEM_STATE number(1)
);

SET DEFINE OFF
insert into MEMBER values('admin', '$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm', '������', '30~39', 1, '�����ڻ���.jpg', SYSDATE, 9999, 2, 0); 
--insert into MEMBER values('kk070@hanmail.net','','�Ӽ���','20',1,'TraceDefaultProfile.jpg',SYSDATE,0,1,1);
insert into MEMBER values('a@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�Ӽ���','20~29',1,'TraceDefaultProfile.jpg',SYSDATE,0,1,0);

insert into MEMBER values('b@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','20~29',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('c@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�輺��','20~29',1,'TraceDefaultProfile.jpg',SYSDATE,0,1,0);
insert into MEMBER values('d@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�տ���','30~39',1,'TraceDefaultProfile.jpg',SYSDATE,0,1,0);
insert into MEMBER values('e@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�躸��','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,1,0);
insert into MEMBER values('f@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�����','20~29',1,'TraceDefaultProfile.jpg',SYSDATE,0,1,0);
insert into MEMBER values('g@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','20~29',1,'TraceDefaultProfile.jpg',SYSDATE,0,1,0);
insert into MEMBER values('h@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�۽���','20~29',1,'TraceDefaultProfile.jpg',SYSDATE,0,1,0);
insert into MEMBER values('i@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','����','20~29',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('j@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','20~29',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('k@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','��Ҵ�','20~29',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);

insert into MEMBER values('l@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','����ȣ','15~19',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('m@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','����ȯ','30~39',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('n@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','40~49',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('o@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','40~49',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('p@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('q@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('r@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','50~59',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('s@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','��̾�','50~59',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('t@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','50~59',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('u@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);

insert into MEMBER values('v@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�ڹ���','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('w@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','40~49',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('x@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','��μ�','30~39',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('y@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','��μ�','40~49',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('z@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�����','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('a1@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�����','40~49',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('a2@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('a3@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�����','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('a4@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','60~69',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('a5@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','50~59',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);

insert into MEMBER values('a6@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','��ȫ��','50~59',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('a7@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','��ȫ��','20~29',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('a8@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�ڱ�ȸ','50~59',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('a9@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�ڰ���','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('b1@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','40~49',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('b2@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','20~29',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('b3@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','20~29',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('b4@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','15~19',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('b5@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','���̼�','60~69',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('b6@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�ڻ���','40~49',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);

insert into MEMBER values('b7@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�迵��','40~49',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('b8@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�����','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('b9@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�ֹ���','60~69',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('c1@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','���Ͽ�','15~19',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('c2@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','40~49',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('c3@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�ռ���','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('c4@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','�ռ���','15~19',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('c5@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','30~39',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('c6@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','40~49',2,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);
insert into MEMBER values('c7@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','������','70~79',1,'TraceDefaultProfile.jpg',SYSDATE,0,0,0);


--insert into MEMBER(MEM_EMAIL, MEM_AGE, MEM_GENDER, MEM_RDATE, MEM_POINT, MEM_AUTH, MEM_STATE) values('disken@naver.com','20-29',2,SYSDATE,0,0,1);

commit;



--select * from MEMBER;

update MEMBER set mem_point = 300000 where mem_email = 'b@naver.com';

--delete from MEMBER where MEM_EMAIL = 'kk070@hanmail.net';



--delete from MEMBER where MEM_EMAIL = 'kk070@hanmail.net';

--select * from MEMBER where MEM_EMAIL = 'kk070@hanmail.net';

--Ż��(��Ȱ��ȭ)
create table DISABLED(
DIS_REASON number(1),
DIS_IMPROVE varchar2(500),
MEM_EMAIL varchar2(100) constraint DISABLED_FK references MEMBER(MEM_EMAIL) on delete cascade
);
--����Ʈ--
create table POINTS(
PO_CONTENT varchar2(500),
PO_SAVING varchar2(100),
PO_RDATE date,
MEM_EMAIL varchar2(100) constraint POINTS_FK references MEMBER(MEM_EMAIL) on delete cascade
);


create table EMAIL_AUTH(
MEM_EMAIL varchar2(100) constraint EMAIL_AUTH_PK primary key,
EMAIL_UUID varchar2(100)
);

create table MENTOR_LIST(
MEM_EMAIL varchar2(100) constraint MENTOR_LIST_FK references MEMBER(MEM_EMAIL) on delete cascade,
ML_NAME varchar(50),
ML_PHONE varchar2(11),
ML_YOURSELF varchar2(1000),
ML_OFNAME varchar2(300),
ML_FNAME varchar2(300),
MTRCG_NO number,
ML_APPLY number(1),
constraint MENTOR_LIST_PK primary key(MEM_EMAIL)
);

insert into MENTOR_LIST values('a@naver.com', '�Ӽ���', '01021735831', '�ڱ�Ұ�����','����ڵ����.png','����ڵ����1.png',0,0);
insert into MENTOR_LIST values('c@naver.com', '�輺��', '01046145442', '�ڱ�Ұ�����','����ڵ����.png','����ڵ����2.png',1,0);
insert into MENTOR_LIST values('d@naver.com', '�տ���', '01033453453', '�ڱ�Ұ�����','����ڵ����.png','����ڵ����3.png',2,0);
insert into MENTOR_LIST values('e@naver.com', '�躸��', '01034534531', '�ڱ�Ұ�����','����ڵ����.png','����ڵ����4.png',3,0);
insert into MENTOR_LIST values('f@naver.com', '�����', '01078967855', '�ڱ�Ұ�����','�ڰ���.png','�ڰ���1.png',4,0);
insert into MENTOR_LIST values('g@naver.com', '������', '01034573463', '�ڱ�Ұ�����','�ڰ���.png','�ڰ���2.png',5,0);
insert into MENTOR_LIST values('h@naver.com', '�۽���', '01064347422', '�ڱ�Ұ�����','�ڰ���.png','�ڰ���3.png',6,0);

--select * from MENTOR_LIST;

-- �����û �����ϸ� �Ϲ�ȸ������ �����
create or replace trigger MENTOR_TRI1
after
    update of ML_APPLY on MENTOR_LIST for each row
begin
    IF (:NEW.ML_APPLY = 0) THEN
    update MEMBER set MEM_AUTH = 1 where MEM_EMAIL = :NEW.MEM_EMAIL;
    end if;
end;
/

-- ������� ����ϸ� ���丮��Ʈ���̺� ������ ����
create or replace trigger MENTOR_TRI2
after
    update of MEM_AUTH on MEMBER for each row
begin
    IF (:NEW.MEM_AUTH = 0) THEN
    delete from MENTOR_LIST where MEM_EMAIL = :NEW.MEM_EMAIL;
    end if;
end;
/

create table SMS_AUTH(
ML_PHONE varchar2(11) constraint SMS_AUTH_PK primary key,
SMS_UUID varchar2(100)
);


create table MENTORING_CATEGORY(
MTRCG_NO number constraint MENTORING_CATEGORY_PK primary key,
MTRCG_NAME varchar2(100)
);

SET DEFINE OFF 
insert into MENTORING_CATEGORY values(0, '������');
insert into MENTORING_CATEGORY values(1, '����');
insert into MENTORING_CATEGORY values(2, '����');
insert into MENTORING_CATEGORY values(3, '�丮');
insert into MENTORING_CATEGORY values(4, '����&����');
insert into MENTORING_CATEGORY values(5, '��Ƽ');
insert into MENTORING_CATEGORY values(6, '�����');
commit;
--select * from MENTORING_CATEGORY;

--���丵--
create table MENTORING(
MTR_SEQ number constraint MENTORING_PK primary key,
MTR_SUBJECT varchar2(500),
MTR_CONTENT CLOB,
MTR_PRICE number,
MTR_AREA varchar2(100),
MTR_ADDR varchar2(1000),
MTR_JUMSU number default 0,
MTR_PROFILE varchar2(500),
MTR_HASHTAG varchar2(1000),
MTR_RDATE date,
MTRCG_NO number constraint MENTORING_FK references MENTORING_CATEGORY(MTRCG_NO),
MEM_EMAIL varchar2(100) constraint MENTORING_FK2 references MEMBER(MEM_EMAIL) on delete cascade
);
create sequence MENTORING_SEQ minvalue 0 start with 1 increment by 1 nocache;

--delete from MENTORING;

/*<insert id="insertBoard" parameterType="com.my.spring.domain.BoardVO">

   <selectKey keyProperty="seq" order="BEFORE" resultType="int">
      SELECT BOARD_SEQ.NEXTVAL FROM DUAL
   </selectKey>
   INSERT INTO BOARD (seq, writer, title, content)
            VALUES (#{seq}, #{writer}, #{title}, #{content})
</insert>*/



--insert into MENTORING values(MENTORING_SEQ.nextval, '�ڼ������뷱���䰡', '�ڼ������ص���', 30000, '������/ȫ��', '���� ���빮�� ���Ϸ� 463 3��', 0, '���丵�������̹���.jpg', 0, 0, 'a@naver.com');
--select MENTORING_SEQ.nextval from dual; ����ؼ� MENTORING���̺�, MENTORING_DETAIL_INFO ���̺� MTR_SEQ �Ȱ��� �־������. // ���̹�Ƽ�� Ʈ����ǻ���ؾ���

/*
insert into MENTORING values(1, '�ڼ������뷱���䰡', '�ڼ������ص���', 30000, '����', '���� ���빮�� ���Ϸ� 463 3��', 0, '���丵�������̹���.jpg', '#�䰡#����', 0, 'a@naver.com');
insert into MENTORING values(2, '�Ϸ�����Ÿ�� ��Ű', '��Ű���丵�ص���', 30000, '����', '���� �Ǵ�', 0, '���丵�������̹���.jpg', '#�䰡#����', 0, 'a@naver.com');
insert into MENTORING values(3, '�ܿ￡�� ���ú���', '���尡���Ŀ�', 30000, '���', '���� ���빮�� ���Ϸ� 463 3��', 0, '���丵�������̹���.jpg', '#�䰡#����', 0, 'a@naver.com');
insert into MENTORING values(4, '������ ����', '�����������Ŀ�', 30000, '����', '���� ���', 0, '���丵�������̹���.jpg', '#�䰡#����', 0, 'a@naver.com');

insert into MENTORING values(5, '�����׼���', '�����װ����Ŀ�', 30000, '���', '���� ���빮�� ���Ϸ� 463 3��', 0, '���丵�������̹���.jpg', '#�䰡#����', 1, 'a@naver.com');
insert into MENTORING values(6, '��Ÿ����', '��Ÿ�����Ŀ�', 30000, '���', '���� �Ǵ�', 0, '���丵�������̹���.jpg', '#�䰡#����', 1, 'a@naver.com');
insert into MENTORING values(7, 'DIY ����', 'DIY�����Ŀ�', 30000, '����', '���� ���빮�� ���Ϸ� 463 3��', 0, '���丵�������̹���.jpg', '#�䰡#����', 2, 'a@naver.com');
insert into MENTORING values(8, '���ڱ� ��������', '���ڱⰡ���Ŀ�', 30000, '����', '���� ���', 0, '���丵�������̹���.jpg', '##����', 2, 'a@naver.com');

insert into MENTORING values(9, '�����׼���', '�����װ����Ŀ�', 30000, '���', '���� ���빮�� ���Ϸ� 463 3��', 0, '���丵�������̹���.jpg', '#����#����', 1, 'a@naver.com');
insert into MENTORING values(10, '��Ÿ����', '��Ÿ�����Ŀ�', 30000, '���', '���� �Ǵ�', 0, '���丵�������̹���.jpg', '#��Ÿ#����', 1, 'a@naver.com');
insert into MENTORING values(11, 'DIY ����', 'DIY�����Ŀ�', 30000, '����', '���� ���빮�� ���Ϸ� 463 3��', 0, '���丵�������̹���.jpg', '#DIY#����', 2, 'a@naver.com');
insert into MENTORING values(12, '���ڱ� ��������', '���ڱⰡ���Ŀ�', 30000, '����', '���� ���', 0, '���丵�������̹���.jpg', '#���ڱ�#����', 2, 'a@naver.com');
*/

SET DEFINE OFF
insert into MENTORING values(MENTORING_SEQ.nextval, '�ڼ������뷱���䰡', '�ڼ������ص���', 25000, '����', '���� ���빮�� ���Ϸ� 463 3��', 0, '�䰡.jpg', '#�䰡#�°�', SYSDATE ,0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�Ϸ�����Ÿ�� ��Ű', '��Ű���丵�ص���', 25000, '����', '���� �Ǵ�', 0, '��Ű.jpg', '#����', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�ܿ￡�� ���ú���', '���尡���Ŀ�', 50000, '���', '���� ���빮�� ���Ϸ� 463 3��', 0, '����캸��.jpg', '#S��', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '������ ����', '�����������Ŀ�', 30000, '����', '���� �������� ���Ǵ��� 43�� 13 ', 0, '������.jpg', '#ȣ��#���̾�Ʈ', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '���� ģ������', '�¸� �˷��帳�ϴ�', 35000, '���', '����Ư���� ���α� ��ô1�� ���η� 445', 0, '�¸�.jpg', '#���̾�Ʈ#����', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�̿���', '�Ƹ��ٿ��� ù���� �ٷ��̰��Դϴ�', 45000, '���', '��õ�� ���̱� �ߵ�', 0, '�̿���.jpg', '#����#�̿�', SYSDATE , 5, 'g@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '������Ʈ����', 'S�ں��� �������� �پ˷��帳�ϴ٤���', 40000, '����', '���� ����3�� ���Ӹ�������Ʈ 105�� 506ȣ', 0, '������Ʈ����.jpg', '#���ǵ�#��Ʈ��Ʈ',  SYSDATE ,0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '����', 'ȣ�ż��� ù������ �������� !', 25000, '����', '���� �ſ�7�� Ǫ����������Ʈ 203�� 1207ȣ', 0, '����.jpg', '#ȣ�ż�', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '����', '����ü�´ܷú��� �����ϽǺб��� �����մϴ� ����', 40000, '����', '���� ������ ���� �����Ͽ콺 501�� ', 0, '����.jpg', '#ȣ�ż�#���̾�Ʈ', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�״Ͻ�', '���� ���� �״Ͻ� ���ϱ��� �ʿ���� �ٷ� �˷��帮�ڽ��ϴ� ', 20000, '����', '���� �߶��� ��ȭ�� 311-5 ', 0, '�״Ͻ�.jpg', '#����#���̾�Ʈ', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '����', '��Ŭ ���� ���մϴ� �ϴܿ����� .', 20000, '���', '��õ�� ���̱� ��õ�� ', 0, '����.jpg', '#��Ŭ#����', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�౸', '�����౸���� �������� ���������ּ���.', 40000, '����', '���� ���̱� �ߵ�', 0, '�౸.jpg', '#�帮��#�ٳ���ű', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, 'ü��', '������ ������ å�����ڽ��ϴ� ����', 30000, '����', '���� ���̱� ��', 4, 'ü��.jpg', '#����#����', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '����', '��Ǯ���� ������ ������ å�����ϴ�.', 50000, '����', '���� ���۱� �Ŵ��2��', 2, '����.jpg', '#����#��¯', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '������', '�߿�X �ǳ�ü���� �ֽ��ϴ�', 30000, '����', '���� ���۱� �븲1��', 5, '������.jpg', '#����#���̾�Ʈ', SYSDATE , 0, 'a@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�������', '�ڽ����� �˸´� ���� �����ƿ�!', 30000, '���', '����� ���Ǳ� ����ŵ� ',4, '�������.jpg', '#�Ǽ�����#����', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��������', '�Ӹ������� �����ϼ���!', 20000, '����', '���� ���Ǳ� �Ż絿', 5, '��������.jpg', '#�Ǽ�����', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�������', '��¦��¦ ��θ��̼���', 25000, '����', '���� ���Ǳ� �Ÿ���', 2, '�������.jpg', '#�Ǽ�����#����', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��Ų����', 'ȣ�ڽ����� �̻ڰ����¹� �˷������', 30000, '����', '���� ���۱� �뷮��2��', 3, '��Ų����.jpg', '#����#��Ʈ', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�ŵ����', '�ŵ������� �����������ϴ� �ͼ� �ǿ����ΰ� ���������', 35000, '����', '���� �������� �ű�1��', 3, '�ŵ����.jpg', '#��Ȱ#��', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��������', '������ �ź����� ü���غ�����', 35000, '���', '����� �������� ���������� ', 5, '��������.jpg', '#����#�׸�', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '���װ���', '�������Ҽ��ִ� �������� �ǿ�ǰ�� ��������', 45000, '����', '���� ������ ������', 2, '���װ���.jpg', '#����#��Ʈ', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�ѱ����ʰ���', '������ ���� ��������', 50000, '����', '���� ������ ������', 3, '�ѱ����ʰ���.jpg', '#��', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�縻����', '�������� �縻�� �ž����!', 30000, '����', '���� ������ ȿâ��', 4, '�縻����.jpg', '#�߰����縻', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, 'ĥ������', '�̻� ��ĵ� ���������� ����', 50000, '����', '���� ������ û�ĵ�', 4, 'ĥ������.jpg', '#�ڱ�#ĥ', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '����ĵ�����', '���� ������������', 30000, '���', '����� ������ ��� ', 4, '����ĵ�����.jpg', '#��#����', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��������', '������ ���� ��췯������!', 45000, '����', '���� ������ ��ȭ��', 5, '��������.jpg', '#����', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�ݼӰ���', 'ö�� �Ƹ��ٿ��� ������ƿ�', 30000, '����', '���� ������ ���̵�', 5, '�ݼӰ���.jpg', '#����', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�Թ����', '���ڱ� ���� ��������~', 30000, '����', '���� ������ ���絿', 1, '�Թ����.jpg', '#���ڱ�#õ', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��������', '������ �������� �߾��� �����ϼ���', 20000, '����', '���� ��õ�� ȭ���', 5, '��������.jpg', '#����#������', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��Ƽ������', '���ٳ��� ���׵�� �̻۾Ǽ������� �����ƿ�', 20000, '���', '����� ������ ��â�� ', 3, '��Ƽ������.jpg', '#����ġ����#�Ƹ��ٿ�', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�Ӹ������', '�̻� �Ӹ���� �����ƿ�', 25000, '����', '���� ���α� ����4��� 29', 2, '�Ӹ������.jpg', '#������#�Ӹ����', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '���ڱ� ��������', '���ڱⰡ���Ŀ�', 25000, '����', '���� ���α� ������ 148', 5, '���ڱ� ��������.jpg', '#�ɺ�#����', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��Ұ���', '��ҷε� ������ �����մϴ�', 45000, '����', '���� ���ϱ� �Ｑ����10�ٱ� 34', 4, '��Ұ���.jpg', '#ū���', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�׾Ƹ�����', '������ �׾Ƹ��� ���� �����ּ���', 45000, '����', '���� ������ ȭ�', 4, '�׾Ƹ�����.jpg', '#���嵶', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��Ÿ����', '��Ÿ��ĵ� ��������', 40000, '���', '���� ���ϱ� �Ƹ����� 68 ', 4, '��Ÿ����.jpg', '#��Ÿ#����ŷ', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��������', '������ ����� �����غ���', 45000, '����', '���� ���빮�� âõ��', 5, '��������.jpg', '#Ŀ��#����', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�������', '���ٸ� �Ǽ������� ��������', 35000, '����', '���� ���ϱ� ���ϵ� 42-32', 2, '�������.jpg', '#�Ǽ�����', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��������', '�Ӹ� �Ǽ����� ��������', 50000, '����', '���� ���ϱ� ������46�� 17', 3, '��������.jpg', '#�Ӹ����', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�Ͱ��̰���', '������ �Ǽ����� ��������', 30000, '����', '������ 21-71', 4, '�Ͱ��̰���.jpg', '#�Ǽ�����#�ڵ���̵�', SYSDATE , 2, 'd@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�������ĿƮ', '�ոӸ�1�� �ʹ� ������Ÿ���̿���', 30000, '���', '���� ���ϱ� ������ 10 ', 5, '�������ĿƮ.jpg', '#���#����', SYSDATE , 5, 'g@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��߰���', '�ǰ��Ѹ�߷� �������� �ڽŰ� ì�⼼��!', 30000, '����', '���� ���ϱ� �Ͽ��', 2, '��߰���.jpg', '#���#�ǰ�', SYSDATE , 5,'g@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�̿���ǰ����', '�ռ����� �̿뵵���� ����������!', 30000, '����', 'û������ 207-41', 3, '�̿���ǰ����.jpg', '#�̿�#����', SYSDATE , 5, 'g@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '��Ÿ�ϸ�', '�����Ժ�ȭ�ϴ� Ʈ���� ���� ���غ����� ', 30000, '����', '���� ���빮�� ȫ���� 111-2', 4, '��Ÿ�ϸ�.jpg', '#���#��Ÿ�ϸ�', SYSDATE , 5, 'g@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, 'ȭ��ǰ��', '�Ǻο��´� ȭ��ǰ�� Ȯ���� �˷��帳�ϴ�', 50000, '����', '���⵿ 1212', 4, 'ȭ��ǰ��.jpg', '#�Ǻ�#����', SYSDATE , 5, 'g@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, 'ü������', '��Ӿƴ϶� �Դ°͵� �Ű��� �մϴ�', 20000, '���', '�Ⱦϵ�4�� 23-3 ', 5, 'ü������.jpg', '#�#�ǰ�', SYSDATE , 5,'g@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '���ʸ���ũ��', '����⺻�� ���̽����� �����մϴ�', 30000, '����', '��սʸ��� 813', 2, '���ʸ���ũ��.jpg', '#�̿�#����', SYSDATE , 5, 'g@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�������ũ��', '���ʸ���ũ�� ��������Դϴ�', 50000, '����', '���� ������ ��սʸ��� 336-7', 3, '�������ũ��.jpg', '#�̿�#����', SYSDATE , 5, 'g@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�Ǻι̿���', '��Ƽ out', 30000, '����', '�Ŵ絿 153-13', 3, '�Ǻι̿���.jpg', '#�̿�#�Ǻ�', SYSDATE , 5, 'g@naver.com');
insert into MENTORING values(MENTORING_SEQ.nextval, '�̹�������ŷ', '�׻� ���� �ڽ��Ǹ���� �������ϴ�!', 350000, '����', '�Ŵ絿 851', 3, '�̹�������ŷ.jpg', '#ǥ��#�̹���', SYSDATE , 5, 'g@naver.com');

commit;


--select * from (select ROWNUM rnum , aa.* from (select * from Mentoring where MTRCG_NO like 0 order by MTR_SEQ desc) aa) where rnum>=1 and rnum<=4;


--select MTR_SEQ, MTR_SUBJECT, MTR_CONTENT, MTR_PRICE, MTR_AREA, MTR_ADDR, MTR_JUMSU, MTR_PROFILE, MTR_HASHTAG, MTRCG_NO, MEM_EMAIL from (select ROWNUM rnum , aa.* from (select * from Mentoring where MTRCG_NO like 5 and MTR_SEQ not like 51 order by MTR_SEQ desc) aa) where rnum>0 and rnum<=4;
--select * from mentoring where MTR_HASHTAG like '%#�䰡%';
--select * from mentoring;

--select MTR_SUBJECT from (select ROWNUM rnum , aa.* from (select * from Mentoring where MTR_SUBJECT like '��%') aa) where rnum>0 and rnum<=10;


--select * from mentoring where mtrcg_no like 0;

/*
select * from MENTORING order by MTR_SEQ desc;

select * from MENTORING where MTR_SUBJECT like '%����%';

       select MTR_SEQ, MTR_SUBJECT, MTR_CONTENT, MTR_PRICE, MTR_AREA, MTR_ADDR, MTR_JUMSU, MTR_PROFILE, MTR_HASHTAG, MTRCG_NO, MEM_EMAIL
        from (select ROWNUM rnum , aa.* from (select * from Mentoring order by MTR_SEQ desc) aa)
          where rnum>0 and rnum<=6;
             
             
               select MTR_SEQ, MTR_SUBJECT, MTR_CONTENT, MTR_PRICE, MTR_AREA, MTR_ADDR, MTR_JUMSU, MTR_PROFILE, MTR_HASHTAG, MTRCG_NO, MEM_EMAIL
        from (select ROWNUM rnum , aa.* from (select * from Mentoring where MTRCG_NO like 0 order by MTR_SEQ desc) aa)
          where rnum>0 and rnum<=6;     
  */           
             

--���丵_��_����--
create table MENTORING_DETAIL_INFO(
MTRDI_SEQ number constraint MENTORING_DETAIL_INFO_PK primary key,
MTRDI_STIME timestamp,
MTRDI_ETIME timestamp,
MTRDI_MAX_PCNT number,
MTRDI_NOW_PCNT number,
MTR_SEQ number constraint MENTORING_DETAIL_INFO_FK references MENTORING(MTR_SEQ) on delete cascade
);
create sequence MENTORING_DETAIL_INFO_SEQ minvalue 0 start with 1 increment by 1 nocache;
--insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-01-18 16:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-01-18 18:00','YYYY-MM-DD HH24:MI'), 4, 0, 1, MENTORING_SEQ.currval);
--insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-01-20 18:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-01-18 20:00','YYYY-MM-DD HH24:MI'), 4, 0, 1, MENTORING_SEQ.currval);
--insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-01-24 20:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-01-18 22:00','YYYY-MM-DD HH24:MI'), 4, 0, 1, MENTORING_SEQ.currval);
-- insert �� MTR_SEQ�� MENTORING ���̺� select MENTORING_SEQ.nextval from dual; ����ؼ� ���� MTR_SEQ������ �־��ָ�� ���̹�Ƽ�� Ʈ����� ����ؾ���

/*
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-01-18 16:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-01-18 18:00','YYYY-MM-DD HH24:MI'), 4, 0, 1, 1);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-01-20 18:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-01-20 20:00','YYYY-MM-DD HH24:MI'), 4, 0, 1, 1);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-01-24 20:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-01-24 22:00','YYYY-MM-DD HH24:MI'), 4, 0, 1, 1);

insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-01-20 10:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-01-20 13:00','YYYY-MM-DD HH24:MI'), 10, 0, 1, 2);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-01-28 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-01-28 17:00','YYYY-MM-DD HH24:MI'), 10, 0, 1, 2);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-03-24 20:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-03-24 23:00','YYYY-MM-DD HH24:MI'), 10, 0, 1, 2);


select MTRDI_SEQ, TO_CHAR(MTRDI_STIME, 'YYYY-MM-DD HH24:MI'), TO_CHAR(MTRDI_ETIME, 'YYYY-MM-DD HH24:MI'), MTRDI_MAX_PCNT, MTRDI_NOW_PCNT, MTRDI_STATE, MTR_SEQ  from MENTORING_DETAIL_INFO where MTR_SEQ = 1;

select MTRDI_SEQ, TO_CHAR(MTRDI_STIME, 'YYYY-MM-DD HH24:MI'), TO_CHAR(MTRDI_ETIME, 'YYYY-MM-DD HH24:MI'), MTRDI_MAX_PCNT, MTRDI_NOW_PCNT, MTRDI_STATE, MTR_SEQ  from MENTORING_DETAIL_INFO;
*/

insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-01-18 16:00', '2020-01-18 18:00', 4, 0, 2);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-01-20 18:00', '2020-01-20 20:00', 4, 0, 2);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-01-24 20:00', '2020-01-24 22:00', 4, 0, 2);

insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-01-20 10:00','2020-01-20 13:00', 10, 0, 3);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-01-28 15:00','2020-01-28 17:00', 10, 0, 3);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-03-24 20:00','2020-03-24 23:00', 10, 0, 3);


select MTRDI_SEQ, TO_CHAR(MTRDI_STIME, 'YYYY-MM-DD HH24:MI') as mtrdi_stime, TO_CHAR(MTRDI_ETIME, 'YYYY-MM-DD HH24:MI') as mtrdi_etime, MTRDI_MAX_PCNT, MTRDI_NOW_PCNT, MTR_SEQ  from MENTORING_DETAIL_INFO;

commit;


--select MENTORING_DETAIL_INFO_SEQ.nextval from dual;

--���丵_QA--
create table MENTORING_QA(
MTRQA_SEQ number constraint MENTORING_QA_PK primary key,
MTRQA_CONTENT varchar2(1000),
MTRQA_RDATE date,
MEM_EMAIL varchar2(100),
MTR_SEQ number constraint MENTORING_QA_FK references MENTORING(MTR_SEQ) on delete cascade
);
create sequence MENTORING_QA_SEQ minvalue 0 start with 1 increment by 1 nocache;

insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�1', SYSDATE, 'b@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�2', SYSDATE, 'b@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�3', SYSDATE, 'b@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�4', SYSDATE, 'b@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�5', SYSDATE, 'b@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�6', SYSDATE, 'b@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�7', SYSDATE, 'b@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�8', SYSDATE, 'b@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�9', SYSDATE, 'b@naver.com', 2);


insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�10', SYSDATE, 'c@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�11', SYSDATE, 'c@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�12', SYSDATE, 'c@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�13', SYSDATE, 'c@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�14', SYSDATE, 'c@naver.com', 2);
insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '�䰡���������̿�15', SYSDATE, 'c@naver.com', 2);


select * from MENTORING_QA;

       select * from (select ROWNUM rnum , aa.* from (select * from Mentoring_QA where MTR_SEQ = 2 order by MTRQA_SEQ desc) aa)
          where rnum>0 and rnum<=3;


/*
       select MTR_SEQ, MTR_SUBJECT, MTR_CONTENT, MTR_PRICE, MTR_AREA, MTR_ADDR, MTR_JUMSU, MTR_PROFILE, MTR_HASHTAG, MTRCG_NO, MEM_EMAIL
        from (select ROWNUM rnum , aa.* from (select * from Mentoring order by MTR_SEQ desc) aa)
          where rnum>0 and rnum<=6;
*/

--select MTRQA_SEQ, MTRQA_CONTENT, MTRQA_RDATE, mq.MEM_EMAIL, MTR_SEQ, MEM_NICK, MEM_PROFILE from MENTORING_QA mq, MEMBER me where mq.MEM_EMAIL = me.MEM_EMAIL and MTR_SEQ = 2;

/*
select MTRQA_SEQ, MTRQA_CONTENT, MTRQA_RDATE, MEM_EMAIL, MTR_SEQ, MEM_NICK, MEM_PROFILE from 
(select ROWNUM rnum, aa.MTRQA_SEQ, aa.MTRQA_CONTENT, aa.MTRQA_RDATE, aa.MEM_EMAIL, aa.MTR_SEQ, aa.MEM_NICK, aa.MEM_PROFILE from
(select MTRQA_SEQ, MTRQA_CONTENT, MTRQA_RDATE, mq.MEM_EMAIL, MTR_SEQ, MEM_NICK, MEM_PROFILE from MENTORING_QA mq, MEMBER me where mq.MEM_EMAIL = me.MEM_EMAIL and MTR_SEQ = 2) aa)
where rnum > 0 and rnum <= 3;
*/

/*
select ROWNUM rnum, aa.MTRQA_SEQ, aa.MTRQA_CONTENT, aa.MTRQA_RDATE, aa.MEM_EMAIL, aa.MTR_SEQ, aa.MEM_NICK, aa.MEM_PROFILE from
(select MTRQA_SEQ, MTRQA_CONTENT, MTRQA_RDATE, mq.MEM_EMAIL, MTR_SEQ, MEM_NICK, MEM_PROFILE from MENTORING_QA mq, MEMBER me where mq.MEM_EMAIL = me.MEM_EMAIL and MTR_SEQ = 2) aa ;
*/



--���丵_QA_���--
create table MENTORING_QA_REPLY(
MTRQARP_SEQ number constraint MENTORING_QA_REPLY_PK primary key,
MTRQARP_CONTENT varchar2(1000),
MTRQARP_RDATE date,
MEM_EMAIL varchar2(100),
MTRQA_SEQ number constraint MENTORING_QA_REPLY_FK references MENTORING_QA(MTRQA_SEQ) on delete cascade
);
create sequence MENTORING_QA_REPLY_SEQ minvalue 0 start with 1 increment by 1 nocache;

insert into MENTORING_QA_REPLY values(MENTORING_QA_REPLY_SEQ.nextval, '�䰡���������亯1', SYSDATE, 'admin', 2);
insert into MENTORING_QA_REPLY values(MENTORING_QA_REPLY_SEQ.nextval, '�䰡���������亯2', SYSDATE, 'admin', 3);
insert into MENTORING_QA_REPLY values(MENTORING_QA_REPLY_SEQ.nextval, '�䰡���������亯3', SYSDATE, 'admin', 4);
insert into MENTORING_QA_REPLY values(MENTORING_QA_REPLY_SEQ.nextval, '�䰡���������亯4', SYSDATE, 'admin', 5);
insert into MENTORING_QA_REPLY values(MENTORING_QA_REPLY_SEQ.nextval, '�䰡���������亯5', SYSDATE, 'admin', 6);
insert into MENTORING_QA_REPLY values(MENTORING_QA_REPLY_SEQ.nextval, '�䰡���������亯6', SYSDATE, 'admin', 7);
insert into MENTORING_QA_REPLY values(MENTORING_QA_REPLY_SEQ.nextval, '�䰡���������亯7', SYSDATE, 'admin', 8);
insert into MENTORING_QA_REPLY values(MENTORING_QA_REPLY_SEQ.nextval, '�䰡���������亯8', SYSDATE, 'admin', 9);
insert into MENTORING_QA_REPLY values(MENTORING_QA_REPLY_SEQ.nextval, '�䰡���������亯9', SYSDATE, 'admin', 10);



select * from MENTORING_QA_REPLY;


commit;

select MTRQARP_SEQ, MTRQARP_CONTENT, MTRQARP_RDATE, mqr.MEM_EMAIL, MTRQA_SEQ, MEM_NICK, MEM_PROFILE from MENTORING_QA_REPLY mqr, MEMBER me where mqr.MEM_EMAIL = me.MEM_EMAIL and MTRQA_SEQ = 10;



--���丵_����--
create table MENTORING_REVIEW(
MTRRV_SEQ number constraint MENTORING_REVIEW_PK primary key,
MTRRV_CONTENT varchar2(1000),
MTRRV_RDATE date,
MTRRV_JUMSU number,
MTRRV_LIKECNT number,
MTR_SEQ number constraint MENTORING_REVIEW_FK1 references MENTORING(MTR_SEQ) on delete cascade,
MEM_EMAIL varchar2(100) constraint MENTORING_REVIEW_FK2 references MEMBER(MEM_EMAIL) on delete cascade
);
create sequence MENTORING_REVIEW_SEQ minvalue 0 start with 1 increment by 1 nocache;

--select MENTORING_REVIEW_SEQ.nextval from dual;

insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��1', SYSDATE, 5, 2, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��2', SYSDATE, 4, 3, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��3', SYSDATE, 3, 3, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��4', SYSDATE, 2, 4, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��5', SYSDATE, 1, 2, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��6', SYSDATE, 1, 1, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��7', SYSDATE, 2, 3, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��8', SYSDATE, 3, 4, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��9', SYSDATE, 4, 5, 2, 'b@naver.com');

insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��10', SYSDATE, 5, 2, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��11', SYSDATE, 0, 3, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��12', SYSDATE, 0, 2, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��13', SYSDATE, 2, 4, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��14', SYSDATE, 0, 5, 2, 'b@naver.com');
insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '�䰡�����ı��15', SYSDATE, 3, 6, 2, 'b@naver.com');

commit;

select * from MENTORING_REVIEW;



--select sum(mtrrv_jumsu) from MENTORING_REVIEW where MTR_SEQ = 2;
--select count(*) from MENTORING_REVIEW where MTR_SEQ = 2;





--���丵_����_����--
create table MENTORING_REVIEW_FILE(
MTRRVF_SEQ number constraint MENTORING_REIVEW_FILE_PK primary key,
MTRRVF_OFNAME varchar2(300),
MTRRVF_FNAME varchar2(300),
MTRRV_SEQ number constraint MENTORING_REVIEW_FILE_FK references MENTORING_REVIEW(MTRRV_SEQ) on delete cascade
);
create sequence MENTORING_REVIEW_FILE_SEQ minvalue 0 start with 1 increment by 1 nocache;

insert into MENTORING_REVIEW_FILE values(MENTORING_REVIEW_FILE_SEQ.nextval, '���丵���������̸�.jpg','���丵���������̸�1.jpg', 2);
insert into MENTORING_REVIEW_FILE values(MENTORING_REVIEW_FILE_SEQ.nextval, '���丵���������̸�.jpg','���丵���������̸�2.jpg', 2);

insert into MENTORING_REVIEW_FILE values(MENTORING_REVIEW_FILE_SEQ.nextval, '���丵���������̸�.jpg','���丵���������̸�3.jpg', 3);
insert into MENTORING_REVIEW_FILE values(MENTORING_REVIEW_FILE_SEQ.nextval, '���丵���������̸�.jpg','���丵���������̸�4.jpg', 3);
insert into MENTORING_REVIEW_FILE values(MENTORING_REVIEW_FILE_SEQ.nextval, '���丵���������̸�.jpg','���丵���������̸�5.jpg', 3);
insert into MENTORING_REVIEW_FILE values(MENTORING_REVIEW_FILE_SEQ.nextval, '���丵���������̸�.jpg','���丵���������̸�6.jpg', 3);

insert into MENTORING_REVIEW_FILE values(MENTORING_REVIEW_FILE_SEQ.nextval, '���丵���������̸�.jpg','���丵���������̸�7.jpg', 4);
insert into MENTORING_REVIEW_FILE values(MENTORING_REVIEW_FILE_SEQ.nextval, '���丵���������̸�.jpg','���丵���������̸�8.jpg', 4);
insert into MENTORING_REVIEW_FILE values(MENTORING_REVIEW_FILE_SEQ.nextval, '���丵���������̸�.jpg','���丵���������̸�9.jpg', 4);

commit;

select * from MENTORING_REVIEW_FILE;

--select MTRRVF_SEQ, MTRRVF_OFNAME, MTRRVF_FNAME, MTRRV_SEQ from MENTORING_REVIEW_FILE where MTRRV_SEQ = 2 order by MTRRV_SEQ desc





--���丵_����_���ƿ�--
create table MENTORING_REVIEW_LIKE(
MEM_EMAIL constraint MENTORING_REVIEW_LIKE_FK1 references MEMBER(MEM_EMAIL) on delete cascade,
MTRRV_SEQ constraint MENTORING_REVIEW_LIKE_FK2 references MENTORING_REVIEW(MTRRV_SEQ) on delete cascade,
constraint MENTORING_REVIEW_LIKE_PK primary key (MEM_EMAIL, MTRRV_SEQ)
);


insert into MENTORING_REVIEW_LIKE values('a@naver.com',MENTORING_REVIEW_SEQ.currval);
update MENTORING_REVIEW set MTRRV_LIKECNT = MTRRV_LIKECNT+1 where MTRRV_SEQ = 1;
insert into MENTORING_REVIEW_LIKE values('b@naver.com',MENTORING_REVIEW_SEQ.currval);
update MENTORING_REVIEW set MTRRV_LIKECNT = MTRRV_LIKECNT+1 where MTRRV_SEQ = 1;



select * from MENTORING_REVIEW_LIKE;


create table MENTORING_REVIEW_REPLY(
MTRRVRP_SEQ number constraint MENTORING_REVIEW_REPLY_PK primary key,
MTRRVRP_CONTENT varchar2(1000),
MTRRVRP_RDATE date,
MEM_EMAIL varchar2(100) constraint MENTORING_REVIEW_REPLY_FK1 references MEMBER(MEM_EMAIL) on delete cascade,
MTRRV_SEQ number constraint MENTORING_REVIEW_REPLY_FK2 references MENTORING_REVIEW(MTRRV_SEQ) on delete cascade
);

create sequence MENTORING_REVIEW_REPLY_SEQ start with 1 minvalue 0 increment by 1 nocache;

insert into MENTORING_REVIEW_REPLY values(MENTORING_REVIEW_REPLY_SEQ.nextval, '�䰡�����ı���1', SYSDATE, 'admin', 2);
insert into MENTORING_REVIEW_REPLY values(MENTORING_REVIEW_REPLY_SEQ.nextval, '�䰡�����ı���2', SYSDATE, 'admin', 2);
insert into MENTORING_REVIEW_REPLY values(MENTORING_REVIEW_REPLY_SEQ.nextval, '�䰡�����ı���2-2', SYSDATE, 'admin', 2);

insert into MENTORING_REVIEW_REPLY values(MENTORING_REVIEW_REPLY_SEQ.nextval, '�䰡�����ı���3', SYSDATE, 'admin', 3);
insert into MENTORING_REVIEW_REPLY values(MENTORING_REVIEW_REPLY_SEQ.nextval, '�䰡�����ı���4', SYSDATE, 'admin', 4);
insert into MENTORING_REVIEW_REPLY values(MENTORING_REVIEW_REPLY_SEQ.nextval, '�䰡�����ı���5', SYSDATE, 'admin', 5);
insert into MENTORING_REVIEW_REPLY values(MENTORING_REVIEW_REPLY_SEQ.nextval, '�䰡�����ı���6', SYSDATE, 'admin', 6);
insert into MENTORING_REVIEW_REPLY values(MENTORING_REVIEW_REPLY_SEQ.nextval, '�䰡�����ı���7', SYSDATE, 'admin', 7);
insert into MENTORING_REVIEW_REPLY values(MENTORING_REVIEW_REPLY_SEQ.nextval, '�䰡�����ı���8', SYSDATE, 'admin', 8);
insert into MENTORING_REVIEW_REPLY values(MENTORING_REVIEW_REPLY_SEQ.nextval, '�䰡�����ı���9', SYSDATE, 'admin', 9);
insert into MENTORING_REVIEW_REPLY values(MENTORING_REVIEW_REPLY_SEQ.nextval, '�䰡�����ı���10', SYSDATE, 'admin', 10);

commit;
select * from MENTORING_REVIEW_REPLY;



/*
select MTRRV_SEQ, MTRRV_CONTENT, MTRRV_RDATE, MEM_EMAIL, MTR_SEQ, MEM_NICK, MEM_PROFILE from 
(select ROWNUM rnum, aa.MTRRV_SEQ, aa.MTRRV_CONTENT, aa.MTRRV_RDATE, aa.MEM_EMAIL, aa.MTR_SEQ, aa.MEM_NICK, aa.MEM_PROFILE from
(select MTRRV_SEQ, MTRRV_CONTENT, MTRRV_RDATE, mr.MEM_EMAIL, MTR_SEQ, MEM_NICK, MEM_PROFILE from MENTORING_REVIEW mr, MEMBER me where mr.MEM_EMAIL = me.MEM_EMAIL and MTR_SEQ = 2 order by MTRRV_SEQ desc) aa)
where rnum > 0 and rnum <= 5;

select MTRRVRP_SEQ, MTRRVRP_CONTENT, MTRRVRP_RDATE, mrr.MEM_EMAIL, MTRRV_SEQ, MEM_NICK, MEM_PROFILE from 
MENTORING_REVIEW_REPLY mrr, MEMBER me where mrr.MEM_EMAIL = me.MEM_EMAIL and MTRRV_SEQ = 2 order by MTRRV_SEQ desc;
*/




--��ٱ���--
create table CART(
CT_SEQ number constraint CART_PK primary key,
CT_RDATE date,
MTR_SEQ number constraint CART_FK1 references MENTORING(MTR_SEQ) on delete cascade,
MTRDI_SEQ number constraint CART_FK2 references MENTORING_DETAIL_INFO(MTRDI_SEQ) on delete cascade,
MEM_EMAIL varchar2(100) constraint CART_FK3 references MEMBER(MEM_EMAIL) on delete cascade
);
create sequence CART_SEQ minvalue 0 start with 1 increment by 1 nocache;

insert into CART values(CART_SEQ.nextval, SYSDATE, 2, 2, 'b@naver.com');
insert into CART values(CART_SEQ.nextval, SYSDATE, 2, 4, 'b@naver.com');

select * from CART where MEM_EMAIL = 'b@naver.com';

--����_����--
create table PAYMENT_INFO (
PI_SEQ number constraint PAYMENT_INFO_PK primary key,
PI_PG varchar2(100),
PI_METHOD varchar2(100),
PI_MUID varchar2(100),
PI_PRODUCT varchar2(500),
PI_PRICE number,
PI_RDATE date,
PI_NAME varchar2(50),
PI_PHONE varchar2(11),
PI_STATE number,
MTR_SEQ number,
MEM_EMAIL constraint PAYMENT_INFO_FK references MEMBER(MEM_EMAIL) on delete cascade
);
create sequence PAYMENT_INFO_SEQ start with 1 minvalue 0 increment by 1 nocache;


--������������--
create table PAYMENT_DETAIL_INFO(
MTRDI_SEQ number,
PI_SEQ number constraint PAYMENT_DETAIL_INFO_FK references PAYMENT_INFO(PI_SEQ) on delete cascade
);



create or replace trigger PAYMENT_TRI
after
    insert on PAYMENT_INFO for each row
begin
    update MEMBER set MEM_POINT = MEM_POINT +(:NEW.PI_PRICE) * 0.02 where MEM_EMAIL = :NEW.MEM_EMAIL;
    insert into POINTS values('��������������Ʈ����', TO_CHAR((:NEW.PI_PRICE) * 0.02), SYSDATE, :NEW.MEM_EMAIL);
end;
/

insert into PAYMENT_INFO values(PAYMENT_INFO_SEQ.nextval, '�̴Ͻý�', 'ī��', 'marchant_uid', '�ڼ������뷱���䰡', 25000, SYSDATE, '������', '01021735831', 1, 2, 'b@naver.com');
insert into PAYMENT_INFO values(PAYMENT_INFO_SEQ.nextval, '�̴Ͻý�', 'ī��', 'marchant_uid', '�Ϸ����Ͻ�Ű', 25000, SYSDATE, '������', '01021735831', 1, 3, 'b@naver.com');


select * from mentoring where mtr_seq = 3;

insert into PAYMENT_DETAIL_INFO values(2, 2);
insert into PAYMENT_DETAIL_INFO values(3, 2);

insert into PAYMENT_DETAIL_INFO values(7, 3);



select * from payment_info;
select * from payment_detail_info;

select * from POINTS;

--ȯ��_����--
create table REFUND_INFO(
RI_SEQ number constraint REFUND_INFO_PK primary key,
RI_PG varchar2(100),
RI_METHOD varchar2(100),
RI_MUID varchar2(100),
RI_PRODUCT varchar2(500),
RI_PRICE number,
RI_RDATE date,
RI_NAME varchar2(50),
RI_PHONE varchar2(11),
MTR_SEQ number,
MEM_EMAIL constraint REFUND_INFO_FK references MEMBER(MEM_EMAIL) on delete cascade,
PI_SEQ constraint REFUND_INFO_FK2 references PAYMENT_INFO(PI_SEQ) on delete cascade
);
create sequence REFUND_INFO_SEQ minvalue 0 start with 1 increment by 1 nocache;


create or replace trigger REFUND_TRI1
after
    insert on REFUND_INFO for each row
begin
    update MEMBER set MEM_POINT = MEM_POINT - ((:NEW.RI_PRICE) * 0.02) where MEM_EMAIL = :NEW.MEM_EMAIL;
    insert into POINTS values('��������������Ʈ�������', TO_CHAR(-1*((:NEW.RI_PRICE) * 0.02)), SYSDATE, :NEW.MEM_EMAIL);
    update PAYMENT_INFO set PI_STATE = 0 where PI_SEQ = :NEW.PI_SEQ;
end;
/


create or replace trigger REFUND_TRI2
after
    update of PI_STATE on PAYMENT_INFO for each row
begin
    IF (:NEW.PI_STATE = 0) THEN
    delete from PAYMENT_DETAIL_INFO where PI_SEQ = :NEW.PI_SEQ;
    end if;
end;
/


insert into REFUND_INFO values(REFUND_INFO_SEQ.nextval, '�̴Ͻý�', 'ī��', 'marchant_uid', '�ڼ������뷱���䰡', 25000, SYSDATE, '������', '01021735831', 2, 'b@naver.com', 2);


--update PAYMENT_INFO set PI_STATE = 0 where PI_SEQ = 1;

select * from REFUND_INFO;
--select * from PAYMENT_INFO;
select * from PAYMENT_DETAIL_INFO;
--��������--
create table NOTICE(
NOTI_SEQ number constraint NOTICE_PK primary key,
NOTI_SUBJECT varchar2(500),
NOTI_CONTENT varchar2(1000),
NOTI_RDATE date,
NOTI_READCNT number,
MEM_EMAIL varchar2(100)
);
create sequence NOTICE_SEQ start with 1 minvalue 0 increment by 1 nocache;

insert into NOTICE values(NOTICE_SEQ.nextval, '������������', '�������׳���', SYSDATE, 0, 'admin');
--select * from NOTICE;


--delete from MENTORING where MTR_SEQ = 1;

--select * from MENTORING_DETAIL_INFO where MTR_SEQ = 1 order by MTRDI_STIME desc;

--select * from MENTORING_DETAIL_INFO where MTRDI_STIME > SYSDATE order by MTRDI_STIME desc;



--select * from member;
--select * from points;

--select tname from tab;
--���̺� 18�� Ȯ��

--���丵������, ���丵��, ��û�ڼ�, �ִ��ο�, ���۽ð�, ������¥
select MTR_SEQ, MTR_SUBJECT, MTRDI_MAX_PCNT, MTRDI_NOW_PCNT, MTRDI_STIME, 