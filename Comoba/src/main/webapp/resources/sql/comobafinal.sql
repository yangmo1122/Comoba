-- 공통 테이블

update cmb_member set status = 0 where nickname = '월이2';
commit;


update cmb_member set status = 1
	    where memberno = 17;

commit;


select * from cmb_member;

create table cmb_member 
(memberno  number        not null    -- 회원번호
,nickname  varchar2(30)  not null    -- 닉네임 
,pwd       varchar2(50)  not null    -- 암호
,email     varchar2(50)  not null    -- 이메일
,status    number(1) default 1       -- 회원상태(1:회원 / 0:회원불)
,constraint PK_cmb_member primary key(memberno)
,constraint CK_cmb_member_status check(status in(0,1))
);


select rno, memberno, nickname, pwd, email, status, studycnt, joindate, comments 
from(
select rownum as rno, V.memberno, V.nickname, V.pwd, V.email, V.status, V.studycnt, V.joindate, V.comments 
from
(
select memberno, nickname, pwd, email, status, studycnt, joindate, comments 
from cmb_member
where status = 1
  order by memberno desc
) V
) T

select * 
from tab




alter table cmb_board add (commentCount number);

alter table cmb_board add (nickname  varchar2(20));

select *
		from cmb_board
		where status = 1
    
    select * from cmb_studyroom
    
    update cmb_studyroom set status = 0 where studyroom_no = 
    
    alter table cmb_studyroom add (status number(1));
    
   alter table cmb_studyroom add constraint status check(status in(0,1));
   
   alter table cmb_studyroom modify (status number(1) default 1);


select * from cmb_studyroom

update cmb_studyroom set status = 1

commit;

delete from cmb_studyroom where STUDYROOM_NO = 19;
insert into cmb_board values (seq_cmb_board.nextval , 14 , '제발 한번에..' , sysdate - 365 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

insert into cmb_board values (seq_cmb_board.nextval , 14 , '제발 한번에..' , sysdate - 365 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

insert into cmb_board values (seq_cmb_board.nextval , 14 , '제발 한번에..' , sysdate - 365 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

insert into cmb_board values (seq_cmb_board.nextval , 14 , '제발 한번에..' , sysdate - 365 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

insert into cmb_board values (seq_cmb_board.nextval , 14 , '제발 한번에..' , sysdate - 365 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '제발 한번에..' , sysdate - 365 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

insert into cmb_board values (seq_cmb_board.nextval , 14 , '제발 한번에..' , sysdate - 365 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

insert into cmb_board values (seq_cmb_board.nextval , 14 , '제발 한번에..' , sysdate - 365 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

insert into cmb_board values (seq_cmb_board.nextval , 14 , '제발 한번에..' , sysdate - 365 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '제발 한번에..' , sysdate - 365 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');


commit;

insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');


insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 3 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 *3 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 3 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 3 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 2 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 3 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 3 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 3 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 3 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 3 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

select count (*) as boardCnt from cmb_board where writedate between TO_DATE('2010','yyyy') and  TO_DATE('2010'+1,'yyyy') ;

select count (*) as boardCnt2016 from cmb_board where writedate between TO_DATE('2016','yyyy') and  TO_DATE('2016'+1,'yyyy') ;


                           
                           or writedate <  TO_DATE('2015','yyyy')+365 order by writedate;
                          
select * from cmb_board where writedate <  TO_DATE('2015','yyyy')+365  order by writedate;

insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 4 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 4 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');


insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 5 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 5 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 5 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 5 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 6 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');
insert into cmb_board values (seq_cmb_board.nextval , 14 , '되겟지???;; ㅠㅠ' , sysdate - 365 * 6 , 0, 1, '어이없군..', 0, 0, 2, '재리',0,'','','');

insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 4 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 8 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 7 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 2 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 1 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 3 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 3 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 3 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 3 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 3 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 3 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 3 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 3 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 3 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 3 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate - 365 * 3 , 1, 1);
insert into CMB_STORY values (seq_CMB_board.nextval , 15 , '되겟지???;; ㅠㅠ' ,0, sysdate + 180 , 1, 1);

select * from CMB_order
commit


commit;


select *from tab;

select * from cmb_studyroom;

select * from CMB_STORY;

insert  

select count(*) from CMB_STORY where regdate = to_date(2017,'yyyy');

select * from CMB_GONGLIVE;

select * from cmb_studyroom;
from
(select * from cmb_order);

select * from cmb_comment;
select count(*)
		from cmb_comment
		where together_no = 88;

		select A.comment_no, A.memberno_fk, A.together_no, A.boardtype, A.comment_content 
		     , A.comment_date , A.comment_status  , B.nickname
		from cmb_comment A, cmb_member B
		where A.memberno_fk = B.memberno and comment_status = 1 and together_no = 88
		order by comment_no desc
--select distinct  sum (D.STUDYROOM_NO * D.cost * E.PEOPLE  )  from cmb_order E join cmb_studyroom D  on E.FK_STUDYROOM_NO = D.STUDYROOM_NO  order by city;

select *
from cmb_comment
order by 1

delete from cmb_comment
where comment_no between 49 and 75
commit
select  FK_STUDYROOM_NO ,people , usehour from cmb_order E join cmb_studyroom D  on E.FK_STUDYROOM_NO = D.STUDYROOM_NO ;


select count (*) from CMB_STORY where regdate between TO_DATE('2017','yyyy') and  TO_DATE('2017'+1,'yyyy') ;
--------------------------------------------------------------------------------------------------------------------------------
양승모 sql
--------------------------------------------------------------------------------------------------------------------------------










--------------------------------------------------------------------------------------------------------------------------------
김송희 sql
--------------------------------------------------------------------------------------------------------------------------------








--------------------------------------------------------------------------------------------------------------------------------
김재연 sql
--------------------------------------------------------------------------------------------------------------------------------



--- << 3자유게시판 내용 테이블(자유게시판 테이블)>> ---
create table cmb_board_contents
(--board_contents_no  number         not null    -- 자유게시판번호
board_no_fk         number         not null    -- 게시판글번호 
,board_contents     VARCHAR2(2000) not null    -- 자유게시판내용
,constraint PK_cmb_contents_board_no_fk primary key(board_no_fk)
,constraint FK_cmb_board_no_fk  foreign key(board_no_fk) references cmb_board(board_no)
);



create table cmb_board
(board_no        number        not null         -- 게시글번호
,memberno_fk     number        not null         -- 글쓴 회원번호
,subject         varchar2(200) not null         -- 글제목 
,writedate       date default sysdate not null  -- 글쓴 시간
,readCount       number        not null         -- 조회수
,status          number(1) default 1            -- 글삭제여부
,constraint PK_cmb_board_board_no primary key(board_no)
,constraint FK_cmb_board_memberno_fk foreign key(memberno_fk) references cmb_member(memberno)
,constraint CK_cmb_board_status check(status in(0,1))
);

select * from tab;

select * from cmb_gonglive where 

select * from cmb_board;
select * from cmb_member;
select * from cmb_board_contents;



create  cmb_boardComment (


        );  

--------------------------


select *
from ALL_ALL_TABLES
where OWNER = 'AWSCOMOBA';




create sequence seq_cmb_member
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;


--drop table comoba_member purge;




select *
from SYS.ALL_SEQUENCES
WHERE SEQUENCE_OWNER = 'AWSCOMOBA';



--drop table cmb_studyroom purge;
--drop sequence seq_cmb_studyroom;
--drop table cmb_studyroom_contents purge;
--drop sequence seq_cmb_studyroom_contents;
--drop table cmb_studyroom_addfile purge;
--drop sequence seq_cmb_studyroom_addfile;

select * from cmb_studyroom_addfile;
select * from cmb_studyroom;
select * from cmb_studyroom_contents;

--- << 17스터디룸 테이블 >> ---
create table cmb_studyroom
(studyroom_no  number         not null   -- 스터디룸 번호
,studyroom_name          varchar2(100)  not null   -- 이름
,addr1          varchar2(100)  not null   -- 주소1
,addr2         varchar2(100)  not null   -- 주소2
,hp            varchar2(13)   not null   -- 연락처
,cost          number(10)     not null   -- 비용
,longitude     varchar2(20)    not null   -- 경도
,latitude      varchar2(20)    not null   -- 위도
,constraint PK_cmb_studyroom_studyroom_no primary key(studyroom_no)

);

PK_spring_tblComment_seq

select * from cmb_studyroom_addfile




alter table cmb_studyroom modify(longitude varchar2(20),latitude varchar2(20));


alter table cmb_studyroom drop(fk_memberno);

select * 
from cmb_studyroom_contents;



--drop table cmb_studyroom purge;

create sequence seq_cmb_studyroom
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


--drop sequence seq_cmb_studyroom;
--select *
--from ALL_sequences


create table cmb_studyroom_contents
(studyroom_contents_no   number           not null     -- 스터디룸 등록번호
,board_contents          varchar2(1000)   not null     -- 스터디룸 테이블 내용
,constraint PK_cmb_studyroom_contents_no primary key (studyroom_contents_no)

);

--constraint FK_cmb_addfile_fk_studyroom_no foreign key(fk_studyroom_no)
  --                              references cmb_studyroom(studyroom_no)


select *
from cmb_studyroom_addfile

alter table cmb_studyroom_contents
drop constraint fk_studyroom_no;

commit;
--drop table cmb_studyroom_contents purge;
create sequence seq_cmb_studyroom_contents
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

--drop sequence seq_cmb_studyroom_contents;
select * 
from cmb_studyroom;

--drop table cmb_studyroom_addfile purge;



create table cmb_studyroom_addfile
( addfile_no        number           not null       -- 이미지 번호
, fk_studyroom_no   number           not null       -- 스터디룸 번호
, attachedfile      varchar2(400) default 'noimage.png'  -- 첨부파일
, imagefilename     varchar2(400) not null
, imageorgFilename  varchar2(400) not null
, imagefileSize     number
, thumbnailFileName varchar2(400)
,constraint PK_cmb_addfile_addfile_no primary key(addfile_no)

);

select * from cmb_studyroom

select * from  cmb_studyroom_addfile
 
 insert into cmb_studyroom_addfile(addfile_no, fk_studyroom_no, imagefilename, imageorgFilename, imagefileSize, thumbnailFileName) 
		values(seq_cmb_studyroom_addfile.nextval, 2, '튤립', 'ㄴㅁ웆ㅂ', 123123, 'ㅁㄴㄴ') 
 
 commit
 
 
 
 --alter table cmb_studyroom_addfile add
 --(imagefilename     varchar2(400) not null
--, imageorgFilename  varchar2(400) not null
--, imagefileSize     number
--, thumbnailFileName varchar2(400))

select * from cmb_board

------------------------------------나만

select board_no, memberno_fk, nickname, subject, readCount, writedate, commentCount
		from 
		(
		  select rownum as RNO
		       , V.board_no, V.memberno_fk, V.nickname, V.subject, V.content, V.readCount, V.writedate, V.commentCount
		  from 
		  (
		      select board_no, memberno_fk, nickname 
		           , case when length(subject) > 20 then substr(subject, 1, 18)||'..'
		             else subject end as subject
		           , content , readCount
		           , to_char(writedate, 'yyyy-mm-dd hh24:mi:ss') as writedate
		           , commentCount
		      from cmb_board
		      where status = 1
	      order by board_no desc
		  ) V
		) T
	
  
  select * from cmb_studyroom


select seq_cmb_studyroom_addfile.nextval
from dual

----------------------------------------나만

select * from cmb_studyroom_addfile;

create sequence seq_cmb_studyroom_addfile
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select seq_cmb_addfile.nextval
from dual

select * from cmb_member

insert into cmb_member values(seq_cmb_member.nextval, '재리', 'qwer1234$', 'woflqh12@naver.com' , 1, 0, default)

commit;


--drop sequence seq_cmb_studyroom_addfile;


select *
from comoba_test

insert into comoba_test values  (1);


select *
from  cmb_member



-------------------------------------
--text



insert into cmb_studyroom_addfile(addfile_no, fk_studyroom_no, imagefilename, imageorgFilename, imagefileSize, thumbnailFileName) 
		values(seq_cmb_studyroom_addfile.nextval, seq_cmb_studyroom.nextval, '20170616174548202688141571911.jpg', 'Hydrangeas.jpg', 595284, '20170616174548202688143116584.jpg');

	insert into cmb_studyroom(studyroom_no, studyroom_name, addr1, addr2, hp, cost, longitude, latitude)
		values(seq_cmb_studyroom.nextval, '용시', '용용구', '용용동', 01094604053 , 1300, '37.533812', '126.896963')

select seq_cmb_studyroom.nextval
from dual;

commit;
select * from cmb_studyroom

---- 결제 그래프 관한 테이블

  select * from cmb_order
  
  select * from cmb_studyroom
  
  select * from cmb_member
  
 
 select * from CMB_order
 
 
 -- drop table cmb_order purge;
  create table cmb_order 
  (order_no number not null           -- 예약번호 PK
  ,regdate date default sysdate       -- 결제시간 현재시간
  ,people number                      -- 스터디룸을 이용하는 인원수
  ,usehour number                    -- 스터디룸을 사용 하는 시간
  ,status number(1) default 0         -- 결제 완료 되면 1 아니면 0
  ,city number(1) default 0           -- 0 : 강남, 1 : 강서, 2 : 강동, 3 : 강북, 4 : 중구
  ,fk_studyroom_no number not null    -- 예약할 스터디룸의 번호
  -- ,fk_cost number not null            -- 스터디룸 비용을 참조 하여  인원수 * 비용 * 시간 를 한다        그냥 참조 받은값을 넣으려고 뺌
  ,fk_memberno number not null        -- 결제하는 회원번호
  ,constraint PK_cmb_order_order_no primary key(order_no)
  ,constraint FK_cmb_order_fk_memberno foreign key(fk_memberno) references cmb_member(memberno)
  ,constraint FK_cmb_order_fk_studyroom_no foreign key(fk_studyroom_no) references cmb_studyroom(studyroom_no)
  ,constraint CK_cmb_order_status check(status in(0,1))
  ,constraint CK_cmb_order_city check(city in(0,1,2,3,4))
  );
  
  
  
    select *
   		 from cmb_story
  		 group by to_char(regdate, 'yyyy')
  	 	order by 1
  
  --drop sequence seq_cmb_order;
  
  create sequence seq_cmb_order --결제시퀀스
  start with 1
  increment by 1
  nomaxvalue
  nominvalue
  nocycle
  nocache;
 
 
 ----------------------------------------------
 select * from cmb_order
 where to_char(regdate , 'yy') =17
 order by 2 desc
 
 
 
 insert into cmb_order (order_no, regdate, people, usehour, status, city, fk_studyroom_no,  fk_memberno) values
 (seq_cmb_order.nextval, sysdate +150, 4, 3, 1, 1, 1, 17);
 
 insert into cmb_order (order_no, regdate, people, usehour, status, city, fk_studyroom_no,  fk_memberno) values
 (seq_cmb_order.nextval, sysdate +180, 1, 2, 1, 2, 1, 17);
 
 insert into cmb_order (order_no, regdate, people, usehour, status, city, fk_studyroom_no,  fk_memberno) values
 (seq_cmb_order.nextval, sysdate +120, 4, 3, 1,3, 1, 17);
 
 
 insert into cmb_order (order_no, regdate, people, usehour, status, city, fk_studyroom_no,  fk_memberno) values
 (seq_cmb_order.nextval, sysdate - trunc(dbms_random.value(-170,180)), trunc(dbms_random.value(1,5)), trunc(dbms_random.value(1,4)), 1, 3, 1, 17);
 
 
 commit
 
 select *
 from cmb_board
 order by 1 desc;
 
 
 select *
 from cmb_order
 where city = 2
 order by regdate asc
 
 select *
 from cmb_order
 -----------------------------------------
 
 insert into cmb_order (order_no, regdate, people, usehour, status, city, fk_studyroom_no,  fk_memberno) values
 (seq_cmb_order.nextval, default, 4, 3, 1, 4, 1, 17);
 
 insert into cmb_order (order_no, regdate, people, usehour, status, city, fk_studyroom_no,  fk_memberno) values
 (seq_cmb_order.nextval, default, 4, 3, 1, 4, 1, 17);
 
 insert into cmb_order (order_no, regdate, people, usehour, status, city, fk_studyroom_no,  fk_memberno) values
 (seq_cmb_order.nextval, default, 4, 3, 1, 4, 1, 17);
 
 insert into cmb_order (order_no, regdate, people, usehour, status, city, fk_studyroom_no,  fk_memberno) values
 (seq_cmb_order.nextval, default, 4, 3, 1, 4, 1, 17);
 
 insert into cmb_order (order_no, regdate, people, usehour, status, city, fk_studyroom_no,  fk_memberno) values
 (seq_cmb_order.nextval, default, 4, 3, 1, 4, 1, 17);
 
 insert into cmb_order (order_no, regdate, people, usehour, status, city, fk_studyroom_no,  fk_memberno) values
 (seq_cmb_order.nextval, default, 4, 3, 1, 0, 1, 17);
 
 insert into cmb_order (order_no, regdate, people, usehour, status, city, fk_studyroom_no,  fk_memberno) values
 (seq_cmb_order.nextval, default, 4, 3, 1, 0, 1, 17);
 
 
 
 
 
 commit;
 
 select count (*)
 from cmb_order 
 where city = 0;
 
 
 commit;
 
 
 	select count (*) from cmb_order  where city = 6;
 
 
 
 	select board_no, memberno_fk, nickname, subject, readCount, writedate, commentCount
          , groupno, fk_seq, depthno
          , fileName, orgFilename, fileSize
		from 
		(
		  select rownum as RNO
		       , V.board_no, V.memberno_fk, V.nickname, V.subject, V.content, V.readCount, V.writedate, V.commentCount
            , V.groupno, V.fk_seq, V.depthno
		     , V.fileName, V.orgFilename, V.fileSize
		  from 
		  (
		      select board_no, memberno_fk, nickname 
		           , case when length(subject) > 20 then substr(subject, 1, 18)||'..'
		             else subject end as subject
		           , content , readCount
		           , to_char(writedate, 'yyyy-mm-dd hh24:mi:ss') as writedate
		           , commentCount
               , groupno, fk_seq, depthno
		         , fileName, orgFilename, fileSize
		      from cmb_board
		      where status = 1
 
     order by board_no desc
		  ) V
		) T;
   
   
      select * from cmb_board  order by writedate;
   
   		select count (*) as www from cmb_board where writedate between TO_DATE(2011,'yyyy') and  TO_DATE(2012,'yyyy');
   
   -------------------------태봉
   select B.*, A.cost*B.people*B.usehour as 가격
from cmb_studyroom A, cmb_order B
where A.studyroom_no = B.fk_studyroom_no
order by B.city
;
   -- 자유게시판 2010년부터 2017까지 게시물 현황
   select to_char(writedate, 'yyyy') as YEAR
 	            , count(*) as CNT
   		 from cmb_board
  		 group by to_char(writedate, 'yyyy')
  	 	order by 1;
      
      
       select to_char(regdate, 'yyyy') as YEAR
 	            , count(*) as CNT
   		 from cmb_order
  		 group by to_char(regdate, 'yyyy')
  	 	order by 1;
      
      
    -- 공라이브 2010년부터 2017까지 게시물 현황
      select count(*) as CNT
   		 from cmb_board
  		 group by to_char(writedate, 'yyyy')
  	 	order by 1
      
       select count(*) as CNT
   		 from cmb_story
  		 group by to_char(regdate, 'yyyy')
  	 	order by 1
      
      select *
      from (select  count(*) 
      from 
      (select  count(*) as CNT
   		 from cmb_gonglive
       where to_char(writedate, 'yyyy') =2010
      ) V
       where to_char(writedate, 'yyyy') =2011
      )T
      
      
   
   select typecode, typename
		from chart_jepumType
		where typecode in(select fk_typecode
                  		  from chart_jepumDetail
                  		   where fk_jepumno = 1000)
   
   -- 갯수 지역별로 가격을 합산, 갯수
 select city,  sum(  A.cost*B.people*B.usehour) as regioncost, COUNT(*)
from cmb_studyroom A, cmb_order B
where A.studyroom_no = B.fk_studyroom_no
group by city 
order by B.city

--
  select to_char(writedate, 'mm') as mm
         , count(*) as cnt
   from cmb_board
   where to_char(writedate, 'yy')= 17
   group by to_char(writedate, 'mm')
   order by 1;


------------ 17년도의 주문내역
select * from cmb_order
 where to_char(regdate , 'yy') =17
 order by 2 desc;
 


--중요
-- 17년도의 시티 4번의 월별 가격의 총합!
 
  select  to_char(regdate, 'mm') as month 
          , sum( A.cost*B.people*B.usehour) as totalcost4
    from cmb_studyroom A, cmb_order B
    where to_char(regdate, 'yy') = 17  
          and A.studyroom_no = B.fk_studyroom_no   
          and B.city = 4
    group by to_char(regdate, 'mm')
    order by 1
 
    ;
    select *
    from cmb_order
    ;
    
    
   select  sum( A.cost*B.people*B.usehour) as totalcost
    from cmb_studyroom A, cmb_order B
    where to_char(regdate, 'yy') = 17  
          
          and A.studyroom_no = B.fk_studyroom_no   
          
          and B.city = '4'
    group by to_char(regdate, 'mm') 
    order by 1




  select  sum( A.cost * B.people * B.usehour) as totalcost
  	  from cmb_studyroom A, cmb_order B
      where     to_char(regdate, 'yy') = 17  
			and A.studyroom_no = B.fk_studyroom_no
			and B.city = 0
      group by to_char(regdate, 'mm') 
      order by 1

select *
from cmb_order







 
    
    	select count (*) from cmb_order  where city = 0
     
 

       select count(*) as CNT, to_char(regdate, 'yyyy')
   		 from cmb_order
  		 group by to_char(regdate, 'yyyy')
  	 	order by 1

      
   -----------개조하자---------------------
   from (select  to_char(regdate, 'mm') as month 
           , sum( A.cost*B.people*B.usehour) as city4
           
    from cmb_studyroom A, cmb_order B
    where to_char(regdate, 'yy') = 17  
           
          and A.studyroom_no = B.fk_studyroom_no   
          
          and B.city = 0
    group by to_char(regdate, 'mm') 
    order by 1
 )V
    ;
   
   
   
    select  to_char(regdate, 'mm') as month 
          , sum( A.cost*B.people*B.usehour) as totalcost0
    from cmb_studyroom A, cmb_order B
    where to_char(regdate, 'yy') = 17  
          and A.studyroom_no = B.fk_studyroom_no   
          and B.city = 0
    group by to_char(regdate, 'mm')
    order by 1
    ;
    
    
   
   
   	 select  count(*) as cnt
   		 from cmb_board
  		 group by to_char(writedate, 'yyyy')
  	 	order by 1
      
      commit;
      
    select  sum( A.cost * B.people * B.usehour) as totalcost
  	  from cmb_studyroom A, cmb_order B
      where     to_char(regdate, 'yy') = 17  
			and A.studyroom_no = B.fk_studyroom_no
			and B.city = 0
      group by to_char(regdate, 'mm') 
      order by 1;
      
      
      
      -- 06 27 김재연
      
      select B.BOARD_CONTENTS , nickname
      from cmb_board A , CMB_BOARD_CONTENTS B
		      where status = 1
              and board_no = board_no_fk
              --and lower(subject) like '%' || lower(#{search}) || '%'
              
      order by 1 desc;
      
    	select substr(B.BOARD_CONTENTS, instr(B.BOARD_CONTENTS, #{search}, 1, 1),
			length(#{search}) +
			5 )
			as searchdata
			from cmb_board A , CMB_BOARD_CONTENTS B
			where
			lower(B.BOARD_CONTENTS) like '%' || lower(#{search}) || '%'
    
    select distinct nickname as searchdata
			from cmb_board A , CMB_BOARD_CONTENTS B
			where lower(nickname) like '%' || lower(#{search}) || '%'
    
      
      
      
      	select board_no, memberno_fk, nickname, category, subject, BOARD_CONTENTS, readCount, writedate, commentCount 
			 , groupno, fk_seq, depthno
          	 , fileName, orgFilename, fileSize
		from 
		(
		  select rownum as RNO
		       , V.board_no, V.memberno_fk, V.nickname, V.category, V.subject, V.BOARD_CONTENTS, V.readCount, V.writedate, V.commentCount
		       , V.groupno, V.fk_seq, V.depthno
		       , V.fileName, V.orgFilename, V.fileSize
		  from 
		  (
		      select board_no, memberno_fk, nickname 
		           , case when length(subject) > 20 then substr(subject, 1, 18)||'..'
		             else subject end as subject
               , category
		           , case when length(BOARD_CONTENTS) > 20 then substr(BOARD_CONTENTS, 1, 20)||'...'
                 else BOARD_CONTENTS
                 end as BOARD_CONTENTS
               , readCount
		           , to_char(writedate, 'yyyy-mm-dd hh24:mi:ss') as writedate
		           , commentCount
		           , groupno, fk_seq, depthno
		           , fileName, orgFilename, fileSize
		      from cmb_board A , CMB_BOARD_CONTENTS B
		      where status = 1
              and board_no = board_no_fk
		
		           and BOARD_CONTENTS like '%'|| '옹' ||'%'
		
		      order by board_no desc
		  ) V
		) T
      
       select SUBJECT as searchdata
    		  from cmb_board A , CMB_BOARD_CONTENTS B
		      where status = 1
              and board_no = board_no_fk
              and lower(subject) like '%' || '도' || '%'
     		 order by 1 desc
      
      
      	select substr(board_contents, instr(board_contents, '헤', 1, 1),
			length('헤') +
			5 )
			as searchdata
			from cmb_board A , CMB_BOARD_CONTENTS B
			where
      
			lower(board_contents) like '%' || lower('헤') || '%'
         and board_no = board_no_fk
      
      select *
      	from cmb_board A , CMB_BOARD_CONTENTS B
      
      
      
      cmb_board
      order by 1 desc
      
      	select board_no, memberno_fk, nickname, category, subject, BOARD_CONTENTS, readCount, writedate, commentCount 
			 , groupno, fk_seq, depthno
          	 , fileName, orgFilename, fileSize
		from 
		(
		  select rownum as RNO
		       , V.board_no, V.memberno_fk, V.nickname, V.category, V.subject, V.BOARD_CONTENTS, V.readCount, V.writedate, V.commentCount
		       , V.groupno, V.fk_seq, V.depthno
		       , V.fileName, V.orgFilename, V.fileSize
		  from 
		  (
		      select board_no, memberno_fk, nickname 
		           , case when length(subject) > 20 then substr(subject, 1, 18)||'..'
		             else subject end as subject
               , category
		           , case when length(BOARD_CONTENTS) > 20 then substr(BOARD_CONTENTS, 1, 20)||'...'
                 else BOARD_CONTENTS
                 end as BOARD_CONTENTS
               , readCount
		           , to_char(writedate, 'yyyy-mm-dd hh24:mi:ss') as writedate
		           , commentCount
		           , groupno, fk_seq, depthno
		           , fileName, orgFilename, fileSize
		      from cmb_board A , CMB_BOARD_CONTENTS B
		      where status = 1
              and board_no = board_no_fk
                order by board_no desc
		  ) V
		) T
    
     	select board_no, memberno_fk, nickname, subject, BOARD_CONTENTS, readCount, writedate, commentCount 
			 , groupno, fk_seq, depthno
          	 , fileName, orgFilename, fileSize
		from 
		(
		  select rownum as RNO
		       , V.board_no, V.memberno_fk, V.nickname, V.subject, V.BOARD_CONTENTS, V.readCount, V.writedate, V.commentCount
		       , V.groupno, V.fk_seq, V.depthno
		       , V.fileName, V.orgFilename, V.fileSize
		  from 
		  (
		      select board_no, memberno_fk, nickname 
		           , case when length(subject) > 20 then substr(subject, 1, 18)||'..'
		             else subject end as subject
		           , case when length(BOARD_CONTENTS) > 20 then substr(BOARD_CONTENTS, 1, 20)||'...'
                 else BOARD_CONTENTS
                 end as BOARD_CONTENTS
               , readCount
		           , to_char(writedate, 'yyyy-mm-dd hh24:mi:ss') as writedate
		           , commentCount
		           , groupno, fk_seq, depthno
		           , fileName, orgFilename, fileSize
		      from cmb_board A , CMB_BOARD_CONTENTS B
		      where status = 1 
              and board_no = board_no_fk
	
		      order by board_no desc
		  ) V
		) T
      --위가 완성본
      
      	select board_no, memberno_fk, nickname, subject, readCount, writedate, commentCount
			 , groupno, fk_seq, depthno
          	 , fileName, orgFilename, fileSize
		from 
		(
		  select rownum as RNO
		       , V.board_no, V.memberno_fk, V.nickname, V.subject, V.content, V.readCount, V.writedate, V.commentCount
		       , V.groupno, V.fk_seq, V.depthno
		       , V.fileName, V.orgFilename, V.fileSize
		  from 
		  (
		      select board_no, memberno_fk, nickname 
		           , case when length(subject) > 20 then substr(subject, 1, 18)||'..'
		             else subject end as subject
		           , content , readCount
		           , to_char(writedate, 'yyyy-mm-dd hh24:mi:ss') as writedate
		           , commentCount
		           , groupno, fk_seq, depthno
		           , fileName, orgFilename, fileSize
		      from cmb_board
		      where status = 1
          	      order by board_no desc
		  ) V
		) T
      
      select * from cmb_board , CMB_BOARD_CONTENTS where board_no = board_no_fk
      
      insert into CMB_BOARD_CONTENTS values( 221 , '벨비유 나의 사랑 그대 널보면 너와 함께 있으면 어둠은 사라져 시간이 멈춰서 이 공간엔 너와 나 둘만 남겨져 love was alwats painful ')
      commit
      select *  from CMB_BOARD_CONTENTS
      select *  from CMB_STORY
      select *  from cmb_board order by 1 desc
      
      select * from cmb_board
      
      update cmb_board set  status = 1
      
      commit;
      
      update cmb_board set status = 0
	    where Board_no = #{Board_no}
      
      CMB_GONGLIVE
      
      CMB_STORY
      
      insert into spring_tblBoard(seq, userid, name, subject, content, pw, readCount, regDate, status, groupno, fk_seq, depthno, fileName, orgFilename, fileSize)
		values(spring_boardSeq.nextval, #{userid}, #{name}, #{subject}, #{content}, #{pw}, default, default, default, #{groupno}, default, default, #{fileName, jdbcType=VARCHAR}, #{orgFilename}, #{fileSize}) 
		
      ---0628 
      <if test='colname.equals("subject")'>
      	 select BOARD_NO , SUBJECT , BOARD_CONTENTS, NICKNAME, WRITEDATE
    		  from cmb_board A , CMB_BOARD_CONTENTS B
		      where status = 1
              and board_no = board_no_fk
              
       	<if test='colname.equals("board_contents")'>
		 select BOARD_NO , SUBJECT , BOARD_CONTENTS, NICKNAME, WRITEDATE
			from cmb_board A , CMB_BOARD_CONTENTS B
			where
			lower(board_contents) like '%' || lower(#{search}) || '%'
			   and board_no = board_no_fk       
         
         
         	<if test='colname.equals("nickname")'>
		 select BOARD_NO , SUBJECT , BOARD_CONTENTS, NICKNAME, WRITEDATE
			from cmb_board A , CMB_BOARD_CONTENTS B
			where lower(nickname) like '%' || lower(#{search}) || '%'    
     
     
  <resultMap type="java.util.HashMap" id="getSearchWordMap">
		<result property="BOARD_NO" column="board_no" javaType="String" />
	</resultMap>
     
  <resultMap type="java.util.HashMap" id="getSearchWordMap">
		<result property="SUBJECT" column="Subject" javaType="String" />
	</resultMap>     
     
  <resultMap type="java.util.HashMap" id="getSearchWordMap">
		<result property="NICKNAME" column="nickname" javaType="String" />
	</resultMap>     
     
  <resultMap type="java.util.HashMap" id="getSearchWordMap">
		<result property="WRITEDATE" column="writedate" javaType="date" />
	</resultMap>     
  
      
--------------------------------------------------------------------------------------------------------------------------------
안태연 sql
--------------------------------------------------------------------------------------------------------------------------------

select *
from tab;

select * from cmb_follow;

-- 이거 하나로 공스토리, 공라이브, 자유게시판 사용
create sequence seq_cmb_board
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

--- << 8공라이브 테이블(회원 테이블)>> ---
create table cmb_gonglive
(live_no       NUMBER             not null    -- 공라이브번호
,memberno_fk   NUMBER             not null    -- 회원번호 
,gong_title    varchar2(200)      not null    -- 제목 
,gonglive_contents varchar2(2000) not null    -- 공라이브테이블내용
,gong_views    NUMBER(38) default 0       not null      -- 조회수 
,gong_link     VARCHAR2(400)          -- 영상링크 
,writedate      date default sysdate not null -- 글쓴 날짜
,gong_status   number(1) default 1 not null   -- 게시물삭제유무
,constraint PK_cmb_gonglive_live_no primary key(live_no)
,constraint FK_cmb_gonglive_memberno_fk foreign key(memberno_fk) references cmb_member(memberno)
,constraint CK_cmb_gonglive_gong_status check(gong_status in(0,1))
);


select A.gong_title, A.gonglive_contents, A.gong_views, A.gong_link as gong_link1, A.writedate
      ,to_char(B.starttime, 'yyyy-mm-dd hh24:mi') as starttime, to_char(B.finishtime, 'yyyy-mm-dd hh24:mi') as finishtime
      ,B.gong_link as gong_link2, B.comments
from cmb_gonglive A, cmb_gonglive_onair B
where live_no = 88 and A.live_no = B.live_no_fk;

select A.*, B.orgFilename, C.nickname
from cmb_gonglive A, cmb_gonglive_addfile B, cmb_member C
where A.memberno_fk = 20 and A.live_no = B.live_no_fk and B.fileStatus = 1 and C.memberno = 20;


drop table cmb_gonglive purge;

alter table cmb_gonglive modify(gong_views number(38) default 0);
insert into cmb_gonglive(live_no, memberno_fk, gong_title, gonglive_contents, gong_views, gong_link, livestartdate, liveenddate, liveday, writedate, gong_status)

--- << 공라이브 방송내역 테이블 >>
create table cmb_gonglive_onair
(onair_no         NUMBER             not null
,live_no_fk NUMBER             not null
,starttime   date              not null
,finishtime  date              
,gong_link       VARCHAR2(400)      not null
,comments    VARCHAR2(200)
,status     number(1) default 1 not null
,constraint PK_cmb_onair_no primary key(onair_no)
,constraint FK_cmb_onair_live_no_fk foreign key(live_no_fk) references cmb_gonglive(live_no)
);
alter table cmb_gonglive_onair add livecnt NUMBER(38) default 0 not null;
ALTER TABLE cmb_gonglive_onair RENAME COLUMN livecnt TO liveviewcnt;
commit;
select * from cmb_gonglive_onair;

delete cmb_gonglive_onair where onair_no=4;
commit;
select count(*) as cnt
		from cmb_gonglive_onair
		where live_no_fk = 88;

select A.live_no, A.memberno_fk, A.gong_title, A.gonglive_contents, A.gong_views, A.gong_link as gong_link1
      ,B.gong_link as gong_link2, B.comments, C.nickname, D.fileName
from cmb_gonglive A, cmb_gonglive_onair B, cmb_member C , cmb_gonglive_addfile D
where A.live_no = B.live_no_fk and A.memberno_fk = C.memberno  and A.live_no = D.live_no_fk and D.fileStatus = 1  and B.status = 1;

select to_char(finishtime, 'yyyy-mm-dd hh24:mi') 
from cmb_gonglive_onair;



create sequence seq_cmb_onair
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

commit;
select * from cmb_gonglive;

alter table cmb_gonglive add starpoint number default 0.0

delete cmb_gonglive where live_no=237;
select * from cmb_gonglive_addfile;
drop table cmb_gonglive purge;

--create sequence seq_cmb_gonglive
--start with 1
--increment by 1
--nomaxvalue 
--nominvalue
--nocycle
--nocache;

select A.live_no, A.memberno_fk, A.gong_title, A.gonglive_contents, A.gong_views, A.gong_link
            , to_char(A.writedate, 'yyyy-mm-dd') as writedate, A.gong_status, B.fileName, C.nickname
         from cmb_gonglive A, cmb_gonglive_addfile B, cmb_member C
         where memberno_fk=20 and A.live_no = B.live_no_fk and B.fileStatus=1 and C.memberno=20



--- << 10공라이브 첨부파일 테이블(공라이브 테이블) >> ---
create table cmb_gonglive_addfile
(addfile_no     NUMBER         not null  -- 이미지번호
,live_no_fk     NUMBER         not null  -- 공라이브번호 
,fileName       varchar2(255)  not null  -- 저장되어지는 파일명
,orgFilename    varchar2(255)  not null  -- 사용되어지는 파일명
,fileSize       number                   -- 파일크기
,fileStatus     number         not null  -- 대표이미지:1, 나머지 첨부파일: 2
,constraint PK_cmb_gonglive_addfile_no primary key(addfile_no)
,constraint FK_cmb_gonglive_live_no_fk foreign key(live_no_fk)
references cmb_gonglive(live_no)
);

select fileName, orgFilename, fileSize
		from cmb_gonglive_addfile
		where live_no_fk = 88 and fileStatus = 2;

drop table cmb_gonglive_addfile purge;
drop sequence seq_cmb_gonglive_addfile

create sequence seq_cmb_gonglive_addfile
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;


--- << 11별점테이블(회원 테이블, 공라이브 테이블)>> ---
create table cmb_stars
(stars_no        NUMBER    not null       -- 별점번호
,live_no_fk      NUMBER    not null       -- 공라이브번호 
,memberno_fk      NUMBER    not null       -- 회원번호 
,stars           NUMBER(2)    not null   -- 별점
,constraint PK_cmb_stars_stars_no primary key(stars_no)
,constraint FK_cmb_stars_live_no_fk foreign key(live_no_fk) references cmb_gonglive(live_no)
,constraint FK_cmb_stars_memberno_fk foreign key(memberno_fk) references cmb_member(memberno)
);

select * from cmb_stars;


select trunc((select sum(stars)
            from cmb_stars
            where live_no_fk = 88)/(select count(*)
                                    from cmb_stars
                                    where live_no_fk = 88)
            ,1) as stars
from dual;



select count(*) as cnt
from cmb_stars
where live_no_fk = 88 and memberno_fk = 10;



create sequence seq_cmb_stars
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;


--- << 22팔로우테이블(회원 테이블)  >> ---
-- drop table cmb_follow purge
create table cmb_follow
(follow_no    number           not null     -- 팔로우 번호(seq)
,followed     number    not null     -- 팔로우 하는사람(회원번호)
,following      number         not null     -- 팔로우 당하는사람(회원번호)
,followedtime date default sysdate not null -- 팔로우 하는시간
,status    number(1) default 1       -- 회원상태(1:회원 / 0:회원불)

,constraint PK_cmb_follow_follow_no primary key(follow_no )
,constraint FK_cmb_follow_following foreign key(following)
                                references cmb_member(memberno)
,constraint FK_cmb_follow_followed foreign key(followed)
                                references cmb_member(memberno)    
,constraint CK_cmb_follow_status check(status in(0,1))
                                
);

select * from cmb_follow;
--drop sequence seq_cmb_follow

delete from cmb_follow where follow_no = 22;
commit;
create sequence seq_cmb_follow
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


select A.comment_no, A.memberno_fk, A.together_no, A.boardtype, A.comment_content 
		     , A.comment_date , A.comment_status  , B.nickname
		from cmb_comment A, cmb_member B
		where A.memberno_fk = B.memberno and comment_status = 1 and together_no = 88
		order by comment_no desc



select * from cmb_comment;
delete from cmb_comment where comment_no between 98 and 107;
commit;

  -------- **** JOB 스케줄러 **** ----------
JOB 스케줄러란? 
==> 지정된 시간에 특정 업무(프로시저)가 자동적으로 발생되어지도록 만들어주는 것.

--SYS에서 작업시작
HR 사용자가 JOB 스케줄러를 만들수 있도록 SYS에서 권한을 부여해주어야 한다.
show user

grant create any job to hr;
grant create table to hr; 

select value from v$parameter where name like '%job%';
-- 여기에 나오는 job_queue_processes 의 value 값은 
-- job 을 몇개 까지 만들어 줄수 있는지 갯수를 말한다.
-- 기본값은 4 인데 이 값이 0 이면 job 을 만들수가 없으므로 주의를 요한다.
-- 우리는 아래처럼 해서 10개 까지 늘려본다.
alter system set job_queue_processes = 10;

select value from v$parameter where name like '%job%';
--SYS에서 작업끝


-- HR 에서 작업시작 
------  데이터를 주기적으로 검사해서 자동으로 status 컬럼의 값이 1 에서 0 으로 update 되도록 하는 테이블 생성 -------
-- drop table tbl_jobtest purge;
create table tbl_jobtest
(seqcode       varchar2(20)
,name          varchar2(20)
,content       varchar2(100)
,opendate      date 
,status        number(1) default 0 
,updatedate    date default sysdate
,constraint  tbl_seq_PK primary key(seqcode)
);



--drop sequence seq_tbl_jobtest;
create sequence seq_tbl_jobtest
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


select seqcode, name, content, 
       to_char(opendate, 'yyyy-mm-dd hh24:mi:ss') as opendate,
       status,
       to_char(updatedate, 'yyyy-mm-dd hh24:mi:ss') as updatedate
from tbl_jobtest;


-- 테이블 cmb_gonglive_onair 에 방송상태를 update 하는 프로시저생성
create or replace procedure pcd_cmb_gonglive_onair_update
is

begin
     
     update cmb_gonglive_onair set status = 0
     where to_date(finishtime, 'yyyy-mm-dd hh24:mi') < sysdate +(9/24);
     
     commit;
end pcd_cmb_gonglive_onair_update;




------ ***** JOB Scheduler 생성하기 ****** --------
-- JOB 등록하기 --
-- 여기서는 프로시저 pcd_tbl_jobtest_update 를 JOB 으로 설정하도록 한다.
DECLARE
  jobno NUMBER;
BEGIN
  SYS.DBMS_JOB.SUBMIT
    ( job       => jobno  
     ,what      => 'awscomoba.pcd_cmb_gonglive_onair_update;'    -- 마지막에 ; 조심!!
     ,next_date => sysdate +(9/24) + 2/(24*60)
     ,interval  => 'SYSDATE + 1/(24*60)'
     ,no_parse  => TRUE
    );
END;


--* job : 실행할 job number   기본적으로 1부터 들어옴.
--* what - 실행할 PL/SQL 프로시저(procedure) 명 혹은 psm 문장의 sequence
--* next_date - job을 언제 처음 시작할 것인지 지정한다. date type으로 evaluate되는 문자열 입력(SYSDATE)
--* interval - job을 수행한 후, 다음 실행시간까지의 시간을 지정한다. 
--                위 셋팅 'SYSDATE + 1/(24*60)' 은 1분마다 실행한다.
--* no_parse - true 이면 submit시에 job을 parsing하지 않는다.


--  job queue 정보 조회
 SELECT * FROM USER_JOBS;

exec dbms_job.run(1);

-- 몇분이 지난후 아래를 실행해본다.
select * from cmb_gonglive_onair;


-- JOB 정지 --  여기서  숫자 1은 job 의 번호 임.  
SELECT * FROM USER_JOBS;

execute dbms_job.broken(1, true); 
commit;


-- 정지된 JOB 재시작 --  여기서  숫자 1은 job 의 번호 임.  
SELECT job FROM USER_JOBS;

execute dbms_job.broken(1, false);
commit;


-- JOB 삭제 --  여기서  숫자 1은 job 의 번호 임.  
SELECT job FROM USER_JOBS;

execute dbms_job.remove(2);
commit;

-- JOB 지금 바로 실행하기 -- 여기서  숫자 1은 job 의 번호 임.  
SELECT job FROM USER_JOBS;

execute dbms_job.run(1);
commit;

-- JOB 변경 next_date  -- 여기서  숫자 1은 job 의 번호 임.  
SELECT job FROM USER_JOBS;

execute dbms_job.next_date(1, trunc(sysdate)+1+1/24/60);
commit;



**** job Interval 설정
ex)
SYSDATE+7 : 7일에 한번 씩 job 수행
SYSDATE+1/24 : 1시간에 한번 씩 job 수행
SYSDATE+30/ : 30초에 한번 씩 job 수행(24: 시간 당, 1440(24x60):분 당, 86400(24x60x60):초 당 )
TRUNC(SYSDATE, 'MI')+8/24 : 최초 job 수행시간이 12:29분 일 경우 매시 12:29분에 job 수행
TRUNC(SYSDATE+1) : 매일 밤 12시에 job 수행
TRUNC(SYSDATE+1)+3/24 : 매일 오전 3시 job 수행
NEXT_DAY(TRUNC(SYSDATE),'MONDAY')+15/25 : 매주 월요일 오후 3시 정각에 job 수행
TRUNC(LAST_DAY(SYSDATE))+1 : 매월 1일 밤 12시에 job 수행
TRUNC(LAST_DAY(SYSDATE))+1+8/24+30/1440 : 매월 1일 오전 8시 30분





--------------------------------------------------------------------------------------------------------------------------------
김재민 sql
--------------------------------------------------------------------------------------------------------------------------------


  select  to_char(regdate, 'mm') , sum( A.cost * B.people * B.usehour) as totalcost
  	  from cmb_studyroom A, cmb_order B
      where     to_char(regdate, 'yy') = 17  
			and A.studyroom_no = B.fk_studyroom_no
			and B.city = 2
      group by to_char(regdate, 'mm') 
      order by 1






--------------------------------------------------------------------------------------------------------------------------------
박월성 sql
--------------------------------------------------------------------------------------------------------------------------------
--- << 1회원 테이블 >> ---
create table cmb_member 
(memberno  number        not null    -- 회원번호
,nickname  varchar2(30)  not null    -- 닉네임 
,pwd       varchar2(50)  not null    -- 암호
,email     varchar2(50)  not null    -- 이메일
,status    number(1) default 1       -- 회원상태(1:회원 / 0:회원불)
,constraint PK_cmb_member primary key(memberno)
,constraint CK_cmb_member_status check(status in(0,1))
,constraint UQ_cmb_member unique(nickname)
,constraint UQ_cmb_member unique(email)
);

ALTER TABLE cmb_member  add(joindate date default sysdate);                     -- 회원 가입일자
alter table cmb_member add constraint UQ_cmb_member unique(email);              -- 이메일 유니크키설정
alter table cmb_member add constraint UQ_cmb_member unique(nickname);           -- 닉네임 유니크키설정
alter table cmb_member add (usercomment  varchar2(100));                        -- 회원댓글내용
alter table cmb_member add (imagestatus  number default 0);                     -- 이미지 상태 (1:회원이미지있음 / 0:회원이미지 없음)
alter table cmb_member add constraint UQ_cmb_member_imagestatus check(status in(0,1)); 

-- 시퀀스 테이블 --
create sequence seq_cmb_member
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;


-- 맴버테이블 조회 --
select *
from cmb_member ;

alter table cmb_member drop(userimage);

delete from cmb_member
where nickname like '1';
commit;

-- 로그인 확인여부 --
select case( select count(*)
           from cmb_member
           where email = 'loopy@gmail.com' and
                 pwd = 'qwer1234$')
      when 1 then 1
       else( case(select count(*) 
          from cmb_member
          where email= 'loopy@gmail.com')
         when 1 then 0
         else -1
         end
         )
     end as LOGINCHECK
from dual

-- 로그인 한 회원 정보 --
select memberno, nickname, pwd , email
        from cmb_member
where status = 1 and email = 'loopy@gmail.com';    

-- 회원정보 추가테이블 --
create table cmb_userdetail 
(seq  number        not null    -- 시퀀스번호
,name  varchar2(30)  not null    -- 성명 
,tel       varchar2(50)  not null    -- 연락처
,address     varchar2(50)  not null    -- 주소
,constraint PK_cmb_userdetail primary key(seq)
);

-- 시퀀스 테이블 --
create sequence seq_userdetail
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

select *
from cmb_story;
-------------------------------인트로 화면관련-------------------------------------------------
---- 인트로 화면관련 -----
--- << 5공스토리 테이블(회원 테이블)>> ---
select *
from cmb_story;

-- 현재 시간 알아보기 --
select to_char(sysdate +(9/24),'yyyy-mm-dd hh24:mi:ss')
from dual;

-- 오늘의 게시글--             
select a.story_no as story_no, b.filename as filename
from ( select story_no
      from cmb_story
      where story_publicStatus = 1 and to_date(regDate +(9/24),'yyyy-mm-dd') = to_date(sysdate +(9/24),'yyyy-mm-dd')) A
      left join ( select story_no, filename
             from cmb_story_file) B
on A.story_no = B.story_no
order by story_no;

-- 오늘의 글수 -- 
select max(rno) maxnum
from ( select rownum as rno, story_no
      from cmb_story
      where story_publicStatus = 1 and to_date(regDate +(9/24),'yyyy-mm-dd') = to_date(sysdate +(9/24),'yyyy-mm-dd')) A
      left join ( select story_no, filename
             from cmb_story_file) B
on A.story_no = B.story_no
order by rno;
                                
-- 오늘의 자극글 보여주는 쿼리문 --
select a.story_no as story_no, b.filename as filename
from ( select rownum as rno, story_no, story_tag
      from cmb_story
      where story_publicStatus = 1 and to_date(regDate +(9/24),'yyyy-mm-dd') = to_date(sysdate +(9/24),'yyyy-mm-dd')) A
      left join ( select story_no, filename
             from cmb_story_file) B
on A.story_no = B.story_no
where A.story_tag like '%'|| '자극' ||'%';

-- 테스트용 --
select B.thumbnailFileName
from ( select story_tag, story_no
        from cmb_story
        where story_publicStatus = 1) A
join ( select story_no, thumbnailFileName
		   from cmb_story_file) B
on A.story_no = B.story_no
where A.story_tag like '%'|| '번째' ||'%';
------------------------------유저이미지테이블 --------------------------------------------------
-- 유저이미지테이블 --
create table cmb_userimage
(image_no             number         not null  -- 유저이미지첨부넘버
,user_fk              NUMBER         not null  -- 유저넘버
,fileName             varchar2(255) not null    -- 저장되어지는 파일명
,orgFilename          varchar2(255) not null    -- 사용되어지는 파일명
,fileSize             number                    -- 파일크기
,thumbnailFileName    varchar2(255)             -- WAS에 저장될 썸네일 파일명(2016082513165790354388015717.png). 
                                                -- 썸네일 파일명을 받는 컬럼임. 
,constraint PK_cmb_userimage_image_no primary key(image_no)
,constraint FK_user_fk foreign key(user_fk) references cmb_member(memberno)
);

select *
from cmb_member
order by memberno asc;

select *
from cmb_userimage
where user_fk = '59';

select memberno, nickname, email, comments, thumbnailFileName
from  (select rownum as rno, memberno, nickname, email, comments,status, imagestatus
        from cmb_member
        where status = 1 and email = '1' )A
        join
        ( select user_fk, thumbnailFileName
        from cmb_userimage
        where user_fk = '47') B
on a.memberno = b.user_fk;

select *
from cmb_userimage
where user_fk = '59';
                       
-- 유저이미지테이블 --
create sequence seq_cmb_userimage
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;

delete from cmb_userimage
where image_no = 4;
-----------------------------------나의 현황관련---------------------------------------------
-- 나의 현황관련
-- d-day
create table cmb_dday
(dday_no      number         not null  
,memberno_fk  NUMBER         not null 
,subject      varchar2(50)    not null
,ddaydate     date            not null   -- 종료일자
,submitdate   date       default sysdate -- 입력날짜
,status       number(1) default 1 not null 
,constraint PK_cmb_dday_no primary key(dday_no)
,constraint FK_cmb_memberno_fk foreign key(memberno_fk) references cmb_member(memberno)
,constraint CK_cmb_dday_status check(status in(0,1))
);
alter table cmb_dday add(datepriority number(1) default 0 not null); -- 유저가 원하는 우선순위 dday를 상태설정 1:우선 0:미정
alter table cmb_dday add constraint CK_cmb_dday_datepriority check(status in(0,1)); -- 유저가 원하는 우선순위 dday를 상태설정 1:우선 0:미정
commit;
-----------------------------DDAY까지 남은날 -------------------------------------------------------
-- DDAY까지 남은날 --
-- 유저가 설정한 dday까지 얼마나 남았는지를 보여주기1
select  memberno_fk
      , to_date( to_char(ddaydate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') as ddaynumber
from cmb_dday
where to_date( to_char(ddaydate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date( to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') > 0;

-- 회원정보 --
select *
from cmb_member
order by memberno asc;

-- 유저 정한날짜 임시 설정
update cmb_dday set datepriority = 1
where dday_no = 18;
commit;

-- 유저가 설정한 dday까지 얼마나 남았는지를 보여주기2
select dday_no, remaindate , datepriority 
from 
    (select memberno, email
     from cmb_member
     where email = 'yangmo112@naver.com' and status = 1
     order by memberno asc) A
join
    (select  dday_no, memberno_fk, datepriority
      , to_date(to_char(ddaydate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(sysdate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd')+1 as remaindate
from cmb_dday
where to_date(to_char(ddaydate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(sysdate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd') > 0)B
on memberno = memberno_fk;

-- 유저가 설정한 dday중 현황창에서 얼마나 남았는지를 보여주기3
select dday_no, remaindate , datepriority 
from 
    (select memberno, email
     from cmb_member
     where memberno = 16 and status = 1
     order by memberno asc) A
join
    (select  dday_no, memberno_fk, datepriority
      , to_date(to_char(ddaydate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(sysdate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd') + 1 as remaindate
from cmb_dday
where to_date(to_char(ddaydate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(sysdate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd') > 0)B
on memberno = memberno_fk
where datepriority = 1;
---------------------------출석테이블--------------------------------------------------
---- 출석테이블 ----
--- 출석이벤트란 ? 해당과목에 입장했을때 출석이므로 이때  출석테이블 에 데이터 정보를 입력(insert)를 하도록 한다.
create table cmb_attandance
(attand_no    number  not null               -- 시퀀스
,userno_fk    NUMBER  not null               -- 유저번호
,name_fk         varchar2(30)  not null    -- 닉네임
,dday_no_fk   number  not null               -- 과목불러오기위한 넘버
,attandedno   number  not null               -- 출석횟수 
,attanddate   date default sysdate  not null -- 출석일자
,status       number(1) default 1 not null   -- 출석상태 (0: 결석, 1: 출석)
,constraint PK_attand_no primary key(attand_no)
,constraint FK_userno_fk foreign key(userno_fk) references cmb_member(memberno)
,constraint FK_name_fk foreign key(name_fk) references cmb_member(nickname)
,constraint FK_dday_no_fk foreign key(dday_no_fk) references cmb_dday(dday_no)
,constraint CK_status check(status in(0,1))
);

--drop table cmb_attandance purge;
--drop sequence seq_cmb_attandance;
-- 출석테이블 시퀀스 --
create sequence seq_cmb_attandance
start with 1
increment by 1
nomaxvalue 
nominvalue
nocycle
nocache;
---------------------------------출석현황---------------------------------------------------
-- 출석현황 --
-- 출석할때 올려주기.
insert into cmb_attandance(attand_no, userno_fk, name_fk, dday_no_fk, attandedno, attanddate, status)
values(seq_cmb_attandance.nextval, 66, '젝이2', 22, 2, default, default );
commit;

update cmb_attandance set attandedno = 2
where userno_fk = 14;  

commit;
-- 총출첵 가져오기
select sum(attandedno) as attandedno
from cmb_attandance
where userno_fk = 66;

select *
from cmb_attandance;

-- dday_no_fk를 받기 위해서 dday_no받아오기
select dday_no
from cmb_dday
where memberno_fk= 16 and datepriority = 1 and status = 1;

-- 오늘 출석했는지 여부확인
select count(*) as cnt
from cmb_attandance
where userno_fk = 18 and to_char(ATTANDDATE+(9/24), 'yyyy-mm-dd') = to_char(sysdate+(9/24), 'yyyy-mm-dd');

-- DDAY를 정한 날짜로 부터 DDAY까지의 일수
select to_date(to_char(ddaydate+(9/24),'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(submitdate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd') + 1 as attandanceday
from cmb_dday
where memberno_fk = 16 and datepriority = 1;
 
-- DDAY를 정한 날짜로 부터 DDAY까지의 일수 중 출석한 날짜의 총
select count(*) 
from cmb_attandance
where userno_fk = 66 and dday_no_fk = 22;

-- DDAY를 정한 날짜로 부터 DDAY까지의 일수 중 출석한 날짜의 출석률
select trunc((select count(*)
        from cmb_attandance
        where userno_fk = 16 and dday_no_fk = 22
        group by userno_fk
        )/(select to_date(to_char(ddaydate+(9/24),'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(submitdate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd') + 1 as attandanceday
           from cmb_dday
           where memberno_fk = 16 and datepriority = 1) * 100, 1) as attandcerate
from dual;
-----------------------미션현황---------------------------------------------------------
--- << 14 내할일 테이블(회원 테이블) >> ---
create table cmb_mission
(todolist_no    number               not null       -- 댓글 번호
,memberno_fk    number               not null       -- 회원 번호
,contents       varchar2(400)        not null       -- 내용
,date           date default sysdate not null       -- 미션작성일자
,status         number(1) default 0  not null       -- 미션완성여부
,constraint PK_cmb_mission_todolist_no primary key(todolist_no)
,constraint FK_cmb_mission_memberno_fk foreign key(memberno_fk)
                                references cmb_member(memberno)
,constraint CK_cmb_mission_status check( status in(0,1) ) 
);

create sequence seq_cmb_mission
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from cmb_attandance;

-- memberno_fk가져오기
select distinct(a.memberno_fk) as memberno_fk
from 
(select memberno_fk
from cmb_mission)A join
(select memberno
from cmb_member
where status = 1 and memberno = 16
)B
on memberno_fk = memberno;

-- 미션성공율 --
select trunc((select count(*)
              from cmb_mission
              where memberno_fk = 16 and status = 1)
        /(select count(*)
          from cmb_mission
          where memberno_fk = 16)  * 100, 1 ) as missionrate
          from dual;
----------------------------출석률랭킹----------------------------------------------
-- 내가 팔로우 한 사람 뽑기
select *
from cmb_follow
where following = 16;

select followed, nickname
from cmb_follow A , cmb_member B
where following = memberno
and memberno = 16;
    
select * from cmb_attandance
where userno_fk = 14;

select memberno, nickname, pwd, email, studycnt, comments
from cmb_member
where memberno = 16; 

select memberno, nickname, pwd, email, studycnt, comments
from cmb_member
where memberno = 16;

-- 내 팔로워와 출석률 랭킹1
select rank() OVER (PARTITION BY following ORDER BY attandancerate DESC) as rank, nickname, attandancerate
from
(select nickname, following, memberno
from 
(select distinct(following) as following
from cmb_follow) A  join
(select memberno,nickname
from cmb_member
order by memberno) B
on memberno =  following) C Join 
(
select trunc((select count(*)
        from cmb_attandance
        where dday_no_fk = 22
        group by userno_fk
        )/(select to_date(to_char(ddaydate+(9/24),'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(submitdate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd') + 1 as attandanceday
           from cmb_dday
           where datepriority = 1) * 100, 1) as attandancerate
from dual) D
on following = memberno
where memberno = 11;


-- 내 팔로워와 출석률 랭킹2
select DENSE_RANK() OVER (ORDER BY attandancerate DESC) as rank, nickname, attandancerate
from
(select nickname, following, memberno
from 
(select distinct(following) as following
from cmb_follow) A  join
(select memberno,nickname
from cmb_member
order by memberno) B
on memberno =  following
where memberno = 15)C Join 
(
select trunc((select count(*)
        from cmb_attandance
        where userno_fk = 15 and dday_no_fk = 22
        group by userno_fk
        )/(select to_date(to_char(ddaydate+(9/24),'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(submitdate+(9/24), 'yyyy-mm-dd'), 'yyyy-mm-dd') + 1 as attandanceday
           from cmb_dday
           where memberno_fk = 15 and datepriority = 1) * 100, 1) as attandancerate
from dual) D
on following = memberno;


--desc cmb_attandance;
--
--select *
--from user_constraints
--where table_name = 'CMB_ATTANDANCE';
--
--select *
--from user_constraints
--where constraint_name = 'PK_CMB_MEMBER';
--
--select *
--from user_cons_columns
--where table_name = 'CMB_MEMBER';
--
--select *
--from CMB_MEMBER
--order by memberno asc;


/*
     팔로워(멘토)가 있는 사람들의 자신을 포함한 팔로워(멘토)들의 출석율의 랭킹조회하기
    --------------------------------------------------------------------
    
     자신의 정보가 들어있는 테이블명            ==>  cmb_member   1 
     내가 팔로우하는(멘토)의 들어있는 테이블명   ==>  cmb_follow   多
     참조관계 컬럼명                        ==>  cmb_member.memberno
                                         ==>  cmb_follow.following    
                                              
                                               
*/


select *
from cmb_member A join cmb_follow B
on A.memberno = B.following;


select *
from cmb_member A join cmb_follow B
on A.memberno = B.following
where A.memberno = 16;

select A.memberno as "나의회원번호"
     , B.followed as "멘토회원번호"
from cmb_member A join cmb_follow B
on A.memberno = B.following
where A.memberno = 16;

--- 출석율을 알수 있는 테이블명 : cmb_attandance
select *
from cmb_attandance
order by userno_fk;

------------------------------------
   등수    회원명     출석율
------------------------------------
select rank() over(order by attandedno desc) as 등수
     , userno_fk as 회원번호
     , name_fk as 회원명
     , attandedno as 출석회수
from cmb_attandance
where userno_fk in (select B.followed 
                    from cmb_member A join cmb_follow B
                    on A.memberno = B.following
                    where A.memberno = 16
                    union 
                    select 16 
                    from dual);


select rank() over(order by attandedno desc) as 등수
     , userno_fk as 회원번호
     , name_fk as 회원명
     , attandedno as 출석회수
from cmb_attandance
where userno_fk in (select B.followed 
                    from cmb_member A join cmb_follow B
                    on A.memberno = B.following
                    where A.memberno = 16
                    union 
                    select 16 
                    from dual);

select *
from cmb_attandance;

-- 회원번호     종료날짜    시작날짜    소정출석일수
select memberno_fk as 회원번호, ddaydate as 종료날짜, submitdate as 시작날짜
      ,to_date(to_char(ddaydate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(submitdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') + 1 as 소정출석일수
from cmb_dday
where datepriority = 1;

delete from cmb_attandance
where attand_no =8

commit;
                      
-- 뷰 만들기
create or replace view view_cmb_attandance
as
select memberno_fk 
       ,to_date(to_char(ddaydate, 'yyyy-mm-dd'), 'yyyy-mm-dd') - to_date(to_char(submitdate, 'yyyy-mm-dd'), 'yyyy-mm-dd') + 1 as ATTENDANCE
from cmb_dday
where datepriority = 1;

-- 팔로우한 인원과 함께 보는 정보
select *
from view_cmb_attandance
where memberno_fk in (select B.followed 
                                    from cmb_member A join cmb_follow B
                                    on A.memberno = B.following
                                    where A.memberno = 16
                                    union 
                                      select memberno
                                      from cmb_member
                                      where status = 1 and memberno  = 16);

                      
-- dday 현황 중 내가 팔로우 한사람까지 나오게 하는 쿼리문
select A.rank, A.name_fk, ATTANDANCERATE
from 
(
select rownum as rno, A.rank, A.name_fk, nvl( trunc((A.attandedno/B.ATTENDANCE)*100, 1), 0) as ATTANDANCERATE
from                       
    (select rank() over(order by attandedno desc) as RANK
             , userno_fk 
             , name_fk 
             , attandedno 
    from cmb_attandance
    where userno_fk in (select B.followed 
                                    from cmb_member A join cmb_follow B
                                    on A.memberno = B.following
                                    where A.memberno = 16
                                    union 
                                    select memberno
                                    from cmb_member
                                    where status = 1 and memberno  = 16)                      
    ) A left join                     
    ( select memberno_fk, ATTENDANCE
    from view_cmb_attandance
    where memberno_fk in (select B.followed 
                                        from cmb_member A join cmb_follow B
                                        on A.memberno = B.following
                                        where A.memberno = 16
                                        union 
                                        select memberno
                                        from cmb_member
                                        where status = 1 and memberno  = 16)  
    ) B
on A.userno_fk = B.memberno_fk
order by rank
)C
where rno between 1 and 3
order by a.rank;
-----------------------------------------------------------
 -- "미션성공률에대한랭크"  "이름"  "미션성공률"  --
-------------미션 달성률--------------------------------------                                
select *
from cmb_mission  -- memberno_fk
where memberno_fk = 16;

select *
from cmb_mission;

update cmb_mission set status =1
where memberno_fk = 14
commit;

-- 미션등록
insert into cmb_mission(todolist_no , memberno_fk,  contents, missiondate)
values( seq_cmb_dday.nextval,  '14', 'dd', sysdate-1);

select B.memberno, B.nickname, A.status
from cmb_mission A join cmb_member B
on A.memberno_fk = B.memberno;

select V.nickname, (sum(V.status)/count(V.status))*100 as missionrae
from 
(select B.memberno, B.nickname, A.status
 from cmb_mission A join cmb_member B
 on A.memberno_fk = B.memberno
 where B.memberno = 16) V
group by V.nickname 

--------------------------------------------------
select *
from cmb_follow
where following = 16;

select B.memberno, B.nickname, A.status
from cmb_mission A join cmb_member B
on A.memberno_fk = B.memberno
where B.memberno in (select followed
                     from cmb_follow
                     where following = 16);
                  
select V.nickname, (sum(V.status)/count(V.status))*100 as missionrate
from 
(select B.memberno, B.nickname, A.status
 from cmb_mission A join cmb_member B
 on A.memberno_fk = B.memberno
 where B.memberno = 16) V
group by V.nickname                      
union
select V.nickname, (sum(V.status)/count(V.status))*100
from 
(
 select B.memberno, B.nickname, A.status
 from cmb_mission A join cmb_member B
 on A.memberno_fk = B.memberno
 where B.memberno in (select followed
                      from cmb_follow
                      where following = 16) ) V
group by V.nickname;                      

select V.nickname, (sum(V.status)/count(V.status))*100 as missionrate
from 
(select B.memberno, B.nickname, A.status
 from cmb_mission A join cmb_member B
 on A.memberno_fk = B.memberno
 where B.memberno = 16) V
group by V.nickname                      
union
select V.nickname, (sum(V.status)/count(V.status))*100
from 
(
 select B.memberno, B.nickname, A.status
 from cmb_mission A join cmb_member B
 on A.memberno_fk = B.memberno
 where B.memberno in (select followed
                      from cmb_follow
                      where following = 16) ) V
group by V.nickname;                      

-- 미션달성률 현황을 보여주는 쿼리                          
select dense_rank()over(order by T.missionrate desc) as RANK
     , T.nickname as NICKNAME
     , T.missionrate as MISSIONRATE
from 
    (select V.nickname, trunc((sum(V.status)/count(V.status))*100,0) as missionrate
     from 
       (select B.memberno, B.nickname, A.status
        from cmb_mission A join cmb_member B
        on A.memberno_fk = B.memberno
        where B.memberno = '16') V
        group by V.nickname                      
        union
        select V.nickname, trunc((sum(V.status)/count(V.status))*100,0) as missionrate
        from 
        (select B.memberno, B.nickname, A.status
         from cmb_mission A join cmb_member B
         on A.memberno_fk = B.memberno
         where B.memberno in (select followed
                             from cmb_follow
                             where following = '16')) V
     group by V.nickname) T
order by rank;
     
select *     
from cmb_member;     