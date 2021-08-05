desc emp;
--select * 
--from emp;

select empno, ename, 'Very Good~' from emp;
select name, '교수님' from PROFESSOR;
select name, position, '반갑습니다 ' from PROFESSOR;
select ename, '님 반갑습니다 ' , hiredate from emp;

select name 교수이름, profno 교수번호 
   from professor;
select name "교수  이름", profno "교 수  번 호"  
   from professor;
select name as 교수이름, profno as "교수번호" 
  from professor;

select empno 사원번호, ename 사원명, job 직업 from emp;
select deptno 부서#, dname 부서명, loc 부서위치 from dept;

select name||position 교수 from professor;
SELECT name || ' 님은 ' || position || ' 입니다'
FROM professor ;


select name || '-' || position as 교수 from professor;
select name || '의 키는' || height || 'cm, 몸무게는' || 
           weight || 'kg 입니다.' 키와몸무게 from student;
           
select name||'('||position||'), '||name||''''||position||'''' 교수정보 
from professor;

select distinct deptno from professor;

select DISTINCT deptno1, deptno2 from student;

문제1 : 학생을 담당하는 지도교수번호를 출력하기
select distinct profno from student;

문제 2 : 현재 교수에 설정된 직급을 출력하기
select distinct position from professor;

select distinct profno from student;
select DISTINCT position from PROFESSOR;

select DISTINCT deptno1 from student;
 select name 이름, birthday 생년월일, height "키(cm)", weight "몸무게(kg)"
 from student;
 desc student;
select ''''||grade||' 학년 학생'||''''|| name from student;
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
where hiredate = '1990/6월/23';

select name, pay, hiredate from professor
where hiredate = '1990/jun/23';


--2일차 시작
select name, height from student
where height >=180;

--between연산자를 사용하여 student 테이블에서 몸무게가 60-80인 사람의 이름과 체중을 출력하세요
select name, weight from student
where WEIGHT BETWEEN 60 and 80;

--and를 이용한 BETWEEN 사용방법
select name, weight from student
where WEIGHT >= 60 and WEIGHT <=80;

--IN 연산자를 사용하여 student 테이블에서 101번 학과 학생과
--201번 학과 학생들을 모두 출력하세요
select name, deptno1 from student
where deptno1 in (101,201);

select name, deptno1 from student
where deptno1 = 101 OR deptno1 = 201;

--Like 연산자를 사용하여 student 테이블에서 성이"김"씨인 사람을 조회하세요
--%: 글자수 무관, 모든 글자 가능
--_: 글자수 1자, 모든 글자 가능
select name from student
where name like '%김';

select name from student
where name like '김%';

--2번째 글자가 '진'인 것을 찾는 방법
select name from student
where name like '_진';

--IS NULL / IS NOT NULL 연산자를 활용하기
--NULL은 정해지지 않아서 값을 모른다는 의미디아. 0과는 다르다.
select name, bonus from professor;


-- 놓쳤다 ㅋ 피피티보고 다시 할 것


--student 테이블을 사용하여 4학년 중에서 키가 170이상인 사람의 이름과 학년과 키를 조회하세요.
select name, grade, height
from student
where grade = 4
AND height > 170;

--student 테이블을 사용하여 1학년 이거나 또는 몸무게가 80 이상인 학생들의 이름과 키와 학년과 몸무게를 출력하세요
select name, grade, height, weight
from student
where grade = 1
OR weight > 80;

--student 테이블을 사용하여 2학년 중에서 키가 180보다 크면서
--몸무게가 70보다 큰 학생들의 이름과 학년과 키와 몸무게를 출력하세요.
--조건이 여러개이고 모두 만족하는 경우 AND를 여러번 쓰면 됩니다. ㅋ/
select name, grade, height, weight
from student
where grade = 2
and height > 180
and weight > 70;

--student 테이블을 사용하여 2학년 학생 중에서 키가 180보다 크거나 또는 몸무게가 70보다
--큰 학생들의 이름과 학년과 키와 몸무게를 출력하세요.
--and와 or 조건이 동시에 나올 경우에는 우선순위를 아주 조심하셔야 합니다. ㅋ\
select name, grade, height, weight
from student
where grade = 2 and (weight > 70 or height >180);
--괄호로 묶어야 함


--professor 테이블에서 교수들의 이름을 조회하여 성 부분에 '0'이 포함된 사람의
--명단을 아래와 같이 출력하세요
select name from professor
where name >='아' and name <'자'
order by 1;

--student 테이블 사용하여 1학년 학생의 이름과 키 추출하세요. 작은 순으로 나열/
select name, grade, height, weight
from student
where grade = 1
order by ?;

-- student 테이블을 사용하여 1학년 학생의 이름과 키와 몸무게를 출력하세요
--단 키는 작은 사람부터 출력하시고 몸무게는 많은 사람부터 출력하세요
select name, height, weight
from student
where grade = 1
order by height ASC, weight DESC;

--student 테이블을 사용하여 1학년 학생의 이름과 생일과 키와 몸무게를 출력하세요
--단 생일이 빠른 사람 순서대로 정렬하세요
select name, birthday, height, weight
from student
where grade = 1
order by  birthday;
--order by 2; 로 해도 됨. 2-> select 두번째 값 birthday를 의미함.


--칼럼의 별명을 사용할 정렬. 알리아스 사용?
--student 테이블을 사용하여 1학년 학생의 이름과 키를 출력하세요.
--단 이름을 오름차순으로 정렬하세요
select name "이름", height "키"
from student
where grade = 1
order by 이름;

--union 결합은 갯수가 같고 타입이 같아야 함.-> 컬럼의 갯수와 타입이 같아야 한다는 말
--union/union all -> 두 집합을 더합니다.
--student 테이블과 professor 테이블을 참조하여 101번 학과에 소속되어 있는 학생과
--교수들의 학번(교수님은 교수번호), 이름, 학과번호를 출력하세요.
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

--student 테이블에서 전공이 101번 학과 학생과 부전공이 201번 학과를 전공하는 학생들의
--이름을 출력하세여ㅛ
--정렬함/중복값 제거 후 출력
select name
from student
union
select name
from student
where deptno2 = 201;

--정렬 안함/중복값 모두 출력
select name
from student
where deptno1 = 101
union all
select name
from student
where deptno2 = 201

--INTERSECT 연산자 사용하기 -> 교집합 찾기
--student테이블을 사용하여 전공이 101번 학과와 부전공이 201번 학과를 복수전공하는
--사람의 이름을 출력하세요.
select name from student where deptno1 = 101
intersect
select name from student where deptno2 = 201;

--MINUS연산자 사용하기 -> 큰집합에서 작은 집합 빼기
--professor 테이블에서 전체 직원의 급여를 20%인상하기 위한 직워 명단을 출력하려 합니다.
--단 직급이 전임강사인 사람들은 명단에서 제외하세요.
select name, position from professor
minus
select name, position from professor
where position = '전임강사';

--칼럼의 갯수가 다를 경우 에러 발생함
--첫번째 select절은 2개의 칼럼인데 두번째 select 절은 1개의 칼럼.-> 칼럼의 갯수가 달라서
--에러발생.ㅋ
select studno, name
from student
union
select profno
from professor;
select studno, nama

--비교되는 칼럼끼리의 데이터 타입이 다를 경우 에러
--첫번째 select 와 두번째 select의 데이터 타입이 서로 다를 경우 에러가 발생한다. ㅋ
select studno, name
from student
union
select name, profno
from proffesor;

--INITCAP함수
--첫글자만 대문자로 출력하고 나머지는 전부 소문자로 출력하는 함수
--문법 : INITCAP(문자열 또는 컬럼명)
--emp테이블을 사용하여 부서가 10번인 사원의 이름을 첫글자만 대문자로 출력하세요
select initcap(ename) from emp
where deptno = 10;

--lower함수: 입력되는 값을 전부 소문자로 변경하여 출력합니다.
--문법: LOWER(문자열 또는 컬럼명)
select lower('Pretty girl')from dual;

--upper함수: 입력되는 값을 전부 대문자로 변경하여 출력합니다.
--문법: UPPER(문자열 또는 컬럼명)
select upper('Pretty girl')from dual;

--LENGTH/LENGTHB 함수: 입력된 문자열의 길이를 (바이트 수를)계산해주는 함수입니다.
--문접: LENGTH(컬럼 또는 문자열) /LENGTHB(컬럼 또는 문자열)
--student 테이블에서 id가 9글자 초과인 학생들의 이름과 id와 글자수를 출력하세요.
select name 이름, id, length(id) 글자수
from student
where length(id) > 9;

--student 테이블에서 1전공이 201번인 학생들의 이름과 이름의 글자수, 이름의 바이트 수를 출력하세요
--express 버전에서는 한글이 3바이트 이다. old 버전에서는 2바이트 사용함 ㅋ.
select name, length(id), length(b)
from student;
--//틀림

--CONCAT함수(||연산자와 동일한 기능이다.)
--문법 : CONCAT('문자열1','문자열2')
--professor 테이블에서 전공이 101인 교수들의 이름과 직급을 출력하세요
select concat(name,position) from professor 
where deptno = 101;

--교수 table에서 name,position 안녕하세요 라고 프린트 하세요
--concat보다 pipeline이 편하다
select concat(name,concat(position,'안녕하세요'))
from professor;

--substr 함수
--문자열에서 특정길이의 문자를 추출할 때 사용하는 함수
--문법: substr('문자열' 또는 칼럼명, 1,4)
select substr('ABCDE',2,3)
from dual;

select substr('ABCDE',-2,3)
from dual;

--student테이블에서 jumin 컬럼을 사용해서 전공이 101번인 학생들의 이름과 생년월일을 출력하세요
select name, substr(jumin,1,6) 생년월일 
from student
where deptno1 = 101;

--Student 테이블에서 jumin 컬럼을 사용해서 태어난 달이 8월인 사람의 이름과 생년월일을 출력하세요
select name, substr(jumin,1,6) 생년월일
from student
where substr(jumin,3,2)='08';


--SUBSTRAB 함수
--이 하수는 SUBSTR 함수와 문법은 동일하며 차이점은 추출할 자리수가 아니라 
--추출할 바이트 수를 지정함

--INSTR 함수
--주어진 문자열이나 칼럼에서 특정 글자의 위치를 찾아주는 함수
--문법 : INSTR('문자열'또는 컬럼, 찾는 글자, 시작위치, 몇번째인지(기본값은 1))
select instr('A*B*C*','*',1,2)
from dual;

select instr('A*B*C*','*',3,2)
from dual;

--시작위치를 -(마이너스)로 줄 경우
select instr('A*B*C*','*',-4,1)
from dual;

select instr('A*B*C*','*',-4,2)
from dual;

select INSTR('A*B*C*','*',-2,2)
from dual;

--문자함수 퀴즈1)
--student 테이블을 참조해서 아래 화면과 같이 전공이(deptno1 컬럼) 101번인 학생의 이름과
--전화번호와 지역번호를 출력하세요. 단 지역번호는 숫자만 나와야 합니다.
select name, tel, substr(tel, 1, instr(tel, ')')-1)지역번? 
from student
where deptno1 = 101;

--
--문법 : LPAD('문자열'또는 컬럼명, 자리수, 제거할 문자?)
SELECT LPAD(name, 10,'*') 
from student;

select rpad(name, 10, '*') 
from student;


--LPAD, RPAD 함수는 채우는 함수이고, LTRIM RTRIM 함수는 제거하는 함수이다.
--문법: LTRIM('문자열' 또는 컬럼명, '제거할 문자')
--LTRIM('문자열' 또는 컬럼명, '제거할 문자')
--

--RTRIM함수
--문법:RTRIM('문자열' 또는 컬럼명, '제거할 문자')
--Dept2 테이블에서 dname을 출력하되 오른쪽 끝에 '부'라는 글자는 제거하고 출력하세요
select RTRIM(dname, '부')
from dept2;



--replace 함수
--문법: replace('문자열' 또는 컬럼명, '문자1', '문자2')
-- 학생들의 이름을 출력하되 성 부분은 '#'으로 표시되게 출력
select replace(name, substr(name,1,1),'#') 
from student
where deptno1 = 101;

--student 테이블에서 전공(deptno1)이 101번인 학생들의 이름을 출력하되
-- 가운데 글자만 '#'으로 표시되게 출력하세요
select replace(name, substr(name,2,1),'#') replace
from student
where deptno1 = 101;


--student 전공(deptno1)이 101번인 학생들의 이름과 주민번호를 출력하되
--주민번호의 뒤 7자리는 '*'로 표시되게 출력
select name, replace(jumin, substr(jumin,7,7),'******')jumin
--jumin(repalce(jumin, substr(jumin 7, 12, '*')))
from student
where deptno1 = 101;


--student 테이블에서 전공이 101번인 학생들의 이름과 전화번호,
--전화번호에서 국번부분만 '*'처리하여 출력하세요/
select name replace(tel, substr(tel,3,3), '***')tel
from student
where deptno1 = 101;

select name, substr(tel, 1, instr(tel, ')'))||'***'
||substr(tel, instr(tel,'-')) tel
from student
where deptno1 = 101;

--ROUND함수 -> 자리 수에 주의할 것
--문법: round(숫자, 원하는 자리수)
select round(12.345),
round(12.345,2),
round(12.345,-1) 
from dual;

--TRUNC 함수
--문법:TRUNC(숫자, 원하는 자리수)
select trunc(12.345),
trunc(12.345,2),
trunc(12.345,-1)
from dual;

--MOD, CEIL, FLOOR 함수
select mod(12,10),
ceil(12.345),
floor(12.345)
from dual;

--POWER함수
--문법:POWER(숫자1, 숫자2)
select power(3,2)
from dual;

select sysdate from dual;
--alter session set NLS_DATE_FORMAT='YYYY-MM-DD:HH24:M1:SS';
select sysdate from dual;

--MONTHS_BETWEEN 함수(두 날짜 사이의 개월 수 계산)
select months_between('2021-02-05', '1991-01-13')
from dual;
--2월은 일수가 달라도 반환 값은 같습니다.


--MONTH_BETWEEN과 전통적인 방법의 차이 -> 오차가 생긴다는 의미?
select name, sysdate,hiredate,
round(Months_between(sysdate,hiredate),2)date_1,
round(((sysdate-hiredate)/31),2)date2
from professor
where deptno = 101;

--ADD_MONTHS
select sysdate, add_months(sysdate, 3)
from dual;

--NEXT_DAY
select '20/02/05',next_day('20/02/05', '월요일')
from dual;
select sysdate,next_day(sysdate,'월요일')
from dual;
select sysdate,next_day(sysdate,'월')
from dual;

--LAST_DAY
select sysdate, last_day(sysdate)
from dual;
select last_day('2020-02-05')
from dual;

--날짜의 round, trunc 함수
select sysdate, round(sysdate),trunc(sysdate)
from dual;
select round(sysdate,'year'),round(sysdate,'month')
from dual;

--형 변환 함수
--묵시적(자동)형 변환
select 1+ '1'
from dual;


select 1 + to_number('1') from dual;


--에러
select 1+ 'A' 
from dual;
select 1 + 'A' from dual;

--
--TO_CHAR함수(날짜를 문자로 형변환하기
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


--게시판 문제
--(1)
select empno, ename, sal
from emp
where deptno =10;

--(2)
select ename, hiredate, deptno
from emp
where empno = 7369;

--(3)
SELECT EMPNO AS 사원번호, ENAME AS 이름, JOB AS 직무,
MGR AS 매니저,HIREDATE AS 입사일,SAL AS 급여,
COMM AS 커미션,DEPTNO AS 부서번호 
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
EMPNO AS 사원번호, ENAME AS 이름, JOB AS 직무, MGR AS 매니저,
HIREDATE AS 입사일, SAL AS 급여, COMM AS 커미션, DEPTNO AS 부서번호
FROM EMP
WHERE JOB <> 'MANAGER';

select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp
where job <> 'MANAGER';

--(6)
SELECT 
EMPNO AS 사원번호, ENAME AS 이름, JOB AS 직무, MGR AS 매니저,
HIREDATE AS 입사일, SAL AS 급여, COMM AS 커미션, DEPTNO AS 부서번호
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
EMPNO AS 사원번호, ENAME AS 이름, JOB AS 직무, MGR AS 매니저,
HIREDATE AS 입사일, SAL AS 급여, COMM AS 커미션, DEPTNO AS 부서번호
FROM EMP
WHERE DEPTNO = 20;

select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp
where deptno >= 20;

--(9)
SELECT 
EMPNO AS 사원번호, ENAME AS 이름, JOB AS 직무, MGR AS 매니저,
HIREDATE AS 입사일, SAL AS 급여, COMM AS 커미션, DEPTNO AS 부서번호
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
sal+comm as 총액
from emp
where comm is not null order by(sal+comm)desc;

--(21)
select ename, sal,
(sal*1.13) as bonus
from emp
where deptno = 10;

--(22)
select ename, deptno, sal,
(sal*12)as 연봉,
(sal*1.5)as 보너스
from emp
where deptno = 30;

--(23)
select ename, sal,
round(((sal/12)/5),1) as "시간당 임금", deptno
from emp
where deptno = 20;

--(24)
select ename, sal,
trunc(sal*0.15) as 회비, deptno 
from emp
where sal between 1500 and 3000;

--(25)
select ename, sal,
trunc(sal*0.15) as 경조비, deptno
from emp
where sal >= 2000;

--(26)
select ename, sal,
trunc(sal*0.9) as 실수령액, deptno
from emp
order by sal desc;



--
--MM : 월을 숫자 2자리로 표현합니다.
--MON : 월을 뜻하는 영어 3글자로 표시합니다.
--MONTH : 월을 뜻하는 영어 이름 전체를 표시합니다.
select to_char(sysdate, 'MM') MM,
to_char(sysdate, 'MONTH') MONTH,
to_char(sysdate, 'MON') mon from dual;

select to_char(sysdate, 'mon', 'nls_date_language = japanese') 
as japan from dual;

--dd : 일을 숫자 2자리료 표시합니다.
select to_char(sysdate, 'dd') dd,
to_char(sysdate, 'day') day,
to_char(sysdate, 'ddth') ddth from dual;

--시간 : HH24 - 하루를 24시간으로 표시합니다.
--hh : 하루를 12시간으로 표시합니다.
--분 : mi로 표시합니다.
--초 : ss로 표시합니다.
select sysdate, 
to_char(sysdate, 'yyyy-mm-dd:hh24:mi:ss')
from dual;

--student 테이블의 birthday 칼럼을 참조하여 생일이 3월인 학생의 이름과 birthday를 출력하세요.
select name, to_char(birthday, 'dd-mon-yy')
from student
where to_char(birthday, 'mm')='03';

--오라클에서는 날짜의 표현식이나 기본 포멧이 굉장히 중요하다.
--2가지방식이 있는데
--세션자체를 바꿔서 하는 방식(alter session 같은 거), to_char to_date 같은 걸로 쿼리만 실행되게 하는 방식

--professor 테이블을 참조하여 101번 학과 교수들의 이름과 연봉을 출력하세요.
--단 연봉은 (pay*12)+bonus로 계산하시고 천 단위 구분기호로 표시하세요.
select name, to_char((pay*12)+bonus, '99,999') 연봉
from professor where deptno = 101;

--문자 type을 숫자 type으로 변경
select '1' + 1 from dual; 
--위에거는 문자타입이긴 하지만 숫자가 들어가있으니 오라클이 서비스해줘서 가능한 것 원래는 안됨
select '23,444'+1 from dual; 
---> ,가 있어서 문자타입으로 인식? 그래서 위에거는 오류
select to_number('23,444','999,999')+1
from dual;

--TO_DATE 함수, date에서 바로 number로 가는 건 없다.
--to date, to number는 캐릭터에서 date, number로 간다는 뜻
select to_date('2021/01/13','yyyy:mm:dd')+1 from dual;

--문자를 날짜type으로 변경
select to_date('2021/3월/01', 'yyyy:mon:dd') from dual;
select to_date('2121/03/01', 'yyyy:mm:dd') from dual;
select to_date('2121/3월/01', 'yyyy:mm:dd') from dual;
select to_date('21210301', 'uuuu:mm:dd') from dual;
select to_date('210301', 'yyyy:mm:dd') from dual;
select to_date('210301', 'yyyy:mm:dd') from dual;
select to_date('20210301', 'yyyy:mm:dd') from dual;

--자료 입력 테스트 to_date에 관한 내용
create table sss(ddd date);
insert into sss values (to_date('2121.01.13', 'yyyy/mm/dd'));
insert into sss values ('2021.12.25');
insert into sss values ('2021.3월.01'); -> 에러
insert into sss values (to_date('2021.3월.01', 'yyyy/mon/dd'));
select*from sss;

--형변환 함수 퀴즈2
--professor 테이블을 사용하여 2000년 이전에 입사한 교수명과 입사일,
--현재연봉과 10% 인상 후 연봉을 출력하세요. 연봉은 상여금(bonus)를 
--제외한 (pay*12)로 계산하고 연봉과 인상 후 연봉은 천 단위 구분 기호를
--추가하여 출력하세요.
select name, to_char(hiredate, 'yyyy-mm-dd') as 입사일, to_char((pay*12)+bonus, '99,999') 연봉,
to_char((pay*12)*1.1, '99,999') 인상후
from professor where hiredate < '20000101';

--교수파일에서 이번달이 입사일의 월과 같은 경우
--교수의 이름, 입사일, 급여를 10%추가하여 프린트한다.
select name, hiredate 입사일, pay 월급, pay*1.1 특별급여
from professor 
where to_char(hiredate, 'mm')=to_char(sysdate, 'mm');

--professor 테이블에서 101번 학과 교수들의 이름과 급여, bonus 연봉을
--출력하세요. 단 연봉은(pay*12+bonus)로 계산하고 bonus가 없는 교수는
--0으로 계산하세요 음 좀 이상해서 다시 해보고 문의. 선생님 답변에 보너스 null로 나옴. 그게 맞는건가?
select name, pay, bonus, pay*12 + nvl(bonus,0) 연봉
from professor where deptno =101;
select name, pay, bonus, nvl(pay*12+bonus, pay*12) as 연봉
from professor where deptno =101;

--일반함수 문법 : NVL2(COL1, A, B)(컬럼, not null, null)
--professor 테이블에서 교수의 이름과 pay, bonus, 연봉을 출력하세요
--단 연봉은 (pay*12+bonus)로 계산하고 만약 bonus가 없으면 급여를 pay*12
--로 처리하세요
select name, pay, bonus, 
nvl2(bonus, pay*12 + bonus, pay*12) 연봉 
from professor;

--professor 테이블에서 교수의 이름과 pay, bonus, 연봉을 출력하세요
--단 연봉은 (pay*12+bonus)로 계산하고 만약 bonus가 없으면 급여를 '없음'으로
--처리하세요
--한 컬럼에 숫자와 문자를 혼용해서 찍을 수 없기 때문에, 캐릭터로 바꾸는 걸(to_char) 사용한다.
select name, pay, bonus, 
NVL2(bonus, to_char(pay*12+bonus, '99999'), '  없음') as 연봉
from professor;

--decode

select name, deptno, decode(deptno, 101, '컴퓨터공학') 학과명
from professor;
--professor 테이블에서 교수명과 급여를 프린트하는데 500만원대, 400만원대,
--300만원대로 분류하여 프린트 하세요.
select name,
decode(trunc(pay, -2), 500, pay) "500만원대",
decode(trunc(pay, -2), 400, pay) "400만원대",
decode(trunc(pay, -2), 300, pay) "300만원대",
decode(trunc(pay, -2), 200, pay) "200만원대",
pay from professor
order by pay desc;

--professor 테이블에서 교수명과 학과번호, 학과명을 출력하되
--deptno가 101번인 교수만 컴퓨터 공학과로 출력하고 101번이 아닌 교수들은
--학과명에 "기타학과"로 출력하세요
select name, deptno,
decode(deptno, 101, '컴퓨터공학', '기타학과') 학과명
from professor;

--professor 테이블에서 교수의 이름과 학과명을 출력하되 학과번호가
--101번이면 '컴퓨터 공학과', 102번이면 '멀티미디어 공학과', 나머지는
--'기타학과'로 출력하세요
select name, deptno,
decode(deptno, 101, '컴퓨터공학과', 102, '멀티미디어공학과', '기타학과')
from professor;

--professor 테이블에서 교수의 이름과 부서번호를 출력하고 101번학과 중에서 이름이
--김명신 교수에게 석좌교수 후보라고 출력하세요. 나머지는 null 값을 출력합니다.
--select name, deptno,
--decode(deptno, 101, decode(name,김명신,'석좌교수후보'))
--from professor;

--student테이블을 사용하여 제1전공(deptno1)이 101번인 학과 학생들의 이름과
--주민번호, 성별을 출력하되 성별은 주민번호(jumin(칼럼을 이용하여 7번째 숫자가 1일경우
--"남자", 2일경우 "여자"로 출력하세요.
select name, jumin, decode(substr(jumin, 7, 1), 1, '남자', '여자')
from student where deptno1 = 101;

--student 테이블에서 1전공이(deptno1) 101번인 학생의 이름과 전화번호와
--지역명을 출력하세요. 지역번호가 02는 서울, 031은 경기, 051은 부산,
--052는 울산, 055는 경남으로 출력하세요.
select name, tel,
decode(substr(tel, 0,instr(tel,')')-1), '055', '경남',
'02', '서울', '031', '경기', '051', '부산') "지역"
from student where deptno1= 101;


--CASE 를 DECODE보다 많이 쓴다. CASE는 비교도 가능하다. 디커드보다 가독성도 좋다

--학생의 이름과 전화번호, 지역명을 출력하세요
--단 지역번호가 02면 서울 031이면 경기 051이면 부산 나머지는 기타로 표시하세요
select name, tel,
case(substr(tel,1,instr(tel,')')-1))
-- subㅏㅐㅇㅂㅈ 가 컬럼에 해당하는 부분
when '02' then '서울'
when '031' then '경기'
when '051' then '부산'
else '기타'
end 지역명
from student;

--예제2 : 비교조건이 '='이 아닌 경우
student 테이블의 jumin 컬럼을 참조하여 학생들의 이름과 태어난 달,
그리고 분기를 출력하세요. 태어난 달이 01-03월은 1/4분기 ...
select name, substr(jumin,3,2) "출생월",
case
when(substr(jumin,3,2)) between '01' and '03' then '1/4'
when(substr(jumin,3,2)) between '04' and '06' then '2/4'
when(substr(jumin,3,2)) between '07' and '09' then '3/4'
when(substr(jumin,3,2)) between '10' and '12' then '4/4'
else '안태어남' end "분기별" from student;

--case 연습문제
--교수테이블(professor)을 조회하여 교수의 급여액수를 기준으로 200미만은 4급
--201-300까지는 3급, 301-400까지는 2급 401이상은 1급으로 표시하여 교수의
--번호, 이름, 급여, 등급을 출력하세요(단 등급컬럼은 내림차순으로)
select profno, name, pay,
case
when pay<=200 then '4급'
when pay between 201 and 300 then '3급'
when pay between 301 and 400 then '2급'
when pay>401 then '1급' end "등급"
from professor order by pay desc;

--case 연습문제
--학생의 분기별 생일자 현황을 아래와 같이 프린트하세요.
select birthday,
nvl(case when(substr(jumin,3,2)) between '01' and '03' then name end, '-') "1/4",
nvl(case when(substr(jumin,3,2)) between '04' and '06' then name end, '-') "2/4",
nvl(case when(substr(jumin,3,2)) between '07' and '09' then name end, '-') "3/4",
nvl(case when(substr(jumin,3,2)) between '10' and '12' then name end, '-') "4/4"
from student;

--case 연습문제
--교수의 입사 년도별 프린트를 하세요
--단 입사일 순으로 프린트하고 null일때는 '-'을 프린트 하세요
select name, 
nvl(case when (substr(to_char(hiredate, 'yyyy'), 1,3) = '199') then to_char(hiredate, 'yyyy/mm/dd') end, '-') "1990대",
nvl(case when (substr(to_char(hiredate, 'yyyy'), 1,3) = '200') then to_char(hiredate, 'yyyy/mm/dd') end, '-') "2000대",
nvl(case when (substr(to_char(hiredate, 'yyyy'), 1,3) = '201') then to_char(hiredate, 'yyyy/mm/dd') end, '-') "2010대"
from professor
order by hiredate;

--오라클은 null을 다 무시한다.


--count함수
--count(*)의 결과는 null 값을 포함한 결과
--count(bonus)의 결과는 null 값을 제외한 결과
select count(*) 총건수, count(bonus) 보너스 from professor;

--복수행 함수에서는 NULL 자체를 무시

--SUM함수 : 입력된 데이터들의 합계 값을 구하는 함수
select name, bonus from professor;
select count(bonus), sum(bonus) from professor;

--AVG함수 : 입력된 값들의 평균값을 구해주는 함수입니다.
select count(bonus), sum(bonus), avg(bonus) from professor;
--null값 자동제외, 틀린결과
select count(bonus), sum(bonus) 합계, avg(nvl(bonus,0)) 평균
from professor;
--null값을 0으로 변화. 바른결과

--MAX함수 MIN함수 : 최댓값, 최솟값 구하는 함수.
--속도와 성능부분에서 문제가 될 수 있으므로 인덱스를 활용하는 방법을 사용할 것을 적극 권장함(과거?)
--최근에는 하드웨어 적인 부분이 많이 좋아져 그렇게까지 신경 안쓴다고 함.?
select max(sal), min(sal) from emp;
select max(hiredate), min(hiredate) from emp;

--STDDEV 함수  VARIANCE 함수 :
--STDDEV 함수는 표준편차를 구하는 함수 
--VARIANCE 함수는 분산을 구하는 함수
select stddev(pay), variance(pay) from professor;
select round(stddev(pay),4), round(variance(pay),4) from professor;


--Group By 절 사용하기
--Professor 테이블에서 학과별로 교수들의 평균 보너스를 출력하세요.
select deptno, round(avg(nvl(bonus,0)),2) as 평균보너스
from professor
group by deptno
order by deptno;

--professor 테이블에서 학과별, 직급별고 교수들의 평균 보너스를 출력하세요
select deptno, position,
avg(nvl(bonus,0)) 평균보너스
from professor
group by deptno, position;


--4일차
--교수 테이블에서 직급별(position) 연봉(pay*12)의 평균을 구하고
--연봉순으로 프린트하세요. 평균은 원이하 반올림합니다.
-- ,를 찍기위해 to_char로 함
-- group by position 없으면 에러남. 왜지?
select position, to_char(avg(pay*12),'999,999') 연봉
from professor
group by position
order by 연봉 desc;

--emp테이블에서 입사년도별 연봉 급여평균을 구하세요
--평균은 원이하 반올림 합니다
--데이터에서 일부만 찍으려면 to_char로 바꿔야한다.
select to_char(hiredate, 'yyyy') as year, round(avg(sal)) as 급여평균
from emp
group by to_char(hiredate, 'yyyy');

--group by 에러 확인
select deptno, position, avg(nvl(bonus,0)) 평균보너스 
from professor
group by deptno;
select deptno, position, avg(nvl(bonus,0)) 평균보너스
from professor;

--사용시 주의사항
--group by 절에 사용된 칼럼은 select 절에 사용되지 않아도 됩니다.
select deptno, avg(nvl(bonus,0))평균보너스
from professor
group by deptno, position;

--group by 절에는 반드시 칼럼명이 사용되어야 하며 칼럼 alias는 사용하면 안된다.
select deptno dno, avg(nvl(bonus,0)) 평균급여
from professor 
group by dno;

--professor table에서 부서별 급여 평균을 구하세요. 단 pay가 null일때는 영으로 연산하고
--원이하 반올림 하세요
select deptno 부서, round(avg(nvl(pay,0))) 급여평균
from professor
group by deptno;

--학과별 교수의 인원, 급여 평균, 최고급여, 최저급여를 구하세요.
select deptno, count(id) COUNT, round(avg(pay)) avg, max(pay) max, min(pay) min
from professor
group by deptno;

--단일행함수를 이용한 group by
--학생의 월별 생일자 인원수를 구하세요 단 1월부터 12월 순으로 정렬하세요
select substr(jumin, 3,2) 생일월 , count(*) 인원수
from student
group by substr(jumin, 3,2)
order by 1;
select to_char(birthday, 'mm') 생일월, count(*) 인원수
from student
group by to_char(birthday, 'mm')
order by 1;

--교수의 급여를 100만원대로 분류 각 분류별 인원수를 구하세요
--단 분류는 금액별 내림순으로 하세요
select trunc(pay, -2)||'만원대' 분류, count(*) 인원
from professor
group by trunc(pay, -2)
order by 1 desc;

--교수의 이메일 사이트 별 인원수를 구하세요
--단 사이트별 이름을 오름차순으로 프린트 하세요
select substr(email, instr(email, '@')+1) 사이트,
count(*) 인원수 from professor
group by substr(email, instr(email, '@') +1)
order by 1;

--교수의 입사년도별 인원, 최고급여, 최저급여, 평균을 구하세요.
--단 평균은 소수점 2자리로 아래와 같이 프린트 하세요
select to_char(hiredate, 'yyyy') year,
count(pay) 인원, max(pay) 최고금액,
min(pay) 최저금액,
to_char(round(avg(pay),2), '999.99') 평균
from professor
group by to_char(hiredate, 'yyyy')
order by 1;

--Having절 사용하기
--평균 급여가 350이상인 부서의 부서번호와 평균급여를 구하세요
select deptno, avg(nvl(pay,0)) 
from professor
where avg(pay) >=350
group by deptno;
select deptno, avg(nvl(pay,0)) 평균
from professor
group by deptno
having avg(nvl(pay,0)) >=350;

--학과별 교수의 인원, 급여 평균, 최고급여, 최저급여를 구하시고
--평균급여가 300만원 이상인 부서를 구하세요.
select deptno, count(pay),
to_char(round(avg(pay),2), '999,999.99') "avg",
max(pay) "max",
min(pay) "min" from professor
group by deptno
having round(avg(pay)) > 300;
--order by 3 desc;

--학생의 월별 생일자가 1명인 월을 구하세요.
select to_char(birthday,'mm')월, count(birthday) 인원수
from student
group by to_char(birthday, 'mm')
having count(birthday)=1
order by 월 asc;

--단일행 함수를 이용한 group by
--교수의 입사년도별 인원, 최고급여, 최저급여, 평균을 구하시고
--평균이 300만원 이상인 연도만 프린트 하세요
--단 평균은 소수점 2자리로 아래와 같이 프린트 하세요
select to_char(hiredate, 'yyyy') year,
count(pay) 인원, max(pay) 최고금액,
min(pay) 최저금액,
to_char(round(avg(pay),2), '999.99') 평균
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

--학년별 과목 평균과 개인별 평균의 평균을 구하세요
select grade, to_char(avg(kor),'99.99') KOR, 
to_char(avg(math),'99.99') MATH,
to_char(avg(eng),'99.99') ENG,
to_char(avg((kor+math+eng)/3),'99.99') 평균
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

--국어 점수별 (10점구간) 인원수, 총점 평균의 평균을 구하세요
select trunc(kor,-1) 국어분류, count(*) 인원수,
to_char(avg((kor+math+eng)/3),'999.99') 총점평균
from kicstudent
group by trunc(kor, -1)
order by 1 desc;


--ROLLUP 함수
select deptno, position,
count(*), sum(pay)
from professor
group by rollup(deptno, position);

select deptno, position,
count(*), sum(pay)
from professor
group by cube(deptno, position);

--emp테이블에서 부서별로 각 직급별 인원이 몇 명인지 계산해서 출력하세요
--decode 함수 이용하는 방법
select deptno,
count(decode(job, 'CLERK', job)) "CLERK",
count(decode(job, 'MANAGER', job)) "MANAGER",
count(decode(job, 'PRESIDENT', job)) "PRESIDENT",
count(decode(job, 'ANALYST', job)) "ANALYST",
count(decode(job, 'SALESMAN', job)) "SALESMAN"
from emp
group by deptno
order by 1;

--professor 테이블을 사용하여 교수 중에서 급여(pay)와 보너스(bonus)를 합친
--금액이 가장 많은 경우와 가장 적은 경우의 평균금액을 구하세요. 단 보너스가 없을
--경우는 보너스를 0으로 계산하고 출력 금액은 모두 소수점 첫째 자리까지만 나오게 하세요.
select max((pay+nvl(bonus,0))) "MAX",
min((pay+nvl(bonus,0))) "MIN",
round(avg((pay+nvl(bonus,0))),1)"AVG" 
from professor;


--카페 select 문제
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

--카페 select 3 문제
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
substr(email, (instr(email, '@')+1)) 사이트
from professor
where deptno = 101;

--4)
select name, nvl(bonus,0) as 보너스, (pay*1.1) as 결정급여
from professor
where deptno = 102 and bonus is null;

--5)
select name, pay as 급여, bonus as 보너스,
to_char(decode(bonus,null,pay*12,pay*12+bonus)||'0000','999,999,999') as 연봉
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
select name, pay 급여, bonus 보너스,
to_char((pay*12+nvl(bonus,'0'))*10000,'999,999,999') 연봉
from professor
where deptno = 103;


--5일차
--professor 테이블을 사용하여 교수 중에서 급여(pay)와 보너스(bonus)를 합친 금액이 가장
--많은 경우와 가장 적은 경우, 평균 금액을 구하세요. 단 보너스가 없을 경우는 급여를 0으로
--계산하고 출력 금액은 모두 소수점 첫째 자리까지만 나오게 하세요
select max(nvl(pay+bonus,0)) "MAX",
min(nvl(pay+bonus,0)) "MIN",
round(avg(nvl(pay+bonus,0)),1) "AVG"
from professor;

--student테이블의 birthday칼럼을 사용하여 아래 화면처럼 월별로 태어난 인원수를 출력하세요.
--내가 한건 틀림
select 
avg(substr(jumin, 3, 2) as 평균,
decode(substr(jumin, 3,2), 01 , count(*)) as "1월",
decode(substr(jumin, 3,2), 02 , count(*)) as "2월"
from student
group by substr(jumin, 3,2);

select count(birthday) as "합계",
count(decode(to_char(birthday, 'mm'), '01', 1)) as "1월",
count(decode(to_char(birthday, 'mm'), '02', 1)) as "2월",
count(decode(to_char(birthday, 'mm'), '03', 1)) as "3월",
count(decode(to_char(birthday, 'mm'), '04', 1)) as "4월",
count(decode(to_char(birthday, 'mm'), '05', 1)) as "5월",
count(decode(to_char(birthday, 'mm'), '06', 1)) as "6월",
count(decode(to_char(birthday, 'mm'), '07', 1)) as "7월",
count(decode(to_char(birthday, 'mm'), '08', 1)) as "8월",
count(decode(to_char(birthday, 'mm'), '09', 1)) as "9월",
count(decode(to_char(birthday, 'mm'), '10', 1)) as "10월",
count(decode(to_char(birthday, 'mm'), '11', 1)) as "11월",
count(decode(to_char(birthday, 'mm'), '12', 1)) as "12월"
from student;

--student 테이블의 tel칼럼을 참고하여 아래와 같이 지역별 인원수를 출력하세요
--단 02-서울, 031-경기 051-부산 052-울산 053-대구 055-경남으로 출력하세요
select count(*) "합계",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '02', 1)) "서울",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '031', 1)) "경기",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '051', 1)) "부산",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '052', 1)) "울산",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '053', 1)) "대구",
count(decode(substr(TEL, 1, instr(tel, ')')-1), '055', 1)) "경남"
from studetnt;

--rollup은 group by의 함수이기 때문에 별칭을 쓸 수 없다.
--숫자랑 문자랑 같이 찍을 수 없다 따라서 deptno도 문자로 바꿈
--emp 테이블을 사용하여 아래의 화면과 같이 부서별로 직급별로 급여 합계 결과를 출력하세요.
select nvl(to_char(deptno,'9999'), '  합계') as deptno,
to_char(nvl(sum(decode(job, 'CLERK', sal)), 0), '999,999') as CLERK,
to_char(nvl(sum(decode(job, 'MANAGER', sal)), 0), '999,999') as MANAGER,
to_char(nvl(sum(decode(job, 'PRESIDENT', sal)), 0), '999,999') as PRESIDENT,
to_char(nvl(sum(decode(job, 'ANALYST', sal)), 0), '999,999') as ANALYST,
to_char(nvl(sum(decode(job, 'SALESMAN', sal)), 0), '999,999') as SALESMAN,
to_char(sum(sal), '999,999') as 합계
from emp
group by rollup(deptno); 

--교수의 부서별 급여합계를 프린트하세요
select nvl(to_char(deptno, '9999'), '합계')dcode,
to_char(sum(pay), '999,999') 급여합계
from professor
group by rollup(deptno);

--mod : 나머지를 뜻함 아래에서는 3으로 나눈 나머지를 리턴
--professor 테이블의 교수번호와 이름을 아래의 예시화면 형태로 출력하세요.
select trunc((rownum-1)/3)+1 no,
nvl(max(decode(mod(rownum, 3), '1', profno||name)), '*******') "사번1 이름1",
nvl(max(decode(mod(rownum, 3), '2', profno||name)), '*******') "사번2 이름2",
nvl(max(decode(mod(rownum, 3), '0', profno||name)), '*******') "사번3 이름3"
from professor
group by trunc((rownum-1)/3)
order by 1;

--cal table을 이용하여 아래와 같이 프린트하세요
select
nvl(max(decode(day, '일', num_day)), ' ') as 일,
nvl(max(decode(day, '월', num_day)), ' ') as 월,
nvl(max(decode(day, '화', num_day)), ' ') as 화,
nvl(max(decode(day, '수', num_day)), ' ') as 수,
nvl(max(decode(day, '목', num_day)), ' ') as 목,
nvl(max(decode(day, '금', num_day)), ' ') as 금,
nvl(max(decode(day, '토', num_day)), ' ') as 토
from cal
group by week
order by week;

--그 외 그룹 함수(LISTAGG 함수(11g에서 추가됨)
select deptno, listagg(name) within group(order by pay)
"listagg" from professor
group by deptno;

--LAG함수 : 이전 행 값을 가져올 때 사용하는 함수입니다.
문법 : LAG(출력할 컬럼명, OFFSET, 기본출력값)
      OVER(Querey_partition 구문, ORDER BY 정렬할 칼럼)
      
select name, hiredate, pay,
lag(pay, 1, 0) over (order by hiredate)
"LAG"
from professor;

select name, hiredate, pay,
lag(pay, 3, 2) over (order by hiredate)
"LAG"
from professor;

--LEAD 함수
--LAG함수와 반대로 이후의 값을 가져오는 함수이다.
select name, hiredate, pay,
lead(pay,1,0)
over(order by hiredate) "lead"
from professor;

--RANK 함수 - 순위출력 함수
RANK(조건값) WITHIN GROUP (ORDER BY 조건값 컬럼명 [asc|desc])
select rank('아이유') within group(order by name) "rank"
from professor;

--교수 테이블에서 교수들의 교수번호와 이름 급여 급여순위를 출력하세요
select name, pay,
rank() over(order by pay) "rank asc",
rank() over(order by pay desc) "rank desc"
from professor;

--emp 테이블에서 10번 부서에 속한 직워들의 사번과 이름, 급여, 해당부서내의 급여
--순위를 출력하세요/
select empno, ename, sal,
rank() over(order by sal desc) as 순위
from emp
where deptno = 10;

--그외 그룹 함수
select empno, ename, sal, deptno,
rank() over(partition by deptno order by sal desc) "rank"
from emp;

--emp 테이블을 사용하여 사번 이름 급여 부서번호 부서내 job 별로
--급여 순위를 출력하세요
select empno, ename, sal, deptno, job,
rank()over(partition by deptno, job order by sal desc) "rank"
from emp;

--누적합계구하기
--panmae 테이블을 사용하여 1000번 대리점의 판매내역을 출력하되 판매일자, 제품,
--코드, 판매량, 누적판매금액을 아래와 같이 출력하세요.
--아래에서 7410이 2칸인 이유는 같은 날짜이기 때문이다.
select p_date, p_code, p_qty, p_total,
sum(p_total) over (order by p_date) as 누계 
from panmae
where p_store = '1000';

--panmae 테이블을 사용하여 1000번 대리점의 판매내역을 판매일자별로 분류하고
--같은 일자일 경우 제품 코드별로 한번 더 분류한 후 판매일자, 제품코드, 판매량, 판매금액,
--누적판매금액을 아래와 같이 출력하세요.
select p_date, p_code, p_qty, p_total,
sum(p_total) over (partition by p_code order by p_date) 누계
from panmae
where p_store = '1000';

--EQUI Join (등가 join)
--Oracle Join문법
select s.name "학생이름", s.deptno1 "학과번호", d.dname "학과이름"
from student s, department d
where s.deptno1 = d.deptno;
--ANSI Join 문법
select s.name "학생이름", s.deptno1 "학과번호", d.dname "학과이름"
from student s join department d
on(s.deptno1 = d.deptno);

--Equi Join 예 3
--학생 테이블(student)과 학과테이블(department) 교수테이블(professor)을 join하여
--학생의 이름과 학과이름 지도교수 이름을 출력하세요.
select s.name, d.dname, p.name
from student s, department d, professor p
where s.deptno1 = d.deptno and s.profno = p.profno;

select s.name, d.dname, p.name
from student s join department d
on s.deptno1 = d.deptno
join professor p
on s.profno = p.profno;


--Equi Join 예 4 :
--emp2 테이블과 p_grade 테이블을 조회하여 사원의 이름과 직급, 현재 연봉, 해당 직급의
--연봉의 하한금액과 상한금액을 출력하세요
select e.name as 사원이름,
e.position as 현재직급,
e.pay as 현재연봉,
p.s_pay as 하한금액,
p.e_pay as 상한금액
from emp2 e, p_grade p
where e.position = p.position;

--
select e.name "사원이름",
e.position "현재직급",
e.pay "현재연봉",
p.s_pay "하한금액",
p.e_pay "상한금액"
from emp2 e join p_grade p
on e.position = p.position;

--전공(deptno1)이 101번인 학생들의 학생이름과 지도교수 이름을 출력하세요
select  s.name as 학생이름, p.name as 지도교수명
from student s, professor p
where s.profno = p.profno
and s.deptno1 = 101;

select s.name "학생이름", p.name "지도교수명"
from student s join professor p
on s.profno = p.profno
and s.deptno1 = 101;

--deptno1가 101인 학생의 exam_01 total 점수를 잘한 학생 순으로 프린트 하세요
select s.name, s.studno, e.total, deptno1
from student s, exam_01 e
where s.studno = e.studno and deptno1 = 101
order by 3 desc;

--판매테이블(panmae) 생상테이블(product)에서 날짜, 상품코드, 수량 금액을 프린트하세요
select p.p_date, p.p_code, p_name, p.p_qty, p_total
from panmae p, product t
where p.p_code = t.p_code;

--프라이머리키와 레퍼런스키

--Non-EQUI Join(비등가 join)
select go.gname "고객명", go.point"POINT", gi.gname"상품명"
from gogak go, gift gi
where go.point between gi.g_start and gi.g_end;

select go.gname"고객명", go.point"POINT",gi.gname"상품명"
from gogak go join gift gi
on go.point between gi.g_start and gi.g_end;

--위 예제 1번에서 조회한 상품의 이름과 수량
select p.gname, count(*) from gogak g, gift p
where g.point between p.g_start and p.g_end
group by p.gname
order by 2 desc;

--Non-Eqqui Join 예제 3:
--student 테이블과 exam_01테이블, hakjum 테이블을 조회하여 학생들의 이름과
--점수와 학점을 높은 점수순으로 출력하세요
select s.name, e.total, h.grade
from student s, exam_01 e, hakjum h
where s.studno = e.studno
and e.total between h.min_point and h.max_point
order by e.total desc;

select 
s.name as 학생이름,
e.total "점수",
h.grade "학점"
from student s join exam_01 
on s.studno = e.studno
join hakjum h
on e.total between h.min_point and h.max_point; 

--Non-Equi-Join 예제 4:
--Gogak 테이블과 gift 테이블을 Join하여 고객이 자기 포인트보다 낮은 포인트의 상품 중
--한가지를 선택할 수 있다고 할 때 산악용 자전거를 선택할 수 있는 고객명과 포인트,
--상품명을 출력하세요.
select g.gname as 고객명,
g.point as POINT,
t.gname as 상품명
from gogak g, gift t
where t.g_start <= g.point
and t.gname = '산악용자전거';

SELECT * FROM GOGAK;
SELECT * FROM GIFT;
select profno, name, pay,
case
when pay<=200 then '4급'
when pay between 201 and 300 then '3급'
when pay between 301 and 400 then '2급'
when pay>401 then '1급' end "등급"
from professor order by pay desc;

select g.gname,
g.point as POINT,
CASE
WHEN G.POINT BETWEEN 1 AND 100000 THEN 참치세트
WHEN G.POINT BETWEEN 100001 AND 201000 THEN 참치세트, 샴푸세트
WHEN G.POINT BETWEEN 201001 AND 300000 THEN 참치세트, 샴푸세트, 세차용품세트
WHEN G.POINT BETWEEN 300001 AND 400000 THEN 참치세트, 샴푸세트, 세차용품세트, 주방용품세트
WHEN G.POINT BETWEEN 400001 AND 500000 THEN 참치세트, 샴푸세트, 세차용품세트, 주방용품세트, 산악용자전거
WHEN G.POINT BETWEEN 500001 AND 600000 THEN 참치세트, 샴푸세트, 세차용품세트, 주방용품세트, 산악용자전거, LCD모니터
from gogak G, gift T
where t.g_start <= g.point
and t.gname = '산악용자전거';

select g.gname as 고객명,
g.point as POINT,
t.gname as 상품명
from gogak g, gift t
where t.g_start <= g.point
and t.gname = '산악용자전거';


like 'm%', '%m%', '%m';

--복수행함수 카페 문제
--1)
SELECT ROUND(AVG(SAL),2) 평균, MAX(SAL) 최고, MIN(SAL) 최저, COUNT(*) 인원수
FROM EMP
WHERE DEPTNO = 10;

--2)
SELECT DISTINCT DEPTNO, ROUND(AVG(SAL),2) 평균, MAX(SAL) 최고, MIN(SAL) 최저, COUNT (*) 인원수
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

--3)
SELECT DEPTNO 부서번호, JOB 업무명, COUNT (*) 인원수
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
SELECT DEPTNO, ROUND(AVG(SAL),2) 평균월급, SUM(SAL) 전체월급, MAX(SAL) 최고월급, MIN(SAL) 최저월급
FROM EMP
GROUP BY DEPTNO
ORDER BY SUM(SAL) DESC;

--8)
SELECT POSITION, COUNT(*) 인원, MAX(PAY) 최고금액, MIN(PAY) 최저금액, TO_CHAR(AVG(PAY),'999.99') 평균금액
FROM PROFESSOR
GROUP BY POSITION
ORDER BY MAX(PAY) DESC;

--9)
SELECT SUBSTR(NAME, 1,1) 성, COUNT(*), AVG(PAY), MAX(PAY), MIN(PAY)
FROM PROFESSOR
GROUP BY SUBSTR(NAME, 1,1)
ORDER BY SUBSTR(NAME, 1,1);

--10)instr substr
SELECT GRADE 학년, 
NVL(TO_CHAR(AVG(DECODE(SUBSTR(TEL, 0, INSTR(TEL, ')') -1), '02', WEIGHT)),'999,99'), ' ') "02"
FROM STUDENT; 

--11)
SELECT SUBSTR(JUMIN, 3, 2)||'월', TO_CHAR(AVG(WEIGHT),'99.99') WEIGHT, 
TO_CHAR(AVG(HEIGHT),'999.99') HEIGHT
FROM STUDENT
GROUP BY SUBSTR(JUMIN, 3, 2);

--12)
SELECT GRADE, SUBSTR(TEL, 0, INSTR(TEL, ')') -1) 지역,
AVG(WEIGHT) 키, AVG(HEIGHT) 몸무게
FROM STUDENT
GROUP BY GRADE, SELECT GRADE, SUBSTR(TEL, 0, INSTR(TEL, ')') -1) 지역,
AVG(WEIGHT) 키, AVG(HEIGHT) 몸무게
FROM STUDENT
GROUP BY GRADE, SUBSTR(TEL, 0, INSTR(TEL, ')')-1)
ORDER BY GRADE, SUBSTR(TEL, 0, INSTR(TEL, ')')-1);


--6일차
--EMP2, P_GRDAE 테이블을 조회하여 사원들의 이름과 나이, 현재 직급, 예상즉급을 출력하세요
예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다. 나이는 현재날짜를 기준으로
하되 TRUNC로 소수점 이하는 절삭해서 계산하세요.
--ORACLE JOIN 문법
select DISTINCT E.NAME AS 이름,
TRUNC((SYSDATE-E.BIRTHDAY)/365) AS 현재나이,
E.POSITION AS 현재직급,
P.POSITION AS 예상직급
from EMP2 E, P_GRADE P
WHERE TRUNC((SYSDATE-E.BIRTHDAY)/365) BETWEEN P.S_AGE AND P.E_AGE;
--ANSI JOIN 문법
SELECT E.NAME AS 이름,
TRUNC((SYSDATE-E.BIRTHDAY)/365) AS 현재나이,
E.POSITION AS 현재직급,
P.POSITION AS 예상직급
FROM EMP2 E JOIN P_GRADE P
ON TRUNC((SYSDATE-E.BIRTHDAY)/365)
BETWEEN P.S_AGE AND P.E_AGE;

--OUTER JOIN(아우터 조인) VS INNER JOIN(이너 조인)
--1) OUTER JOIN 예제 1 :
--STUDENT 테이블과 PROFESSOR 테이블을 JOIN하여 학생이름과 지도교수 이름을 출력하세요.
--단 지도교수가 결정되지 않은 학생의 명단도 함께 출력하세요.
--ORCALE OUTER JOIN 문법(교수가 정해지지 않은 학생도 출력하는 게 (+)
SELECT S.NAME AS 학생이름, P.NAME AS 교수이름
FROM STUDENT S, PROFESSOR P
WHERE S.PROFNO = P.PROFNO(+);
--ANSI OUTER JOIN 문법
SELECT S.NAME AS 학생이름, P.NAME AS 교수이름
FROM STUDENT S LEFT OUTER JOIN PROFESSOR P
ON S.PROFNO = P.PROFNO;

--ORACLE OUTER JOIN 문법
SELECT S.NAME AS 학생이름, P.NAME AS 교수이름
FROM STUDENT S, PROFESSOR P
WHERE S.PROFNO(+) = P.PROFNO
UNION
SELECT S.NAME AS 학생이름, P.NAME 교수이름
FROM STUDENT S, PROFESSOR P
WHERE S.PROFNO = P.PROFNO(+);
--ANSI JOIN 문법
SELECT S.NAME AS 학생이름, P.NAME AS 교수이름
FROM STUDENT S FULL OUTER JOIN PROFESSOR P
ON S.PROFNO = P.PROFNO;

--SELF JOIN -> 같은 테이블을 JOIN 해서 둘 간의 고리를 찾는 방식. 많이 사용함.
SELECT * FROM DEPT2;
--ORACLE JOIN 문법
SELECT A.DNAME AS 부서명, B.DNAME AS 상위부서명
FROM DEPT2 A, DEPT2 B
WHERE A.PDEPT = B.DCODE;
--ANSI JOIN 문법
SELECT A.DNAME AS 부서명, B.DNAME 상위부서명
FROM DEPT2 A JOIN DEPT2 B
ON A.PDEPT = B.DCODE;

--PROFESSOR 테이블에서 교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람의 인워수를
--출력하세요. 단 자신보다 입사일이 빠른 사람 수를 오름차순으로 출력하세요.
SELECT A.PROFNO, A.NAME, A.HIREDATE, COUNT(*)
FROM PROFESSOR A, PROFESSOR B;
SELECT P1.PROFNO, P1.NAME, P1.HIREDATE, COUNT(P2.HIREDATE) AS 인원
FROM PROFESSOR P1, PROFESSOR P2
WHERE P1.HIREDATE > P2.HIREDATE(+)
GROUP BY P1.PROFNO, P1.NAME, P1.HIREDATE
ORDER BY P1.HIREDATE;

--JOIN 연습문제 2 
--SELF JOIN -> 뭘 기준으로 잡을지가 중요함
--EMP TABLE에서 직속부하 직원의 수를 프린트하세요
SELECT E1.ENAME, COUNT(E2.MGR)
FROM EMP E1, EMP E2
WHERE E1.EMPNO = E2.MGR(+)
GROUP BY E1.ENAME
ORDER BY COUNT(E2.MGR) DESC;

--학생(student)테이블과 점수(exam_01)테이블을 이용하여 아래와 같이 프린트 하세요.
SELECT S.NAME, S.STUDNO, E.TOTAL, E1.TOTAL
FROM STUDENT S, EXAM_01 E, EXAM_01 E1
WHERE E.TOTAL > E1.TOTAL;

SELECT S.NAME, S.STUDNO, E1.TOTAL, COUNT(E2.TOTAL) AS 인원
FROM STUDENT S, EXAM_01 E1, EXAM_01 E2
WHERE S.STUDNO = E1.STUDNO AND E1.TOTAL > E2.TOTAL(+)
GROUP BY S.NAME, S.STUDNO, E1.TOTAL
ORDER BY E1.TOTAL DESC;

--JOIN 연습문제3_1
--학생(STUDENT)테이블과 점수(EXAM_01)테이블을 이용하여 아래와 같이 프린트 하세요
SELECT * FROM STUDENT;
SELECT S.NAME, S.STUDNO, E.TOTAL,
RANK() OVER (ORDER BY E.TOTAL DESC) AS 등수
FROM STUDENT S, EXAM_01 E
WHERE S.STUDNO = E.STUDNO;

SELECT * FROM STUDENT;
SELECT S.NAME, S.STUDNO, E.TOTAL, COUNT(E1.TOTAL) 등수
FROM STUDENT S, EXAM_01 E, EXAM_01 E1
WHERE S.STUDNO = E.STUDNO AND E.TOTAL <= E1.TOTAL(+)
GROUP BY S.NAME, S.STUDNO, E.TOTAL
ORDER BY E.TOTAL DESC;

--서브쿼리
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= (SELECT SAL
FROM EMP
WHERE ENAME ='MARTIN');

--(1)단일행 sub query 연습문제
--
SELECT DEPTNO1 FROM STUDENT WHERE NAME = '이윤나';

SELECT NAME, DNAME FROM STUDENT, DEPARTMENT
WHERE DEPTNO1 = DEPTNO
AND DEPTNO1 = (SELECT DEPTNO1 FROM STUDENT WHERE NAME = '이윤나');

--(2)단일행 SUB QUERY 연습문제 2
--PROFESSOR 테이블에서 입사일이 나몰라 교수보다 나중에 입사한 사람의 이름과 입사일, 학과명을 출력하세요
SELECT NAME, HIREDATE
FROM PROFESSOR
WHERE HIREDATE = (SELECT HIREDATE FROM PROFESSRO WHERE HIREDATE);

SELECT HIREDATE FROM PROFESSOR 
WHERE NAME = '나몰라';

SELECT P.NAME, P.HIREDATE, D.DNAME
FROM PROFESSOR P, DEPARTMENT D
WHERE P.DEPTNO = D.DEPTNO
AND P.HIREDATE > (SELECT HIREDATE FROM PROFESSOR 
WHERE NAME = '나몰라');
--지금 위에 하는 건 WHERE절에 들어가는 서브쿼리.

--서브쿼리를 뭐부터 잡아야되는지를 기억해야함
--(3)단일 행 SUB QUERY 연습문제3
--STUDENT 테이블에서 1전공(DEPTNO1)이 101번인 학과의 평균 몸무게보다 몸무게가 많은
--학생들의 이름과 몸무게를 출력하세요.
SELECT AVG(WEIGHT) FROM STUDENT WHERE DEPTNO1 = 101;

SELECT NAME, WEIGHT
FROM STUDENT
WHERE WEIGHT > (SELECT AVG(WEIGHT) FROM STUDENT WHERE DEPTNO1 = 101);

--(4)단일행 서브쿼리 예4 :
--PROFESSOR 테이블에서 심슨 교수와 같은 입사일에 입사한 교수 중에서 김명선 보다 월급을
--적게받는 교수의 이름과 급여, 입사일을 출력하세요
SELECT PAY FROM PROFESSOR WHERE NAME = '김명선';
SELECT HIREDATE FROM PROFESSOR WHERE NAME = '심슨';

SELECT NAME, PAY, HIREDATE
FROM PROFESSOR
WHERE HIREDATE = (SELECT HIREDATE FROM PROFESSOR WHERE NAME = '심슨')
AND PAY > (SELECT PAY FROM PROFESSOR WHERE NAME = '김명선'-);


--다중 행 서브쿼리 예1
--EMP2 테이블과 DEPT2테이블을 참조하여 근무지역(DEPT2 테이블의 AREA 컬럼)이 서울지사인
--모든 사워들의 사번과 이름, 부서번호를 출력하세요.
--안에 넣을 걸 해보고 넣으면 된당
--IN 과 관련된 문제
SELECT DCODE FROM DEPT2 WHERE AREA = '서울지사';
SELECT EMPNO, NAME, DEPTNO 
FROM EMP2
WHERE DEPTNO IN(SELECT DCODE
                        FROM DEPT2 
                      WHERE AREA = '서울지사');
                      

--(2) 다중 행 서브쿼리 연습문제1: ANY 사용하는 문제, ALL도 알아두셈
-- ANY 그 중 하나보다 크면되고 , ALL은 걔네 각자 다 보다 커야
--EMP2 테이블을 사용하여 전체 직원 중 과장 직급의 최소 연봉자보다 연봉이 높은 사람의 이름과
--직급, 연봉을 출력하세요. 단 연봉출력형식은 아래와 같이 천 단위 구분 기호를 표시하세요.
SELECT MIN(PAY) FROM EMP2 WHERE POSITION = '과장';
SELECT * FROM EMP2;
SELECT NAME, POSITION, TO_CHAR(PAY , '999,999,999') AS 급여
FROM EMP2
WHERE PAY > ANY (SELECT PAY FROM EMP2 
WHERE POSITION = '과장');

SELECT NAME, POSITION, TO_CHAR(PAY , '999,999,999')
FROM EMP2
WHERE PAY > (SELECT MIN(PAY) FROM EMP2 WHERE POSITION = '과장')
ORDER BY PAY DESC;


--(3)다중 행 서브쿼리 연습문제 2:
--STUDENT 테이블을 조회하여 전체 학생 중에서 체중이 4학년 학생들의 체중에서 가장 적게
--나가는 학생보다 몸무게가 적은 학생의 이름과 학년과 몸무게를 출력하세요.
SELECT * FROM STUDENT;
SELECT NAME, GRADE, WEIGHT
FROM STUDENT
WHERE WEIGHT < ALL (SELECT WEIGHT FROM STUDENT 
WHERE GRADE = 4);

SELECT NAME 이름, GRADE 학년, WEIGHT 몸무게
FROM STUDENT
WHERE WEIGHT < (SELECT MIN(WEIGHT) FROM STUDENT WHERE GRADE =4)
ORDER BY WEIGHT DESC, GRADE;

--서브쿼리 종류 다중컬럼(열)
--다중컬럼(열) (COL1, COL2) IN (VAL1, VAL2)
--EMP2 테이블을 조회하여 각 직급별로 최대급여를 가진 직원의 급여와 직급을 프린트하세요
SELECT EMPNO, NAME, BIRTHDAY, PAY, POSITION 
FROM EMP2
WHERE (PAY, POSITION) IN (SELECT MAX(PAY), POSITION 
FROM EMP2 GROUP BY POSITION);

--(1)다중컬럼 서브쿼리 예1:
--STUDENT 테이블을 조회하여 각 학년별로 최대키를 가진 학생들의 학년과 이름과 키를 출력하세요
SELECT * FROM STUDENT;
SELECT GRADE 학년, NAME 이름, HEIGHT 키
FROM STUDENT
WHERE (GRADE, HEIGHT) IN (SELECT GRADE, MAX(HEIGHT)
FROM STUDENT GROUP BY GRADE);

--(2)다중컬럼 서브쿼리 연습문제1:
--PROFESSOR 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의 교수번호와 이름,
--학과명을 출력하세요. (학과이름(DEPARTMENT)순으로 오름차순 정렬)
SELECT * FROM PROFESSOR;
SELECT P.PROFNO, P.NAME, P.HIREDATE, D.DNAME
FROM PROFESSOR P, DEPARTMENT D
WHERE (P.DEPTNO,HIREDATE) IN (SELECT DEPTNO, MIN(HIREDATE)
FROM PROFESSOR GROUP BY DEPTNO) AND P.DEPTNO = D.DEPTNO
ORDER BY DNAME;

--(3)다중 컬럼 서브쿼리 연습문제 2:
--EMP2 테이블을 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급,
--연봉을 출력하세요. 연봉순으로 오름차순 정렬하세요.
SELECT * FROM EMP2;
SELECT NAME, POSITION, PAY
FROM EMP2
WHERE (POSITION, PAY) IN (SELECT POSITION, MAX(PAY)
FROM EMP2
GROUP BY POSITION)
ORDER BY PAY;

--(4)다중행 서브쿼리 연습문제 3:
--EMP2, DEPT2 테이블을 조회하여 각 부서별 평균 연봉을 구하고 그 중에서 평균 연봉이
--가장 적은 부서의  평균 연봉보다 적게받는 직원들의 부서명, 직원명, 연봉을 출력하세요.
SELECT * FROM EMP2;
SELECT * FROM DEPT2;
SELECT D.DNAME 부서명, E.NAME 사원명, E.PAY 연봉
FROM EMP2 E, DEPT2 D
WHERE PAY > (SELECT PAY FROM EMP2 WHERE MIN(PAY);
--아래는 다중행
SELECT D.DNAME, E.NAME, E.PAY
FROM DEPT2 D, EMP2 E
WHERE D.DCODE = E.DEPTNO AND PAY < ALL(SELECT AVG(PAY) FROM EMP2
GROUP BY DEPTNO);
--아래는 단일행
SELECT D.DNAME, E.NAME, E.PAY
FROM DEPT2 D, EMP2 E
WHERE D.DCODE = E.DEPTNO AND PAY < (SELECT MIN(AVG(PAY)) FROM EMP2
GROUP BY DEPTNO);

--(1)상호연관 서브쿼리 예1:
--EMP2 테이블을 조회해서 직원 둘 중에서 자신의 직급의 평균연봉과 같거나 많이 받는 사람들의
--이름과 직급, 현재 연봉을 출력하세요.
SELECT NAME 사원이름, POSITION 직급, PAY 급여
FROM EMP2 A 
WHERE PAY >= (SELECT AVG(PAY) 
              FROM EMP2
               WHERE A.POSITION = POSITION);
               
             
               
               
               
--7일차
--서브쿼리 종류 다중컬럼(열) -> 상호연관 서브쿼리로 바꿔보는 것
--다중컬럼(열) (COL1, COL2) IN (VAL1, VAL2)
--EMP2 테이블을 조회하여 각 직급별로 최대급여를 가진 직원의 급여와 직급을 프린트하세요
SELECT EMPNO, NAME, BIRTHDAY, PAY, POSITION 
FROM EMP2
WHERE (PAY, POSITION) IN (SELECT MAX(PAY), POSITION 
FROM EMP2 GROUP BY POSITION);

SELECT EMPNO, NAME, BIRTHDAY, PAY, POSITION
FROM EMP2 E
WHERE PAY = ( SELECT MAX(PAY) FROM EMP2 WHERE POSITION = E.POSITION);

--(1)다중컬럼 서브쿼리 - > 상호연관 서브쿼리 예1
--STUDENT 테이블을 조회하여 각 학년별로 최대키를 가진 학생들의 학년과 이름과 키를 출력하세요
SELECT * FROM STUDENT;
SELECT GRADE 학년, NAME 이름, HEIGHT 키
FROM STUDENT
WHERE (GRADE, HEIGHT) IN (SELECT GRADE, MAX(HEIGHT)
FROM STUDENT GROUP BY GRADE);

SELECT GRADE 학년, NAME 이름, HEIGHT 키
FROM STUDENT S
WHERE HEIGHT = ( SELECT MAX(HEIGHT) FROM STUDENT WHERE GRADE = S.GRADE )
ORDER BY GRADE;


--(2)다중컬럼 서브쿼리 -> 상호연관 서브쿼리 연습문제1:
--PROFESSOR 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의 교수번호와 이름,
--학과명을 출력하세요. (학과이름(DEPARTMENT)순으로 오름차순 정렬)
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

--(3)다중 컬럼 서브쿼리 -> 상호연관 서브쿼리 연습문제 2:
--EMP2 테이블을 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급,
--연봉을 출력하세요. 연봉순으로 오름차순 정렬하세요.
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


--스칼라 서브쿼리 SCALAR SUB QUERY
--스칼라 서브 쿼리 예:
--EMP2 테이블과 DEPT2 테이블을 조회하여 사원들의 이름과 부서이름을 출력하세요
SELECT NAME AS 사원이름, 
(SELECT DNAME FROM DEPT2 D WHERE E.DEPTNO = D.DCODE) AS 부서이름
FROM EMP2 E;

--인라인 서브쿼리 -> 스칼라 서브쿼리 // 갑자기 나옴..
SELECT D.DNAME 학과명,
S.MAX_HEIGHT 최대키,
S.MAX_WEIGHT 최대몸무게
FROM ( SELECT DEPTNO1, MAX(HEIGHT) MAX_HEIGHT, MAX(WEIGHT) MAX_WEIGHT
FROM STUDENT
GROUP BY DEPTNO1) S, DEPARTMENT D
WHERE S.DEPTNO1 = D.DEPTNO;

SELECT (SELECT D.DNAME FROM DEPARTMENT D WHERE D.DEPTNO = S.DEPTNO1) 학과명,
S.MAX_HEIGHT 최대키,
S.MAX_WEIGHT 최대몸무게
FROM ( SELECT DEPTNO1, MAX(HEIGHT) MAX_HEIGHT, MAX(WEIGHT) MAX_WEIGHT
FROM STUDENT
GROUP BY DEPTNO1) S;

--(1)단일행 서브 쿼리 연습문제
--STUDENT 테이블과 DEPARTMENT 테이블을 사용하여 이윤나 학생과 전공(DEPTNO1)이
--동일한 학생들의 이름과 전공 이름을 출력하세요.
--내가 한게 아래인데 틀림, 접근방법부터 다시 봐야할듯. 모르면 물어보고
SELECT NAME, (SELECT DNAME FROM DEPARTMENT)
FROM STUDENT S
WHERE DNAME = (SELECT DNAME FROM DEPARTMENT WHERE S.NAME = '이윤나');

SELECT S.NAME, (SELECT DNAME FROM DEPARTMENT WHERE S.DEPTNO1 = DEPTNO) 전공명
FROM STUDENT S
WHERE S.DEPTNO1 = (SELECT DEPTNO1 FROM STUDENT
WHERE NAME = '이윤나');

--단일행 서브쿼리 연습문제2:
--PROFESSOR 테이블에서 입사일이 나몰라 교수보다 나중에 입사한 사람의 이름과 입사일,
--학과명을 출력하세요 스칼라서브쿼리
SELECT P.NAME 교수명, P.HIREDATE 입사일,
(SELECT DNAME FROM DEPARTMENT WHERE P.DEPTNO = DEPTNO)
FROM PROFESSOR P
WHERE P.HIREDATE > (SELECT HIREDATE FROM PROFESSOR WHERE NAME = '나몰라');

--인라인 뷰 INLINE VIEW - 1회용 뷰
--생성예제1
--ROWNUM에 관하여
--1)
SELECT * FROM STUDENT WHERE ROWNUM < 5;
--2) 에러
SELECT * FROM STUDENT WHERE ROWNUM > 5;
SELECT * FROM STUDENT WHERE ROWNUM BETWEEN 3 AND 10;


--학생파일과
SELECT NAME, E.TOTAL
FROM STUDENT S, EXAM_01 E
WHERE S.STUDNO = E.STUDNO
ORDER BY TOTAL DESC;

SELECT RNUM 순위, NAME 이름, TOTAL 점수 FROM(
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


--ROW의 존재를 물어보는 조건식
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


--DML : INSERT명령어
--사용 예1:
DEPT2 테이블에 아래와 같은 내용으로 새로운 부서 정보를 입력하세요.
INSERT INTO DEPT2(DCODE, DNAME, PDEPT, AREA)
VALUES (9000, '특판1팀','1006','임시지역');

--위에 생략하면 밑에 4개를 다 써야 함
INSERT INTO DEPT2
VALUES (9001, '특판2팀', '1006', '임시지역');

--사용 예2: 특정 칼럼만 입력하기
--부서번호와 부서명, 상위부서 값만 아래의 값으로 입력하세요
--부서번호 : 9002
--부서명 : 특판3팀
--상위부서 : 영업부
INSERT INTO DEPT2(DCODE, DNAME, PDEPT)
VALUES(9002, '특판3팀', '1006');

SELECT * FROM DEPT2;

--사용 예3: 날짜 데이터 입력하기
--아래정보를 PROFESSOR 테이블에 입력하세요
--교수번호 : 5001
--교수이름 : 김설희
--ID : LOVE_ME
--POSITION : 정교수
--PAY : 510
--입사일 : 2011년 11월 14일 <- 이 부분을 주의깊게 보세요
INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5001,'김설희','LOVE_ME', '정교수', 510, '2011-11-14');

INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5004,'김설희','LOVE_ME','정교수',510,'2011/11월/14');

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MON-DD';

INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5004,'김설희','LOVE_ME','정교수',510,'2011/11월/14');

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';

SELECT * FROM PROFESSOR;

INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5005,'김설희','LOVE_ME','정교수',510,'2011-11-14');

INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5002,'김설희','LOVE_ME','정교수',510,'2011/11/14');

INSERT INTO PROFESSOR (PROFNO, NAME, ID, POSITION, PAY, HIREDATE)
VALUES (5003,'김설희','LOVE_ME','정교수',510,'2011/11/14');

-- NULL 입력방식
SELECT * FROM DEPT2;

INSERT INTO DEPT2 (DCODE, DNAME, PDEPT)
VALUES (9002, '특판3팀', '1006');

INSERT INTO DEPT2 (DCODE, DNAME, PDEPT, AREA)
VALUES (9003, '특판4팀', '1006', NULL);

--DML : INSERT 명령어
--2) INSERT를 사용하여 여러행 입력하기
--아래와 같은 방식은 이미 생성되어 있는 테이블에서 대량의 데이터를 복사해올 때 아주 많이
--사용하는 방법입니다.
CREATE TABLE PROFESSOR2
AS SELECT * FROM PROFESSOR;
-- 다 저장
SELECT * FROM PROFESSOR2;
SELECT * FROM PROFESSOR;

CREATE TABLE PROFESSOR3
AS SELECT * FROM PROFESSOR WHERE 1 = 2;
--WHERE 조건 때매 틀만, ROW는 저장하지 않음.
SELECT * FROM PROFESSOR3;

INSERT INTO PROFESSOR3
SELECT * FROM PROFESSOR;
--이미 만들어진 틀에 값을 추가
SELECT * FROM PROFESSOR3;

--3)INSERT ALL을 이용한 여러테이블에 여러행 입력하기
--사용예 1: 다른 테이블에 한꺼번에 데이터 입력하기
--이 예제는 P_01테이블과 P_02테이블에 각각 서로 다른 데이터를 동시에 입력하는 방법으로
--보여주고 있습니다.
INSERT ALL
INTO P_01(NO,NAME)
VALUES (1,'AAA')
INTO P_02(NO, NAME)
VALUES(2,'BBB')
SELECT*FROM DUAL;

--사용예 2: 다른 테이블의 데이터를 가져와서 입력하기
--PROFESSOR 테이블에서 교수번호가 1000번에서 1999번까지인 교수의 번호와 교수이름은
--P_01테이블에 입력하고 교수번호가 2000번에서 2999번까지인 교수의 번호와 이름은
--P_02테이블에 입력하세요.
INSERT ALL
WHEN PROFNO BETWEEN 1000 AND 1999 THEN
INTO P_01 VALUES(PROFNO, NAME)
WHEN PROFNO BETWEEN 2000 AND 2999 THEN
INTO P_02 VALUES(PROFNO, NAME)
SELECT PROFNO, NAME
FROM PROFESSOR;

--사용예 3: 다른 테이블에 동시에 같은 데이터 입력하기
--PROFESSOR 테이블에서 교수번호가 3000번에서 3999번인 교수들의 교수번호와 이름을
--P_01테이블과 P_02테이블에 동시에 입력하세요.
INSERT ALL
INTO P_01 VALUES(PROFNO, NAME)
INTO P_02 VALUES(PROFNO, NAME)
SELECT PROFNO, NAME
FROM PROFESSOR
WHERE PROFNO BETWEEN 3000 AND 3999;

SELECT * FROM PROFESSOR;

--DML : UPDATE 명령어
--1. UPDATE (데이터 변경하기)
--UPDATE TABLE
--SET COLUMN = VALUE
--WHERE 조건 ;
--사용 예1:
--PROFESSOR 테이블에서 직급이 조교수인 교수들의 BONUS를 100만원으로 인상하세요
UPDATE PROFESSOR
SET BONUS = 100
WHERE POSITION = '조교수';
SELECT * FROM PROFESSOR;

--사용 예2:
--PROFESSOR 테이블에서 김명선 교수의 직급과 동일한 직급을 가진 교수들 중 현재 급여가
--250만원이 안되는 교수들의 급여를 15% 인상하세요.
UPDATE PROFESSOR
SET PAY = PAY*1.15
WHERE POSITION = ( SELECT POSITION 
                   FROM PROFESSOR
                   WHERE NAME = '김명선' )
AND PAY < 250 ;

SELECT * FROM PROFESSOR;

--DML : DELETE 명령어
--1.DELETE(데이터 삭제하기)
--DELETE FROM TABLE
--WHERE 조건 ;
--사용에:
--DEPT2 테이블에서 부서번호(DCODE)가 9000번에서 9100번 사이인 매장들을 삭제하세요.
DELETE FROM DEPT2
WHERE DCODE BETWEEN 9000 AND 9100;
--DELETE 는 데이터는 삭제되나 용량은 변함이 없다는 것!!

--DELETE, TRUNCATE, DROP의 차이
--테이블의 데이터를 삭제처리할때, DELETE, TRUNCATE를 이용한다.
--눈으로 보기에는 
--
--
--


--MERGE (테이블합치기)
--MERGE 전 테이블 내용 확인
SELECT * FROM PT_01;
SELECT * FROM PT_02;
SELECT * FROM P_TOTAL;
--MERGE 작업 쿼리1 (PT_01 테이블과 P_TOTAL 테이블 병합)
MERGE INTO P_TOTAL TOTAL
USING PT_01 P01
ON (TOTAL.판매번호 = P01.판매번호)
WHEN MATCHED THEN
UPDATE SET TOTAL.제품번호 = P01.제품번호
WHEN NOT MATCHED THEN
INSERT VALUES(P01.판매번호, P01.제품번호, P01.수량, P01.금액);

MERGE INTO P_TOTAL TOTAL
USING PT_02 P02
ON (TOTAL.판매번호 = P02.판매번호)
WHEN MATCHED THEN
UPDATE SET TOTAL.
WHEN NOT MATCHED THEN제품번호 = P02.제품번호
INSERT VALUES(P02.판매번호, P02.제품번호, P02.수량, P02.금액);

SELECT * FROM P_TOTAL;

SELECT * FROM EMP;

--commit rollback 실습 // sqld 랑 cmd 같이 진행.
--1
create table rolluptest(
num number(10),
name varchar2(20));
--sql
--SQL> select * from rolluptest;
--no rows selected
--2 아래 DBMS_RANDOM은 함수라서 있는 그대로 입력해야 함
INSERT INTO ROLLUPTEST VALUES
( ROUND (DBMS_RANDOM.VALUE(1,45), 0),
DBMS_RANDOM.STRING('A',9));
--3
SELECT * FROM ROLLUPTEST;
--여기서는 보이지만 sql에서는 안보임 = 다른 클라이언트에서는 안보임
--이럴 때 어떻게 봐야되지 하는 게 commit이다
--SQL> select * from rolluptest;
--no rows selected
COMMIT;
--DML이 아닌 DDL 같은 걸 하면 COMMIT을 자동으로 한다.
--또는 이 프로세스를 제대로 종료하면 자동 COMMIT이 된다.
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
--여기까지 해도 COMMIT은 안했기 때문에 cmd 에서는 변화가 없다 = 추가된 것이 안보인다.
COMMIT;
--COMMIT 하고 나면 추가된게 보인다. ROLLBACK; COMMIT까지 롤백하는거.
--SQL> SELECT * FROM ROLLUPTEST;

--       NUM NAME
---------- --------------------
--        25 TaMoOZMqB
--        43 jWLsLjMPc
-- 지금까지 TCL까지 설명한 거다 TCL은 DML과 관련된 거.

--DDL과 DATA DICTIONARY
--DDL : CREATE
--1.CREATE
--1) 사용예1: 일반테이블 생성ㅅ하기
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

--2. 사원테이블(EMP)에서 관리자사번(MGR)이 7566번이고 급여가 100에서 3000사이에 있는
--사원의 사번(EMPNO), 사원명(ENAME), 급여(SAL) 관리자사번(MRG)을 입력하는 INSERT문을
--작성해보자
INSERT INTO EXDDL01
SELECT EMPNO, ENAME, SAL, MGR
FROM EMP A
WHERE A.MGR = 7566
AND A.SAL BETWEEN 1000 AND 3000;

SELECT * FROM EXDDL01;

--(5) 사용 예5: 가상 컬럼 테이블 생성하기 (11g부터 추가된 기능)
--STEP 1. 가상 컬럼을 가지는 VT001 테이블을 생성합니다.
CREATE TABLE VT001
( NO1 NUMBER,
  NO2 NUMBER,
  NO3 NUMBER GENERATED ALWAYS AS (NO1 + NO2) VIRTUAL );
--  위 명령어에서 4번 라인의 NO3 칼럼은 NO1+NO2의 값을 가지는 가상 컬럼입니다.

--STEP 2. VT001 테이블에 데이터를 입력합니다.
INSERT INTO VT001 VALUES (1,2,3);
INSERT INTO VT001 VALUES (1,2,3)
--ERROR AT LINE 1:
--ORA-54013:INSERT OPERTION DISALLOWED ON VIRTUAL COLUMNS

INSERT INTO VT001(NO1,NO2)
VALUES(1,2);
---위 결과로 알 수 있듯이 가상컬럼에는 사용자가 데이터를 입력할 수 없습니다.

--STEP 3. 입력된 데이터를 조회합니다.
SELECT * FROM VT001;

--STEP 4. 기존 값을 변경한 후 가상 칼럼에 반영되는지 확인합니다.
--NO1을 10으로 바꾸는 일. 잘 된다.
UPDATE VT001
SET NO1=10;

SELECT * FROM VT001;

--STEP 5.인덱스와 제약조건이 생성가능한지 테스트 합니다.
--ALTER는 그 테이블에 대한 조건을 바꾸는 것. 두번재 문장을 실행하면 유니크에 읜한 constra- 에러
ALTER TABLE VT001 ADD
CONSTRAINT NO3_CONSTRAINT UNIQUE(NO3);
INSERT INTO VT001(NO1,NO2) VALUES(6,6);
SELECT * FROM VT001;


--8일차
--STEP 6. 새로운 가상 칼럼을 추가합니다.
ALTER TABLE VT001
ADD ( NO4 GENERATED ALWAYS AS ((NO1*12)+NO2));
--새로운 가상컬럼이 추가되면 즉시 값이 반영된다.
SELECT * FROM VT001;

--쿼리 대소문자 구분 안하는 이유는?
--VALUE는 대소문자를 구분
--STEP 7.테이블에서 가상 칼럼 내역을 조회합니다.
SELECT COLUMN_NAME
,DATA_TYPE
,DATA_DEFAULT
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'VT001'
ORDER BY COLUMN_ID;

--STEP 8. 조건절을 활용한 가상컬럼 생성하기
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
--1) 사용 예 1: 새로운 컬럼을 추가하기
CREATE TABLE DEPT6
AS
SELECT DCODE, DNAME
FROM DEPT2
WHERE DCODE IN ( 1000, 1001, 1002 );

SELECT * FROM DEPT6;

ALTER TABLE DEPT6
ADD ( LOC VARCHAR2(10) );

SELECT * FROM DEPT6;

--기본값 지정하여 추가하기
ALTER TABLE DEPT6
ADD ( LOC2 VARCHAR2(10) DEFAULT '서울' );

SELECT * FROM DEPT6;

--2) 사용 예 2: 테이블의 칼럼 이름 변경하기
ALTER TABLE DEPT6 RENAME COLUMN LOC2 TO AREA;

RENAME DEPT6 TO DEPT7 ;

--SELECT * FROM DEPT6 는 없음 DEPT7 로 변경
SELECT * FROM DEPT7;

--3) 사용 예 3: 칼럼의 데이터 크기를 변경하기
ALTER TABLE DEPT7
MODIFY ( DCODE VARCHAR2(10) );
-- VARCHAR2(6) -> VARCHAR2(10) 으로 변경

--CONSTRATINS : 제약조건
--4)사용 예 4: 칼럼 삭제하기
ALTER TABLE DEPT7 DROP COLUMN LOC;

ALTER TABLE DEPT7 DROP COLUMN LOC CASCADE CONSTRAINTS;
--> CASCADE CONSTRAINTS; 다른데  걸려있지만  지울거다

ALTER TABLE DEPT DROP COLUMN DEPTNO;
--참조하는 테이블(CHILD TABLE)은 삭제 가능하지만 참조되어지는 테이블(PARENT TABLE)DMF
--삭제하려면 CASCADE CONSTRATINS 옵션을 추가로 사용해야 한다.

--5) 읽기 전용 테이블로 변경하기 = 11g NEW FEATURE
CREATE TABLE T_READ
( NO NUMBER, 
 NAME VARCHAR2(10) );
 
 INSERT INTO T_READ
 VALUES (1, 'AAA');
 
 SELECT * FROM T_READ;
 
 ALTER TABLE T_READ READ ONLY;  -- <- 읽기전용으로 변경합니다.
-- 읽기 전용으로 변경된 테이블에 데이터 입력 시도함 -> 안된다. READ ONLY 로 변경해서.
INSERT INTO T_READ
VALUES (2, 'BBB');

--읽기전용으로 변경된 테이블에 컬럼 추가 시도함
ALTER TABLE T_READ
ADD ( TEL NUMBER DEFAULT 111);

ALTER TABLE T_READ READ WRITE; 
--읽기 쓰기 모드로 변경함
INSERT INTO T_READ VALUES(1, 'AAA');

ALTER TABLE T_READ READ ONLY;
DROP TABLE T_READ;
--읽기모드이지만 삭제는 가능함

--3. TRUNCATE 명령
TRUNCATE TABLE DEPT7;

--4. DROP 명령
DROP TABLE DEPT7;

SELECT * FROM TAB;
--DROP TABLE AAA PURGE;
--오나클 10G부터는 위 명령어로 테이블을 삭제할 경우 테이블이 삭제되는 게 아니라
--휴지통으로 보내지게 된다.
--삭제된 테이블의 이름은 BIN$...로 변경된다. 이 기능은 무료버전에서는 불가

--6. 데이터 딕셔너리(DICTIONARY)
SELECT * FROM DICTIONARY;
SELECT * FROM DICT;

SELECT TABLE_NAME FROM USER_TABLES;

SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

SELECT * FROM DBA_TABLES;

SELECT * FROM DBA_USERS WHERE USERNAME = 'KIC';

SELECT * FROM USER_INDEXES;

SELECT * FROM USER_IND_COLUMNS;

--FOREIGN 외부키
--2. 각 제약 조건의 설정 방법
--1) 테이블 생성 동시에 설정하기
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
  
--약식으로 생성하기, 키가 생략된 거
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
--테이블 이름은 항상 대문자로 써야한다.

--2) 테이블 생성 후 추가하기 / NULL <-> NOT NULL 변경방법
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NAME_UK UNIQUE(NAME);

ALTER TABLE EMP4
ADD CONSTRAINT EMP4_AREA_NN NOT NULL(AREA);
--> 에러난다. ADD로 하면 안된다는 거지 

ALTER TABLE EMP4
MODIFY ( AREA CONSTRAINT EMP4_AREA_NN NOT NULL );

--FOREIGN KEY 추가하기
--EMP4 테이블의 NO 컬럼이 EMP2 테이블의 EMPNO 컬럼의 값을 참조하도록
--참조키 제약 조건을 설정하세요.
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NO_FK FOREIGN KEY(NO)
REFERENCES EMP2(EMPNO) ;

--FOREIGN KEY 추가시 주의 사항
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NAME_FK FOREIGN KEY(NAME)
REFERENCES EMP2(NAME);

ALTER TABLE EMP2
ADD CONSTRAINT EMP2_NAME_UK UNIQUE(NAME);
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NAME_FK FOREIGN KEY(NAME)
REFERENCES EMP2(NAME) ON DELETE CASCADE;
--부모 테이블 칼럼에 UNIQUE나 PK 칼럼이어야 함.

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

--EMP2 TABLE에 NAME을 UNIQUE 제약을 정의한다
ALTER TABLE EMP2
ADD CONSTRAINT EMP2_NAME_UK UNIQUE(NAME);

--EMP4 TABLE ON DELETE CASCADE; 설정한다
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NAME_FK FOREIGN KEY(NAME)
REFERENCES EMP2(NAME) ON DELETE CASCADE;

--EMP4 TABLE FOREIGN KEY 지움
ALTER TABLE EMP4
DROP CONSTRAINT EMP4_NAME_FK;

--EMP4 TABLE ON DELETE SET NULL; 설정한다
ALTER TABLE EMP4
ADD CONSTRAINT EMP4_NAME_FK FOREIGN KEY(NAME)
REFERENCES EMP2(NAME) ON DELETE SET NULL;

SELECT * FROM EMP2;
SELECT * FROM EMP4;
--EMP2에 NAME으로 저장된 이름만 입력 가능함.
INSERT INTO EMP4 VALUES(112, '11111', 112 ,1, 1000);
INSERT INTO EMP4 VALUES(111, '나사장', 111, 1, 1000);
INSERT INTO EMP4 VALUES(112, '전부장', 112 ,1, 1000);
DELETE FROM EMP2 WHERE NAME = '전부장';
--> 전부장 이름이 NULL로 됨. 위에서 DELETE SET NULL로 해서.


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


--5) 제약조건 삭제하기
ALTER TABLE EMP4
DROP CONSTRAINT EMP4_NAME_FK;


--1. 인덱스
--(1)UNIQUE INDEX
--CREATE UNIQUE INDEX 인덱스명
--ON 테이블이름(컬럼명1 ASC | DESC, 컬럼명....)
CREATE UNIQUE INDEX IDX_DEPT2_DNAME
ON DEPT2(DNAME);

INSERT INTO DEPT2
VALUES(9100, '임시매장', 1006, '서울지사');
SELECT * FROM DEPT2;
--아레는 에러
INSERT INTO DEPT2
VALUES(9101, '임시매장', 1006, '부산지사');
--유니크 인덱스는 유니크 제약 조건과 동일하다. 즉 중복되는 값을 입력할 수 없다.

--(2)NON UNIQUE INDEX 
--CREATE INDEX 인덱스명
--ON 테이블명(컬럼명1 ASC | DESC, 컬럼명2, .....);
CREATE UNIQUE INDEX IDX_PROF_POSITION
ON PROFESSOR(POSITION) ;
--위에는 에러
CREATE INDEX IDX_PROF_POSITION
ON PROFESSOR(POSITION DESC);

--(5) 결합 인덱스 (COMPOSITE INDEX) 사실안쓰는게 좋음. 퍼포먼스 떨어질 때가 있어서.

--5 인덱스의 주의사항
--1) DML에 취약하다
--(1) INSERT-  INDEX SPLIT 현상
--(2) DELETE - 인덱스 내용이 삭제가 안됨
--(3) UPDATE- DELETE + INSERT 작업이 발생함
--2) 타 SQL 실행에 악영향을 줄 수 있다.

--6.인덱스 관리 방법
--1) 인덱스 조회하기
SELECT TABLE_NAME, INDEX_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'DEPT2';


--VIEW
--2.단순 VIEW
--생성예제 1:
--PROFESSOR 테이블의 PROFNO, NAME, EMAIL, HPAGE 컬럼만 사용하는 VIEW를 생성하세요
--VIEW 이름은 V_PROF_로 하세요
CREATE OR REPLACE VIEW V_PROF
AS
SELECT PROFNO, NAME, EMAIL, HPAGE
FROM PROFESSOR;
SELECT * FROM V_PROF;

--2.복합 VIEW(COMPLEX VIEW)
--생성 예제 2:
--PROFESSOR 테이블과 DEPARTMENT 테이블을 조인하여 교수번호와 교수이름과 소속학과 이름을
--조회하는 VIEW를 생성하세요 VIEW 이름은 V_PROF_DEPT로 하세요
CREATE OR REPLACE VIEW V_PROF_DEPT
AS
SELECT P.PROFNO "교수번호===",
            P.NAME "교수명",
            D.DNAME "소속학과명"
      FROM PROFESSOR P, DEPARTMENT D
    WHERE P.DEPTNO = D.DEPTNO;

SELECT * FROM V_PROF_DEPT;


--인라인뷰
--생성예제1:
--STUDENT 테이블과 DEPARTMENT 테이블을 사용하여 학과별로 가장 키가 큰 학생들의
--최대 몸무게, 학과이름을 출력하세요.
SELECT D.DNAME "학과명",
           S.MAX_HEIGHT "최대키",
           S.MAX_WEIGHT "최대몸무게"
FROM ( SELECT DEPTNO1, MAX(HEIGHT) MAX_HEIGHT, MAX(WEIGHT) MAX_WEIGHT
            FROM STUDENT
            GROUP BY DEPTNO1 ) S, DEPARTMENT D
WHERE S.DEPTNO1 = D.DEPTNO;

SELECT * FROM STUDENT;

--INLINE VIEW 연습문제 1:
--STUDENT 테이블과 DEPARTMENT 테이블을 사용하여 학과별로 가장 키가 큰 학생들의 이름과 키,
--학과이름을 아래와 같이 V_STU01 VIEW로 만드세요
CREATE OR REPLACE VIEW V_STU01
AS
SELECT D.DNAME, S.HEIGHT, S.NAME, S.HEIGHT
FROM STUDEMT S, DEPARTMENT D
WHERE S.DEPTNO1 = D.DEPTNO
AND S.HEIGHT = ( SELECT MAX(HEIGHT) FROM STUDENT WHERE S.DEPTNO1 = DEPTNO1 ;


--INLINE VIEW 연습문제 2:
--STUDENT 테이블에서 학생의 키가 동일학년의 평균 키 보다 큰 학생들의 학년과 이름과 키, 해당 학년의 평균 키를 출력하는
--V_STU01 VIEW 생성하세요(학년 컬럼으로 오름차순 정렬해서 출력하세요.
CREATE OR REPLACE VIEW V_STU01
AS
SELECT GRADE, NAME, HEIGHT,
ROUND((SELECT AVG(HEIGHT) FROM STUDENT S2
WHERE S2.GRADE = S.GRADE),1) "평균"
FROM STUDENT S
WHERE S.HEIGHT > (SELECT AVG(HEIGHT) FROM STUDENT S2
WHERE S2.GRADE = S.GRADE ) ORDER BY 1;
SELECT * FROM V_STU01;



--SEQUENCE(시퀀스)
--사용예제:
--아래의 조건으로 제품 주문번호를 생성하기 위해 사용할 SEQUENCE를 만드세요
--시작번호 : 1000
--끝번호 : 1010
--증가값 : 1
--반복되고 캐싱은 2개씩 되도록 하세요
CREATE SEQUENCE SEQ_JUMUN_NO
INCREMENT BY 1
START WITH 1000
MAXVALUE 1010
MINVALUE 990
CYCLE
CACHE 2;

--1) SEQUENCE 생성 및 옵션 확인하기
CREATE TABLE JUMUN
(J_NO NUMBER(4),
J_NAME VARCHAR2(10));
--예제용 테이블 생성
INSERT INTO JUMUN
VALUES ( SEQ_JUMUN_NO.NEXTVAL,'AAAA');
SELECT * FROM JUMUN;

--NEXTVAL : 다음값
--CURRVAL : 현재값
SELECT SEQ_JUMUN_NO.CURRVAL FROM DUAL;
SELECT SEQ_JUMUN_NO.NEXTVAL FROM DUAL;

INSERT INTO JUMUN
VALUES(SEQ_JUMUN_NO.NEXTVAL,'BBBB');
SELECT * FROM JUMUN;

SELECT SEQ_JUMUN_NO.CURRVAL FROM DUAL;

--2) 값이 감소하는 SEQUENCE 생성 및 사용하기
CREATE SEQUENCE S_REV
INCREMENT BY -1
MINVALUE 0
MAXVALUE 10
START WITH 5;

SELECT S_REV.CURRVAL FROM DUAL;
--> 처음 시퀀스를 만들고 CURRVAL을 부르면 에러 난다.
SELECT S_REV.NEXTVAL FROM DUAL;


--SEQUENCE 조회 및 수정하기
COL 이름 FOR A15;
SELECT SEQUENCE_NAME "이름",
            MIN_VALUE "MIN 값",
            MAX_VALUE "최대값",
            INCREMENT_BY "증가값",
            CYCLE_FLAG "CYCLE?",
            ORDER_FLAG "정렬",
            CACHE_SIZE "캐싱값",
            LAST_NUMBER "마지막생성값"
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'SEQ_JUMUN_NO';

ALTER SEQUENCE SEQ_JUMUN_NO
MAXVALUE 1100
CACHE 5;

DROP SEQUENCE SEQ_JUMUN_NO;


--2. SYBONYM(동의어)
--2.SYNONYM(동의어)

CREATE SYNONYM E2 FOR EMP2;
SELECT * FROM E2;
-->EMP2를 E2로 부른 것.
CREATE PUBLIC SYNONYM D2 FOR DEPARTMENT;
--PUBLIC 은 다른 유저에서도 부를 수 있게 하는 것
--KIC 사용자의 DEPARTMENT 테이블 동의어를 D2로 생성하며 모든 사용자가 사용 할 수 있게 생성.
SELECT * FROM E2;
SELECT * FROM D2;

--SYNONYM 삭제하기
DROP SYNONYM E2;

--ROLE 관리하기 (SYSTEM USER) CMD에서 SQLPLUS에서 해야됨.
--1)ROLE 생성하기
CREATE ROLE TROLE;

--2) ROLE에 CREATE SESSION, CREATE TABLE 권한 할당하기
GRANT CREATE SESSION, CREATE TABLE TO TROLE;

--3) TROLE 할당하기
GRANT TROLE TO KIC;

4) 어떤 사용자가 어떤 ROLE을 사용하는지 확인하기
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
--1. 각 부서에 따른 근무직원 목록을 출력하시오.
--조건1 : 10번 부서는 제외
--조건2 : 급여가 1000만원 미만 직원은 제외
--출력형태 : 사번, 직원명, 급여, 부서번호, 부서명, job
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT E.DEPTNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, E.JOB
FROM EMP E, DEPT D
WHERE NOT E.DEPTNO IN ('10')
AND E.SAL > 1000 ;

WHERE DEPTNO NOT IN('10');
AND SAL >1000;

--Having절 사용하기
--평균 급여가 350이상인 부서의 부서번호와 평균급여를 구하세요
select deptno, avg(nvl(pay,0)) 
from professor
where avg(pay) >=350
group by deptno;
select deptno, avg(nvl(pay,0)) 평균
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

--7. emp 테이블을 사용하여 부서별 급여 평균(평균은2 ,000 이상)을 구하시오.
SELECT * FROM EMP;
SELECT DEPTNO, TO_CHAR(AVG(SAL),'9999.99')
FROM EMP
GROUP BY DEPTNO
having avg(SAL) > 2000
ORDER BY 1;


select EMP 부서, round(avg(nvl(pay,0))) 급여평균
from EMP
group by EMP;


--EMP2 테이블을 조회해서 직원 둘 중에서 자신의 직급의 평균연봉과 같거나 많이 받는 사람들의
--이름과 직급, 현재 연봉을 출력하세요.
SELECT NAME 사원이름, POSITION 직급, PAY 급여
FROM EMP2 A 
WHERE PAY >= (SELECT AVG(PAY) 
              FROM EMP2
               WHERE A.POSITION = POSITION);
               
낫널로 바꿔라
--emp 테이블로 평균 연봉보다 연봉이 높은 직원들을 모두 출력하는 vtest라는 뷰 파일을 작성하시오.
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


--9. emp 테이블에 대한 컬럼명 ename에 , not NULL 으로 하는 정의 하는 sql을 작성하세요
SELECT * FROM EMP;


ALTER TABLE EMP RENAME COLUMN ename TO 'not NULL';


ALTER TABLE EMP RENAME COLUMN ENAME TO "NOT NULL";



--10. gogak , gift table 을 이용하여 받을수 있는 사은품 리스트를 아래와 같이 프린트 하세요

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


insert into member values ('11', '11', '김명선', 1, '010-1212', 'email1', 'img01.png');
insert into member values ('12', '11', '김자바', 2, '010-1213', 'email2', 'img02.png');
insert into member values ('13', '11', '박자바', 1, '010-1214', 'email3', 'img03.png');
insert into member values ('14', '11', '홍길동', 2, '010-1215', 'email4', 'img04.png');
insert into member values ('15', '11', '나바바', 1, '010-1216', 'email5', 'img05.png');
insert into member values ('16', '11', '나몰라', 2, '010-1217', 'email6', 'img07.png');
insert into member values ('admin', '11', '실행중', 1, '010-1218', 'email7', 'img09.png');
commit;
select * from member;



210404
select * from MEMBER_INF;
insert into member_inf values ('aaaaa', 'aaaaa', 'andyairis@gmail.com', '01066406060', '아직없네', '개발자', '31', 'NAVER');


