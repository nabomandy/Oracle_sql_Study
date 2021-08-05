=================================================시퀀스생성
create sequence memberpetseq start with 1;
create sequence boardpetseq start with 1;
create sequence clinicseq start with 1;
create sequence reserveclinicseq start with 1;
create sequence hotelseq start with 1;
create sequence reservehotelseq start with 1;
create sequence playplaceseq start with 1;
create sequence goodsseq start with 1;
CREATE SEQUENCE cartseq start with 1;
create sequence reviewseq start with 1;

==================================================테이블생성
--회원관리 
create table memberpet(
id varchar2(50) primary key, --회원아이디
pass varchar2(50) not null,
name varchar2(50) not null,  --회원이름
join_date varchar2(50), --가입일
birthday number(30),
gender number,
tel varchar2(50),
email varchar2(50),
address varchar2(300),
memlevel varchar2(50),
pet_kind varchar2(50), --반려동물종류(강아지, 고양이, 금붕어 등)
pet_name varchar2(50),
pet_age number(30),
agree number(1), --약관동의
picture varchar2(200));

--게시물관리
create table boardpet(
b_num number(30) primary key,
id varchar2(50) references memberpet(id) on delete cascade,
pass varchar2(50),
SUBJECT varchar2(300) not null,
CONTENT varchar2(4000) not null,
FILE1 varchar2(300),
like1 varchar2(50),
REGDATE DATE,
READCNT number(30),
REF number(30),
REFLEVEL number(30),
REFSTEP number(30),
boardid varchar2(50));

--병원관리
create table clinic(
c_num number(30) primary key, --병원코드
c_name varchar(50) not null, --병원명
c_location varchar2(300) not null, --병원위치
c_tel varchar(50) not null, --병원전화번호
picture varchar2(200), --병원사진
pet_kind varchar(50), --진료가능한 동물종류
open_hour varchar2(50), --운영시간
park varchar(50), --주차가능여부
reserve varchar(50)); --예약가능여부

--병원예약
create table reserveclinic(
rc_num number(30) primary key, --예약코드
c_num number(30) references clinic(c_num) on delete cascade, --병원코드
c_name varchar2(50) not null, --병원명
c_tel varchar(50), --병원전화번호
id varchar2(50) references memberpet(id) on delete cascade, --예약자아이디
name varchar2(50), --예약자이름
date1 date not null, --예약일자
time1 varchar2(50) not null, --예약시간
pet_kind varchar2(50) not null, --펫종류
pet_name varchar2(50),
pet_age number(30),
problem varchar2(200)); --무슨문제인지 간략하게 작성

--호텔관리
create table hotel(
h_num number(30) primary key, --호텔코드
h_name varchar(50) not null, --호텔명
h_location varchar2(300) not null, --호텔위치
h_tel varchar(50) not null, --호텔전화번호
picture varchar2(200), --호텔사진
room_kind varchar(50), --객실종류
room_num varchar(50), --객실번호
park varchar(50), --주차가능여부
reserve varchar(50), --예약가능여부
wifi varchar(50), --무선인터넷가능여부
disability varchar(50), --장애인 편의시설여부
reference_room  varchar(100)); --회의실/강당/단체석 여부 및 갯수

--호텔예약
create table reservehotel(
rh_num number(30) primary key, --예약코드
h_num number(30) references hotel(h_num) on delete cascade, --호텔코드
h_name varchar2(50) not null, --호텔명
h_tel varchar(50), --호텔 전화번호
room_kind varchar(50), --객실종류
id varchar2(50) references memberpet(id) on delete cascade, --예약자아이디
name varchar2(50), --예약자이름
num number(3), --동반인원수
s_date date not null, --예약일자
e_date date not null, --퇴실일자
pet_kind varchar2(50) not null, --동반펫종류
pet_num  number(30) not null, --동반펫마리수
content varchar2(200)); --기타사항

--놀이시설
create table playplace(
p_num number(30) primary key, --놀이시설코드
p_name varchar2(50) not null, --놀이시설이름
p_location varchar2(50) not null, --놀이시설장소
p_tel varchar2(50) not null, --놀이시설전화번호
park varchar2(50), --주차가능여부
p_img1 varchar2(200), --설명사진1
p_img2 varchar2(200),
p_img3 varchar2(200),
p_img4 varchar2(200),
p_img5 varchar2(200),
p_img6 varchar2(200),
content varchar2(200), --설명
open_hour varchar(50), --운영시간
caution varchar(500),  --유의사항
playid number 
);

create table goods (
gbsNum number(30) primary key,   --상품번호
gbsName varchar2(100) not null,  -- 상품이름
gbsPrice number(30) not null,    -- 상품가격
gbsDes varchar(500),        -- 상품설명
picture varchar(200)        --상품이미지
);

//장바구니 테이블 생성
CREATE TABLE cart(
cartid NUMBER PRIMARY KEY,
id varchar2(50) references memberpet(id) on delete cascade,
gbsNum NUMBER references goods(gbsNum) on delete cascade,
gbsname varchar(100), --상품이름
gbsPrice number(30),    -- 상품가격
cartStock number);


//카트 담기 예제
insert into cart(cart_id ,id, gbsNum, cartStock) values (1,'admin',1,21);

//상품 등록
INSERT INTO goods VALUES(2,'핏펫몰 공식 강아지사료
ANF 유기농 사료','75000','너도나도좋아하는사료','meal2.JPG');

INSERT INTO goods VALUES(3,'사계절용 아르르 꿀잠 방석','79900','너도나도좋아하는방석','arrcushion.JPG');

INSERT INTO goods VALUES(4,'프티트리아농 하우스','150000','너도나도좋아하는집','house.JPG');

INSERT INTO goods VALUES(5,'깨끗해치약 - 치석제거특허제품','12000','너도나도좋아하는치약','toothpaste.JPG');

INSERT INTO goods VALUES(6,'플라고 송곳니 칫솔','6800','너도나도좋아하는칫솔','toothbrush.JPG');

INSERT INTO goods VALUES(1,'펫 피트니스 로봇','90000','너도나도좋아하는친구','petrobot.JPG');

--리뷰
create table review(
rv_num number(30),
id varchar2(30) references memberpet(id) on delete cascade,
rv_desc varchar2(500),
c_num number(30) references clinic(c_num) on delete cascade,
h_num number(30) references hotel(h_num) on delete cascade
);


==============================================테이블 삭제용
drop table review;
drop table reserveclinic;
drop table reservehotel;
drop table clinic;
drop table hotel;
drop table playplace;
drop table boardpet;
drop table cart;
drop table goods;
drop table memberpet;
drop table playplace;