desc emp;
--select * 
--from emp;

select empno, ename, 'Very Good~' from emp;
select name, '������' from PROFESSOR;
select name, position, '�ݰ����ϴ� ' from PROFESSOR;
select ename, '�� �ݰ����ϴ� ' , hiredate from emp;

select name �����̸�, profno ������ȣ 
   from professor;
select name "����  �̸�", profno "�� ��  �� ȣ"  
   from professor;
select name as �����̸�, profno as "������ȣ" 
  from professor;

select empno �����ȣ, ename �����, job ���� from emp;
select deptno �μ�#, dname �μ���, loc �μ���ġ from dept;

select name||position ���� from professor;
SELECT name || ' ���� ' || position || ' �Դϴ�'
FROM professor ;


select name || '-' || position as ���� from professor;
select name || '�� Ű��' || height || 'cm, �����Դ�' || 
           weight || 'kg �Դϴ�.' Ű�͸����� from student;
           
select name||'('||position||'), '||name||''''||position||'''' �������� 
from professor;

select distinct deptno from professor;

select DISTINCT deptno1, deptno2 from student;

����1 : �л��� ����ϴ� ����������ȣ�� ����ϱ�
select distinct profno from student;

���� 2 : ���� ������ ������ ������ ����ϱ�
select distinct position from professor;

select distinct profno from student;
select DISTINCT position from PROFESSOR;

select DISTINCT deptno1 from student;
 select name �̸�, birthday �������, height "Ű(cm)", weight "������(kg)"
 from student;
 desc student;
select ''''||grade||' �г� �л�'||''''|| name from student;
select name,deptno from professor; 
select * from professor;

select ename, sal , deptno from emp where deptno = 10;
select ename,sal from emp where sal > 4000;
select ename, sal from emp;
select ename, sal, sal*1.1 from emp
where sal*1.1 < 1000;
select * from emp;
select 'aaaa' from dual;


select sysdate from dual;
alter session set nls_date_format='yyyy/mon/dd';
alter session set nls_date_format='yyyy-mm-dd';
alter session set nls_language='american';
alter session set nls_language='korean';

select name, pay, hiredate from professor;

select name, pay, hiredate from professor
where hiredate = '1990/06/23';

select name, pay, hiredate from professor
where hiredate = '1990/6��/23';

select name, pay, hiredate from professor
where hiredate = '1990/jun/23';


--2���� ����
select name, height from student
where height >=180;

--between�����ڸ� ����Ͽ� student ���̺��� �����԰� 60-80�� ����� �̸��� ü���� ����ϼ���
select name, weight from student
where WEIGHT BETWEEN 60 and 80;

--and�� �̿��� BETWEEN �����
select name, weight from student
where WEIGHT >= 60 and WEIGHT <=80;

--IN �����ڸ� ����Ͽ� student ���̺��� 101�� �а� �л���
--201�� �а� �л����� ��� ����ϼ���
select name, deptno1 from student
where deptno1 in (101,201);

select name, deptno1 from student
where deptno1 = 101 OR deptno1 = 201;

--Like �����ڸ� ����Ͽ� student ���̺��� ����"��"���� ����� ��ȸ�ϼ���
--%: ���ڼ� ����, ��� ���� ����
--_: ���ڼ� 1��, ��� ���� ����
select name from student
where name like '%��';

select name from student
where name like '��%';

--2��° ���ڰ� '��'�� ���� ã�� ���
select name from student
where name like '_��';

--IS NULL / IS NOT NULL �����ڸ� Ȱ���ϱ�
--NULL�� �������� �ʾƼ� ���� �𸥴ٴ� �ǹ̵��. 0���� �ٸ���.
select name, bonus from professor;


-- ���ƴ� �� ����Ƽ���� �ٽ� �� ��


--student ���̺��� ����Ͽ� 4�г� �߿��� Ű�� 170�̻��� ����� �̸��� �г�� Ű�� ��ȸ�ϼ���.
select name, grade, height
from student
where grade = 4
AND height > 170;

--student ���̺��� ����Ͽ� 1�г� �̰ų� �Ǵ� �����԰� 80 �̻��� �л����� �̸��� Ű�� �г�� �����Ը� ����ϼ���
select name, grade, height, weight
from student
where grade = 1
OR weight > 80;

--student ���̺��� ����Ͽ� 2�г� �߿��� Ű�� 180���� ũ�鼭
--�����԰� 70���� ū �л����� �̸��� �г�� Ű�� �����Ը� ����ϼ���.
--������ �������̰� ��� �����ϴ� ��� AND�� ������ ���� �˴ϴ�. ��/
select name, grade, height, weight
from student
where grade = 2
and height > 180
and weight > 70;

--student ���̺��� ����Ͽ� 2�г� �л� �߿��� Ű�� 180���� ũ�ų� �Ǵ� �����԰� 70����
--ū �л����� �̸��� �г�� Ű�� �����Ը� ����ϼ���.
--and�� or ������ ���ÿ� ���� ��쿡�� �켱������ ���� �����ϼž� �մϴ�. ��\
select name, grade, height, weight
from student
where grade = 2 and (weight > 70 or height >180);
--��ȣ�� ����� ��


--professor ���̺��� �������� �̸��� ��ȸ�Ͽ� �� �κп� '0'�� ���Ե� �����
--����� �Ʒ��� ���� ����ϼ���
select name from professor
where name >='��' and name <'��'
order by 1;

--student ���̺� ����Ͽ� 1�г� �л��� �̸��� Ű �����ϼ���. ���� ������ ����/
select name, grade, height, weight
from student
where grade = 1
order by ?;

-- student ���̺��� ����Ͽ� 1�г� �л��� �̸��� Ű�� �����Ը� ����ϼ���
--�� Ű�� ���� ������� ����Ͻð� �����Դ� ���� ������� ����ϼ���
select name, height, weight
from student
where grade = 1
order by height ASC, weight DESC;

--student ���̺��� ����Ͽ� 1�г� �л��� �̸��� ���ϰ� Ű�� �����Ը� ����ϼ���
--�� ������ ���� ��� ������� �����ϼ���
select name, birthday, height, weight
from student
where grade = 1
order by  birthday;
--order by 2; �� �ص� ��. 2-> select �ι�° �� birthday�� �ǹ���.


--Į���� ������ ����� ����. �˸��ƽ� ���?
--student ���̺��� ����Ͽ� 1�г� �л��� �̸��� Ű�� ����ϼ���.
--�� �̸��� ������������ �����ϼ���
select name "�̸�", height "Ű"
from student
where grade = 1
order by �̸�;

--union ������ ������ ���� Ÿ���� ���ƾ� ��.-> �÷��� ������ Ÿ���� ���ƾ� �Ѵٴ� ��
--union/union all -> �� ������ ���մϴ�.
--student ���̺�� professor ���̺��� �����Ͽ� 101�� �а��� �ҼӵǾ� �ִ� �л���
--�������� �й�(�������� ������ȣ), �̸�, �а���ȣ�� ����ϼ���.
select studno, name, deptno1
from student
where deptno1 = 101
union
select profno, name, deptno
from professor
where deptno = 101;

select studno, name, deptno1
from student
where deptno1 = 101
union all
select profno, name, deptno
from professor
where deptno = 101;

--student ���̺��� ������ 101�� �а� �л��� �������� 201�� �а��� �����ϴ� �л�����
--�̸��� ����ϼ�����
--������/�ߺ��� ���� �� ���
select name
from student
union
select name
from student
where deptno2 = 201;

--���� ����/�ߺ��� ��� ���
select name
from student
where deptno1 = 101
union all
select name
from student
where deptno2 = 201

--INTERSECT ������ ����ϱ� -> ������ ã��
--student���̺��� ����Ͽ� ������ 101�� �а��� �������� 201�� �а��� ���������ϴ�
--����� �̸��� ����ϼ���.
select name from student where deptno1 = 101
intersect
select name from student where deptno2 = 201;

--MINUS������ ����ϱ� -> ū���տ��� ���� ���� ����
--professor ���̺��� ��ü ������ �޿��� 20%�λ��ϱ� ���� ���� ����� ����Ϸ� �մϴ�.
--�� ������ ���Ӱ����� ������� ��ܿ��� �����ϼ���.
select name, position from professor
minus
select name, position from professor
where position = '���Ӱ���';

--Į���� ������ �ٸ� ��� ���� �߻���
--ù��° select���� 2���� Į���ε� �ι�° select ���� 1���� Į��.-> Į���� ������ �޶�
--�����߻�.��
select studno, name
from student
union
select profno
from professor;
select studno, nama

--�񱳵Ǵ� Į�������� ������ Ÿ���� �ٸ� ��� ����
--ù��° select �� �ι�° select�� ������ Ÿ���� ���� �ٸ� ��� ������ �߻��Ѵ�. ��
select studno, name
from student
union
select name, profno
from proffesor;

--INITCAP�Լ�
--ù���ڸ� �빮�ڷ� ����ϰ� �������� ���� �ҹ��ڷ� ����ϴ� �Լ�
--���� : INITCAP(���ڿ� �Ǵ� �÷���)
--emp���̺��� ����Ͽ� �μ��� 10���� ����� �̸��� ù���ڸ� �빮�ڷ� ����ϼ���
select initcap(ename) from emp
where deptno = 10;

--lower�Լ�: �ԷµǴ� ���� ���� �ҹ��ڷ� �����Ͽ� ����մϴ�.
--����: LOWER(���ڿ� �Ǵ� �÷���)
select lower('Pretty girl')from dual;

--upper�Լ�: �ԷµǴ� ���� ���� �빮�ڷ� �����Ͽ� ����մϴ�.
--����: UPPER(���ڿ� �Ǵ� �÷���)
select upper('Pretty girl')from dual;

--LENGTH/LENGTHB �Լ�: �Էµ� ���ڿ��� ���̸� (����Ʈ ����)������ִ� �Լ��Դϴ�.
--����: LENGTH(�÷� �Ǵ� ���ڿ�) /LENGTHB(�÷� �Ǵ� ���ڿ�)
--student ���̺��� id�� 9���� �ʰ��� �л����� �̸��� id�� ���ڼ��� ����ϼ���.
select name �̸�, id, length(id) ���ڼ�
from student
where length(id) > 9;

--student ���̺��� 1������ 201���� �л����� �̸��� �̸��� ���ڼ�, �̸��� ����Ʈ ���� ����ϼ���
--express ���������� �ѱ��� 3����Ʈ �̴�. old ���������� 2����Ʈ ����� ��.
select name, length(id), length(b)
from student;
--//Ʋ��

--CONCAT�Լ�(||�����ڿ� ������ ����̴�.)
--���� : CONCAT('���ڿ�1','���ڿ�2')
--professor ���̺��� ������ 101�� �������� �̸��� ������ ����ϼ���
select concat(name,position) from professor 
where deptno = 101;

--���� table���� name,position �ȳ��ϼ��� ��� ����Ʈ �ϼ���
--concat���� pipeline�� ���ϴ�
select concat(name,concat(position,'�ȳ��ϼ���'))
from professor;

--substr �Լ�
--���ڿ����� Ư�������� ���ڸ� ������ �� ����ϴ� �Լ�
--����: substr('���ڿ�' �Ǵ� Į����, 1,4)
select substr('ABCDE',2,3)
from dual;

select substr('ABCDE',-2,3)
from dual;

--student���̺��� jumin �÷��� ����ؼ� ������ 101���� �л����� �̸��� ��������� ����ϼ���
select name, substr(jumin,1,6) ������� 
from student
where deptno1 = 101;

--Student ���̺��� jumin �÷��� ����ؼ� �¾ ���� 8���� ����� �̸��� ��������� ����ϼ���
select name, substr(jumin,1,6) �������
from student
where substr(jumin,3,2)='08';


--SUBSTRAB �Լ�
--�� �ϼ��� SUBSTR �Լ��� ������ �����ϸ� �������� ������ �ڸ����� �ƴ϶� 
--������ ����Ʈ ���� ������

--INSTR �Լ�
--�־��� ���ڿ��̳� Į������ Ư�� ������ ��ġ�� ã���ִ� �Լ�
--���� : INSTR('���ڿ�'�Ǵ� �÷�, ã�� ����, ������ġ, ���°����(�⺻���� 1))
select instr('A*B*C*','*',1,2)
from dual;

select instr('A*B*C*','*',3,2)
from dual;

--������ġ�� -(���̳ʽ�)�� �� ���
select instr('A*B*C*','*',-4,1)
from dual;

select instr('A*B*C*','*',-4,2)
from dual;

select INSTR('A*B*C*','*',-2,2)
from dual;

--�����Լ� ����1)
--student ���̺��� �����ؼ� �Ʒ� ȭ��� ���� ������(deptno1 �÷�) 101���� �л��� �̸���
--��ȭ��ȣ�� ������ȣ�� ����ϼ���. �� ������ȣ�� ���ڸ� ���;� �մϴ�.
select name, tel, substr(tel, 1, instr(tel, ')')-1)������? 
from student
where deptno1 = 101;

--
--���� : LPAD('���ڿ�'�Ǵ� �÷���, �ڸ���, ������ ����?)
SELECT LPAD(name, 10,'*') 
from student;

select rpad(name, 10, '*') 
from student;


--LPAD, RPAD �Լ��� ä��� �Լ��̰�, LTRIM RTRIM �Լ��� �����ϴ� �Լ��̴�.
--����: LTRIM('���ڿ�' �Ǵ� �÷���, '������ ����')
--LTRIM('���ڿ�' �Ǵ� �÷���, '������ ����')
--

--RTRIM�Լ�
--����:RTRIM('���ڿ�' �Ǵ� �÷���, '������ ����')
--Dept2 ���̺��� dname�� ����ϵ� ������ ���� '��'��� ���ڴ� �����ϰ� ����ϼ���
select RTRIM(dname, '��')
from dept2;



--replace �Լ�
--����: replace('���ڿ�' �Ǵ� �÷���, '����1', '����2')
-- �л����� �̸��� ����ϵ� �� �κ��� '#'���� ǥ�õǰ� ���
select replace(name, substr(name,1,1),'#') 
from student
where deptno1 = 101;

--student ���̺��� ����(deptno1)�� 101���� �л����� �̸��� ����ϵ�
-- ��� ���ڸ� '#'���� ǥ�õǰ� ����ϼ���
select replace(name, substr(name,2,1),'#') replace
from student
where deptno1 = 101;


--student ����(deptno1)�� 101���� �л����� �̸��� �ֹι�ȣ�� ����ϵ�
--�ֹι�ȣ�� �� 7�ڸ��� '*'�� ǥ�õǰ� ���
select name, replace(jumin, substr(jumin,7,7),'******')jumin
--jumin(repalce(jumin, substr(jumin 7, 12, '*')))
from student
where deptno1 = 101;


--student ���̺��� ������ 101���� �л����� �̸��� ��ȭ��ȣ,
--��ȭ��ȣ���� �����κи� '*'ó���Ͽ� ����ϼ���/
select name replace(tel, substr(tel,3,3), '***')tel
from student
where deptno1 = 101;

select name, substr(tel, 1, instr(tel, ')'))||'***'
||substr(tel, instr(tel,'-')) tel
from student
where deptno1 = 101;

--ROUND�Լ� -> �ڸ� ���� ������ ��
--����: round(����, ���ϴ� �ڸ���)
select round(12.345),
round(12.345,2),
round(12.345,-1) 
from dual;

--TRUNC �Լ�
--����:TRUNC(����, ���ϴ� �ڸ���)
select trunc(12.345),
trunc(12.345,2),
trunc(12.345,-1)
from dual;

--MOD, CEIL, FLOOR �Լ�
select mod(12,10),
ceil(12.345),
floor(12.345)
from dual;

--POWER�Լ�
--����:POWER(����1, ����2)
select power(3,2)
from dual;

select sysdate from dual;
--alter session set NLS_DATE_FORMAT='YYYY-MM-DD:HH24:M1:SS';
select sysdate from dual;

--MONTHS_BETWEEN �Լ�(�� ��¥ ������ ���� �� ���)
select months_between('2021-02-05', '1991-01-13')
from dual;
--2���� �ϼ��� �޶� ��ȯ ���� �����ϴ�.


--MONTH_BETWEEN�� �������� ����� ���� -> ������ ����ٴ� �ǹ�?
select name, sysdate,hiredate,
round(Months_between(sysdate,hiredate),2)date_1,
round(((sysdate-hiredate)/31),2)date2
from professor
where deptno = 101;

--ADD_MONTHS
select sysdate, add_months(sysdate, 3)
from dual;

--NEXT_DAY
select '20/02/05',next_day('20/02/05', '������')
from dual;
select sysdate,next_day(sysdate,'������')
from dual;
select sysdate,next_day(sysdate,'��')
from dual;

--LAST_DAY
select sysdate, last_day(sysdate)
from dual;
select last_day('2020-02-05')
from dual;

--��¥�� round, trunc �Լ�
select sysdate, round(sysdate),trunc(sysdate)
from dual;
select round(sysdate,'year'),round(sysdate,'month')
from dual;

--�� ��ȯ �Լ�
--������(�ڵ�)�� ��ȯ
select 1+ '1'
from dual;


select 1 + to_number('1') from dual;


--����
select 1+ 'A' 
from dual;
select 1 + 'A' from dual;

--
--TO_CHAR�Լ�(��¥�� ���ڷ� ����ȯ�ϱ�
--


select to_char(sysdate, 'yyyy') "yyyy",
to_char(sysdate, 'RRRR'),
to_char(sysdate, 'yy'),
to_char(sysdate, 'year')
from dual;

select
TO_CHAR(sysdate,'yyyy.mm.dd')d_yyyymmdd,
TO_CHAR(sysdate,'y','nls_date_language=korean')d_y,
TO_CHAR(sysdate,'year','nls_date_language=korean')d_year,
TO_CHAR(sysdate,'year','nls_date_language=korean')d_year_1,
TO_CHAR(sysdate,'mon')d_mon,
TO_CHAR(sysdate,'mon')d_mon_1,
TO_CHAR(sysdate,'month')d_month,
TO_CHAR(sysdate,'month')d_month_1,
TO_CHAR(sysdate,'d')d_d,
TO_CHAR(sysdate,'dd')d_dd,
TO_CHAR(sysdate,'ddd')d_ddd,
TO_CHAR(sysdate,'day')d_day,
TO_CHAR(sysdate,'day')d_day_1,
TO_CHAR(sysdate,'dy','nls_date_language=korean')d_dy,
TO_CHAR(sysdate,'dy')d_dy_1
from dual;


--�Խ��� ����
--(1)
select empno, ename, sal
from emp
where deptno =10;

--(2)
select ename, hiredate, deptno
from emp
where empno = 7369;

--(3)
SELECT EMPNO AS �����ȣ, ENAME AS �̸�, JOB AS ����,
MGR AS �Ŵ���,HIREDATE AS �Ի���,SAL AS �޿�,
COMM AS Ŀ�̼�,DEPTNO AS �μ���ȣ 
FROM EMP
WHERE ENAME = 'ALLEN';

select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp
where ename = 'ALLEN';

--(4)
select ename, deptno, sal
from emp
where hiredate = '91/05/01';

--(5)

SELECT 
EMPNO AS �����ȣ, ENAME AS �̸�, JOB AS ����, MGR AS �Ŵ���,
HIREDATE AS �Ի���, SAL AS �޿�, COMM AS Ŀ�̼�, DEPTNO AS �μ���ȣ
FROM EMP
WHERE JOB <> 'MANAGER';

select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp
where job <> 'MANAGER';

--(6)
SELECT 
EMPNO AS �����ȣ, ENAME AS �̸�, JOB AS ����, MGR AS �Ŵ���,
HIREDATE AS �Ի���, SAL AS �޿�, COMM AS Ŀ�̼�, DEPTNO AS �μ���ȣ
FROM EMP
WHERE HIREDATE > '81/04/02';

select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp
where hiredate > '81/04/02';


--(7)
select ename, sal, deptno
from emp
where sal >= 800;

--(8)
SELECT 
EMPNO AS �����ȣ, ENAME AS �̸�, JOB AS ����, MGR AS �Ŵ���,
HIREDATE AS �Ի���, SAL AS �޿�, COMM AS Ŀ�̼�, DEPTNO AS �μ���ȣ
FROM EMP
WHERE DEPTNO = 20;

select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp
where deptno >= 20;

--(9)
SELECT 
EMPNO AS �����ȣ, ENAME AS �̸�, JOB AS ����, MGR AS �Ŵ���,
HIREDATE AS �Ի���, SAL AS �޿�, COMM AS Ŀ�̼�, DEPTNO AS �μ���ȣ
FROM EMP
WHERE ENAME > CHR(ASCII('K')+1);
--WHERE UPPER(ENAME) > CHR(ASCII('K')+1);

--
select ename
from emp
where ename >= 'L';
--

--(10)
select empno, ename
from emp
where empno <= 7698;

--(11)
select ename, sal, deptno
from emp
where hiredate > '1991/04/02' and hiredate < '1992/12/09';

--(12)
select ename, job, sal
from emp
where sal > 1600 and sal < 3000;

--(13)
select empno, ename
from emp
where empno > 7654 and empno < 7782;

--(14)
select ename
from emp
where ename between 'B' and 'J';

--(15)
select hiredate, ename
from emp
where substr(hiredate, 1, 2) <> 91;

--(16)  
select ename, job
from emp
where job = 'MANAGER' or job = 'SALESMAN';

--(17)
select empno, ename, hiredate, deptno
from emp
where deptno <> 20 and deptno <>30;

--(18)
select empno, ename, hiredate, deptno
from emp
where ename >= 'S' and ename < 'T';

--(19)
select hiredate, ename
from emp
where substr(hiredate,1,2)= '91';

--(20)
select ename, sal, comm,
sal+comm as �Ѿ�
from emp
where comm is not null order by(sal+comm)desc;

--(21)
select ename, sal,
(sal*1.13) as bonus
from emp
where deptno = 10;

--(22)
select ename, deptno, sal,
(sal*12)as ����,
(sal*1.5)as ���ʽ�
from emp
where deptno = 30;

--(23)
select ename, sal,
round(((sal/12)/5),1) as "�ð��� �ӱ�", deptno
from emp
where deptno = 20;

--(24)
select ename, sal,
trunc(sal*0.15) as ȸ��, deptno 
from emp
where sal between 1500 and 3000;

--(25)
select ename, sal,
trunc(sal*0.15) as ������, deptno
from emp
where sal >= 2000;

--(26)
select ename, sal,
trunc(sal*0.9) as �Ǽ��ɾ�, deptno
from emp
order by sal desc;



--
--MM : ���� ���� 2�ڸ��� ǥ���մϴ�.
--MON : ���� ���ϴ� ���� 3���ڷ� ǥ���մϴ�.
--MONTH : ���� ���ϴ� ���� �̸� ��ü�� ǥ���մϴ�.
select to_char(sysdate, 'MM') MM,
to_char(sysdate, 'MONTH') MONTH,
to_char(sysdate, 'MON') mon from dual;

select to_char(sysdate, 'mon', 'nls_date_language = japanese') 
as japan from dual;

--dd : ���� ���� 2�ڸ��� ǥ���մϴ�.
select to_char(sysdate, 'dd') dd,
to_char(sysdate, 'day') day,
to_char(sysdate, 'ddth') ddth from dual;

--�ð� : HH24 - �Ϸ縦 24�ð����� ǥ���մϴ�.
--hh : �Ϸ縦 12�ð����� ǥ���մϴ�.
--�� : mi�� ǥ���մϴ�.
--�� : ss�� ǥ���մϴ�.
select sysdate, 
to_char(sysdate, 'yyyy-mm-dd:hh24:mi:ss')
from dual;

--student ���̺��� birthday Į���� �����Ͽ� ������ 3���� �л��� �̸��� birthday�� ����ϼ���.
select name, to_char(birthday, 'dd-mon-yy')
from student
where to_char(birthday, 'mm')='03';

--����Ŭ������ ��¥�� ǥ�����̳� �⺻ ������ ������ �߿��ϴ�.
--2��������� �ִµ�
--������ü�� �ٲ㼭 �ϴ� ���(alter session ���� ��), to_char to_date ���� �ɷ� ������ ����ǰ� �ϴ� ���

--professor ���̺��� �����Ͽ� 101�� �а� �������� �̸��� ������ ����ϼ���.
--�� ������ (pay*12)+bonus�� ����Ͻð� õ ���� ���б�ȣ�� ǥ���ϼ���.
select name, to_char((pay*12)+bonus, '99,999') ����
from professor where deptno = 101;

--���� type�� ���� type���� ����
select '1' + 1 from dual; 
--�����Ŵ� ����Ÿ���̱� ������ ���ڰ� �������� ����Ŭ�� �������༭ ������ �� ������ �ȵ�
select '23,444'+1 from dual; 
---> ,�� �־ ����Ÿ������ �ν�? �׷��� �����Ŵ� ����
select to_number('23,444','999,999')+1
from dual;

--TO_DATE �Լ�, date���� �ٷ� number�� ���� �� ����.
--to date, to number�� ĳ���Ϳ��� date, number�� ���ٴ� ��
select to_date('2021/01/13','yyyy:mm:dd')+1 from dual;

--���ڸ� ��¥type���� ����
select to_date('2021/3��/01', 'yyyy:mon:dd') from dual;
select to_date('2121/03/01', 'yyyy:mm:dd') from dual;
select to_date('2121/3��/01', 'yyyy:mm:dd') from dual;
select to_date('21210301', 'uuuu:mm:dd') from dual;
select to_date('210301', 'yyyy:mm:dd') from dual;
select to_date('210301', 'yyyy:mm:dd') from dual;
select to_date('20210301', 'yyyy:mm:dd') from dual;

--�ڷ� �Է� �׽�Ʈ to_date�� ���� ����
create table sss(ddd date);
insert into sss values (to_date('2121.01.13', 'yyyy/mm/dd'));
insert into sss values ('2021.12.25');
insert into sss values ('2021.3��.01'); -> ����
insert into sss values (to_date('2021.3��.01', 'yyyy/mon/dd'));
select*from sss;

--����ȯ �Լ� ����2
--professor ���̺��� ����Ͽ� 2000�� ������ �Ի��� ������� �Ի���,
--���翬���� 10% �λ� �� ������ ����ϼ���. ������ �󿩱�(bonus)�� 
--������ (pay*12)�� ����ϰ� ������ �λ� �� ������ õ ���� ���� ��ȣ��
--�߰��Ͽ� ����ϼ���.
select name, to_char(hiredate, 'yyyy-mm-dd') as �Ի���, to_char((pay*12)+bonus, '99,999') ����,
to_char((pay*12)*1.1, '99,999') �λ���
from professor where hiredate < '20000101';

--�������Ͽ��� �̹����� �Ի����� ���� ���� ���
--������ �̸�, �Ի���, �޿��� 10%�߰��Ͽ� ����Ʈ�Ѵ�.
select name, hiredate �Ի���, pay ����, pay*1.1 Ư���޿�
from professor 
where to_char(hiredate, 'mm')=to_char(sysdate, 'mm');

--professor ���̺��� 101�� �а� �������� �̸��� �޿�, bonus ������
--����ϼ���. �� ������(pay*12+bonus)�� ����ϰ� bonus�� ���� ������
--0���� ����ϼ��� �� �� �̻��ؼ� �ٽ� �غ��� ����. ������ �亯�� ���ʽ� null�� ����. �װ� �´°ǰ�?
select name, pay, bonus, pay*12 + nvl(bonus,0) ����
from professor where deptno =101;
select name, pay, bonus, nvl(pay*12+bonus, pay*12) as ����
from professor where deptno =101;

--�Ϲ��Լ� ���� : NVL2(COL1, A, B)(�÷�, not null, null)
--professor ���̺��� ������ �̸��� pay, bonus, ������ ����ϼ���
--�� ������ (pay*12+bonus)�� ����ϰ� ���� bonus�� ������ �޿��� pay*12
--�� ó���ϼ���
select name, pay, bonus, 
nvl2(bonus, pay*12 + bonus, pay*12) ���� 
from professor;

--professor ���̺��� ������ �̸��� pay, bonus, ������ ����ϼ���
--�� ������ (pay*12+bonus)�� ����ϰ� ���� bonus�� ������ �޿��� '����'����
--ó���ϼ���
--�� �÷��� ���ڿ� ���ڸ� ȥ���ؼ� ���� �� ���� ������, ĳ���ͷ� �ٲٴ� ��(to_char) ����Ѵ�.
select name, pay, bonus, 
NVL2(bonus, to_char(pay*12+bonus, '99999'), '  ����') as ����
from professor;

--decode

select name, deptno, decode(deptno, 101, '��ǻ�Ͱ���') �а���
from professor;
--professor ���̺��� ������� �޿��� ����Ʈ�ϴµ� 500������, 400������,
--300������� �з��Ͽ� ����Ʈ �ϼ���.
select name,
decode(trunc(pay, -2), 500, pay) "500������",
decode(trunc(pay, -2), 400, pay) "400������",
decode(trunc(pay, -2), 300, pay) "300������",
decode(trunc(pay, -2), 200, pay) "200������",
pay from professor
order by pay desc;

--professor ���̺��� ������� �а���ȣ, �а����� ����ϵ�
--deptno�� 101���� ������ ��ǻ�� ���а��� ����ϰ� 101���� �ƴ� ��������
--�а��� "��Ÿ�а�"�� ����ϼ���
select name, deptno,
decode(deptno, 101, '��ǻ�Ͱ���', '��Ÿ�а�') �а���
from professor;

--professor ���̺��� ������ �̸��� �а����� ����ϵ� �а���ȣ��
--101���̸� '��ǻ�� ���а�', 102���̸� '��Ƽ�̵�� ���а�', ��������
--'��Ÿ�а�'�� ����ϼ���
select name, deptno,
decode(deptno, 101, '��ǻ�Ͱ��а�', 102, '��Ƽ�̵����а�', '��Ÿ�а�')
from professor;

--professor ���̺��� ������ �̸��� �μ���ȣ�� ����ϰ� 101���а� �߿��� �̸���
--���� �������� ���±��� �ĺ���� ����ϼ���. �������� null ���� ����մϴ�.
--select name, deptno,
--decode(deptno, 101, decode(name,����,'���±����ĺ�'))
--from professor;

--student���̺��� ����Ͽ� ��1����(deptno1)�� 101���� �а� �л����� �̸���
--�ֹι�ȣ, ������ ����ϵ� ������ �ֹι�ȣ(jumin(Į���� �̿��Ͽ� 7��° ���ڰ� 1�ϰ��
--"����", 2�ϰ�� "����"�� ����ϼ���.
select name, jumin, decode(substr(jumin, 7, 1), 1, '����', '����')
from student where deptno1 = 101;

--student ���̺��� 1������(deptno1) 101���� �л��� �̸��� ��ȭ��ȣ��
--�������� ����ϼ���. ������ȣ�� 02�� ����, 031�� ���, 051�� �λ�,
--052�� ���, 055�� �泲���� ����ϼ���.
select name, tel,
decode(substr(tel, 0,instr(tel,')')-1), '055', '�泲',
'02', '����', '031', '���', '051', '�λ�') "����"
from student where deptno1= 101;


--CASE �� DECODE���� ���� ����. CASE�� �񱳵� �����ϴ�. ��Ŀ�庸�� �������� ����

--�л��� �̸��� ��ȭ��ȣ, �������� ����ϼ���
--�� ������ȣ�� 02�� ���� 031�̸� ��� 051�̸� �λ� �������� ��Ÿ�� ǥ���ϼ���
select name, tel,
case(substr(tel,1,instr(tel,')')-1))
-- sub���������� �� �÷��� �ش��ϴ� �κ�
when '02' then '����'
when '031' then '���'
when '051' then '�λ�'
else '��Ÿ'
end ������
from student;

--����2 : �������� '='�� �ƴ� ���
student ���̺��� jumin �÷��� �����Ͽ� �л����� �̸��� �¾ ��,
�׸��� �б⸦ ����ϼ���. �¾ ���� 01-03���� 1/4�б� ...
select name, substr(jumin,3,2) "�����",
case
when(substr(jumin,3,2)) between '01' and '03' then '1/4'
when(substr(jumin,3,2)) between '04' and '06' then '2/4'
when(substr(jumin,3,2)) between '07' and '09' then '3/4'
when(substr(jumin,3,2)) between '10' and '12' then '4/4'
else '���¾' end "�б⺰" from student;

--case ��������
--�������̺�(professor)�� ��ȸ�Ͽ� ������ �޿��׼��� �������� 200�̸��� 4��
--201-300������ 3��, 301-400������ 2�� 401�̻��� 1������ ǥ���Ͽ� ������
--��ȣ, �̸�, �޿�, ����� ����ϼ���(�� ����÷��� ������������)
select profno, name, pay,
case
when pay<=200 then '4��'
when pay between 201 and 300 then '3��'
when pay between 301 and 400 then '2��'
when pay>401 then '1��' end "���"
from professor order by pay desc;

--case ��������
--�л��� �б⺰ ������ ��Ȳ�� �Ʒ��� ���� ����Ʈ�ϼ���.
select birthday,
nvl(case when(substr(jumin,3,2)) between '01' and '03' then name end, '-') "1/4",
nvl(case when(substr(jumin,3,2)) between '04' and '06' then name end, '-') "2/4",
nvl(case when(substr(jumin,3,2)) between '07' and '09' then name end, '-') "3/4",
nvl(case when(substr(jumin,3,2)) between '10' and '12' then name end, '-') "4/4"
from student;

--case ��������
--������ �Ի� �⵵�� ����Ʈ�� �ϼ���
--�� �Ի��� ������ ����Ʈ�ϰ� null�϶��� '-'�� ����Ʈ �ϼ���
select name, 
nvl(case when (substr(to_char(hiredate, 'yyyy'), 1,3) = '199') then to_char(hiredate, 'yyyy/mm/dd') end, '-') "1990��",
nvl(case when (substr(to_char(hiredate, 'yyyy'), 1,3) = '200') then to_char(hiredate, 'yyyy/mm/dd') end, '-') "2000��",
nvl(case when (substr(to_char(hiredate, 'yyyy'), 1,3) = '201') then to_char(hiredate, 'yyyy/mm/dd') end, '-') "2010��"
from professor
order by hiredate;

--����Ŭ�� null�� �� �����Ѵ�.


--count�Լ�
--count(*)�� ����� null ���� ������ ���
--count(bonus)�� ����� null ���� ������ ���
select count(*) �ѰǼ�, count(bonus) ���ʽ� from professor;

--������ �Լ������� NULL ��ü�� ����

--SUM�Լ� : �Էµ� �����͵��� �հ� ���� ���ϴ� �Լ�
select name, bonus from professor;
select count(bonus), sum(bonus) from professor;

--AVG�Լ� : �Էµ� ������ ��հ��� �����ִ� �Լ��Դϴ�.
select count(bonus), sum(bonus), avg(bonus) from professor;
--null�� �ڵ�����, Ʋ�����
select count(bonus), sum(bonus) �հ�, avg(nvl(bonus,0)) ���
from professor;
--null���� 0���� ��ȭ. �ٸ����

--MAX�Լ� MIN�Լ� : �ִ�, �ּڰ� ���ϴ� �Լ�.
--�ӵ��� ���ɺκп��� ������ �� �� �����Ƿ� �ε����� Ȱ���ϴ� ����� ����� ���� ���� ������(����?)
--�ֱٿ��� �ϵ���� ���� �κ��� ���� ������ �׷��Ա��� �Ű� �Ⱦ��ٰ� ��.?
select max(sal), min(sal) from emp;
select max(hiredate), min(hiredate) from emp;

--STDDEV �Լ�  VARIANCE �Լ� :
--STDDEV �Լ��� ǥ�������� ���ϴ� �Լ� 
--VARIANCE �Լ��� �л��� ���ϴ� �Լ�
select stddev(pay), variance(pay) from professor;
select round(stddev(pay),4), round(variance(pay),4) from professor;


--Group By �� ����ϱ�
--Professor ���̺��� �а����� �������� ��� ���ʽ��� ����ϼ���.
select deptno, round(avg(nvl(bonus,0)),2) as ��պ��ʽ�
from professor
group by deptno
order by deptno;

--professor ���̺��� �а���, ���޺��� �������� ��� ���ʽ��� ����ϼ���
select deptno, position,
avg(nvl(bonus,0)) ��պ��ʽ�
from professor
group by deptno, position;


--4����
--���� ���̺��� ���޺�(position) ����(pay*12)�� ����� ���ϰ�
--���������� ����Ʈ�ϼ���. ����� ������ �ݿø��մϴ�.
-- ,�� ������� to_char�� ��
-- group by position ������ ������. ����?
select position, to_char(avg(pay*12),'999,999') ����
from professor
group by position
order by ���� desc;

--emp���̺��� �Ի�⵵�� ���� �޿������ ���ϼ���
--����� ������ �ݿø� �մϴ�
--�����Ϳ��� �Ϻθ� �������� to_char�� �ٲ���Ѵ�.
select to_char(hiredate, 'yyyy') as year, round(avg(sal)) as �޿����
from emp
group by to_char(hiredate, 'yyyy');

--group by ���� Ȯ��
select deptno, position, avg(nvl(bonus,0)) ��պ��ʽ� 
from professor
group by deptno;
select deptno, position, avg(nvl(bonus,0)) ��պ��ʽ�
from professor;

--���� ���ǻ���
--group by ���� ���� Į���� select ���� ������ �ʾƵ� �˴ϴ�.
select deptno, avg(nvl(bonus,0))��պ��ʽ�
from professor
group by deptno, position;

--group by ������ �ݵ�� Į������ ���Ǿ�� �ϸ� Į�� alias�� ����ϸ� �ȵȴ�.
select deptno dno, avg(nvl(bonus,0)) ��ձ޿�
from professor 
group by dno;

--professor table���� �μ��� �޿� ����� ���ϼ���. �� pay�� null�϶��� ������ �����ϰ�
--������ �ݿø� �ϼ���
select deptno �μ�, round(avg(nvl(pay,0))) �޿����
from professor
group by deptno;

--�а��� ������ �ο�, �޿� ���, �ְ�޿�, �����޿��� ���ϼ���.
select deptno, count(id) COUNT, round(avg(pay)) avg, max(pay) max, min(pay) min
from professor
group by deptno;

--�������Լ��� �̿��� group by
--�л��� ���� ������ �ο����� ���ϼ��� �� 1������ 12�� ������ �����ϼ���
select substr(jumin, 3,2) ���Ͽ� , count(*) �ο���
from student
group by substr(jumin, 3,2)
order by 1;
select to_char(birthday, 'mm') ���Ͽ�, count(*) �ο���
from student
group by to_char(birthday, 'mm')
order by 1;

--������ �޿��� 100������� �з� �� �з��� �ο����� ���ϼ���
--�� �з��� �ݾ׺� ���������� �ϼ���
select trunc(pay, -2)||'������' �з�, count(*) �ο�
from professor
group by trunc(pay, -2)
order by 1 desc;

--������ �̸��� ����Ʈ �� �ο����� ���ϼ���
--�� ����Ʈ�� �̸��� ������������ ����Ʈ �ϼ���
select substr(email, instr(email, '@')+1) ����Ʈ,
count(*) �ο��� from professor
group by substr(email, instr(email, '@') +1)
order by 1;

--������ �Ի�⵵�� �ο�, �ְ�޿�, �����޿�, ����� ���ϼ���.
--�� ����� �Ҽ��� 2�ڸ��� �Ʒ��� ���� ����Ʈ �ϼ���
select to_char(hiredate, 'yyyy') year,
count(pay) �ο�, max(pay) �ְ�ݾ�,
min(pay) �����ݾ�,
to_char(round(avg(pay),2), '999.99') ���
from professor
group by to_char(hiredate, 'yyyy')
order by 1;

--Having�� ����ϱ�
--��� �޿��� 350�̻��� �μ��� �μ���ȣ�� ��ձ޿��� ���ϼ���
select deptno, avg(nvl(pay,0)) 
from professor
where avg(pay) >=350
group by deptno;
select deptno, avg(nvl(pay,0)) ���
from professor
group by deptno
having avg(nvl(pay,0)) >=350;

--�а��� ������ �ο�, �޿� ���, �ְ�޿�, �����޿��� ���Ͻð�
--��ձ޿��� 300���� �̻��� �μ��� ���ϼ���.
select deptno, count(pay),
to_char(round(avg(pay),2), '999,999.99') "avg",
max(pay) "max",
min(pay) "min" from professor
group by deptno
having round(avg(pay)) > 300;
--order by 3 desc;

--�л��� ���� �����ڰ� 1���� ���� ���ϼ���.
select to_char(birthday,'mm')��, count(birthday) �ο���
from student
group by to_char(birthday, 'mm')
having count(birthday)=1
order by �� asc;

--������ �Լ��� �̿��� group by
--������ �Ի�⵵�� �ο�, �ְ�޿�, �����޿�, ����� ���Ͻð�
--����� 300���� �̻��� ������ ����Ʈ �ϼ���
--�� ����� �Ҽ��� 2�ڸ��� �Ʒ��� ���� ����Ʈ �ϼ���
select to_char(hiredate, 'yyyy') year,
count(pay) �ο�, max(pay) �ְ�ݾ�,
min(pay) �����ݾ�,
to_char(round(avg(pay),2), '999.99') ���
from professor
group by to_char(hiredate, 'yyyy')
having avg(pay)>=300
order by 1;

--rownum, rowid
select rownum, rowid, ename from emp;

select empno, ename from emp
where rownum < 5;

select empno, ename from emp
where rownum > 5;

create table kicstudent(
grade int,
sno int,
name varchar2(20),
kor int,
eng int,
math int);

--�г⺰ ���� ��հ� ���κ� ����� ����� ���ϼ���
select grade, to_char(avg(kor),'99.99') KOR, 
to_char(avg(math),'99.99') MATH,
to_char(avg(eng),'99.99') ENG,
to_char(avg((kor+math+eng)/3),'99.99') ���
from kicstudent
group by grade;

drop table kicstudent;

create table kicstudent (
grade int,
sno int,
name varchar2(20),
kor int,
eng int,
math int);

select count(*) from kicstudent;

--���� ������ (10������) �ο���, ���� ����� ����� ���ϼ���
select trunc(kor,-1) ����з�, count(*) �ο���,
to_char(avg((kor+math+eng)/3),'999.99') �������
from kicstudent
group by trunc(kor, -1)
order by 1 desc;


--ROLLUP �Լ�
select deptno, position,
count(*), sum(pay)
from professor
group by rollup(deptno, position);

select deptno, position,
count(*), sum(pay)
from professor
group by cube(deptno, position);

--emp���̺��� �μ����� �� ���޺� �ο��� �� ������ ����ؼ� ����ϼ���
--decode �Լ� �̿��ϴ� ���
select deptno,
count(decode(job, 'CLERK', job)) "CLERK",
count(decode(job, 'MANAGER', job)) "MANAGER",
count(decode(job, 'PRESIDENT', job)) "PRESIDENT",
count(decode(job, 'ANALYST', job)) "ANALYST",
count(decode(job, 'SALESMAN', job)) "SALESMAN"
from emp
group by deptno
order by 1;

--professor ���̺��� ����Ͽ� ���� �߿��� �޿�(pay)�� ���ʽ�(bonus)�� ��ģ
--�ݾ��� ���� ���� ���� ���� ���� ����� ��ձݾ��� ���ϼ���. �� ���ʽ��� ����
--���� ���ʽ��� 0���� ����ϰ� ��� �ݾ��� ��� �Ҽ��� ù° �ڸ������� ������ �ϼ���.
select max((pay+nvl(bonus,0))) "MAX",
min((pay+nvl(bonus,0))) "MIN",
round(avg((pay+nvl(bonus,0))),1)"AVG" 
from professor;


--ī�� select ����
--1)
select empno, ename
from emp
where ename like '%A%';

--2)
select ename
from emp
where ename like 'S%%T';

--3)
select ename
from emp
where ename like '_A%';

--cf)
select ename
from emp
where ename like '__A%';

--4)
select ename, comm
from emp
where comm is null;

--5)
select ename, comm
from emp
where comm is not null;

--6)
select ename, deptno, sal
from emp
where deptno = 30 and sal >=1500;

--7)
select empno, ename, deptno
from emp
where ename like 'K%' or deptno = 30;

--8)
select sal, deptno, job
from emp
where sal>=1500 and deptno=30 and job='MANAGER';

--9)
select ename, empno, deptno
from emp
where deptno=30
order by 2;

--10)
select ename, sal
from emp
order by 2 desc;

--11)
select ename, deptno, sal
from emp
order by deptno asc, sal desc;

--12)
select deptno, job, sal
from emp
order by deptno desc, job asc;

--ī�� select 3 ����
--1)
select name , birthday
from student
where grade=4 and to_char(birthday, 'mm')= to_char(sysdate, 'mm');
--2)
select
decode(substr(jumin, 1, 2), '75', name) as "75",
decode(substr(jumin, 1, 2), '76', name) as "76",
decode(substr(jumin, 1, 2), '77', name) as "77",
decode(substr(jumin, 1, 2), '78', name) as "78"
from student;

--3)
select name, 
substr(email, (instr(email, '@')+1)) ����Ʈ
from professor
where deptno = 101;

--4)
select name, nvl(bonus,0) as ���ʽ�, (pay*1.1) as �����޿�
from professor
where deptno = 102 and bonus is null;

--5)
select name, pay as �޿�, bonus as ���ʽ�,
to_char(decode(bonus,null,pay*12,pay*12+bonus)||'0000','999,999,999') as ����
from professor
where deptno = 103;

--6)
select name,
decode(deptno, '101', pay) as "101",
decode(deptno, '102', pay) as "102",
decode(deptno, '103', pay) as "103"
from professor
where deptno between 101 and 103;


--
select name, pay �޿�, bonus ���ʽ�,
to_char((pay*12+nvl(bonus,'0'))*10000,'999,999,999') ����
from professor
where deptno = 103;


--5����
--professor ���̺��� ����Ͽ� ���� �߿��� �޿�(pay)�� ���ʽ�(bonus)�� ��ģ �ݾ��� ����
--���� ���� ���� ���� ���, ��� �ݾ��� ���ϼ���. �� ���ʽ��� ���� ���� �޿��� 0����
--����ϰ� ��� �ݾ��� ��� �Ҽ��� ù° �ڸ������� ������ �ϼ���
select max(nvl(pay+bonus,0)) "MAX",
min(nvl(pay+bonus,0)) "MIN",
round(avg(nvl(pay+bonus,0)),1) "AVG"
from professor;

--student���̺��� birthdayĮ���� ����Ͽ� �Ʒ� ȭ��ó�� ������ �¾ �ο����� ����ϼ���.
--���� �Ѱ� Ʋ��
select 
avg(substr(jumin, 3, 2) as ���,
decode(substr(jumin, 3,2), 01 , count(*)) as "1��",
decode(substr(jumin, 3,2), 02 , count(*)) as "2��"
from student
group by substr(jumin, 3,2);

select count(birthday) as "�հ�",
count(decode(to_char(birthday, 'mm'), '01', 1)) as "1��",
count(decode(to_char(birthday, 'mm'), '02', 1)) as "2��",
count(decode(to_char(birthday, 'mm'), '03', 1)) as "3��",
count(decode(to_char(birthday, 'mm'), '04', 1)) as "4��",
count(decode(to_char(birthday, 'mm'), '05', 1)) as "5��",
count(decode(to_char(birthday, 'mm'), '06', 1)) as "6��",
count(decode(to_char(birthday, 'mm'), '07', 1)) as "7��",
count(decode(to_char(birthday, 'mm'), '08', 1)) as "8��",
count(decode(to_char(birthday, 'mm'), '09', 1)) as "9��",
count(decode(to_char(birthday, 'mm'), '10', 1)) as "10��",
count(decode(to_char(birthday, 'mm'), '11', 1)) as "11��",
count(decode(to_char(birthday, 'mm'), '12', 1)) as "12��"
from student;

--student ���̺��� telĮ���� �����Ͽ� �Ʒ��� ���� ������ �ο����� ����ϼ���
--�� 02-����, 031-��� 051-�λ� 052-��� 053-�뱸 055-�泲���� ����ϼ���
select count(*) "�հ�",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '02', 1)) "����",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '031', 1)) "���",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '051', 1)) "�λ�",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '052', 1)) "���",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '053', 1)) "�뱸",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '055', 1)) "�泲"
from studetnt;

--rollup�� group by�� �Լ��̱� ������ ��Ī�� �� �� ����.
--���ڶ� ���ڶ� ���� ���� �� ���� ���� deptno�� ���ڷ� �ٲ�
--emp ���̺��� ����Ͽ� �Ʒ��� ȭ��� ���� �μ����� ���޺��� �޿� �հ� ����� ����ϼ���.
select nvl(to_char(deptno,'9999'), '  �հ�') as deptno,
to_char(nvl(sum(decode(job, 'CLERK', sal)), 0), '999,999') as CLERK,
to_char(nvl(sum(decode(job, 'MANAGER', sal)), 0), '999,999') as MANAGER,
to_char(nvl(sum(decode(job, 'PRESIDENT', sal)), 0), '999,999') as PRESIDENT,
to_char(nvl(sum(decode(job, 'ANALYST', sal)), 0), '999,999') as ANALYST,
to_char(nvl(sum(decode(job, 'SALESMAN', sal)), 0), '999,999') as SALESMAN,
to_char(sum(sal), '999,999') as �հ�
from emp
group by rollup(deptno); 

--������ �μ��� �޿��հ踦 ����Ʈ�ϼ���
select nvl(to_char(deptno, '9999'), '�հ�')dcode,
to_char(sum(pay), '999,999') �޿��հ�
from professor
group by rollup(deptno);

--mod : �������� ���� �Ʒ������� 3���� ���� �������� ����
--professor ���̺��� ������ȣ�� �̸��� �Ʒ��� ����ȭ�� ���·� ����ϼ���.
select trunc((rownum-1)/3)+1 no,
nvl(max(decode(mod(rownum, 3), '1', profno||name)), '*******') "���1 �̸�1",
nvl(max(decode(mod(rownum, 3), '2', profno||name)), '*******') "���2 �̸�2",
nvl(max(decode(mod(rownum, 3), '0', profno||name)), '*******') "���3 �̸�3"
from professor
group by trunc((rownum-1)/3)
order by 1;

--cal table�� �̿��Ͽ� �Ʒ��� ���� ����Ʈ�ϼ���
select
nvl(max(decode(day, '��', num_day)), ' ') as ��,
nvl(max(decode(day, '��', num_day)), ' ') as ��,
nvl(max(decode(day, 'ȭ', num_day)), ' ') as ȭ,
nvl(max(decode(day, '��', num_day)), ' ') as ��,
nvl(max(decode(day, '��', num_day)), ' ') as ��,
nvl(max(decode(day, '��', num_day)), ' ') as ��,
nvl(max(decode(day, '��', num_day)), ' ') as ��
from cal
group by week
order by week;

--�� �� �׷� �Լ�(LISTAGG �Լ�(11g���� �߰���)
select deptno, listagg(name) within group(order by pay)
"listagg" from professor
group by deptno;

--LAG�Լ� : ���� �� ���� ������ �� ����ϴ� �Լ��Դϴ�.
���� : LAG(����� �÷���, OFFSET, �⺻��°�)
      OVER(Querey_partition ����, ORDER BY ������ Į��)
      
select name, hiredate, pay,
lag(pay, 1, 0) over (order by hiredate)
"LAG"
from professor;

select name, hiredate, pay,
lag(pay, 3, 2) over (order by hiredate)
"LAG"
from professor;

--LEAD �Լ�
--LAG�Լ��� �ݴ�� ������ ���� �������� �Լ��̴�.
select name, hiredate, pay,
lead(pay,1,0)
over(order by hiredate) "lead"
from professor;

--RANK �Լ� - ������� �Լ�
RANK(���ǰ�) WITHIN GROUP (ORDER BY ���ǰ� �÷��� [asc|desc])
select rank('������') within group(order by name) "rank"
from professor;

--���� ���̺��� �������� ������ȣ�� �̸� �޿� �޿������� ����ϼ���
select name, pay,
rank() over(order by pay) "rank asc",
rank() over(order by pay desc) "rank desc"
from professor;

--emp ���̺��� 10�� �μ��� ���� �������� ����� �̸�, �޿�, �ش�μ����� �޿�
--������ ����ϼ���/
select empno, ename, sal,
rank() over(order by sal desc) as ����
from emp
where deptno = 10;

--�׿� �׷� �Լ�
select empno, ename, sal, deptno,
rank() over(partition by deptno order by sal desc) "rank"
from emp;

--emp ���̺��� ����Ͽ� ��� �̸� �޿� �μ���ȣ �μ��� job ����
--�޿� ������ ����ϼ���
select empno, ename, sal, deptno, job,
rank()over(partition by deptno, job order by sal desc) "rank"
from emp;

--�����հ豸�ϱ�
--panmae ���̺��� ����Ͽ� 1000�� �븮���� �Ǹų����� ����ϵ� �Ǹ�����, ��ǰ,
--�ڵ�, �Ǹŷ�, �����Ǹűݾ��� �Ʒ��� ���� ����ϼ���.
--�Ʒ����� 7410�� 2ĭ�� ������ ���� ��¥�̱� �����̴�.
select p_date, p_code, p_qty, p_total,
sum(p_total) over (order by p_date) as ���� 
from panmae
where p_store = '1000';

--panmae ���̺��� ����Ͽ� 1000�� �븮���� �Ǹų����� �Ǹ����ں��� �з��ϰ�
--���� ������ ��� ��ǰ �ڵ庰�� �ѹ� �� �з��� �� �Ǹ�����, ��ǰ�ڵ�, �Ǹŷ�, �Ǹűݾ�,
--�����Ǹűݾ��� �Ʒ��� ���� ����ϼ���.
select p_date, p_code, p_qty, p_total,
sum(p_total) over (partition by p_code order by p_date) ����
from panmae
where p_store = '1000';

--EQUI Join (� join)
--Oracle Join����
select s.name "�л��̸�", s.deptno1 "�а���ȣ", d.dname "�а��̸�"
from student s, department d
where s.deptno1 = d.deptno;
--ANSI Join ����
select s.name "�л��̸�", s.deptno1 "�а���ȣ", d.dname "�а��̸�"
from student s join department d
on(s.deptno1 = d.deptno);

--Equi Join �� 3
--�л� ���̺�(student)�� �а����̺�(department) �������̺�(professor)�� join�Ͽ�
--�л��� �̸��� �а��̸� �������� �̸��� ����ϼ���.
select s.name, d.dname, p.name
from student s, department d, professor p
where s.deptno1 = d.deptno and s.profno = p.profno;

select s.name, d.dname, p.name
from student s join department d
on s.deptno1 = d.deptno
join professor p
on s.profno = p.profno;


--Equi Join �� 4 :
--emp2 ���̺�� p_grade ���̺��� ��ȸ�Ͽ� ����� �̸��� ����, ���� ����, �ش� ������
--������ ���ѱݾװ� ���ѱݾ��� ����ϼ���
select e.name as ����̸�,
e.position as ��������,
e.pay as ���翬��,
p.s_pay as ���ѱݾ�,
p.e_pay as ���ѱݾ�
from emp2 e, p_grade p
where e.position = p.position;

--
select e.name "����̸�",
e.position "��������",
e.pay "���翬��",
p.s_pay "���ѱݾ�",
p.e_pay "���ѱݾ�"
from emp2 e join p_grade p
on e.position = p.position;

--����(deptno1)�� 101���� �л����� �л��̸��� �������� �̸��� ����ϼ���
select  s.name as �л��̸�, p.name as ����������
from student s, professor p
where s.profno = p.profno
and s.deptno1 = 101;

select s.name "�л��̸�", p.name "����������"
from student s join professor p
on s.profno = p.profno
and s.deptno1 = 101;

--deptno1�� 101�� �л��� exam_01 total ������ ���� �л� ������ ����Ʈ �ϼ���
select s.name, s.studno, e.total, deptno1
from student s, exam_01 e
where s.studno = e.studno and deptno1 = 101
order by 3 desc;

--�Ǹ����̺�(panmae) �������̺�(product)���� ��¥, ��ǰ�ڵ�, ���� �ݾ��� ����Ʈ�ϼ���
select p.p_date, p.p_code, p_name, p.p_qty, p_total
from panmae p, product t
where p.p_code = t.p_code;

--�����̸Ӹ�Ű�� ���۷���Ű

--Non-EQUI Join(�� join)
select go.gname "����", go.point"POINT", gi.gname"��ǰ��"
from gogak go, gift gi
where go.point between gi.g_start and gi.g_end;

select go.gname"����", go.point"POINT",gi.gname"��ǰ��"
from gogak go join gift gi
on go.point between gi.g_start and gi.g_end;

--�� ���� 1������ ��ȸ�� ��ǰ�� �̸��� ����
select p.gname, count(*) from gogak g, gift p
where g.point between p.g_start and p.g_end
group by p.gname
order by 2 desc;

--Non-Eqqui Join ���� 3:
--student ���̺�� exam_01���̺�, hakjum ���̺��� ��ȸ�Ͽ� �л����� �̸���
--������ ������ ���� ���������� ����ϼ���
select s.name, e.total, h.grade
from student s, exam_01 e, hakjum h
where s.studno = e.studno
and e.total between h.min_point and h.max_point
order by e.total desc;

select 
s.name as �л��̸�,
e.total "����",
h.grade "����"
from student s join exam_01 
on s.studno = e.studno
join hakjum h
on e.total between h.min_point and h.max_point; 

--Non-Equi-Join ���� 4:
--Gogak ���̺�� gift ���̺��� Join�Ͽ� ���� �ڱ� ����Ʈ���� ���� ����Ʈ�� ��ǰ ��
--�Ѱ����� ������ �� �ִٰ� �� �� ��ǿ� �����Ÿ� ������ �� �ִ� ����� ����Ʈ,
--��ǰ���� ����ϼ���.
select g.gname as ����,
g.point as POINT,
t.gname as ��ǰ��
from gogak g, gift t
where t.g_start <= g.point
and t.gname = '��ǿ�������';

SELECT * FROM GOGAK;
SELECT * FROM GIFT;
select profno, name, pay,
case
when pay<=200 then '4��'
when pay between 201 and 300 then '3��'
when pay between 301 and 400 then '2��'
when pay>401 then '1��' end "���"
from professor order by pay desc;

select g.gname,
g.point as POINT,
CASE
WHEN G.POINT BETWEEN 1 AND 100000 THEN ��ġ��Ʈ
WHEN G.POINT BETWEEN 100001 AND 201000 THEN ��ġ��Ʈ, ��Ǫ��Ʈ
WHEN G.POINT BETWEEN 201001 AND 300000 THEN ��ġ��Ʈ, ��Ǫ��Ʈ, ������ǰ��Ʈ
WHEN G.POINT BETWEEN 300001 AND 400000 THEN ��ġ��Ʈ, ��Ǫ��Ʈ, ������ǰ��Ʈ, �ֹ��ǰ��Ʈ
WHEN G.POINT BETWEEN 400001 AND 500000 THEN ��ġ��Ʈ, ��Ǫ��Ʈ, ������ǰ��Ʈ, �ֹ��ǰ��Ʈ, ��ǿ�������
WHEN G.POINT BETWEEN 500001 AND 600000 THEN ��ġ��Ʈ, ��Ǫ��Ʈ, ������ǰ��Ʈ, �ֹ��ǰ��Ʈ, ��ǿ�������, LCD�����
from gogak G, gift T
where t.g_start <= g.point
and t.gname = '��ǿ�������';

select g.gname as ����,
g.point as POINT,
t.gname as ��ǰ��
from gogak g, gift t
where t.g_start <= g.point
and t.gname = '��ǿ�������';


like 'm%', '%m%', '%m';

--�������Լ� ī�� ����
--1)
SELECT ROUND(AVG(SAL),2) ���, MAX(SAL) �ְ�, MIN(SAL) ����, COUNT(*) �ο���
FROM EMP
WHERE DEPTNO = 10;

--2)
SELECT DISTINCT DEPTNO, ROUND(AVG(SAL),2) ���, MAX(SAL) �ְ�, MIN(SAL) ����, COUNT (*) �ο���
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

--3)
SELECT DEPTNO �μ���ȣ, JOB ������, COUNT (*) �ο���
FROM EMP
GROUP BY DEPTNO, JOB;

--4)
SELECT DISTINCT JOB, TO_CHAR(AVG(SAL),'9,999.99')
FROM EMP
GROUP BY JOB;

--5)
SELECT DISTINCT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 4;

--6)
SELECT JOB, AVG(SAL)
FROM EMP;

--7)
SELECT DEPTNO, ROUND(AVG(SAL),2) ��տ���, SUM(SAL) ��ü����, MAX(SAL) �ְ����, MIN(SAL) ��������
FROM EMP
GROUP BY DEPTNO
ORDER BY SUM(SAL) DESC;

--8)
SELECT POSITION, COUNT(*) �ο�, MAX(PAY) �ְ�ݾ�, MIN(PAY) �����ݾ�, TO_CHAR(AVG(PAY),'999.99') ��ձݾ�
FROM PROFESSOR
GROUP BY POSITION
ORDER BY MAX(PAY) DESC;

--9)
SELECT SUBSTR(NAME, 1,1) ��, COUNT(*), AVG(PAY), MAX(PAY), MIN(PAY)
FROM PROFESSOR
GROUP BY SUBSTR(NAME, 1,1)
ORDER BY SUBSTR(NAME, 1,1);

--10)instr substr
SELECT GRADE �г�, 
NVL(TO_CHAR(AVG(DECODE(SUBSTR(TEL, 0, INSTR(TEL, ')') -1), '02', WEIGHT)),'999,99'), ' ') "02"
FROM STUDENT; 

--11)
SELECT SUBSTR(JUMIN, 3, 2)||'��', TO_CHAR(AVG(WEIGHT),'99.99') WEIGHT, 
TO_CHAR(AVG(HEIGHT),'999.99') HEIGHT
FROM STUDENT
GROUP BY SUBSTR(JUMIN, 3, 2);

--12)
SELECT GRADE, SUBSTR(TEL, 0, INSTR(TEL, ')') -1) ����,
AVG(WEIGHT) Ű, AVG(HEIGHT) ������
FROM STUDENT
GROUP BY GRADE, SELECT GRADE, SUBSTR(TEL, 0, INSTR(TEL, ')') -1) ����,
AVG(WEIGHT) Ű, AVG(HEIGHT) ������
FROM STUDENT
GROUP BY GRADE, SUBSTR(TEL, 0, INSTR(TEL, ')')-1)
ORDER BY GRADE, SUBSTR(TEL, 0, INSTR(TEL, ')')-1);


--6����
--EMP2, P_GRDAE ���̺��� ��ȸ�Ͽ� ������� �̸��� ����, ���� ����, ��������� ����ϼ���
���� ������ ���̷� ����ϸ� �ش� ���̰� �޾ƾ� �ϴ� ������ �ǹ��մϴ�. ���̴� ���糯¥�� ��������
�ϵ� TRUNC�� �Ҽ��� ���ϴ� �����ؼ� ����ϼ���.
--ORACLE JOIN ����
select DISTINCT E.NAME AS �̸�,
TRUNC((SYSDATE-E.BIRTHDAY)/365) AS ���糪��,
E.POSITION AS ��������,
P.POSITION AS ��������
from EMP2 E, P_GRADE P
WHERE TRUNC((SYSDATE-E.BIRTHDAY)/365) BETWEEN P.S_AGE AND P.E_AGE;
--ANSI JOIN ����
SELECT E.NAME AS �̸�,
TRUNC((SYSDATE-E.BIRTHDAY)/365) AS ���糪��,
E.POSITION AS ��������,
P.POSITION AS ��������
FROM EMP2 E JOIN P_GRADE P
ON TRUNC((SYSDATE-E.BIRTHDAY)/365)
BETWEEN P.S_AGE AND P.E_AGE;

--OUTER JOIN(�ƿ��� ����) VS INNER JOIN(�̳� ����)
--1) OUTER JOIN ���� 1 :
--STUDENT ���̺�� PROFESSOR ���̺��� JOIN�Ͽ� �л��̸��� �������� �̸��� ����ϼ���.
--�� ���������� �������� ���� �л��� ��ܵ� �Բ� ����ϼ���.
--ORCALE OUTER JOIN ����(������ �������� ���� �л��� ����ϴ� �� (+)
SELECT S.NAME AS �л��̸�, P.NAME AS �����̸�
FROM STUDENT S, PROFESSOR P
WHERE S.PROFNO = P.PROFNO(+);
--ANSI OUTER JOIN ����
SELECT S.NAME AS �л��̸�, P.NAME AS �����̸�
FROM STUDENT S LEFT OUTER JOIN PROFESSOR P
ON S.PROFNO = P.PROFNO;

--ORACLE OUTER JOIN ����
SELECT S.NAME AS �л��̸�, P.NAME AS �����̸�
FROM STUDENT S, PROFESSOR P
WHERE S.PROFNO(+) = P.PROFNO
UNION
SELECT S.NAME AS �л��̸�, P.NAME �����̸�
FROM STUDENT S, PROFESSOR P
WHERE S.PROFNO = P.PROFNO(+);
--ANSI JOIN ����
SELECT S.NAME AS �л��̸�, P.NAME AS �����̸�
FROM STUDENT S FULL OUTER JOIN PROFESSOR P
ON S.PROFNO = P.PROFNO;

--SELF JOIN -> ���� ���̺��� JOIN �ؼ� �� ���� ���� ã�� ���. ���� �����.
SELECT * FROM DEPT2;
--ORACLE JOIN ����
SELECT A.DNAME AS �μ���, B.DNAME AS �����μ���
FROM DEPT2 A, DEPT2 B
WHERE A.PDEPT = B.DCODE;
--ANSI JOIN ����
SELECT A.DNAME AS �μ���, B.DNAME �����μ���
FROM DEPT2 A JOIN DEPT2 B
ON A.PDEPT = B.DCODE;

--PROFESSOR ���̺��� ������ ��ȣ, �����̸�, �Ի���, �ڽź��� �Ի��� ���� ����� �ο�����
--����ϼ���. �� �ڽź��� �Ի����� ���� ��� ���� ������������ ����ϼ���.
SELECT A.PROFNO, A.NAME, A.HIREDATE, COUNT(*)
FROM PROFESSOR A, PROFESSOR B;
SELECT P1.PROFNO, P1.NAME, P1.HIREDATE, COUNT(P2.HIREDATE) AS �ο�
FROM PROFESSOR P1, PROFESSOR P2
WHERE P1.HIREDATE > P2.HIREDATE(+)
GROUP BY P1.PROFNO, P1.NAME, P1.HIREDATE
ORDER BY P1.HIREDATE;

--JOIN �������� 2 
--SELF JOIN -> �� �������� �������� �߿���
--EMP TABLE���� ���Ӻ��� ������ ���� ����Ʈ�ϼ���
SELECT E1.ENAME, COUNT(E2.MGR)
FROM EMP E1, EMP E2
WHERE E1.EMPNO = E2.MGR(+)
GROUP BY E1.ENAME
ORDER BY COUNT(E2.MGR) DESC;

--�л�(student)���̺�� ����(exam_01)���̺��� �̿��Ͽ� �Ʒ��� ���� ����Ʈ �ϼ���.
SELECT S.NAME, S.STUDNO, E.TOTAL, E1.TOTAL
FROM STUDENT S, EXAM_01 E, EXAM_01 E1
WHERE E.TOTAL > E1.TOTAL;

SELECT S.NAME, S.STUDNO, E1.TOTAL, COUNT(E2.TOTAL) AS �ο�
FROM STUDENT S, EXAM_01 E1, EXAM_01 E2
WHERE S.STUDNO = E1.STUDNO AND E1.TOTAL > E2.TOTAL(+)
GROUP BY S.NAME, S.STUDNO, E1.TOTAL
ORDER BY E1.TOTAL DESC;

--JOIN ��������3_1
--�л�(STUDENT)���̺�� ����(EXAM_01)���̺��� �̿��Ͽ� �Ʒ��� ���� ����Ʈ �ϼ���
SELECT * FROM STUDENT;
SELECT S.NAME, S.STUDNO, E.TOTAL,
RANK() OVER (ORDER BY E.TOTAL DESC) AS ���
FROM STUDENT S, EXAM_01 E
WHERE S.STUDNO = E.STUDNO;

SELECT * FROM STUDENT;
SELECT S.NAME, S.STUDNO, E.TOTAL, COUNT(E1.TOTAL) ���
FROM STUDENT S, EXAM_01 E, EXAM_01 E1
WHERE S.STUDNO = E.STUDNO AND E.TOTAL <= E1.TOTAL(+)
GROUP BY S.NAME, S.STUDNO, E.TOTAL
ORDER BY E.TOTAL DESC;

--��������
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= (SELECT SAL
FROM EMP
WHERE ENAME ='MARTIN');

--(1)������ sub query ��������
--
SELECT DEPTNO1 FROM STUDENT WHERE NAME = '������';

SELECT NAME, DNAME FROM STUDENT, DEPARTMENT
WHERE DEPTNO1 = DEPTNO
AND DEPTNO1 = (SELECT DEPTNO1 FROM STUDENT WHERE NAME = '������');

--(2)������ SUB QUERY �������� 2
--PROFESSOR ���̺��� �Ի����� ������ �������� ���߿� �Ի��� ����� �̸��� �Ի���, �а����� ����ϼ���
SELECT NAME, HIREDATE
FROM PROFESSOR
WHERE HIREDATE = (SELECT HIREDATE FROM PROFESSRO WHERE HIREDATE);

SELECT HIREDATE FROM PROFESSOR 
WHERE NAME = '������';

SELECT P.NAME, P.HIREDATE, D.DNAME
FROM PROFESSOR P, DEPARTMENT D
WHERE P.DEPTNO = D.DEPTNO
AND P.HIREDATE > (SELECT HIREDATE FROM PROFESSOR 
WHERE NAME = '������');
--���� ���� �ϴ� �� WHERE���� ���� ��������.

--���������� ������ ��ƾߵǴ����� ����ؾ���
--(3)���� �� SUB QUERY ��������3
--STUDENT ���̺��� 1����(DEPTNO1)�� 101���� �а��� ��� �����Ժ��� �����԰� ����
--�л����� �̸��� �����Ը� ����ϼ���.
SELECT AVG(WEIGHT) FROM STUDENT WHERE DEPTNO1 = 101;

SELECT NAME, WEIGHT
FROM STUDENT
WHERE WEIGHT > (SELECT AVG(WEIGHT) FROM STUDENT WHERE DEPTNO1 = 101);

--(4)������ �������� ��4 :
--PROFESSOR ���̺��� �ɽ� ������ ���� �Ի��Ͽ� �Ի��� ���� �߿��� ��� ���� ������
--���Թ޴� ������ �̸��� �޿�, �Ի����� ����ϼ���
SELECT PAY FROM PROFESSOR WHERE NAME = '���';
SELECT HIREDATE FROM PROFESSOR WHERE NAME = '�ɽ�';

SELECT NAME, PAY, HIREDATE
FROM PROFESSOR
WHERE HIREDATE = (SELECT HIREDATE FROM PROFESSOR WHERE NAME = '�ɽ�')
AND PAY > (SELECT PAY FROM PROFESSOR WHERE NAME = '���'-);


--���� �� �������� ��1
--EMP2 ���̺�� DEPT2���̺��� �����Ͽ� �ٹ�����(DEPT2 ���̺��� AREA �÷�)�� ����������
--��� ������� ����� �̸�, �μ���ȣ�� ����ϼ���.
--�ȿ� ���� �� �غ��� ������ �ȴ�
--IN �� ���õ� ����
SELECT DCODE FROM DEPT2 WHERE AREA = '��������';
SELECT EMPNO, NAME, DEPTNO 
FROM EMP2
WHERE DEPTNO IN(SELECT DCODE
                        FROM DEPT2 
                      WHERE AREA = '��������');
                      

--(2) ���� �� �������� ��������1: ANY ����ϴ� ����, ALL�� �˾Ƶμ�
-- ANY �� �� �ϳ����� ũ��ǰ� , ALL�� �³� ���� �� ���� Ŀ��
--EMP2 ���̺��� ����Ͽ� ��ü ���� �� ���� ������ �ּ� �����ں��� ������ ���� ����� �̸���
--����, ������ ����ϼ���. �� ������������� �Ʒ��� ���� õ ���� ���� ��ȣ�� ǥ���ϼ���.
SELECT MIN(PAY) FROM EMP2 WHERE POSITION = '����';
SELECT * FROM EMP2;
SELECT NAME, POSITION, TO_CHAR(PAY , '999,999,999') AS �޿�
FROM EMP2
WHERE PAY > ANY (SELECT PAY FROM EMP2 
WHERE POSITION = '����');

SELECT NAME, POSITION, TO_CHAR(PAY , '999,999,999')
FROM EMP2
WHERE PAY > (SELECT MIN(PAY) FROM EMP2 WHERE POSITION = '����')
ORDER BY PAY DESC;


--(3)���� �� �������� �������� 2:
--STUDENT ���̺��� ��ȸ�Ͽ� ��ü �л� �߿��� ü���� 4�г� �л����� ü�߿��� ���� ����
--������ �л����� �����԰� ���� �л��� �̸��� �г�� �����Ը� ����ϼ���.
SELECT * FROM STUDENT;
SELECT NAME, GRADE, WEIGHT
FROM STUDENT
WHERE WEIGHT < ALL (SELECT WEIGHT FROM STUDENT 
WHERE GRADE = 4);

SELECT NAME �̸�, GRADE �г�, WEIGHT ������
FROM STUDENT
WHERE WEIGHT < (SELECT MIN(WEIGHT) FROM STUDENT WHERE GRADE =4)
ORDER BY WEIGHT DESC, GRADE;

--�������� ���� �����÷�(��)
--�����÷�(��) (COL1, COL2) IN (VAL1, VAL2)
--EMP2 ���̺��� ��ȸ�Ͽ� �� ���޺��� �ִ�޿��� ���� ������ �޿��� ������ ����Ʈ�ϼ���
SELECT EMPNO, NAME, BIRTHDAY, PAY, POSITION 
FROM EMP2
WHERE (PAY, POSITION) IN (SELECT MAX(PAY), POSITION 
FROM EMP2 GROUP BY POSITION);

--(1)�����÷� �������� ��1:
--STUDENT ���̺��� ��ȸ�Ͽ� �� �г⺰�� �ִ�Ű�� ���� �л����� �г�� �̸��� Ű�� ����ϼ���
SELECT * FROM STUDENT;
SELECT GRADE �г�, NAME �̸�, HEIGHT Ű
FROM STUDENT
WHERE (GRADE, HEIGHT) IN (SELECT GRADE, MAX(HEIGHT)
FROM STUDENT GROUP BY GRADE);

--(2)�����÷� �������� ��������1:
--PROFESSOR ���̺��� ��ȸ�Ͽ� �� �а����� �Ի����� ���� ������ ������ ������ȣ�� �̸�,
--�а����� ����ϼ���. (�а��̸�(DEPARTMENT)������ �������� ����)
SELECT * FROM PROFESSOR;
SELECT P.PROFNO, P.NAME, P.HIREDATE, D.DNAME
FROM PROFESSOR P, DEPARTMENT D
WHERE (P.DEPTNO,HIREDATE) IN (SELECT DEPTNO, MIN(HIREDATE)
FROM PROFESSOR GROUP BY DEPTNO) AND P.DEPTNO = D.DEPTNO
ORDER BY DNAME;

--(3)���� �÷� �������� �������� 2:
--EMP2 ���̺��� ��ȸ�Ͽ� ���޺��� �ش� ���޿��� �ִ� ������ �޴� ������ �̸��� ����,
--������ ����ϼ���. ���������� �������� �����ϼ���.
SELECT * FROM EMP2;
SELECT NAME, POSITION, PAY
FROM EMP2
WHERE (POSITION, PAY) IN (SELECT POSITION, MAX(PAY)
FROM EMP2
GROUP BY POSITION)
ORDER BY PAY;

--(4)������ �������� �������� 3:
--EMP2, DEPT2 ���̺��� ��ȸ�Ͽ� �� �μ��� ��� ������ ���ϰ� �� �߿��� ��� ������
--���� ���� �μ���  ��� �������� ���Թ޴� �������� �μ���, ������, ������ ����ϼ���.
SELECT * FROM EMP2;
SELECT * FROM DEPT2;
SELECT D.DNAME �μ���, E.NAME �����, E.PAY ����
FROM EMP2 E, DEPT2 D
WHERE PAY > (SELECT PAY FROM EMP2 WHERE MIN(PAY);
--�Ʒ��� ������
SELECT D.DNAME, E.NAME, E.PAY
FROM DEPT2 D, EMP2 E
WHERE D.DCODE = E.DEPTNO AND PAY < ALL(SELECT AVG(PAY) FROM EMP2
GROUP BY DEPTNO);
--�Ʒ��� ������
SELECT D.DNAME, E.NAME, E.PAY
FROM DEPT2 D, EMP2 E
WHERE D.DCODE = E.DEPTNO AND PAY < (SELECT MIN(AVG(PAY)) FROM EMP2
GROUP BY DEPTNO);

--(1)��ȣ���� �������� ��1:
--EMP2 ���̺��� ��ȸ�ؼ� ���� �� �߿��� �ڽ��� ������ ��տ����� ���ų� ���� �޴� �������
--�̸��� ����, ���� ������ ����ϼ���.
SELECT NAME ����̸�, POSITION ����, PAY �޿�
FROM EMP2 A 
WHERE PAY >= (SELECT AVG(PAY) 
              FROM EMP2
               WHERE A.POSITION = POSITION);
               
             
               
               
               
--7����
--�������� ���� �����÷�(��) -> ��ȣ���� ���������� �ٲ㺸�� ��
--�����÷�(��) (COL1, COL2) IN (VAL1, VAL2)
--EMP2 ���̺��� ��ȸ�Ͽ� �� ���޺��� �ִ�޿��� ���� ������ �޿��� ������ ����Ʈ�ϼ���
SELECT EMPNO, NAME, BIRTHDAY, PAY, POSITION 
FROM EMP2
WHERE (PAY, POSITION) IN (SELECT MAX(PAY), POSITION 
FROM EMP2 GROUP BY POSITION);

SELECT EMPNO, NAME, BIRTHDAY, PAY, POSITION
FROM EMP2 E
WHERE PAY = ( SELECT MAX(PAY) FROM EMP2 WHERE POSITION = E.POSITION);

--(1)�����÷� �������� - > ��ȣ���� �������� ��1
--STUDENT ���̺��� ��ȸ�Ͽ� �� �г⺰�� �ִ�Ű�� ���� �л����� �г�� �̸��� Ű�� ����ϼ���
SELECT * FROM STUDENT;
SELECT GRADE �г�, NAME �̸�, HEIGHT Ű
FROM STUDENT
WHERE (GRADE, HEIGHT) IN (SELECT GRADE, MAX(HEIGHT)
FROM STUDENT GROUP BY GRADE);

SELECT GRADE �г�, NAME �̸�, HEIGHT Ű
FROM STUDENT S
WHERE HEIGHT = ( SELECT MAX(HEIGHT) FROM STUDENT WHERE GRADE = S.GRADE )
ORDER BY GRADE;


--(2)�����÷� �������� -> ��ȣ���� �������� ��������1:
--PROFESSOR ���̺��� ��ȸ�Ͽ� �� �а����� �Ի����� ���� ������ ������ ������ȣ�� �̸�,
--�а����� ����ϼ���. (�а��̸�(DEPARTMENT)������ �������� ����)
SELECT * FROM PROFESSOR;
SELECT P.PROFNO, P.NAME, P.HIREDATE, D.DNAME
FROM PROFESSOR P, DEPARTMENT D
WHERE (P.DEPTNO,HIREDATE) IN (SELECT DEPTNO, MIN(HIREDATE)
FROM PROFESSOR GROUP BY DEPTNO) AND P.DEPTNO = D.DEPTNO
ORDER BY DNAME;

SELECT P.PROFNO, P.NAME, P.HIREDATE, D.DNAME
FROM PROFESSOR P, DEPARTMENT D
WHERE HIREDATE = ( SELECT MIN(HIREDATE) FROM PROFESSOR WHERE P.DEPTNO = DEPTNO)
AND D.DEPTNO=P.DEPTNO
ORDER BY D.DNAME;

--(3)���� �÷� �������� -> ��ȣ���� �������� �������� 2:
--EMP2 ���̺��� ��ȸ�Ͽ� ���޺��� �ش� ���޿��� �ִ� ������ �޴� ������ �̸��� ����,
--������ ����ϼ���. ���������� �������� �����ϼ���.
SELECT * FROM EMP2;
SELECT NAME, POSITION, PAY
FROM EMP2
WHERE (POSITION, PAY) IN (SELECT POSITION, MAX(PAY)
FROM EMP2
GROUP BY POSITION)
ORDER BY PAY;

SELECT * FROM EMP2;
SELECT NAME, POSITION, PAY
FROM EMP2 E
WHERE PAY = ( SELECT MAX(PAY) FROM EMP2 WHERE E.POSITION = POSITION)
ORDER BY PAY;


--��Į�� �������� SCALAR SUB QUERY
--��Į�� ���� ���� ��:
--EMP2 ���̺�� DEPT2 ���̺��� ��ȸ�Ͽ� ������� �̸��� �μ��̸��� ����ϼ���
SELECT NAME AS ����̸�, 
(SELECT DNAME FROM DEPT2 D WHERE E.DEPTNO = D.DCODE) AS �μ��̸�
FROM EMP2 E;

--�ζ��� �������� -> ��Į�� �������� // ���ڱ� ����..
SELECT D.DNAME �а���,
S.MAX_HEIGHT �ִ�Ű,
S.MAX_WEIGHT �ִ������
FROM ( SELECT DEPTNO1, MAX(HEIGHT) MAX_HEIGHT, MAX(WEIGHT) MAX_WEIGHT
FROM STUDENT
GROUP BY DEPTNO1) S, DEPARTMENT D
WHERE S.DEPTNO1 = D.DEPTNO;

SELECT (SELECT D.DNAME FROM DEPARTMENT D WHERE D.DEPTNO = S.DEPTNO1) �а���,
S.MAX_HEIGHT �ִ�Ű,
S.MAX_WEIGHT �ִ������
FROM ( SELECT DEPTNO1, MAX(HEIGHT) MAX_HEIGHT, MAX(WEIGHT) MAX_WEIGHT
FROM STUDENT
GROUP BY DEPTNO1) S;

--(1)������ ���� ���� ��������
--STUDENT ���̺�� DEPARTMENT ���̺��� ����Ͽ� ������ �л��� ����(DEPTNO1)��
--������ �л����� �̸��� ���� �̸��� ����ϼ���.
--���� �Ѱ� �Ʒ��ε� Ʋ��, ���ٹ������ �ٽ� �����ҵ�. �𸣸� �����
SELECT NAME, (SELECT DNAME FROM DEPARTMENT)
FROM STUDENT S
WHERE DNAME = (SELECT DNAME FROM DEPARTMENT WHERE S.NAME = '������');

SELECT S.NAME, (SELECT DNAME FROM DEPARTMENT WHERE S.DEPTNO1 = DEPTNO) ������
FROM STUDENT S
WHERE S.DEPTNO1 = (SELECT DEPTNO1 FROM STUDENT
WHERE NAME = '������');

--������ �������� ��������2:
--PROFESSOR ���̺��� �Ի����� ������ �������� ���߿� �Ի��� ����� �̸��� �Ի���,
--�а����� ����ϼ��� ��Į�󼭺�����
SELECT P.NAME ������, P.HIREDATE �Ի���,
(SELECT DNAME FROM DEPARTMENT WHERE P.DEPTNO = DEPTNO)
FROM PROFESSOR P
WHERE P.HIREDATE > (SELECT HIREDATE FROM PROFESSOR WHERE NAME = '������');

--�ζ��� �� INLINE VIEW - 1ȸ�� ��
--��������1
--ROWNUM�� ���Ͽ�
--1)
SELECT * FROM STUDENT WHERE ROWNUM < 5;
--2) ����
SELECT * FROM STUDENT WHERE ROWNUM > 5;
SELECT * FROM STUDENT WHERE ROWNUM BETWEEN 3 AND 10;


--�л����ϰ�
SELECT NAME, E.TOTAL
FROM STUDENT S, EXAM_01 E
WHERE S.STUDNO = E.STUDNO
ORDER BY TOTAL DESC;

SELECT RNUM ����, NAME �̸�, TOTAL ���� FROM(
SELECT ROWNUM rnum, A.*FROM(
SELECT NAME, E.TOTAL
FROM STUDENT S, EXAM_01 E
WHERE S.STUDNO = E.STUDNO
ORDER BY 2 DESC) A ) WHERE RNUM BETWEEN 3 AND 5;

SELECT * FROM (
SELECT ROWNUM rnum, A.*FROM(
SELECT NAME, E.TOTAL
FROM STUDENT S, EXAM_01 E
WHERE S.STUDNO = E.STUDNO
ORDER BY TOTAL DESC) A ) WHERE RNUM BETWEEN 3 AND 5;


--ROW�� ���縦 ����� ���ǽ�
SELECT 1 FROM EMP WHERE ENAME='SMITH' AND EMPNO = 7369;

SELECT * FROM EMP
WHERE EXISTS
(SELECT 1 FROM EMP WHERE ENAME = 'FORD' AND EMPNO = 333);

SELECT * FROM EMP
WHERE EXISTS
(SELECT 1 FROM EMP WHERE ENAME='SMITH' AND EMPNO = 7369);

SELECT * FROM EMP
WHERE NOT EXISTS
(SELECT 1 FROM EMP WHERE ENAME = 'FORD' AND EMPNO = 333);

SELECT * FROM EMP
WHERE NOT EXISTS
(SELECT 1 FROM EMP WHERE ENAME='SMITH' AND EMPNO = 7369);


--DML : INSERT��ɾ�
--��� ��1:
DEPT2 ���̺� �Ʒ��� ���� �������� ���ο� �μ� ������ �Է��ϼ���.
INSERT INTO DEPT2(DCODE, DNAME, PDEPT, AREA)
VALUES (9000, 'Ư��1��','1006','�ӽ�����');

--���� �����ϸ� �ؿ� 4���� �� ��� ��
INSERT INTO DEPT2
VALUES (9001, 'Ư��2��', '1006', '�ӽ�����');

--��� ��2: Ư�� Į���� �Է��ϱ�
--�μ���ȣ�� �μ���, �����μ� ���� �Ʒ��� ������ �Է��ϼ���
--�μ���ȣ : 9002
--�μ��� : Ư��3��
--�����μ� : ������
INSERT INTO DEPT2(DCODE, DNAME, PDEPT)
VALUES(9002, 'Ư��3��', '1006');

SELECT * FROM DEPT2;

--��� ��3: ��¥ ������ �Է��ϱ�
--�Ʒ������� PROFESSOR ���̺� �Է��ϼ���
--������ȣ : 5001
--�����̸� : �輳��
--ID : LOVE_ME
--POSITION : ������
--PAY : 510
--�Ի��� : 2011�� 11�� 14�� <- �� �κ��� ���Ǳ�� ������
INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5001,'�輳��','LOVE_ME', '������', 510, '2011-11-14');

INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5004,'�輳��','LOVE_ME','������',510,'2011/11��/14');

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MON-DD';

INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5004,'�輳��','LOVE_ME','������',510,'2011/11��/14');

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';

SELECT * FROM PROFESSOR;

INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5005,'�輳��','LOVE_ME','������',510,'2011-11-14');

INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5002,'�輳��','LOVE_ME','������',510,'2011/11/14');

INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5003,'�輳��','LOVE_ME','������',510,'2011/11/14');

-- NULL �Է¹��
SELECT * FROM DEPT2;

INSERT INTO DEPT2 (DCODE, DNAME, PDEPT)
VALUES (9002, 'Ư��3��', '1006');

INSERT INTO DEPT2 (DCODE, DNAME, PDEPT, AREA)
VALUES (9003, 'Ư��4��', '1006', NULL);

--DML : INSERT ��ɾ�
--2) INSERT�� ����Ͽ� ������ �Է��ϱ�
--�Ʒ��� ���� ����� �̹� �����Ǿ� �ִ� ���̺��� �뷮�� �����͸� �����ؿ� �� ���� ����
--����ϴ� ����Դϴ�.
CREATE TABLE PROFESSOR2
AS SELECT * FROM PROFESSOR;
-- �� ����
SELECT * FROM PROFESSOR2;
SELECT * FROM PROFESSOR;

CREATE TABLE PROFESSOR3
AS SELECT * FROM PROFESSOR WHERE 1 = 2;
--WHERE ���� ���� Ʋ��, ROW�� �������� ����.
SELECT * FROM PROFESSOR3;

INSERT INTO PROFESSOR3
SELECT * FROM PROFESSOR;
--�̹� ������� Ʋ�� ���� �߰�
SELECT * FROM PROFESSOR3;

--3)INSERT ALL�� �̿��� �������̺� ������ �Է��ϱ�
--��뿹 1: �ٸ� ���̺� �Ѳ����� ������ �Է��ϱ�
--�� ������ P_01���̺�� P_02���̺� ���� ���� �ٸ� �����͸� ���ÿ� �Է��ϴ� �������
--�����ְ� �ֽ��ϴ�.
INSERT ALL
INTO P_01(NO,NAME)
VALUES (1,'AAA')
INTO P_02(NO, NAME)
VALUES(2,'BBB')
SELECT*FROM DUAL;

--��뿹 2: �ٸ� ���̺��� �����͸� �����ͼ� �Է��ϱ�
--PROFESSOR ���̺��� ������ȣ�� 1000������ 1999�������� ������ ��ȣ�� �����̸���
--P_01���̺� �Է��ϰ� ������ȣ�� 2000������ 2999�������� ������ ��ȣ�� �̸���
--P_02���̺� �Է��ϼ���.
INSERT ALL
WHEN PROFNO BETWEEN 1000 AND 1999 THEN
INTO P_01 VALUES(PROFNO, NAME)
WHEN PROFNO BETWEEN 2000 AND 2999 THEN
INTO P_02 VALUES(PROFNO, NAME)
SELECT PROFNO, NAME
FROM PROFESSOR;

--��뿹 3: �ٸ� ���̺� ���ÿ� ���� ������ �Է��ϱ�
--PROFESSOR ���̺��� ������ȣ�� 3000������ 3999���� �������� ������ȣ�� �̸���
--P_01���̺�� P_02���̺� ���ÿ� �Է��ϼ���.
INSERT ALL
INTO P_01 VALUES(PROFNO, NAME)
INTO P_02 VALUES(PROFNO, NAME)
SELECT PROFNO, NAME
FROM PROFESSOR
WHERE PROFNO BETWEEN 3000 AND 3999;

SELECT * FROM PROFESSOR;

--DML : UPDATE ��ɾ�
--1. UPDATE (������ �����ϱ�)
--UPDATE TABLE
--SET COLUMN = VALUE
--WHERE ���� ;
--��� ��1:
--PROFESSOR ���̺��� ������ �������� �������� BONUS�� 100�������� �λ��ϼ���
UPDATE PROFESSOR
SET BONUS = 100
WHERE POSITION = '������';
SELECT * FROM PROFESSOR;

--��� ��2:
--PROFESSOR ���̺��� ��� ������ ���ް� ������ ������ ���� ������ �� ���� �޿���
--250������ �ȵǴ� �������� �޿��� 15% �λ��ϼ���.
UPDATE PROFESSOR
SET PAY = PAY*1.15
WHERE POSITION = ( SELECT POSITION 
                   FROM PROFESSOR
                   WHERE NAME = '���' )
AND PAY < 250 ;

SELECT * FROM PROFESSOR;

--DML : DELETE ��ɾ�
--1.DELETE(������ �����ϱ�)
--DELETE FROM TABLE
--WHERE ���� ;
--��뿡:
--DEPT2 ���̺��� �μ���ȣ(DCODE)�� 9000������ 9100�� ������ ������� �����ϼ���.
DELETE FROM DEPT2
WHERE DCODE BETWEEN 9000 AND 9100;
--DELETE �� �����ʹ� �����ǳ� �뷮�� ������ ���ٴ� ��!!

--DELETE, TRUNCATE, DROP�� ����
--���̺��� �����͸� ����ó���Ҷ�, DELETE, TRUNCATE�� �̿��Ѵ�.
--������ ���⿡�� 
--
--
--


--MERGE (���̺���ġ��)
--MERGE �� ���̺� ���� Ȯ��
SELECT * FROM PT_01;
SELECT * FROM PT_02;
SELECT * FROM P_TOTAL;
--MERGE �۾� ����1 (PT_01 ���̺�� P_TOTAL ���̺� ����)
MERGE INTO P_TOTAL TOTAL
USING PT_01 P01
ON (TOTAL.�ǸŹ�ȣ = P01.�ǸŹ�ȣ)
WHEN MATCHED THEN
UPDATE SET TOTAL.��ǰ��ȣ = P01.��ǰ��ȣ
WHEN NOT MATCHED THEN
INSERT VALUES(P01.�ǸŹ�ȣ, P01.��ǰ��ȣ, P01.����, P01.�ݾ�);

MERGE INTO P_TOTAL TOTAL
USING PT_02 P02
ON (TOTAL.�ǸŹ�ȣ = P02.�ǸŹ�ȣ)
WHEN MATCHED THEN
UPDATE SET TOTAL.
WHEN NOT MATCHED THEN��ǰ��ȣ = P02.��ǰ��ȣ
INSERT VALUES(P02.�ǸŹ�ȣ, P02.��ǰ��ȣ, P02.����, P02.�ݾ�);

SELECT * FROM P_TOTAL;

SELECT * FROM EMP;

--commit rollback �ǽ� // sqld �� cmd ���� ����.
--1
create table rolluptest(
num number(10),
name varchar2(20));
--sql
--SQL> select * from rolluptest;
--no rows selected
--2 �Ʒ� DBMS_RANDOM�� �Լ��� �ִ� �״�� �Է��ؾ� ��
INSERT INTO ROLLUPTEST VALUES
( ROUND (DBMS_RANDOM.VALUE(1,45), 0),
DBMS_RANDOM.STRING('A',9));
--3
SELECT * FROM ROLLUPTEST;
--���⼭�� �������� sql������ �Ⱥ��� = �ٸ� Ŭ���̾�Ʈ������ �Ⱥ���
--�̷� �� ��� ���ߵ��� �ϴ� �� commit�̴�
--SQL> select * from rolluptest;
--no rows selected
COMMIT;
--DML�� �ƴ� DDL ���� �� �ϸ� COMMIT�� �ڵ����� �Ѵ�.
--�Ǵ� �� ���μ����� ����� �����ϸ� �ڵ� COMMIT�� �ȴ�.
--SQL> select * from rolluptest;

--       NUM NAME
-------- --------------------
--        25 TaMoOZMqB

SAVEPOINT A1;
INSERT INTO ROLLUPTEST VALUES
( ROUND(DBMS_RANDOM.VALUE(1,45), 0), DBMS_RANDOM.STRING('A',9));
SELECT * FROM ROLLUPTEST;

SAVEPOINT A2;
INSERT INTO ROLLUPTEST VALUES
( ROUND(DBMS_RANDOM.VALUE(1,45), 0), DBMS_RANDOM.STRING('A',9));
SELECT * FROM ROLLUPTEST;

ROLLBACK TO A2;
SELECT * FROM ROLLUPTEST;
--������� �ص� COMMIT�� ���߱� ������ cmd ������ ��ȭ�� ���� = �߰��� ���� �Ⱥ��δ�.
COMMIT;
--COMMIT �ϰ� ���� �߰��Ȱ� ���δ�. ROLLBACK; COMMIT���� �ѹ��ϴ°�.
--SQL> SELECT * FROM ROLLUPTEST;

--       NUM NAME
---------- --------------------
--        25 TaMoOZMqB
--        43 jWLsLjMPc
-- ���ݱ��� TCL���� ������ �Ŵ� TCL�� DML�� ���õ� ��.

--DDL�� DATA DICTIONARY
--DDL : CREATE
--1.CREATE
--1) ��뿹1: �Ϲ����̺� �������ϱ�
CREATE TABLE DDL_TEST
( NO NUMBER(3),
  NAME VARCHAR2(10),
  BIRTH DATE DEFAULT SYSDATE);
  
--  
CREATE TABLE EXDDL01
( EMPLOYEE_ID NUMBER(6),
  EMP_NAME VARCHAR2(80),
  SALARY NUMBER(8,2),
  MANAGER_ID NUMBER(6));
SELECT * FROM EXDDL01;

--2. ������̺�(EMP)���� �����ڻ��(MGR)�� 7566���̰� �޿��� 100���� 3000���̿� �ִ�
--����� ���(EMPNO), �����(ENAME), �޿�(SAL) �����ڻ��(MRG)�� �Է��ϴ� INSERT����
--�ۼ��غ���
INSERT INTO EXDDL01
SELECT EMPNO, ENAME, SAL, MGR
FROM EMP A
WHERE A.MGR = 7566
AND A.SAL BETWEEN 1000 AND 3000;

SELECT * FROM EXDDL01;

--(5) ��� ��5: ���� �÷� ���̺� �����ϱ� (11g���� �߰��� ���)
--STEP 1. ���� �÷��� ������ VT001 ���̺��� �����մϴ�.
CREATE TABLE VT001
( NO1 NUMBER,
  NO2 NUMBER,
  NO3 NUMBER GENERATED ALWAYS AS (NO1 + NO2) VIRTUAL );
--  �� ��ɾ�� 4�� ������ NO3 Į���� NO1+NO2�� ���� ������ ���� �÷��Դϴ�.

--STEP 2. VT001 ���̺� �����͸� �Է��մϴ�.
INSERT INTO VT001 VALUES (1,2,3);
INSERT INTO VT001 VALUES (1,2,3)
--ERROR AT LINE 1:
--ORA-54013:INSERT OPERTION DISALLOWED ON VIRTUAL COLUMNS

INSERT INTO VT001(NO1,NO2)
VALUES(1,2);
---�� ����� �� �� �ֵ��� �����÷����� ����ڰ� �����͸� �Է��� �� �����ϴ�.

--STEP 3. �Էµ� �����͸� ��ȸ�մϴ�.
SELECT * FROM VT001;

--STEP 4. ���� ���� ������ �� ���� Į���� �ݿ��Ǵ��� Ȯ���մϴ�.
--NO1�� 10���� �ٲٴ� ��. �� �ȴ�.
UPDATE VT001
SET NO1=10;

SELECT * FROM VT001;

--STEP 5.�ε����� ���������� ������������ �׽�Ʈ �մϴ�.
--ALTER�� �� ���̺� ���� ������ �ٲٴ� ��. �ι��� ������ �����ϸ� ����ũ�� ���� constra- ����
ALTER TABLE VT001 ADD
CONSTRAINT NO3_CONSTRAINT UNIQUE(NO3);
INSERT INTO VT001(NO1,NO2) VALUES(6,6);
SELECT * FROM VT001;


--8����
--STEP 6. ���ο� ���� Į���� �߰��մϴ�.
ALTER TABLE VT001
ADD ( NO4 GENERATED ALWAYS AS ((NO1*12)+NO2));
--���ο� �����÷��� �߰��Ǹ� ��� ���� �ݿ��ȴ�.
SELECT * FROM VT001;

--���� ��ҹ��� ���� ���ϴ� ������?
--VALUE�� ��ҹ��ڸ� ����
--STEP 7.���̺��� ���� Į�� ������ ��ȸ�մϴ�.
SELECT COLUMN_NAME
,DATA_TYPE
,DATA_DEFAULT
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'VT001'
ORDER BY COLUMN_ID;

--STEP 8. �������� Ȱ���� �����÷� �����ϱ�
CREATE TABLE PANMAE10
( NO NUMBER,
  PCODE CHAR(4),
  PDATE CHAR(8),
  PQTY NUMBER,
  PBUNGI NUMBER(1)
  GENERATED ALWAYS AS
  (
  CASE
   WHEN SUBSTR(PDATE,5,2) IN ('01', '02', '03') THEN 1
   WHEN SUBSTR(PDATE,5,2) IN ('04', '05', '06') THEN 2
   WHEN SUBSTR(PDATE,5,2) IN ('07', '08', '09') THEN 3
   ELSE 4
  END ));
  
--  DDL CREATE
INSERT INTO PANMAE10 ( NO, PCODE, PDATE, PQTY)
VALUES(1, '100', '20110112', 10);

INSERT INTO PANMAE10 ( NO, PCODE, PDATE, PQTY)
VALUES(2, '200', '20110505', 20);

INSERT INTO PANMAE10 ( NO, PCODE, PDATE, PQTY)
VALUES(3, '300', '20110812', 30);

INSERT INTO PANMAE10 ( NO, PCODE, PDATE, PQTY)
VALUES(4, '400', '20111024', 40);

SELECT * FROM PANMAE10;


--2. DDL : ALTER
--1) ��� �� 1: ���ο� �÷��� �߰��ϱ�
CREATE TABLE DEPT6
AS
SELECT DCODE, DNAME
FROM DEPT2
WHERE DCODE IN ( 1000, 1001, 1002 );

SELECT * FROM DEPT6;

ALTER TABLE DEPT6
ADD ( LOC VARCHAR2(10) );

SELECT * FROM DEPT6;

--�⺻�� �����Ͽ� �߰��ϱ�
ALTER TABLE DEPT6
ADD ( LOC2 VARCHAR2(10) DEFAULT '����' );

SELECT * FROM DEPT6;

--2) ��� �� 2: ���̺��� Į�� �̸� �����ϱ�
ALTER TABLE DEPT6 RENAME COLUMN LOC2 TO AREA;

RENAME DEPT6 TO DEPT7 ;

--SELECT * FROM DEPT6 �� ���� DEPT7 �� ����
SELECT * FROM DEPT7;

--3) ��� �� 3: Į���� ������ ũ�⸦ �����ϱ�
ALTER TABLE DEPT7
MODIFY ( DCODE VARCHAR2(10) );
-- VARCHAR2(6) -> VARCHAR2(10) ���� ����

--CONSTRATINS : ��������
--4)��� �� 4: Į�� �����ϱ�
ALTER TABLE DEPT7 DROP COLUMN LOC;

ALTER TABLE DEPT7 DROP COLUMN LOC CASCADE CONSTRAINTS;
--> CASCADE CONSTRAINTS; �ٸ���  �ɷ�������  ����Ŵ�

ALTER TABLE DEPT DROP COLUMN DEPTNO;
--�����ϴ� ���̺�(CHILD TABLE)�� ���� ���������� �����Ǿ����� ���̺�(PARENT TABLE)DMF
--�����Ϸ��� CASCADE CONSTRATINS �ɼ��� �߰��� ����ؾ� �Ѵ�.

--5) �б� ���� ���̺�� �����ϱ� = 11g NEW FEATURE
CREATE TABLE T_READ
( NO NUMBER, 
 NAME VARCHAR2(10) );
 
 INSERT INTO T_READ
 VALUES (1, 'AAA');
 
 SELECT * FROM T_READ;
 
 ALTER TABLE T_READ READ ONLY;  -- <- �б��������� �����մϴ�.
-- �б� �������� ����� ���̺� ������ �Է� �õ��� -> �ȵȴ�. READ ONLY �� �����ؼ�.
INSERT INTO T_READ
VALUES (2, 'BBB');

--�б��������� ����� ���̺� �÷� �߰� �õ���
ALTER TABLE T_READ
ADD ( TEL NUMBER DEFAULT 111);

ALTER TABLE T_READ READ WRITE; 
--�б� ���� ���� ������
INSERT INTO T_READ VALUES(1, 'AAA');

ALTER TABLE T_READ READ ONLY;
DROP TABLE T_READ;
--�б��������� ������ ������

--3. TRUNCATE ���
TRUNCATE TABLE DEPT7;

--4. DROP ���
DROP TABLE DEPT7;

SELECT * FROM TAB;
--DROP TABLE AAA PURGE;
--����Ŭ 10G���ʹ� �� ��ɾ�� ���̺��� ������ ��� ���̺��� �����Ǵ� �� �ƴ϶�
--���������� �������� �ȴ�.
--������ ���̺��� �̸��� BIN$...�� ����ȴ�. �� ����� ������������� �Ұ�

--6. ������ ��ųʸ�(DICTIONARY)
SELECT * FROM DICTIONARY;
SELECT * FROM DICT;

SELECT TABLE_NAME FROM USER_TABLES;

SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

SELECT * FROM DBA_TABLES;

SELECT * FROM DBA_USERS WHERE USERNAME = 'KIC';

SELECT * FROM USER_INDEXES;

SELECT * FROM USER_IND_COLUMNS;

--FOREIGN �ܺ�Ű
--2. �� ���� ������ ���� ���
--1) ���̺� ���� ���ÿ� �����ϱ�
CREATE TABLE EMP3
( NO NUMBER(4)
        CONSTRAINT EMP3_NO_PK PRIMARY KEY,
  NAME VARCHAR2(10)
        CONSTRAINT EMP3_NAME_NN NOT NULL,
  JUMIN VARCHAR2(13)
        CONSTRAINT EMP3_JUMIN_NN NOT NULL
        CONSTRAINT EMP3_JUMIN_UK UNIQUE,
  AREA NUMBER(1)
        CONSTRAINT EMP3_AREA_CK CHECK (AREA < 5 ),
  DEPTNO VARCHAR2(6)
        CONSTRAINT EMP3_DEPTNO_FK REFERENCES DEPT2(DCODE) 
  );
  
--������� �����ϱ�, Ű�� ������ ��
CREATE TABLE EMP4
( NO NUMBER(4) PRIMARY KEY,
NAME VARCHAR2(10) NOT NULL,
JUMIN VARCHAR2(13) NOT NULL UNIQUE,
AREA NUMBER(1) CHECK ( AREA < 5 ),
DEPTNO VARCHAR2(6) REFERENCES DEPT2(DCODE)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP3';
--���̺� �̸��� �׻� �빮�ڷ� ����Ѵ�.

--2) ���̺� ���� �� �߰��ϱ� / NULL <-> NOT NULL ������
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NAME_UK UNIQUE(NAME);

ALTER TABLE EMP4
ADD CONSTRAINT EMP4_AREA_NN NOT NULL(AREA);
--> ��������. ADD�� �ϸ� �ȵȴٴ� ���� 

ALTER TABLE EMP4
MODIFY ( AREA CONSTRAINT EMP4_AREA_NN NOT NULL );

--FOREIGN KEY �߰��ϱ�
--EMP4 ���̺��� NO �÷��� EMP2 ���̺��� EMPNO �÷��� ���� �����ϵ���
--����Ű ���� ������ �����ϼ���.
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NO_FK FOREIGN KEY(NO)
REFERENCES EMP2(EMPNO) ;

--FOREIGN KEY �߰��� ���� ����
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NAME_FK FOREIGN KEY(NAME)
REFERENCES EMP2(NAME);

ALTER TABLE EMP2
ADD CONSTRAINT EMP2_NAME_UK UNIQUE(NAME);
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NAME_FK FOREIGN KEY(NAME)
REFERENCES EMP2(NAME) ON DELETE CASCADE;
--�θ� ���̺� Į���� UNIQUE�� PK Į���̾�� ��.

SELECT * FROM EMP4;

DROP TABLE EMP4;

CREATE TABLE EMP4
 ( NO NUMBER(4) PRIMARY KEY,
   NAME VARCHAR2(10),
   JUMIN VARCHAR2(13) NOT NULL UNIQUE,
   AREA NUMBER(1) CHECK ( AREA < 5 ),
   DEPTNO VARCHAR2(6) REFERENCES DEPT2(DCODE)
   );
   
SELECT * FROM EMP4;

--EMP2 TABLE�� NAME�� UNIQUE ������ �����Ѵ�
ALTER TABLE EMP2
ADD CONSTRAINT EMP2_NAME_UK UNIQUE(NAME);

--EMP4 TABLE ON DELETE CASCADE; �����Ѵ�
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NAME_FK FOREIGN KEY(NAME)
REFERENCES EMP2(NAME) ON DELETE CASCADE;

--EMP4 TABLE FOREIGN KEY ����
ALTER TABLE EMP4
DROP CONSTRAINT EMP4_NAME_FK;

--EMP4 TABLE ON DELETE SET NULL; �����Ѵ�
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NAME_FK FOREIGN KEY(NAME)
REFERENCES EMP2(NAME) ON DELETE SET NULL;

SELECT * FROM EMP2;
SELECT * FROM EMP4;
--EMP2�� NAME���� ����� �̸��� �Է� ������.
INSERT INTO EMP4 VALUES(112, '11111', 112 ,1, 1000);
INSERT INTO EMP4 VALUES(111, '������', 111, 1, 1000);
INSERT INTO EMP4 VALUES(112, '������', 112 ,1, 1000);
DELETE FROM EMP2 WHERE NAME = '������';
--> ������ �̸��� NULL�� ��. ������ DELETE SET NULL�� �ؼ�.


SELECT a.table_name  "Child_Table",
c.column_name  "Child_Column",
a.constraint_name  "Child_Cons_name",
b.table_name  "Parent_Table" ,
a.r_constraint_name  "Parent_Cons_name" ,
d.column_name  "Parent_Column"
FROM  user_constraints  a , user_constraints  b , user_cons_columns  c,
            (SELECT constraint_name, column_name, table_name
FROM  user_cons_columns) d
WHERE  a.r_constraint_name=b.constraint_name
AND    a.constraint_name=c.constraint_name
AND    a.r_constraint_name=d.constraint_name
AND    a.constraint_type='R' ;


--5) �������� �����ϱ�
ALTER TABLE EMP4
DROP CONSTRAINT EMP4_NAME_FK;


--1. �ε���
--(1)UNIQUE INDEX
--CREATE UNIQUE INDEX �ε�����
--ON ���̺��̸�(�÷���1 ASC | DESC, �÷���....)
CREATE UNIQUE INDEX IDX_DEPT2_DNAME
ON DEPT2(DNAME);

INSERT INTO DEPT2
VALUES(9100, '�ӽø���', 1006, '��������');
SELECT * FROM DEPT2;
--�Ʒ��� ����
INSERT INTO DEPT2
VALUES(9101, '�ӽø���', 1006, '�λ�����');
--����ũ �ε����� ����ũ ���� ���ǰ� �����ϴ�. �� �ߺ��Ǵ� ���� �Է��� �� ����.

--(2)NON UNIQUE INDEX 
--CREATE INDEX �ε�����
--ON ���̺��(�÷���1 ASC | DESC, �÷���2, .....);
CREATE UNIQUE INDEX IDX_PROF_POSITION
ON PROFESSOR(POSITION) ;
--������ ����
CREATE INDEX IDX_PROF_POSITION
ON PROFESSOR(POSITION DESC);

--(5) ���� �ε��� (COMPOSITE INDEX) ��ǾȾ��°� ����. �����ս� ������ ���� �־.

--5 �ε����� ���ǻ���
--1) DML�� ����ϴ�
--(1) INSERT-  INDEX SPLIT ����
--(2) DELETE - �ε��� ������ ������ �ȵ�
--(3) UPDATE- DELETE + INSERT �۾��� �߻���
--2) Ÿ SQL ���࿡ �ǿ����� �� �� �ִ�.

--6.�ε��� ���� ���
--1) �ε��� ��ȸ�ϱ�
SELECT TABLE_NAME, INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'DEPT2';


--VIEW
--2.�ܼ� VIEW
--�������� 1:
--PROFESSOR ���̺��� PROFNO, NAME, EMAIL, HPAGE �÷��� ����ϴ� VIEW�� �����ϼ���
--VIEW �̸��� V_PROF_�� �ϼ���
CREATE OR REPLACE VIEW V_PROF
AS
SELECT PROFNO, NAME, EMAIL, HPAGE
FROM PROFESSOR;
SELECT * FROM V_PROF;

--2.���� VIEW(COMPLEX VIEW)
--���� ���� 2:
--PROFESSOR ���̺�� DEPARTMENT ���̺��� �����Ͽ� ������ȣ�� �����̸��� �Ҽ��а� �̸���
--��ȸ�ϴ� VIEW�� �����ϼ��� VIEW �̸��� V_PROF_DEPT�� �ϼ���
CREATE OR REPLACE VIEW V_PROF_DEPT
AS
SELECT P.PROFNO "������ȣ===",
            P.NAME "������",
            D.DNAME "�Ҽ��а���"
      FROM PROFESSOR P, DEPARTMENT D
    WHERE P.DEPTNO = D.DEPTNO;

SELECT * FROM V_PROF_DEPT;


--�ζ��κ�
--��������1:
--STUDENT ���̺�� DEPARTMENT ���̺��� ����Ͽ� �а����� ���� Ű�� ū �л�����
--�ִ� ������, �а��̸��� ����ϼ���.
SELECT D.DNAME "�а���",
           S.MAX_HEIGHT "�ִ�Ű",
           S.MAX_WEIGHT "�ִ������"
FROM ( SELECT DEPTNO1, MAX(HEIGHT) MAX_HEIGHT, MAX(WEIGHT) MAX_WEIGHT
            FROM STUDENT
            GROUP BY DEPTNO1 ) S, DEPARTMENT D
WHERE S.DEPTNO1 = D.DEPTNO;

SELECT * FROM STUDENT;

--INLINE VIEW �������� 1:
--STUDENT ���̺�� DEPARTMENT ���̺��� ����Ͽ� �а����� ���� Ű�� ū �л����� �̸��� Ű,
--�а��̸��� �Ʒ��� ���� V_STU01 VIEW�� ���弼��
CREATE OR REPLACE VIEW V_STU01
AS
SELECT D.DNAME, S.HEIGHT, S.NAME, S.HEIGHT
FROM STUDEMT S, DEPARTMENT D
WHERE S.DEPTNO1 = D.DEPTNO
AND S.HEIGHT = ( SELECT MAX(HEIGHT) FROM STUDENT WHERE S.DEPTNO1 = DEPTNO1 ;


--INLINE VIEW �������� 2:
--STUDENT ���̺��� �л��� Ű�� �����г��� ��� Ű ���� ū �л����� �г�� �̸��� Ű, �ش� �г��� ��� Ű�� ����ϴ�
--V_STU01 VIEW �����ϼ���(�г� �÷����� �������� �����ؼ� ����ϼ���.
CREATE OR REPLACE VIEW V_STU01
AS
SELECT GRADE, NAME, HEIGHT,
ROUND((SELECT AVG(HEIGHT) FROM STUDENT S2
WHERE S2.GRADE = S.GRADE),1) "���"
FROM STUDENT S
WHERE S.HEIGHT > (SELECT AVG(HEIGHT) FROM STUDENT S2
WHERE S2.GRADE = S.GRADE ) ORDER BY 1;
SELECT * FROM V_STU01;



--SEQUENCE(������)
--��뿹��:
--�Ʒ��� �������� ��ǰ �ֹ���ȣ�� �����ϱ� ���� ����� SEQUENCE�� ���弼��
--���۹�ȣ : 1000
--����ȣ : 1010
--������ : 1
--�ݺ��ǰ� ĳ���� 2���� �ǵ��� �ϼ���
CREATE SEQUENCE SEQ_JUMUN_NO
INCREMENT BY 1
START WITH 1000
MAXVALUE 1010
MINVALUE 990
CYCLE
CACHE 2;

--1) SEQUENCE ���� �� �ɼ� Ȯ���ϱ�
CREATE TABLE JUMUN
(J_NO NUMBER(4),
J_NAME VARCHAR2(10));
--������ ���̺� ����
INSERT INTO JUMUN
VALUES ( SEQ_JUMUN_NO.NEXTVAL,'AAAA');
SELECT * FROM JUMUN;

--NEXTVAL : ������
--CURRVAL : ���簪
SELECT SEQ_JUMUN_NO.CURRVAL FROM DUAL;
SELECT SEQ_JUMUN_NO.NEXTVAL FROM DUAL;

INSERT INTO JUMUN
VALUES(SEQ_JUMUN_NO.NEXTVAL,'BBBB');
SELECT * FROM JUMUN;

SELECT SEQ_JUMUN_NO.CURRVAL FROM DUAL;

--2) ���� �����ϴ� SEQUENCE ���� �� ����ϱ�
CREATE SEQUENCE S_REV
INCREMENT BY -1
MINVALUE 0
MAXVALUE 10
START WITH 5;

SELECT S_REV.CURRVAL FROM DUAL;
--> ó�� �������� ����� CURRVAL�� �θ��� ���� ����.
SELECT S_REV.NEXTVAL FROM DUAL;


--SEQUENCE ��ȸ �� �����ϱ�
COL �̸� FOR A15;
SELECT SEQUENCE_NAME "�̸�",
            MIN_VALUE "MIN ��",
            MAX_VALUE "�ִ밪",
            INCREMENT_BY "������",
            CYCLE_FLAG "CYCLE?",
            ORDER_FLAG "����",
            CACHE_SIZE "ĳ�̰�",
            LAST_NUMBER "������������"
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_JUMUN_NO';

ALTER SEQUENCE SEQ_JUMUN_NO
MAXVALUE 1100
CACHE 5;

DROP SEQUENCE SEQ_JUMUN_NO;


--2. SYBONYM(���Ǿ�)
--2.SYNONYM(���Ǿ�)

CREATE SYNONYM E2 FOR EMP2;
SELECT * FROM E2;
-->EMP2�� E2�� �θ� ��.
CREATE PUBLIC SYNONYM D2 FOR DEPARTMENT;
--PUBLIC �� �ٸ� ���������� �θ� �� �ְ� �ϴ� ��
--KIC ������� DEPARTMENT ���̺� ���Ǿ D2�� �����ϸ� ��� ����ڰ� ��� �� �� �ְ� ����.
SELECT * FROM E2;
SELECT * FROM D2;

--SYNONYM �����ϱ�
DROP SYNONYM E2;

--ROLE �����ϱ� (SYSTEM USER) CMD���� SQLPLUS���� �ؾߵ�.
--1)ROLE �����ϱ�
CREATE ROLE TROLE;

--2) ROLE�� CREATE SESSION, CREATE TABLE ���� �Ҵ��ϱ�
GRANT CREATE SESSION, CREATE TABLE TO TROLE;

--3) TROLE �Ҵ��ϱ�
GRANT TROLE TO KIC;

4) � ����ڰ� � ROLE�� ����ϴ��� Ȯ���ϱ�
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'KIC';



create table members
(m_name varchar2(20),
m_num number(3),
grade number(1),
address varchar2(20),
tel varchar(15),
age number(3),
sex varchar(2));
desc members;

create table books
(no number(10),
genere varchar2(10),
b_name varchar(100),
b_author varchar2(100),
b_pub varchar2(100),
b_year number(5),
b_total number(5));

create table rent
(m_num number(3),
st_date date,
due_date date,
fin_date date,
no number(10));

select * from rent;




--
--1. �� �μ��� ���� �ٹ����� ����� ����Ͻÿ�.
--����1 : 10�� �μ��� ����
--����2 : �޿��� 1000���� �̸� ������ ����
--������� : ���, ������, �޿�, �μ���ȣ, �μ���, job
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT E.DEPTNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, E.JOB
FROM EMP E, DEPT D
WHERE NOT E.DEPTNO IN ('10')
AND E.SAL > 1000 ;

WHERE DEPTNO NOT IN('10');
AND SAL >1000;

--Having�� ����ϱ�
--��� �޿��� 350�̻��� �μ��� �μ���ȣ�� ��ձ޿��� ���ϼ���
select deptno, avg(nvl(pay,0)) 
from professor
where avg(pay) >=350
group by deptno;
select deptno, avg(nvl(pay,0)) ���
from professor
group by deptno
having avg(nvl(pay,0)) >=350;

--2)
SELECT * FROM EMP2;




--4)
SELECT * FROM DEPT;

create table DEPT
(
DEPTNO NUMBER(2,0),
DNAME VARCHAR2(14),
LOC VARCHAR2 (13)
);

DROP TABLE DEPT1234 [CASCADE CONSTRAINT];

DROP TABLE DEPT1234;

--7. emp ���̺��� ����Ͽ� �μ��� �޿� ���(�����2 ,000 �̻�)�� ���Ͻÿ�.
SELECT * FROM EMP;
SELECT DEPTNO, TO_CHAR(AVG(SAL),'9999.99')
FROM EMP
GROUP BY DEPTNO
having avg(SAL) > 2000
ORDER BY 1;


select EMP �μ�, round(avg(nvl(pay,0))) �޿����
from EMP
group by EMP;


--EMP2 ���̺��� ��ȸ�ؼ� ���� �� �߿��� �ڽ��� ������ ��տ����� ���ų� ���� �޴� �������
--�̸��� ����, ���� ������ ����ϼ���.
SELECT NAME ����̸�, POSITION ����, PAY �޿�
FROM EMP2 A 
WHERE PAY >= (SELECT AVG(PAY) 
              FROM EMP2
               WHERE A.POSITION = POSITION);
               
���η� �ٲ��
--emp ���̺�� ��� �������� ������ ���� �������� ��� ����ϴ� vtest��� �� ������ �ۼ��Ͻÿ�.
SELECT * FROM EMP;

CREATE OR REPLACE VIEW vtest AS
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP E
WHERE SAL >= (SELECT AVG(SAL) FROM EMP);

SELECT * FROM VTEST;

CREATE OR REPLACE VIEW vtest AS
SELECT m.m_num num, b.genere genere, count(genere) count
FROM members m, books b, rent r
WHERE m.m_num=r.m_num AND b.NO=r.NO
GROUP BY m.m_num, genere;
SELECT * FROM view_1
ORDER BY 1;


--9. emp ���̺� ���� �÷��� ename�� , not NULL ���� �ϴ� ���� �ϴ� sql�� �ۼ��ϼ���
SELECT * FROM EMP;


ALTER TABLE EMP RENAME COLUMN ename TO 'not NULL';


ALTER TABLE EMP RENAME COLUMN ENAME TO "NOT NULL";



--10. gogak , gift table �� �̿��Ͽ� ������ �ִ� ����ǰ ����Ʈ�� �Ʒ��� ���� ����Ʈ �ϼ���

SELECT * FROM GOGAK;
SELECT * FROM GIFT;
SELECT G.GNAME, GI.GNAME
FROM GOGAK G, GIFT GI;
GROUP BY G.GNAME;
WHERE G.POINT BETWEEN GI.G_START AND GI.G_START AND GI.G_END;


SELECT G1.GNAME, G2.GNAME
FROM GOGAK G1, GIFT G2
WHERE G1.POINT >= G2.G_START;

SELECT * FROM GOGAK;
SELECT * FROM GIFT;
--SELECT G1.GNAME, POINT, LISTAGG(G2.GNAME, ',') WITHIN GROUP (ORDER BY G2.GNAME)
--SUBSTR (
-- XMLAGG(
-- XMLELEMENT(COL , ',' , G2.GNAME) ORDER BY ST).EXTRACT().GETSTRINGVAL(), 2)

SELECT G1.GNAME, POINT, LISTAGG(G2.GNAME, ',') WITHIN GROUP (ORDER BY G2.GNAME)
 FROM GOGAK G1, GIFT G2
 GROUP BY G1.GNAME
 WHERE POINT > G_START
 ORDER BY G1.GNAME;
 
 SELECT G1.GNAME AS GNAME, G1.POINT AS POINT,
 LISTAGG(G2.GNAME, ',') WITHIN GROUP (ORDER BY G2.GNAME) AS LISTAGG
 FROM GOGAK G1, GIFT G2
 WHERE G1.POINT >= G2.G_START
 ORDER BY 1;
 
 SELECT G1.GNAME AS GNAME, G1.POINT AS POINT,
G2.GNAME AS LISTAGG
 FROM GOGAK G1, GIFT G2
 WHERE G1.POINT >= G2.G_START
 ;
 
 
 
 
 
 
 

CREATE TABLE BRAND_INFO (
BRAND_NAME VARCHAR2(100),
STORE_NAME VARCHAR2(100),
AREA VARCHAR2(50),
ADDRESS VARCHAR2(100),
TEL num(50) 
);


CREATE TABLE BRAND_INFO (
BRAND_NAME VARCHAR2(100),
STORE_NAME VARCHAR2(100),
AREA VARCHAR2(50),
ADDRESS VARCHAR2(100),
TEL NUM(30)
);


drop table brand_info;
 
 
 CREATE TABLE BRAND_INFO (
BRAND_NAME VARCHAR2(100),
STORE_NAME VARCHAR2(100),
AREA VARCHAR2(50),
ADDRESS VARCHAR2(100),
TEL NUM(30)
);

CREATE TABLE BRAND_MENU 
BRAND_NAME VARCHAR2(100),
BRAND_MENU VARCHAR2(100),
PRICE NUM(50) ;

CREATE TABLE BRAND_MENU
(
BRAND_NAME VARCHAR(30),

);
drop table ex_table;




select id, pass from member;
desc member;

insert into member values ('admin2', '1111', 'aaaa', 1, '123', 'email', ' ');
commit;


select id, pass from member;
desc member;

insert into member values ('admin', '1111', 'aaaa', 1, '123', 'email', '');
commit;




drop table member;

create table member (
id varchar(20) primary key, 
pass varchar(20), 
name varchar(20), 
gender number(1), 
tel varchar(20), 
email varchar(50), 
picture varchar(200));


insert into member values ('11', '11', '���', 1, '010-1212', 'email1', 'img01.png');
insert into member values ('12', '11', '���ڹ�', 2, '010-1213', 'email2', 'img02.png');
insert into member values ('13', '11', '���ڹ�', 1, '010-1214', 'email3', 'img03.png');
insert into member values ('14', '11', 'ȫ�浿', 2, '010-1215', 'email4', 'img04.png');
insert into member values ('15', '11', '���ٹ�', 1, '010-1216', 'email5', 'img05.png');
insert into member values ('16', '11', '������', 2, '010-1217', 'email6', 'img07.png');
insert into member values ('admin', '11', '������', 1, '010-1218', 'email7', 'img09.png');
commit;
select * from member;



210404
select * from MEMBER_INF;
insert into member_inf values ('aaaaa', 'aaaaa', 'andyairis@gmail.com', '01066406060', '��������', '������', '31', 'NAVER');


