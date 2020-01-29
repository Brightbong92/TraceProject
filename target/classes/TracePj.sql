/*
create user trace identified by java;
grant resource, connect to trace;
conn trace/java;
*/
--delete table문--
delete from NOTICE;
delete from EMAIL_AUTH;
delete from MENTOR_LIST;
delete from REFUND_INFO;
delete from PAYMENT_INFO;
delete from MENTORING_QA_REPLY;
delete from MENTORING_QA;
delete from MENTORING_REVIEW_FILE;
delete from MENTORING_REVIEW_LIKE;
delete from MENTORING_REVIEW;
delete from MENTORING_FILE;
delete from MENTORING_DETAIL_INFO;
delete from MENTORING;
delete from MENTORING_CATEGORY;
delete from CART;

delete from POINTS;
delete from MEMBER;


--drop trigger문--
drop trigger PAYMENT_TRI;
drop trigger REFUND_TRI;
drop trigger MENTOR_TRI;

--drop table문--
drop table NOTICE;
drop table EMAIL_AUTH;
drop table MENTOR_LIST;

drop table REFUND_INFO;
drop table PAYMENT_INFO;
drop table CART;

drop table MENTORING_QA_REPLY;
drop table MENTORING_QA;

drop table MENTORING_REVIEW_FILE;
drop table MENTORING_REVIEW_LIKE;
drop table MENTORING_REVIEW;

drop table MENTORING_FILE;

drop table MENTORING_DETAIL_INFO;
drop table MENTORING;
drop table MENTORING_CATEGORY;

drop table POINTS;
drop table MEMBER;

--drop sequence 문--
drop sequence NOTICE_SEQ;
drop sequence PAYMENT_INFO_SEQ;
drop sequence REFUND_INFO_SEQ;

drop sequence MENTORING_QA_REPLY_SEQ;
drop sequence MENTORING_QA_SEQ;

drop sequence MENTORING_REVIEW_SEQ;
drop sequence MENTORING_REVIEW_FILE_SEQ;

drop sequence MENTORING_FILE_SEQ;
drop sequence MENTORING_DETAIL_INFO_SEQ;
drop sequence MENTORING_SEQ;

drop sequence CART_SEQ;

purge recyclebin;

--회원--
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
insert into MEMBER values('admin', '$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm', '관리자', '30', 2, '관리자사진.jpg', SYSDATE, 9999, 2, 1); 
--insert into MEMBER values('kk070@hanmail.net','','임성지','20',1,'프로필사진.jpg',SYSDATE,0,1,1);
insert into MEMBER values('a@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','임성지','20',1,'프로필사진.jpg',SYSDATE,0,1,1);

insert into MEMBER values('b@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','장현봉','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('c@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김성태','20',1,'프로필사진.jpg',SYSDATE,0,1,1);
insert into MEMBER values('d@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','손영빈','20',1,'프로필사진.jpg',SYSDATE,0,1,1);
insert into MEMBER values('e@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김보라','20',1,'프로필사진.jpg',SYSDATE,0,1,1);
insert into MEMBER values('f@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','모건일','20',1,'프로필사진.jpg',SYSDATE,0,1,1);
insert into MEMBER values('g@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','공병찬','20',1,'프로필사진.jpg',SYSDATE,0,1,1);
insert into MEMBER values('h@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','송승훈','20',1,'프로필사진.jpg',SYSDATE,0,1,1);
insert into MEMBER values('i@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','윤별','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('j@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','안정은','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('k@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김소담','20',1,'프로필사진.jpg',SYSDATE,0,0,1);

insert into MEMBER values('l@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','강현호','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('m@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','강지환','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('n@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','강수민','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('o@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','강옥순','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('p@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','고현주','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('q@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','고지은','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('r@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','구현덕','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('s@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김미애','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('t@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박정은','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('u@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박은정','20',1,'프로필사진.jpg',SYSDATE,0,0,1);

insert into MEMBER values('v@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박미희','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('w@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박현주','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('x@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김민성','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('y@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김민수','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('z@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김민지','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('a1@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김민정','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('a2@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김지혜','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('a3@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김소은','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('a4@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박준형','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('a5@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박종균','20',1,'프로필사진.jpg',SYSDATE,0,0,1);

insert into MEMBER values('a6@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박홍도','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('a7@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박홍기','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('a8@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박근회','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('a9@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박가연','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('b1@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박지연','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('b2@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박지은','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('b3@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김종찬','20',1,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('b4@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','한조온','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('b5@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','장이수','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('b6@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','박상주','20',2,'프로필사진.jpg',SYSDATE,0,0,1);

insert into MEMBER values('b7@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김영섭','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('b8@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김수지','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('b9@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','최문선','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('c1@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','임하영','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('c2@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','이지애','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('c3@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','손수정','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('c4@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','손수지','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('c5@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','문지은','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('c6@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','문지영','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('c7@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','김형섭','20',2,'프로필사진.jpg',SYSDATE,0,0,1);
insert into MEMBER values('qqq@naver.com','$2a$10$P1AYVvH2a00gBDQKxqbZyOEPxCPr/8tSVMjTW8aNpQnUnL88TfKxm','단무지','20',2,'프로필사진.jpg',SYSDATE,0,0,1);



insert into MEMBER(MEM_EMAIL, MEM_AGE, MEM_GENDER, MEM_RDATE, MEM_POINT, MEM_AUTH, MEM_STATE) values('disken@naver.com','20-29',2,SYSDATE,0,0,1);

commit;
select * from MEMBER;

--delete from MEMBER where MEM_EMAIL = 'kk070@hanmail.net';

--select * from MEMBER where MEM_EMAIL = 'kk070@hanmail.net';

--포인트--
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
ML_BUSINESS varchar2(300),
MTRCG_NO number,
constraint MENTOR_LIST_PK primary key(MEM_EMAIL),
ML_APPLY number(1)
);

insert into MENTOR_LIST values('a@naver.com', '임성지', '01021735831', '자기소개서요','사업자등록증.jpg',0,0);
insert into MENTOR_LIST values('c@naver.com', '김성태', '01046145442', '자기소개서요','사업자등록증.jpg',1,0);
insert into MENTOR_LIST values('d@naver.com', '손영빈', '01033453453', '자기소개서요','사업자등록증.jpg',2,0);
insert into MENTOR_LIST values('e@naver.com', '김보라', '01034534531', '자기소개서요','사업자등록증.jpg',3,0);
insert into MENTOR_LIST values('f@naver.com', '모건일', '01078967855', '자기소개서요','사업자등록증.jpg',4,0);
insert into MENTOR_LIST values('g@naver.com', '공병찬', '01034573463', '자기소개서요','사업자등록증.jpg',5,0);
insert into MENTOR_LIST values('h@naver.com', '송승훈', '01064347422', '자기소개서요','사업자등록증.jpg',6,0);
insert into MENTOR_LIST values('qqq@naver.com', '단무지', '01012341234', '자기소개서요','사업자등록증.jpg',0,1);

create or replace trigger MENTOR_TRI
after
    update on MENTOR_LIST for each row
begin
    update MEMBER set MEM_AUTH = 1 where MEM_EMAIL = :NEW.MEM_EMAIL;
end;
/

select * from MENTOR_LIST;

create table MENTORING_CATEGORY(
MTRCG_NO number constraint MENTORING_CATEGORY_PK primary key,
MTRCG_NAME varchar2(100)
);

SET DEFINE OFF 
insert into MENTORING_CATEGORY values(0, '스포츠');
insert into MENTORING_CATEGORY values(1, '음악');
insert into MENTORING_CATEGORY values(2, '공예');
insert into MENTORING_CATEGORY values(3, '요리');
insert into MENTORING_CATEGORY values(4, '사진&영상');
insert into MENTORING_CATEGORY values(5, '뷰티');
insert into MENTORING_CATEGORY values(6, '음료술');
commit;
select * from MENTORING_CATEGORY;

--멘토링--
create table MENTORING(
MTR_SEQ number constraint MENTORING_PK primary key,
MTR_SUBJECT varchar2(500),
MTR_CONTENT varchar2(1000),
MTR_PRICE number,
MTR_AREA varchar2(100),
MTR_ADDR varchar2(1000),
MTR_JUMSU number default 0,
MTR_PROFILE varchar2(500),
MTR_HASHTAG varchar2(500),
MTRCG_NO number constraint MENTORING_FK references MENTORING_CATEGORY(MTRCG_NO),
MEM_EMAIL varchar2(100) constraint MENTORING_FK2 references MEMBER(MEM_EMAIL) on delete cascade
);
create sequence MENTORING_SEQ minvalue 0 start with 0 increment by 1 nocache;

--delete from MENTORING;

/*<insert id="insertBoard" parameterType="com.my.spring.domain.BoardVO">

	<selectKey keyProperty="seq" order="BEFORE" resultType="int">
		SELECT BOARD_SEQ.NEXTVAL FROM DUAL
	</selectKey>
	INSERT INTO BOARD (seq, writer, title, content)
				VALUES (#{seq}, #{writer}, #{title}, #{content})
</insert>*/



--insert into MENTORING values(MENTORING_SEQ.nextval, '자세교정밸런스요가', '자세교정해드료요', 30000, '서강대/홍대', '서울 서대문구 통일로 463 3층', 0, '멘토링프로필이미지.jpg', 0, 0, 'a@naver.com');
--select MENTORING_SEQ.nextval from dual; 사용해서 MENTORING테이블, MENTORING_DETAIL_INFO 테이블 MTR_SEQ 똑같이 넣어줘야함. // 마이바티스 트랜잭션사용해야함

/*
insert into MENTORING values(1, '자세교정밸런스요가', '자세교정해드료요', 30000, '서울', '서울 서대문구 통일로 463 3층', 0, '멘토링프로필이미지.jpg', '#요가#귯걸', 0, 'a@naver.com');
insert into MENTORING values(2, '하루종일타는 스키', '스키멘토링해드료요', 30000, '서울', '서울 건대', 0, '멘토링프로필이미지.jpg', '#요가#귯걸', 0, 'a@naver.com');
insert into MENTORING values(3, '겨울에는 역시보드', '보드가르쳐요', 30000, '경기', '서울 서대문구 통일로 463 3층', 0, '멘토링프로필이미지.jpg', '#요가#귯걸', 0, 'a@naver.com');
insert into MENTORING values(4, '주짓수 배우기', '주짓수가르쳐요', 30000, '서울', '서울 잠실', 0, '멘토링프로필이미지.jpg', '#요가#귯걸', 0, 'a@naver.com');

insert into MENTORING values(5, '디제잉수업', '디제잉가르쳐요', 30000, '경기', '서울 서대문구 통일로 463 3층', 0, '멘토링프로필이미지.jpg', '#요가#귯걸', 1, 'a@naver.com');
insert into MENTORING values(6, '기타수업', '기타가르쳐요', 30000, '경기', '서울 건대', 0, '멘토링프로필이미지.jpg', '#요가#귯걸', 1, 'a@naver.com');
insert into MENTORING values(7, 'DIY 수업', 'DIY가르쳐요', 30000, '서울', '서울 서대문구 통일로 463 3층', 0, '멘토링프로필이미지.jpg', '#요가#귯걸', 2, 'a@naver.com');
insert into MENTORING values(8, '도자기 만들기수업', '도자기가르쳐요', 30000, '서울', '서울 잠실', 0, '멘토링프로필이미지.jpg', '##귯걸', 2, 'a@naver.com');

insert into MENTORING values(9, '디제잉수업', '디제잉가르쳐요', 30000, '경기', '서울 서대문구 통일로 463 3층', 0, '멘토링프로필이미지.jpg', '#음악#귯걸', 1, 'a@naver.com');
insert into MENTORING values(10, '기타수업', '기타가르쳐요', 30000, '경기', '서울 건대', 0, '멘토링프로필이미지.jpg', '#기타#귯걸', 1, 'a@naver.com');
insert into MENTORING values(11, 'DIY 수업', 'DIY가르쳐요', 30000, '서울', '서울 서대문구 통일로 463 3층', 0, '멘토링프로필이미지.jpg', '#DIY#귯걸', 2, 'a@naver.com');
insert into MENTORING values(12, '도자기 만들기수업', '도자기가르쳐요', 30000, '서울', '서울 잠실', 0, '멘토링프로필이미지.jpg', '#도자기#귯걸', 2, 'a@naver.com');
*/

SET DEFINE OFF
insert into MENTORING values(1, '자세교정밸런스요가', '자세교정해드료요', 25000, '서울', '서울 서대문구 통일로 463 3층', 0, '요가.jpg', '#요가#굿걸', 0, 'a@naver.com');
insert into MENTORING values(2, '하루종일타는 스키', '스키멘토링해드료요', 25000, '서울', '서울 건대', 0, '스키.jpg', '#점프', 0, 'a@naver.com');
insert into MENTORING values(3, '겨울에는 역시보드', '보드가르쳐요', 50000, '경기', '서울 서대문구 통일로 463 3층', 0, '스노우보드.jpg', '#S자', 0, 'a@naver.com');
insert into MENTORING values(4, '주짓수 배우기', '주짓수가르쳐요', 30000, '서울', '서울 영등포구 여의대방로 43길 13 ', 0, '주짓수.jpg', '#호신#다이어트', 0, 'a@naver.com');
insert into MENTORING values(5, '말과 친해지기', '승마 알려드립니다', 35000, '경기', '서울특별시 구로구 고척1동 경인로 445', 0, '승마.jpg', '#다이어트#동물', 0, 'a@naver.com');
insert into MENTORING values(6, '미용학', '아름다움의 첫걸음 바로이곳입니다', 45000, '경기', '부천시 원미구 중동', 0, '미용학.jpg', '#기초#미용', 5, 'g@naver.com');
insert into MENTORING values(7, '스케이트보드', 'S자부터 덤블링까지 다알려드립니다ㅎㅎ', 40000, '서울', '서울 신정3동 숲속마을아파트 105동 506호', 0, '스케이트보드.jpg', '#여의도#스트리트', 0, 'a@naver.com');
insert into MENTORING values(8, '역도', '호신술의 첫걸음은 역도부터 !', 25000, '서울', '서울 신월7동 푸른마을아파트 203동 1207호', 0, '역도.jpg', '#호신술', 0, 'a@naver.com');
insert into MENTORING values(9, '복싱', '기초체력단련부터 선수하실분까지 모집합니다 ㅎㅎ', 40000, '서울', '서울 신정동 신정 이펜하우스 501동 ', 0, '복싱.jpg', '#호신술#다이어트', 0, 'a@naver.com');
insert into MENTORING values(10, '테니스', '배우기 쉬운 테니스 라켓구매 필요없이 바로 알려드리겠습니다 ', 20000, '서울', '서울 중랑구 중화동 311-5 ', 0, '테니스.jpg', '#라켓#다이어트', 0, 'a@naver.com');
insert into MENTORING values(11, '럭비', '태클 많이 안합니다 일단오세요 .', 20000, '경기', '부천시 원미구 부천동 ', 0, '럭비.jpg', '#태클#안전', 0, 'a@naver.com');
insert into MENTORING values(12, '축구', '조기축구부터 원정까지 연락먼저주세요.', 40000, '서울', '서울 원미구 중동', 0, '축구.jpg', '#드리볼#바나나킥', 0, 'a@naver.com');
insert into MENTORING values(13, '체조', '전신의 유연함 책임지겠습니다 ㅎㅎ', 30000, '서울', '서울 원미구 상동', 0, '체조.jpg', '#리듬#볼륨', 0, 'a@naver.com');
insert into MENTORING values(14, '서핑', '날풀리는 지금이 여름을 책임집니다.', 50000, '서울', '서울 동작구 신대방2동', 0, '서핑.jpg', '#여름#몸짱', 0, 'a@naver.com');
insert into MENTORING values(15, '배드민턴', '야외X 실내체육관 있습니다', 30000, '서울', '서울 동작구 대림1동', 0, '배드민턴.jpg', '#쉬운#다이어트', 0, 'a@naver.com');
insert into MENTORING values(16, '팔찌공예', '자신한테 알맞는 팔찌 만들어보아요!', 30000, '경기', '서울시 관악구 보라매동 ', 0, '팔찌공예.jpg', '#악세서리#보석', 2, 'd@naver.com');
insert into MENTORING values(17, '리본공예', '머리끈만들어서 선물하세요!', 20000, '서울', '서울 관악구 신사동', 0, '리본공예.jpg', '#악세서리', 2, 'd@naver.com');
insert into MENTORING values(18, '비즈공예', '반짝반짝 모두모이세요', 25000, '서울', '서울 관악구 신림동', 0, '비즈공예.jpg', '#악세서리#보석', 2, 'd@naver.com');
insert into MENTORING values(19, '냅킨공예', '호텔식으로 이쁘게접는법 알려드려요', 30000, '서울', '서울 동작구 노량진2동', 0, '냅킨공예.jpg', '#휴지#아트', 2, 'd@naver.com');
insert into MENTORING values(20, '매듭공예', '매듭종류는 무수히많습니다 와서 실용적인걸 배워가세요', 35000, '서울', '서울 영등포구 신길1동', 0, '매듭공예.jpg', '#생활#끈', 2, 'd@naver.com');
insert into MENTORING values(21, '유리공예', '유리의 신비함을 체험해보세요', 35000, '경기', '서울시 영등포구 영등포본동 ', 0, '유리공예.jpg', '#물잔#그릇', 2, 'd@naver.com');
insert into MENTORING values(22, '가죽공예', '쉽게접할수있는 가죽으로 실용품을 만들어보세요', 45000, '서울', '서울 마포구 공덕동', 0, '가죽공예.jpg', '#지갑#벨트', 2, 'd@naver.com');
insert into MENTORING values(23, '한국양초공예', '나만의 빛을 만들어보세요', 50000, '서울', '서울 마포구 염리동', 0, '한국양초공예.jpg', '#빛', 2, 'd@naver.com');
insert into MENTORING values(24, '양말공예', '직접만든 양말을 신어봐요!', 30000, '서울', '서울 마포구 효창동', 0, '양말공예.jpg', '#발가락양말', 2, 'd@naver.com');
insert into MENTORING values(25, '칠보공예', '이쁜 장식들 가져가세요 ㅎㅎ', 50000, '서울', '서울 마포구 청파동', 0, '칠보공예.jpg', '#자기#칠', 2, 'd@naver.com');
insert into MENTORING values(26, '소이캔들공예', '향초 직접만들어보세요', 30000, '경기', '서울시 강서구 마곡동 ', 0, '소이캔들공예.jpg', '#향#색감', 2, 'd@naver.com');
insert into MENTORING values(27, '한지공예', '전통의 멋을 배우러오세요!', 45000, '서울', '서울 강서구 방화동', 0, '한지공예.jpg', '#전통', 2, 'd@naver.com');
insert into MENTORING values(28, '금속공예', '철의 아름다움을 배워보아요', 30000, '서울', '서울 강서구 등촌동', 0, '금속공예.jpg', '#쉬움', 2, 'd@naver.com');
insert into MENTORING values(29, '규방공예', '보자기 직접 만들어봐요~', 30000, '서울', '서울 강서구 가양동', 0, '규방공예.jpg', '#보자기#천', 2, 'd@naver.com');
insert into MENTORING values(30, '사진공예', '잘찍은 사진으로 추억을 보관하세요', 20000, '서울', '서울 양천구 화곡본동', 0, '사진공예.jpg', '#사진#사진기', 2, 'd@naver.com');
insert into MENTORING values(31, '빈티지공예', '쓰다남은 가죽들로 이쁜악세서리를 만들어보아용', 20000, '경기', '서울시 강서구 염창동 ', 0, '빈티지공예.jpg', '#생각치못한#아름다움', 2, 'd@naver.com');
insert into MENTORING values(32, '머리띠공예', '이쁜 머리장식 만들어보아요', 25000, '서울', '서울 종로구 동숭4라길 29', 0, '머리띠공예.jpg', '#딸아이#머리장식', 2, 'd@naver.com');
insert into MENTORING values(33, '도자기 만들기수업', '도자기가르쳐요', 25000, '서울', '서울 종로구 동숭길 148', 0, '도자기만들기수업.jpg', '#꽃병#물병', 2, 'd@naver.com');
insert into MENTORING values(34, '비닐공예', '비닐로도 예술이 가능합니다', 45000, '서울', '서울 성북구 삼선교로10바길 34', 0, '비닐공예.jpg', '#큰비닐', 2, 'd@naver.com');
insert into MENTORING values(35, '항아리공예', '검은색 항아리는 이제 보내주세요', 45000, '서울', '서울 강서구 화곡동', 0, '항아리공예.jpg', '#김장독', 2, 'd@naver.com');
insert into MENTORING values(36, '기타공예', '기타장식들 만들어봐요', 40000, '경기', '서울 성북구 아리랑로 68 ', 0, '기타공예.jpg', '#기타#버스킹', 2, 'd@naver.com');
insert into MENTORING values(37, '반지공예', '반지를 만들어 선물해봐요', 45000, '서울', '서울 서대문구 창천동', 0, '반지공예.jpg', '#커플#선물', 2, 'd@naver.com');
insert into MENTORING values(38, '발찌공예', '남다른 악세서리를 만들어보세요', 35000, '서울', '서울 성북구 돈암동 42-32', 0, '발찌공예.jpg', '#악세서리', 2, 'd@naver.com');
insert into MENTORING values(39, '헤어밴드공예', '머리 악세서리 만들어봐요', 50000, '서울', '서울 성북구 정릉로46길 17', 0, '헤어밴드공예.jpg', '#머리장식', 2, 'd@naver.com');
insert into MENTORING values(40, '귀걸이공예', '나만의 악세서리 만들어보세요', 30000, '서울', '길음동 21-71', 0, '귀걸이공예.jpg', '#악세서리#핸드메이드', 2, 'd@naver.com');
insert into MENTORING values(41, '기초헤어커트', '앞머리1자 너무 예전스타일이에요', 30000, '경기', '서울 강북구 도봉로 10 ', 0, '기초헤어커트.jpg', '#헤어#기초', 5, 'g@naver.com');
insert into MENTORING values(42, '모발과학', '건강한모발로 앞으로의 자신감 챙기세요!', 30000, '서울', '서울 성북구 하월곡동', 0, '모발과학.jpg', '#헤어#건강', 5,'g@naver.com');
insert into MENTORING values(43, '미용작품제작', '손수만든 미용도구를 만나보세요!', 30000, '서울', '청량리동 207-41', 0, '미용작품제작.jpg', '#미용#도구', 5, 'g@naver.com');
insert into MENTORING values(44, '헤어스타일링', '빠르게변화하는 트렌드 쉽게 접해보세요 ', 30000, '서울', '서울 동대문구 홍릉로 111-2', 0, '헤어스타일링.jpg', '#헤어#스타일링', 5, 'g@naver.com');
insert into MENTORING values(45, '화장품학', '피부에맞는 화장품톤 확실히 알려드립니다', 50000, '서울', '제기동 1212', 0, '화장품학.jpg', '#피부#색조', 5, 'g@naver.com');
insert into MENTORING values(46, '체형관리', '운동뿐아니라 먹는것도 신경써야 합니다', 20000, '경기', '안암동4가 23-3 ', 0, '체형관리.jpg', '#운동#건강', 5,'g@naver.com');
insert into MENTORING values(47, '기초메이크업', '가장기본인 베이스부터 시작합니다', 30000, '서울', '상왕십리동 813', 0, '기초메이크업.jpg', '#미용#기초', 5, 'g@naver.com');
insert into MENTORING values(48, '응용메이크업', '기초메이크업 연계수업입니다', 50000, '서울', '서울 성동구 상왕십리동 336-7', 0, '응용메이크업.jpg', '#미용#응용', 5, 'g@naver.com');
insert into MENTORING values(49, '피부미용학', '잡티 out', 30000, '서울', '신당동 153-13', 0, '피부미용학.jpg', '#미용#피부', 5, 'g@naver.com');
insert into MENTORING values(50, '이미지메이킹', '항상 밝은 자신의모습을 연상케하다!', 350000, '서울', '신당동 851', 0, '이미지메이킹.jpg', '#표정#이미지', 5, 'g@naver.com');


commit;
select * from MENTORING order by MTR_SEQ desc;

select * from MENTORING where MTR_SUBJECT like '%공예%';

	    select MTR_SEQ, MTR_SUBJECT, MTR_CONTENT, MTR_PRICE, MTR_AREA, MTR_ADDR, MTR_JUMSU, MTR_PROFILE, MTR_HASHTAG, MTRCG_NO, MEM_EMAIL, MTR_HASHTAG 
        from (select ROWNUM rnum , aa.* from (select * from Mentoring order by MTR_SEQ desc) aa)
			 where rnum>0 and rnum<=6;
             
             
        	    select MTR_SEQ, MTR_SUBJECT, MTR_CONTENT, MTR_PRICE, MTR_AREA, MTR_ADDR, MTR_JUMSU, MTR_PROFILE, MTR_HASHTAG, MTRCG_NO, MEM_EMAIL, MTR_HASHTAG 
        from (select ROWNUM rnum , aa.* from (select * from Mentoring where MTRCG_NO like 0 order by MTR_SEQ desc) aa)
			 where rnum>0 and rnum<=6;     
             
             

--멘토링_상세_정보--
create table MENTORING_DETAIL_INFO(
MTRDI_SEQ number constraint MENTORING_DETAIL_INFO_PK primary key,
MTRDI_STIME timestamp,
MTRDI_ETIME timestamp,
MTRDI_MAX_PCNT number,
MTRDI_NOW_PCNT number,
MTRDI_STATE number(1),
MTR_SEQ number constraint MENTORING_DETAIL_INFO_FK references MENTORING(MTR_SEQ) on delete cascade
);
create sequence MENTORING_DETAIL_INFO_SEQ minvalue 0 start with 0 increment by 1 nocache;
--insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-01-18 16:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-01-18 18:00','YYYY-MM-DD HH24:MI'), 4, 0, 1, MENTORING_SEQ.currval);
--insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-01-20 18:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-01-18 20:00','YYYY-MM-DD HH24:MI'), 4, 0, 1, MENTORING_SEQ.currval);
--insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,TO_DATE('2020-01-24 20:00','YYYY-MM-DD HH24:MI'), TO_DATE('2020-01-18 22:00','YYYY-MM-DD HH24:MI'), 4, 0, 1, MENTORING_SEQ.currval);
-- insert 시 MTR_SEQ는 MENTORING 테이블에 select MENTORING_SEQ.nextval from dual; 사용해서 넣은 MTR_SEQ변수를 넣어주면됨 마이바티스 트랜잭션 사용해야함

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

insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-01-18 16:00', '2020-01-18 18:00', 4, 0, 1, 1);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-01-20 18:00', '2020-01-20 20:00', 4, 0, 1, 1);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-01-24 20:00', '2020-01-24 22:00', 4, 0, 1, 1);

insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-01-20 10:00','2020-01-20 13:00', 10, 0, 1, 2);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-01-28 15:00','2020-01-28 17:00', 10, 0, 1, 2);
insert into MENTORING_DETAIL_INFO values(MENTORING_DETAIL_INFO_SEQ.nextval,'2020-03-24 20:00','2020-03-24 23:00', 10, 0, 1, 2);


select MTRDI_SEQ, TO_CHAR(MTRDI_STIME, 'YYYY-MM-DD HH24:MI'), TO_CHAR(MTRDI_ETIME, 'YYYY-MM-DD HH24:MI'), MTRDI_MAX_PCNT, MTRDI_NOW_PCNT, MTRDI_STATE, MTR_SEQ  from MENTORING_DETAIL_INFO;

commit;
--멘토링_파일--
create table MENTORING_FILE(
MTRF_SEQ number constraint MENTORING_FILE_PK primary key,
MTRF_OFNAME varchar2(300),
MTRF_FNAME varchar2(300),
MTR_SEQ number constraint MENTORING_FILE_FK references MENTORING(MTR_SEQ) on delete cascade
);
create sequence MENTORING_FILE_SEQ minvalue 0 start with 0 increment by 1 nocache;

insert into MENTORING_FILE values(MENTORING_FILE_SEQ.nextval, '오리지날파일이름.jpg', '파일이름.jpg', 1);
insert into MENTORING_FILE values(MENTORING_FILE_SEQ.nextval, '오리지날파일이름.jpg', '파일이름.jpg', 1);
--insert 시 MTR_SEQ는 MENTORING 테이블에 select MENTORING_SEQ.nextval from dual; 사용해서 넣은 MTR_SEQ변수를 넣어주면됨 마이바티스 트랜잭션 사용해야함

select * from MENTORING_FILE;

--멘토링_QA--
create table MENTORING_QA(
MTRQA_SEQ number constraint MENTORING_QA_PK primary key,
MTRQA_CONTENT varchar2(1000),
MTRQA_RDATE date,
MEM_EMAIL varchar2(100),
MTR_SEQ number constraint MENTORING_QA_FK references MENTORING(MTR_SEQ) on delete cascade
);
create sequence MENTORING_QA_SEQ minvalue 0 start with 0 increment by 1 nocache;

insert into MENTORING_QA values(MENTORING_QA_SEQ.nextval, '요가수업질문이요?', SYSDATE, 'b@naver.com', 1);

select * from MENTORING_QA;


--멘토링_QA_댓글--
create table MENTORING_QA_REPLY(
MTRQARP_SEQ number constraint MENTORING_QA_REPLY_PK primary key,
MTRQARP_CONTENT varchar2(1000),
MTRQARP_RDATE date,
MEM_EMAIL varchar2(100),
MTRQA_SEQ number constraint MENTORING_QA_REPLY_FK references MENTORING_QA(MTRQA_SEQ) on delete cascade
);
create sequence MENTORING_QA_REPLY_SEQ minvalue 0 start with 0 increment by 1 nocache;

insert into MENTORING_QA_REPLY values(MENTORING_QA_REPLY_SEQ.nextval, '요가수업질문답변입니다', SYSDATE, 'admin', MENTORING_QA_SEQ.currval);
select * from MENTORING_QA_REPLY;

--멘토링_리뷰--
create table MENTORING_REVIEW(
MTRRV_SEQ number constraint MENTORING_REVIEW_PK primary key,
MTRRV_CONTENT varchar2(1000),
MTRRV_RDATE date,
MTRRV_JUMSU number,
MTRRV_LIKECNT number,
MTR_SEQ number constraint MENTORING_REVIEW_FK1 references MENTORING(MTR_SEQ) on delete cascade,
MEM_EMAIL varchar2(100) constraint MENTORING_REVIEW_FK2 references MEMBER(MEM_EMAIL) on delete cascade
);
create sequence MENTORING_REVIEW_SEQ minvalue 0 start with 0 increment by 1 nocache;

insert into MENTORING_REVIEW values(MENTORING_REVIEW_SEQ.nextval, '요가수업짱이에요!', SYSDATE, 5, 0, 1, 'b@naver.com');

select * from MENTORING_REVIEW;

--멘토링_리뷰_좋아요--
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

--멘토링_리뷰_파일--
create table MENTORING_REVIEW_FILE(
MTRRVF_SEQ number constraint MENTORING_REIVEW_FILE_PK primary key,
MTRRVF_OFNAME varchar2(300),
MTRRVF_FNAME varchar2(300),
MTRRV_SEQ number constraint MENTORING_REVIEW_FILE_FK references MENTORING_REVIEW(MTRRV_SEQ) on delete cascade
);
create sequence MENTORING_REVIEW_FILE_SEQ minvalue 0 start with 0 increment by 1 nocache;

insert into MENTORING_REVIEW_FILE values(MENTORING_REVIEW_FILE_SEQ.nextval, '멘토링리뷰파일이름','멘토링리뷰파일이름1', MENTORING_REVIEW_SEQ.currval);
insert into MENTORING_REVIEW_FILE values(MENTORING_REVIEW_FILE_SEQ.nextval, '멘토링리뷰파일이름','멘토링리뷰파일이름2', MENTORING_REVIEW_SEQ.currval);

select * from MENTORING_REVIEW_FILE;

--장바구니--
create table CART(
CT_SEQ number constraint CART_PK primary key,
CT_RDATE date,
MTR_SEQ number constraint CART_FK1 references MENTORING(MTR_SEQ) on delete cascade,
MTRDI_SEQ number constraint CART_FK2 references MENTORING_DETAIL_INFO(MTRDI_SEQ) on delete cascade,
MEM_EMAIL varchar2(100) constraint CART_FK3 references MEMBER(MEM_EMAIL) on delete cascade
);
create sequence CART_SEQ minvalue 0 start with 0 increment by 1 nocache;

insert into CART values(CART_SEQ.nextval, SYSDATE, 1, 1, 'b@naver.com');
insert into CART values(CART_SEQ.nextval, SYSDATE, 2, 4, 'b@naver.com');

select * from CART where MEM_EMAIL = 'b@naver.com';

--결제_정보--
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
MTRDI_SEQ number,
MEM_EMAIL constraint PAYMENT_INFO_FK references MEMBER(MEM_EMAIL) on delete cascade
);
create sequence PAYMENT_INFO_SEQ start with 0 minvalue 0 increment by 1 nocache;


create or replace trigger PAYMENT_TRI
after
    insert on PAYMENT_INFO for each row
begin
    update MEMBER set MEM_POINT = MEM_POINT +(:NEW.PI_PRICE) * 0.02 where MEM_EMAIL = :NEW.MEM_EMAIL;
    insert into POINTS values('결제로인한포인트적립', TO_CHAR((:NEW.PI_PRICE) * 0.02), SYSDATE, :NEW.MEM_EMAIL);
end;
/

insert into PAYMENT_INFO values(PAYMENT_INFO_SEQ.nextval, '이니시스', '카드', 'marchant_uid', '재밋는디제잉', 10000, SYSDATE, '장현봉', '01021735831', 1, 1, 1, 'a@naver.com');

select * from payment_info;

--환불_정보--
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
MTRDI_SEQ number,
MEM_EMAIL constraint REFUND_INFO_FK references MEMBER(MEM_EMAIL) on delete cascade,
PI_SEQ constraint REFUND_INFO_FK2 references PAYMENT_INFO(PI_SEQ) on delete cascade
);
create sequence REFUND_INFO_SEQ minvalue 0 start with 0 increment by 1 nocache;


create or replace trigger REFUND_TRI
after
    insert on REFUND_INFO for each row
begin
    update MEMBER set MEM_POINT = MEM_POINT - ((:NEW.RI_PRICE) * 0.02) where MEM_EMAIL = :NEW.MEM_EMAIL;
    insert into POINTS values('결제로인한포인트적립취소', TO_CHAR(-1*((:NEW.RI_PRICE) * 0.02)), SYSDATE, :NEW.MEM_EMAIL);
    update PAYMENT_INFO set PI_STATE = 0 where PI_SEQ = :NEW.PI_SEQ;
end;
/

insert into REFUND_INFO values(REFUND_INFO_SEQ.nextval, '이니시스', '카드', 'marchant_uid', '재밋는디제잉', 10000, SYSDATE, '장현봉', '01021735831', 1, 1, 'a@naver.com', 1);
--update PAYMENT_INFO set PI_STATE = 0 where PI_SEQ = 1;

select * from REFUND_INFO;
select * from PAYMENT_INFO;
--공지사항--
create table NOTICE(
NOTI_SEQ number constraint NOTICE_PK primary key,
NOTI_SUBJECT varchar2(500),
NOTI_CONTENT varchar2(1000),
NOTI_RDATE date,
NOTI_READCNT number,
MEM_EMAIL varchar2(100)
);
create sequence NOTICE_SEQ start with 0 minvalue 0 increment by 1 nocache;

insert into NOTICE values(NOTICE_SEQ.nextval, '공지사항제목', '공지사항내용', SYSDATE, 0, 'admin');
select * from NOTICE;


--delete from MENTORING where MTR_SEQ = 1;

select * from MENTORING_DETAIL_INFO where MTR_SEQ = 1 order by MTRDI_STIME desc;

select * from MENTORING_DETAIL_INFO where MTRDI_STIME > SYSDATE order by MTRDI_STIME desc;



select * from member;
select * from points;

select tname from tab;
--테이블 18개 확인



