=================================================����������
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

==================================================���̺����
--ȸ������ 
create table memberpet(
id varchar2(50) primary key, --ȸ�����̵�
pass varchar2(50) not null,
name varchar2(50) not null,  --ȸ���̸�
join_date varchar2(50), --������
birthday number(30),
gender number,
tel varchar2(50),
email varchar2(50),
address varchar2(300),
memlevel varchar2(50),
pet_kind varchar2(50), --�ݷ���������(������, �����, �ݺؾ� ��)
pet_name varchar2(50),
pet_age number(30),
agree number(1), --�������
picture varchar2(200));

--�Խù�����
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

--��������
create table clinic(
c_num number(30) primary key, --�����ڵ�
c_name varchar(50) not null, --������
c_location varchar2(300) not null, --������ġ
c_tel varchar(50) not null, --������ȭ��ȣ
picture varchar2(200), --��������
pet_kind varchar(50), --���ᰡ���� ��������
open_hour varchar2(50), --��ð�
park varchar(50), --�������ɿ���
reserve varchar(50)); --���డ�ɿ���

--��������
create table reserveclinic(
rc_num number(30) primary key, --�����ڵ�
c_num number(30) references clinic(c_num) on delete cascade, --�����ڵ�
c_name varchar2(50) not null, --������
c_tel varchar(50), --������ȭ��ȣ
id varchar2(50) references memberpet(id) on delete cascade, --�����ھ��̵�
name varchar2(50), --�������̸�
date1 date not null, --��������
time1 varchar2(50) not null, --����ð�
pet_kind varchar2(50) not null, --������
pet_name varchar2(50),
pet_age number(30),
problem varchar2(200)); --������������ �����ϰ� �ۼ�

--ȣ�ڰ���
create table hotel(
h_num number(30) primary key, --ȣ���ڵ�
h_name varchar(50) not null, --ȣ�ڸ�
h_location varchar2(300) not null, --ȣ����ġ
h_tel varchar(50) not null, --ȣ����ȭ��ȣ
picture varchar2(200), --ȣ�ڻ���
room_kind varchar(50), --��������
room_num varchar(50), --���ǹ�ȣ
park varchar(50), --�������ɿ���
reserve varchar(50), --���డ�ɿ���
wifi varchar(50), --�������ͳݰ��ɿ���
disability varchar(50), --����� ���ǽü�����
reference_room  varchar(100)); --ȸ�ǽ�/����/��ü�� ���� �� ����

--ȣ�ڿ���
create table reservehotel(
rh_num number(30) primary key, --�����ڵ�
h_num number(30) references hotel(h_num) on delete cascade, --ȣ���ڵ�
h_name varchar2(50) not null, --ȣ�ڸ�
h_tel varchar(50), --ȣ�� ��ȭ��ȣ
room_kind varchar(50), --��������
id varchar2(50) references memberpet(id) on delete cascade, --�����ھ��̵�
name varchar2(50), --�������̸�
num number(3), --�����ο���
s_date date not null, --��������
e_date date not null, --�������
pet_kind varchar2(50) not null, --����������
pet_num  number(30) not null, --�����긶����
content varchar2(200)); --��Ÿ����

--���̽ü�
create table playplace(
p_num number(30) primary key, --���̽ü��ڵ�
p_name varchar2(50) not null, --���̽ü��̸�
p_location varchar2(50) not null, --���̽ü����
p_tel varchar2(50) not null, --���̽ü���ȭ��ȣ
park varchar2(50), --�������ɿ���
p_img1 varchar2(200), --�������1
p_img2 varchar2(200),
p_img3 varchar2(200),
p_img4 varchar2(200),
p_img5 varchar2(200),
p_img6 varchar2(200),
content varchar2(200), --����
open_hour varchar(50), --��ð�
caution varchar(500),  --���ǻ���
playid number 
);

create table goods (
gbsNum number(30) primary key,   --��ǰ��ȣ
gbsName varchar2(100) not null,  -- ��ǰ�̸�
gbsPrice number(30) not null,    -- ��ǰ����
gbsDes varchar(500),        -- ��ǰ����
picture varchar(200)        --��ǰ�̹���
);

//��ٱ��� ���̺� ����
CREATE TABLE cart(
cartid NUMBER PRIMARY KEY,
id varchar2(50) references memberpet(id) on delete cascade,
gbsNum NUMBER references goods(gbsNum) on delete cascade,
gbsname varchar(100), --��ǰ�̸�
gbsPrice number(30),    -- ��ǰ����
cartStock number);


//īƮ ��� ����
insert into cart(cart_id ,id, gbsNum, cartStock) values (1,'admin',1,21);

//��ǰ ���
INSERT INTO goods VALUES(2,'����� ���� ���������
ANF ����� ���','75000','�ʵ����������ϴ»��','meal2.JPG');

INSERT INTO goods VALUES(3,'������� �Ƹ��� ���� �漮','79900','�ʵ����������ϴ¹漮','arrcushion.JPG');

INSERT INTO goods VALUES(4,'��ƼƮ���Ƴ� �Ͽ콺','150000','�ʵ����������ϴ���','house.JPG');

INSERT INTO goods VALUES(5,'������ġ�� - ġ������Ư����ǰ','12000','�ʵ����������ϴ�ġ��','toothpaste.JPG');

INSERT INTO goods VALUES(6,'�ö�� �۰��� ĩ��','6800','�ʵ����������ϴ�ĩ��','toothbrush.JPG');

INSERT INTO goods VALUES(1,'�� ��Ʈ�Ͻ� �κ�','90000','�ʵ����������ϴ�ģ��','petrobot.JPG');

--����
create table review(
rv_num number(30),
id varchar2(30) references memberpet(id) on delete cascade,
rv_desc varchar2(500),
c_num number(30) references clinic(c_num) on delete cascade,
h_num number(30) references hotel(h_num) on delete cascade
);


==============================================���̺� ������
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