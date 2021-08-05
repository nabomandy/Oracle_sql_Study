SET SERVEROUTPUT ON;
-->이걸 실행 안하고 아래 작업을 하면, 프린트가 안된다. = 100이 뜨지 않는다.
-->아래 거 할때, 여러개의 쿼리가 있을 때는 실행할 걸 드래그 해서 실행해야 오류가 안난나.
DECLARE
    VI_NUM NUMBER;
-->선언부
BEGIN
    VI_NUM := 100;
    DBMS_OUTPUT.PUT_LINE(VI_NUM);
-->실행부    

END;

DECLARE
   A INTEGER := 2**2*3**2;
-- >선언부 2의 제곱 곱하기 3의 제곱.**이 우선순위가 높다
BEGIN
   DBMS_OUTPUT.PUT_LINE('A='||TO_CHAR(A));
   DBMS_OUTPUT.PUT_LINE('A='||A);
END;

--오라클에서는 + 로 연결이 안됨. ||나 컨캣을 쓴다.

--1.구구단 중 3단을 출력하는 익명 블록을 만들어보자.
BEGIN
  DBMS_OUTPUT.PUT_LINE('3*1=' || 3*1);
  DBMS_OUTPUT.PUT_LINE('3*2=' || 3*2);
  DBMS_OUTPUT.PUT_LINE('3*3=' || 3*3);
  DBMS_OUTPUT.PUT_LINE('3*4=' || 3*4);
  DBMS_OUTPUT.PUT_LINE('3*5=' || 3*5);
  DBMS_OUTPUT.PUT_LINE('3*6=' || 3*6);
  DBMS_OUTPUT.PUT_LINE('3*7=' || 3*7);
  DBMS_OUTPUT.PUT_LINE('3*8=' || 3*8);
  DBMS_OUTPUT.PUT_LINE('3*9=' || 3*9);
END;

--
DECLARE
-->선언부 시작됨
VNO NUMBER(4);
VNAME VARCHAR2(10);

BEGIN
-->실행부 시작됨
SELECT EMPNO, ENAME INTO VNO, VNAME
FROM EMP
WHERE EMPNO = 7900;

DBMS_OUTPUT.PUT_LINE(VNO||'  '||VNAME);
END;
-->실행부 종료됨

--사용 예1:
--PROFESSOR 테이블에서 교수번호가 1001번인 교수의 교수번호와 급여를 조회한 후
--변수에 저장해서 화면에 출력하세요
DECLARE
    V_PROFNO PROFESSOR.PROFNO%TYPE;
    V_PAY PROFESSOR.PAY%TYPE;
  BEGIN
    SELECT PROFNO, PAY INTO V_PROFNO, V_PAY
    FROM PROFESSOR WHERE PROFNO = 1001;
DBMS_OUTPUT.PUT_LINE(V_PROFNO|| ' 번 교수의 급여는'||V_PAY||'입니다');

END;

--사용 예 2:
--EMP2 테이블을 사용하여 사원번호를 입력 받아서 사원의 사번과 이름, 생일을
--출력하세요 (EMP2.EMPNO%TYPE) 20000102 김설악 22-MAR-83
DECLARE
    V_EMPNO EMP2.EMPNO%TYPE;
    V_NAME EMP2.NAME%TYPE;
    V_BIRTH EMP2.BIRTHDAY%TYPE;
  BEGIN
   SELECT EMPNO, NAME, BIRTHDAY
   INTO V_EMPNO, V_NAME, V_BIRTH
   FROM EMP2
   WHERE EMPNO = '&EMPNO';
  DBMS_OUTPUT.PUT_LINE(V_EMPNO||'  '||V_NAME||'  '||V_BIRTH);
  
END;

--사용 예 3:
--교수번호를 입력 받은 후 PROFESSOR 테이블을 조회하여 해당교수의 교수번호와 교수이름, 부서번호, 입사일을 출력하세요
DECLARE
    V_PROFNO PROFESSOR.PROFNO%TYPE;
    V_NAME PROFESSOR.NAME%TYPE;
    V_DEPTNO PROFESSOR.DEPTNO%TYPE;   
    V_HIREDATE PROFESSOR.HIREDATE%TYPE;   

BEGIN
   SELECT PROFNO, NAME, DEPTNO, HIREDATE
   INTO V_PROFNO, V_NAME, V_DEPTNO, V_HIREDATE
   FROM PROFESSOR
   WHERE PROFNO = '&교수번호';
-->입력받는게 정수 일때는 '' 안써도 됨

   DBMS_OUTPUT.PUT_LINE(V_PROFNO||'  '||V_NAME||'  '||V_DEPTNO||'  '||V_HIREDATE);   

END;
   
--   2) PL/SQL 내에서의 DML 문장 사용하기
--(1) INSERT 문장 수행하기 예 1:
CREATE TABLE PL_TEST
      (NO NUMBER,
      NAME VARCHAR2(10));

CREATE SEQUENCE PL_SEQ;

--PL/SQL에서 INSERT를 수행합니다.
BEGIN
  INSERT INTO PL_TEST
  VALUES(PL_SEQ.NEXTVAL, 'AAA');
END;
      
SELECT * FROM PL_TEST;

----INSERT 문장 수행하기 예2:
--CREATE TABLE PL_TEST2
--(NO NUMBER,
--NAME VARCHAR2(10),
--ADDR VARCHAR2(10) );
--> 실습용 테이블 생성하기

--사용자로부터 번호(NO), 이름(NAME), 주소(ADDR)값을 입력받은 후 PL_TEST2 테이블에 입력하는
--PL/SQL문장을 작성하세요
CREATE TABLE PL_TEST2
  (NO NUMBER,
   NAME VARCHAR2(10),
   ADDR VARCHAR2(10) );
   
DECLARE
V_NO NUMBER := '&NO';
V_NAME VARCHAR2(10) := '&NAME';
V_ADDR VARCHAR2(10) := '&ADDR';
BEGIN
INSERT INTO PL_TEST2
VALUES (V_NO, V_NAME, V_ADDR);
END;

SELECT * FROM PL_TEST2;

--PL/SQL에서 UPDATE를 수행합니다.
BEGIN 
   UPDATE PL_TEST2
   SET NAME = 'BBB'
   WHERE NO = 1 ;
-- > WHERE는 기존에 있는 값 = 바꾸려는 현재값 을 입력해야 한다. =없는 값 입력하면 에러.  
END;

SELECT * FROM PL_TEST2;

--PL/SQL에서 MERGE 작업을 수행합니다.
CREATE TABLE PL_MERGE1
(NO NUMBER, NAME VARCHAR2(10));

CREATE TABLE PL_MERGE2
(NO NUMBER, NAME VARCHAR2(10));

INSERT INTO PL_MERGE1 VALUES(1,'AAA');
INSERT INTO PL_MERGE1 VALUES(2,'BBB');

INSERT INTO PL_MERGE2 VALUES(1,'CCC');
INSERT INTO PL_MERGE2 VALUES(3, 'DDD');

SELECT * FROM PL_MERGE1;
SELECT * FROM PL_MERGE2;

--
BEGIN
 MERGE INTO PL_MERGE2 M2
 USING PL_mERGE1 M1
 ON(M1.NO = M2.NO)
 WHEN MATCHED THEN
 UPDATE SET
 M2.NAME = M1.NAME
 WHEN NOT MATCHED THEN
 INSERT VALUES(M1.NO, M1.NAME);
END;

SELECT * FROM PL_MERGE2;

--식별자 따옴표로 묶어서 사용
DECLARE
"PI" NUMBER := 3.14;
"TABLE" NUMBER :=20;
"SELECT NO" NUMBER := 999;
BEGIN

DBMS_OUTPUT.PUT_LINE("PI" || '       '||"TABLE" || '  ' || "SELECT NO");

END;

--9.중첩된 PL/SQL 블록 작성하기
--11번 줄의 V_SECOND 변수 때문에 에러가 발생함. 변수의 범위가 중요함.
DECLARE
   V_FIRST VARCHAR2(5) := 'OUTER';
  BEGIN
     DECLARE
       V_SECOND VARCHAR2(5) := 'INNER';
     BEGIN
       DBMS_OUTPUT.PUT_LINE(V_FIRST);
       DBMS_OUTPUT.PUT_LINE(V_SECOND);
     END;
    DBMS_OUTPUT.PUT_LINE(V_FIRST);
    DBMS_OUTPUT.PUT_LINE(V_SECOND);
  END;
  
  
-- CONSTANT : 수정불가 변수 정의함
DECLARE
  V_EMPNO CONSTANT NUMBER(1) :=3;
BEGIN
  V_EMPNO :=5;
  DBMS_OUTPUT.PUT_LINE('V_EMPNO :' || V_EMPNO);
END;
-->에러 남 CONSTANT를 지우고 하면 에러가 안난다.
DECLARE
  V_EMPNO NUMBER(1) :=3;
BEGIN
  V_EMPNO :=5;
  DBMS_OUTPUT.PUT_LINE('V_EMPNO :' || V_EMPNO);
END;

--DEFAULT 기본값 정의 수정 가능함
DECLARE
  V_CODE NUMBER(2) NOT NULL DEFAULT 10;
BEGIN
  V_CODE :=20;
  DBMS_OUTPUT.PUT_LINE('V_CODE :' || V_CODE);
END;

--2)REFERENCE 변수%
--(2) ROWTYPE 변수를 활용하여 데이터 출력하기
앞의 예 1번에서 출력했던 내용을 ROWTYPE 변수를 사용하여 출력하세요.
DECLARE
  V_ROW EMP%ROWTYPE;
  
BEGIN
  SELECT * INTO V_ROW
  FROM EMP
  WHERE EMPNO=7900;
  
  DBMS_OUTPUT.PUT_LINE(V_ROW.EMPNO ||' '|| V_ROW.ENAME ||' '||V_ROW.SAL);
END;

--(3) ROWTYPE 변수를 활용한 데이터의 입력
--실습용 테이블 생성하기
CREATE TABLE ROW_TEST
 ( NO NUMBER, NAME VARCHAR2(10), HDATE DATE );

CREATE TABLE ROW_TEST2 
AS SELECT * FROM ROW_TEST;

INSERT INTO ROW_TEST 
 VALUES (1, 'AAA', SYSDATE);
INSERT INTO ROW_TEST
VALUES (2, 'BBB', SYSDATE);
INSERT INTO ROW_TEST
VALUES (3, 'CCC', SYSDATE);

SELECT * FROM ROW_TEST;
SELECT * FROM ROW_TEST2;

--ROWTYPE 변수를 활용한 데이터 입력
DECLARE
V_RECORD ROW_TEST%ROWTYPE;
BEGIN 
SELECT * INTO V_RECORD
FROM ROW_TEST
WHERE NO=1 ;
INSERT INTO ROW_TEST2
VALUES V_RECORD ;
END;

SELECT * FROM ROW_TEST2;
SELECT * FROM ROW_TEST;

--(4)ROWTYPE 변수를 활용한 데이터의 변경
DECLARE
V_RECORD ROW_TEST%ROWTYPE;
BEGIN
SELECT * INTO V_RECORD
FROM ROW_TEST
WHERE NO=1;

V_RECORD.NAME := 'DDD';

UPDATE ROW_TEST2
SET ROW=V_RECORD
WHERE NO=1;
END;
--> AAA였던 값이 DDD 로 변경

SELECT * FROM ROW_TEST2;

--예제1.
--%TYPE 변수를 사용하여 EMP, DEPT 테이블을 조인하여 EMPNO=7900인 사람의 정보를
--4개의 변수에 넣은 후 EMPNO, ENAME, DEPTNO, DNAME을 아래와 같이 나오도록 출력하세요
DECLARE
    V_EMPNO EMP.EMPNO%TYPE;
    V_ENAME EMP.ENAME%TYPE;
    V_DEPTNO DEPT.DEPTNO%TYPE;
    V_DNAME DEPT.DNAME%TYPE;
  BEGIN
    SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME 
    INTO V_EMPNO, V_ENAME, V_DEPTNO, V_DNAME
    FROM EMP E, DEPT D 
    WHERE E.EMPNO = 7900 AND E.DEPTNO = D.DEPTNO;
    
    DBMS_OUTPUT.PUT_LINE(V_EMPNO||'          '||V_ENAME||'      '||V_DEPTNO||'     '||V_DNAME);
END;

SELECT * FROM EMP;
SELECT * FROM DEPT;

--예제2. 사용자로부터 두개의 숫자를 입력 받아서 합을 구하세요.
--첫번? 수:12, 두번째 수:13, 합은 :25입니다.

DECLARE
    V_NO1 NUMBER := &NO1 ;
    V_NO2 NUMBER := &NO2 ;
    V_SUM NUMBER ;
  BEGIN
    V_SUM := V_NO1 + V_NO2 ;
   DBMS_OUTPUT.PUT_LINE('첫번째 수: ' || V_NO1 || ', 두번째 수 : ' || V_NO2 || ', 합은 : ' || V_SUM || '입니다.');

END;

--2) 복합변수
DECLARE 
  TYPE EMP_RECORD_TYPE IS RECORD
  ( EMP_NO EMP.EMPNO%TYPE,
    EMP_NAME EMP.ENAME%TYPE,
    JOB EMP.JOB%TYPE) ;
    
  V_RECL EMP_RECORD_TYPE;
   BEGIN
    SELECT EMPNO, ENAME, JOB
    INTO V_RECL
    FROM EMP
    WHERE EMPNO = 7499;
    DBMS_OUTPUT.PUT_LINE ( '사원번호     사원명       업무');
    DBMS_OUTPUT.PUT_LINE (V_RECL.EMP_NO||'    '||
                                         V_RECL.EMP_NAME||'    '||
                                         V_RECL.JOB) ;
END;



--RECORD TYPE 변수 사용 예1:
--RECORD TYPE 변수를 활용하여 부서번호가 30번인 부서의 부서번호와 부서명과
--지역명을 RECORD TYPE 변수에 저장한 후 출력하세요. 단 RECORD TYPE 데이터 
--타입은 DEPT_RECORD_TYPE로 하겠습니다.
DECLARE
TYPE DEPT_RECORD_TYPE IS RECORD
  (DEPTNO DEPT.DEPTNO%TYPE,
   DNAME DEPT.DNAME%TYPE,
   LOC DEPT.LOC%TYPE) ;
   
   V_DEPT DEPT_RECORD_TYPE;
   
   BEGIN
    SELECT DEPTNO, DNAME, LOC
    INTO V_DEPT
    FROM DEPT
    WHERE DEPTNO = 30;
    DBMS_OUTPUT.PUT_LINE ( '부서번호     부서명       위치');
    DBMS_OUTPUT.PUT_LINE (V_DEPT.DEPTNO||'    '||
                                         V_DEPT.DNAME||'    '||
                                         V_DEPT.LOC) ;
END;

SELECT * FROM DEPT;

--RECORD TYPE 변수 사용 예2:
--EMP2 테이블을 사용하여 사용자로부터 사원번호를 입력 받은 후 아래와 같이 사원번호.
--사원이름, 직급, 생일, 연락처, 급여를 출력하세요.
--단 직급이 없는 사원은 직급을 사원으로 표시해서 출력하세요.

SELECT * FROM EMP2;

DECLARE 
TYPE DEPT_RECORD_TYPE IS RECORD
--DEPT_RECORD_TYPE는 그냥 이름이라 다른 거로 바꿔도 됨.
  (V_EMPNO EMP2.EMPNO%TYPE,
   V_NAME EMP2.NAME%TYPE,
   V_BIRTH EMP2.BIRTHDAY%TYPE,
   V_TEL EMP2.TEL%TYPE,
   V_PAY EMP2.PAY%TYPE,
   V_POSITION EMP2.POSITION%TYPE) ;
   
   V_DEPT DEPT_RECORD_TYPE;
   
   BEGIN
    SELECT EMPNO, NAME, BIRTHDAY, TEL, PAY, NVL(POSITION, '사원')
    INTO V_DEPT.V_EMPNO, V_DEPT.V_NAME, V_DEPT.V_BIRTH,
    V_DEPT.V_TEL, V_DEPT.V_PAY, V_DEPT.V_POSITION
    FROM EMP2
    WHERE EMPNO = '&EMPNO' ;
    DBMS_OUTPUT.PUT_LINE (' 사원번호 : ' ||V_DEPT.V_EMPNO);
    DBMS_OUTPUT.PUT_LINE (' 사원명 : ' ||V_DEPT.V_NAME);
    DBMS_OUTPUT.PUT_LINE (' 직급 : ' ||V_DEPT.V_POSITION);
    DBMS_OUTPUT.PUT_LINE (' 생일 : ' ||V_DEPT.V_BIRTH);
    DBMS_OUTPUT.PUT_LINE (' 연락처 : ' ||V_DEPT.V_TEL);
    DBMS_OUTPUT.PUT_LINE (' 급여 : ' ||V_DEPT.V_PAY);
                                         
END;

--RECORD TYPE 변수 사용 예 3:
--EMP2 테이블을 사용하여 사용자로부터 사원번호를 입력 받은 후 아래와 같이 사원번호, 사원이름.
--부서명(DEPT2.DNAME), 직급, 생일, 연락처, 급여를 출력하세요.
--단 직급이 없는 사원은 직급을 사원으로 표시해서 출력하세요
DECLARE 
TYPE DEPT_RECORD_TYPE IS RECORD
--DEPT_RECORD_TYPE는 그냥 이름이라 다른 거로 바꿔도 됨.
  (V_EMPNO EMP2.EMPNO%TYPE,
   V_NAME EMP2.NAME%TYPE,
   V_BIRTH EMP2.BIRTHDAY%TYPE,
   V_TEL EMP2.TEL%TYPE,
   V_PAY EMP2.PAY%TYPE,
   V_POSITION EMP2.POSITION%TYPE,
   V_DNAME DEPT2.DNAME%TYPE   ) ;
   
   V_DEPT DEPT_RECORD_TYPE;
   
   BEGIN
    SELECT EMPNO, NAME, BIRTHDAY, TEL, PAY, NVL(POSITION, '사원'), DNAME
    INTO V_DEPT
    FROM EMP2, DEPT2
    WHERE EMPNO = '&EMPNO' AND DEPTNO = DCODE;
    DBMS_OUTPUT.PUT_LINE (' 사원번호 : ' ||V_DEPT.V_EMPNO);
    DBMS_OUTPUT.PUT_LINE (' 부서명 : ' ||V_DEPT.V_DNAME);
    DBMS_OUTPUT.PUT_LINE (' 사원명 : ' ||V_DEPT.V_NAME);
    DBMS_OUTPUT.PUT_LINE (' 직급 : ' ||V_DEPT.V_POSITION);
    DBMS_OUTPUT.PUT_LINE (' 생일 : ' ||V_DEPT.V_BIRTH);
    DBMS_OUTPUT.PUT_LINE (' 연락처 : ' ||V_DEPT.V_TEL);
    DBMS_OUTPUT.PUT_LINE (' 급여 : ' ||V_DEPT.V_PAY);
                                         
END;


--10일차
PL/SQL 변수 사용 예1:
SET SERVEROUTPUT ON
--> 껐다가 새로 켰기 ?문에 최초 1회 사용
--TABLE TYPE 변수 사용 예1:
DECLARE
T_NAME VARCHAR2(20);

TYPE TBL_EMP_NAME IS TABLE OF
EMP.ENAME%TYPE
INDEX BY BINARY_INTEGER;

V_NAME TBL_EMP_NAME;

BEGIN 
 SELECT ENAME INTO T_NAME
 FROM EMP
 WHERE EMPNO = 7499;
 
 V_NAME(0) := T_NAME;
 DBMS_OUTPUT.PUT_LINE(V_NAME(0));
 END ;
 /
 
-- 3.비 PL/SQL변수
--아래는 다  따로 실행헤야 함. 총 3번
VAR V_BIND NUMBER;
-->여기서는 이게 포인트, 외부에서 사용할 수 있다?는 의미
BEGIN
SELECT (PAY*12) + NVL(BONUS, 0) INTO :V_BIND
FROM PROFESSOR
WHERE PROFNO = 1001;
END;
--> 내부에서 선언하면 INTO :V_BIND 여기서 : 안들어가는데 외부에서 선언에서 bind 변수가 : 들어간거다.
--> 이게 포인트

PRINT V_BIND;

--
SET AUTOPRINT ON;
-->off를 하면 프린트가 안되고 on하면 되는거? 
-->SET AUTOPRINT ON 를 하면 위에서 PRINT V_BIND;이걸 아써도 프린트가 된다는 건지 아니면 
--VAR V_BIND NUMBER; 이거 안쓰면 안된다는 건지 아니면 둘다인지
BEGIN
SELECT (PAY*12) +NVL(BONUS,0) INTO :VI_BIND
FROM PROFESSOR
WHERE PROFNO = 1001;
END;


--PL/SQL 제어문
--> 조건문과 반복문으로 나눌 수 있음.
조건문 : IF, CASE
반복 : BASIC LOOP, WHILE(반복횟수를 알 수 없을 경우), FOR(반복 횟수를 지정할 경우)

--유형 1번의 예:
--EMP 테이블에서 EMPNO, ENAME, DEPTNO, DNAME을 출력하세요
--단 DNAME의 값은 아래와 같습니다.
--DEPTNO 가 10이면 'ACCOUNT',
--DEPTNO 가 20이면 '',
--DEPTNO 가 30이면 '',
--DEPTNO 가 40이면 ''

DECLARE
    VEMPNO EMP.EMPNO%TYPE;
    VENAME EMP.ENAME%TYPE;
    VDEPTNO EMP.DEPTNO%TYPE;
    VDNAME VARCHAR2(20) := NULL;
    
BEGIN
   SELECT EMPNO, ENAME, DEPTNO
   INTO VEMPNO, VENAME, VDEPTNO
   FROM EMP
   WHERE EMPNO = 7900;
   IF (VDEPTNO = 10) THEN
   --> IF문이 시작됩니다.
      VDNAME := 'ACCOUNT'
   END IF ;
   -->IF 문이 끝나면 반드시 END IF로 마쳐야 한다.
   IF (VDEPTNO = 20) THEN
      VDNAME := 'RESEARCH';
   END IF;
   IF (VEDPTNO = 30) THEN
      VDNAME := 'SALES' ;
   END IF ;
   IF (VDEPTNO = 30) THEN
      VDNAME := 'SALES' ;
   END IF ;
   IF (VDEPTNO = 40) THEN
      VDNAME := 'OPERATIONS';
   END IF;
   DBMS_OUTPUT.PUT_LINE ( VEMPNO||'      '||VENAME||'      '||VDEPTNO||'      '||VDNAME);
   END;
   
--  유형 3 이전 설명 못들음 소리 안나서.
   
-- 유형 3. IF~THEN~ELSE~END IF ( 조건이 2개일 경우 사용(
--IF (조건) THEN
--실행문장;
--ELSE
--실행 문장;
--END IF;
--
--예 : EMP 테이블에서 사원번호가 7900번인 사원의 EMPNO, ENAME, COMM을 출력하되
--해당사원의 COMM이 0보다 크면 COMM의 금액을 출력하고, 0보다 작으면 '사원의 보너스는 없습니다'라는
--문장을 출력했습니다.

DECLARE
    VEMPNO EMP.EMONP%TYPE ;
    VENAME EMP.ENAME%TYPE ;
    VCOMM EMP.COMM%TYPE := NULL ;

BEGIN
    SELECT EMPNO, ENAME, COMM INTO VEMPNO, VENAME, VCOMM

FROM EMP 
WHERE EMPNO = 7900 ;

 IF VCOMM > 0 THEN
   DBMS_OUTPUT.PUT_LINE (VENAME||' 사원의 보너스는 '||VCOMM||' 입니다.');
 ELSE
  DBMS_OUTPUT.PUT_LINE(VENAME||'사원의 보너스는 없습니다.');
 END IF;
END;


--2. CASE문 CASE 식
DECLARE
     V_EMPNO EMP.EMPNO%TYPE ;
     V_ENAME EMP.ENAME%TYPE ;
     V_DEPTNO EMP.DEPTNO%TYPE ;
     V_DNAME VARCHAR2(20) ;
BEGIN
SELECT EMPNO, ENAME, DEPTNO
INTO V_EMPNO, V_ENAME, V_DEPTNO
FROM EMP
WHERE EMPNO = &EMPNO ;
--> 값을 입력받는 거
--EMPNO = 7900 입력
V_DNAME := CASE V_DEPTNO
                   WHEN 10 THEN 'ACCOUNT'
                   WHEN 20 THEN 'RESEARCH'
                   WHEN 30 THEN 'SALES'
                   WHEN 40 THEN 'OPERATION'
                   END ;
 DBMS_OUTPUT.PUT_LINE ( V_EMPNO||'               '||V_ENAME||'           '||V_DEPTNO||'    '||V_DNAME) ;
 END ;


--<IF문 연습문제>
--1. 사번을 입력받아 사원(EMP)테이블에서 그 해당 사원의 이름과 연봉(SAL), 세금을 출력하세요.
--단, 세금은 연봉액수에 따라 5000만원 이상이면 5%,
--4000만원부터 4999만원까지는 4%,
--3000만원부터 3999만원까지는 3%.
--2000만원부터 2999만원까지는 2%,
--나머지는 1%로 차등 계산하세요)
--조건이 여러가지 이므로 IF - THEN -ELSIF - ELSE - END IF 문장을 사용하세요.
DECLARE
    VENAME EMP.ENAME%TYPE ;
    VSAL EMP.SAL%TYPE ;
    VTAX NUMBER(10,2) ;
    
BEGIN
    SELECT SAL, ENAME
    INTO VSAL, VENAME
    FROM EMP WHERE EMPNO = &EMPNO ;
    
    IF (VSAL >= 5000)
    THEN VTAX := VSAL * 0.05 ;
    ELSIF ( VSAL BEETWEEN 4000 AND 4999 ) 
    THEN VTAX := VSAL *0.04 ;
    ELSIF ( VSAL BEETWEEN 3000 AND 3999 ) 
    THEN VTAX := VSAL *0.03 ;
    ELSIF ( VSAL BEETWEEN 2000 AND 2999 ) 
    THEN VTAX := VSAL *0.02 ;
    ELSE VTAX := VSAL*0.01 ;
    END IF;
    DBMS_OUTPUT.PUT_LINE(VENAME||'         '||VSAL||'          '||VTAX) ;
    END;
    
--CASE문 사용 예2:
--EMP테이블을 사용하여 사용자로부터 사원번호를 입력 받아 해당 사원의 EMPNO, ENAME, SAL, DEPTNO 인상 후
--연봉(UP_SAL)을 출력하세요.
--단 부서번호가 10번 부서는 현재 연봉의 10% 인상하고
--부서번호 20번, 30번 부서는 20% 인상하고,
--부서번호 30번 보다 클 경우 30%를 인상하세요.
SELECT * FROM EMP;
DECLARE
    V_EMPNO EMP.EMPNO%TYPE ;
    V_ENAME EMP.ENAME%TYPE ;
    V_SSAL EMP.SAL%TYPE ;
    V_DEPTNO EMP.DEPTNO%TYPE ;
    V_UP_SAL EMP.SAL%TYPE ;

BEGIN
SELECT EMPNO, ENAME, SAL, DEPTNO
INTO V_EMPNO, V_ENAME, V_SAL, V_DEPTNO
FROM EMP 
WHERE EMPNO = &EMPNO ;


V_UP SAL := CASE
                  WHEN V_DEPTNO = 10 THEN V_SAL*1.1
                  WHEN V_DEPTNO IN (20, 30) THEN V_SAL*1.2
                  WHEN V_DEPTNO > 30 THEN V_SAL*1.3
                  ELSE V_SAL
                  END ;
                  
      DBMS_OUTPUT.PUT_LINE ( '사원번호'||'   '||'이름'||'   '||'급여'||'   '||'부서번호'||'  '||'인상후급여');
      DBMS_OUTPUT.PUT_LINE(V_EMPNO||'   '||V_ENAME||'  '|V_SAL||'  '||V_DEPTNO||'     '||V_UP_SAL);
END ;

--BASIC LOOP문 사용 예1:
--LOOP 문을 사용하여 화면에 0부터 5까지의 숫자를 아래와 같이 출력하세요
DECLARE
NUM NUMBER := 0;
BEGIN
    LOOP
    DBMS_OUTPUT.PUT_LINE(NUM);
    NUM :=NUM +1 ;
    EXIT WHEN NUM > 5;
    END LOOP;
    END;
    
--WHILE 반복문 사용 예1:
--WHILE 반복문을 사용하여 아래의 출력 예시와 같이 출력하세요.
DECLARE
NUM NUMBER :=0 ;
BEGIN 
   WHILE NUM < 6
   LOOP
   DBMS_OUTPUT.PUT_LINE(NUM) ;
   NUM :=NUM + 1;
   END LOOP;
   
END;

--BASIC LOOP 문과 WHILE 반복문 연습 문제
--BASIC LOOP 문과 WHILE 문을 사용하여 아래의 결과처럼 나오도록 각각 작성하세요.
DECLARE
NUM NUMBER := 5;
BEGIN
    LOOP
    DBMS_OUTPUT.PUT_LINE(NUM);
    NUM :=NUM -1 ;
    EXIT WHEN NUM < 0;
    END LOOP;
    END;

DECLARE
NUM NUMBER :=5 ;
BEGIN 
   WHILE NUM >= 0
   LOOP
   DBMS_OUTPUT.PUT_LINE(NUM) ;
   NUM :=NUM - 1;
   END LOOP;
   
END;


--FOR 반복문 예1:
--0-5까지 숫자를 화면에 출력하세요
BEGIN
FOR I IN 0..5
--I가 DELCARE에 없어도 된다는게 포인트
LOOP
DBMS_OUTPUT.PUT_LINE(I) ;
END LOOP;
END ;
/

--FOR 반복문 예2:
--0-5까지의 숫자를 역순으로 출력하세요.
BEGIN
FOR I IN REVERSE 0..5
LOOP
  DBMS_OUTPUT.PUT_LINE(I) ;
  END LOOP ;
END;
/

--사원번호를 입력 받아 사원이름의 글자수 만큼 화면에 *를 찍는 문장을 작성하세요.
SELECT * FROM EMP;
DECLARE 
  V_EMPNO EMP.EMPNO%TYPE := &ENO;
  V_NUMBER NUMBER ;
  V_CHAR VARCHAR2(100) ;
  
BEGIN
SELECT LENGTH(ENAME)
INTO V_NUMBER
FROM EMP 
WHERE EMPNO = V_EMPNO;
FOR I IN 1..V_NUMBER
LOOP
V_CHAR :=V_CHAR||'*' ;

DBMS_OUTPUT.PUT_LINE(V_CHAR) ;
END LOOP ;

END ;

--CONTINUE 문(11G에서 추가된 기능입니다.)
DECLARE
TOTAL NUMBER :=0 ;
BEGIN 
FOR I IN 1..10
LOOP
TOTAL := TOTAL +1;
--> 1추가
DBMS_OUTPUT.PUT_LINE('TOTAL:'||TOTAL);
CONTINUE WHEN I>5 ;
TOTAL := TOTAL + I ;
DBMS_OUTPUT.PUT_LINE('OUT TOTAL'||TOTAL);
END LOOP;
END;|


--PL/SQL 커서
DECLARE
VEMPNO NUMBER(4);
VENAME VARCHAR2(20);
VSAL NUMBER(7);

CURSOR C1 IS
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = 20;

BEGIN
 OPEN C1;
--> 커서 오픈
DBMS_OUTPUT.PUT_LINE('번호  이름  급여');

LOOP
FETCH C1 INTO VEMPNO, VENAME, VSAL ;
--> 커서에 있는 데이터를 FETCH해서 변수로 할당
EXIT WHEN C1%NOTFOUND ;

DBMS_OUTPUT.PUT_LINE(VEMPNO||'  '||VENAME||'  '||VSAL);
END LOOP;
CLOSE C1;
END;

--예제 1
--화면에서 학생의 이름을 입력 받아 그 학생과 같은 지역에 사는 학생이름과 학과 전화번호를 프린트하세요.
SELECT * FROM STUDENT;
SELECT * FROM DEPARTMENT;
SELECT * FROM EMP;

DECLARE 
V_NAME S.NAME%TYPE
V_DNAME D.DNAME%TYPE
V_TEL S.TEL%TYPE;

CURSOR T1 IS
SELECT S.NAME, D.DNAME, S.TEL
FROM STUDENT S, DEPARTMENT D
WHERE DNAME = '&DNAME';

BEGIN
 OPEN C1;
--> 커서 오픈
DBMS_OUTPUT.PUT_LINE('이름  학과  전화번호');

LOOP

DBMS_OUTPUT.PUT_LINE(V_NAME||'  '||V_DNAME||'  '||V_TEL);
END LOOP;
CLOSE C1;
END;

BEGIN
FROM STUDENT S, DEPARTMENT D
--아래가 답
DECLARE
TYPE EMP_RECORD_TYPE IS RECORD
      ( VNAME VARCHAR2(26),
        VDNAME VARCHAR2(100),
        VTEL VARCHAR2(20)) ;
 VROW EMP_RECORD_TYPE ;
 
 CURSOR C1 IS
  SELECT S.NAME, D.DNAME, S.TEL
  FROM STUDENT S, DEPARTMENT D
  WHERE SUBSTR(TEL, 0, INSTR(TEL, ')')) 
  = (SELECT SUBSTR(TEL, 0, INSTR(TEL, ')')) 
  FROM STUDENT 
  WHERE NAME = '&NAME') 
  AND S.DEPTNO1 = D.DEPTNO;
  
  BEGIN
  OPEN C1;
  DBMS_OUTPUT.PUT_LINE('이름  학과  전화번호');
  LOOP
  FETCH C1 INTO VROW ;
  EXIT WHEN C1%NOTFOUND ;
  DBMS_OUTPUT.PUT_LINE(VROW.VNAME||'   '||VROW.VDNAME||'   '||VROW.VTEL) ;
  END LOOP ;
  CLOSE C1 ;
  END ;
  
--CURSOR FOR LOOP 예1:
--EMP테이블에서 EMPNO, ENAME 값을 가져와서 커서에 저장 후 출력하세요.
--> FOR문을 사용해서 하면은 OPEN과 CLOSE를 따로 하지 않아도 된다는게 포인트. 가장많이 사용하는 방식
SELECT * FROM EMP;
DECLARE
CURSOR EMP_CUR IS
-->커서를 선언
SELECT EMPNO, ENAME
FROM EMP;

BEGIN
 FOR EMP_REC IN EMP_CUR
-- 커서의 데이터를 저장할 EMP_REC 변수 선언
  LOOP
   DBMS_OUTPUT.PUT_LINE ( EMP_REC.EMPNO||'    '||EMP_REC.ENAME );
  END LOOP;
END;

--CURSOR FOR LOOP 예 3:
이번 예는 SUB QUERY를 사용하여 작업을 하는 예 입니다.
이 방법은 DECLARE 부분에 커서를 선언할 필요가 없습니다.
대시 커서에 들어가는 서브쿼리 부분을 IN 뒷부분에 바로 사용하는 방법입니다.
DECLARE
BEGIN 
FOR EMP_REC IN ( SELECT EMPNO, ENAME, SAL 
                           FROM EMP)
LOOP
 DBMS_OUTPUT.PUT_LINE(EMP_REC.EMPNO||'   '||EMP_REC.ENAME||'   '||EMP_REC.SAL);
 END LOOP;
END;

--TABLE TYPE 변수 사용 예2:
--FOR 반복문을 사용하여 변수에 여러 건의 데이터를 입력하는 방법입니다.
DECLARE

TYPE E_TABLE_TYPE IS TABLE OF
EMP.ENAME%TYPE
INDEX BY BINARY_INTEGER ;

TAB_TYPE E_TABLE_TYPE ;
A BINARY_INTEGER := 0 ;

BEGIN
   FOR I IN ( SELECT ENAME FROM EMP )
   LOOP
       A := A+1 ;
       TAB_TYPE(A) := I.ENAME ;
   END LOOP ;
   FOR J IN 1..A 
   LOOP
      DBMS_OUTPUT.PUT_LINE ( TAB_TYPE(J));
    END LOOP;
END;

DECLARE
   R_EMP EMP%ROWTYPE ;
   
   CURSOR C_EMP (DNO NUMBER)
   IS SELECT * FROM EMP
     WHERE DEPTNO = DNO ;
BEGIN
 DBMS_OUTPUT.PUT_LINE ( '============================') ;
   OPEN C_EMP (20) ;
   LOOP
       FETCH C_EMP INTO R_EMP ;
       EXIT WHEN C_EMP%NOTFOUND ;
       DBMS_OUTPUT.PUT_LINE ( R_EMP.ENAME||'   '||R_EMP.DEPTNO) ;
   END LOOP ;
   CLOSE C_EMP;
   
   OPEN C_EMP (30) ;
   LOOP
       FETCH C_EMP INTO R_EMP ;
       EXIT WHEN C_EMP%NOTFOUND ;
       DBMS_OUTPUT.PUT_lINE ( R_EMP.ENAME||'   '||R_EMP.DEPTNO) ;
   END LOOP ;
   CLOSE C_EMP;
END;
--위에 내용을 FOR문으로 변경 한게 아래
BEGIN
   FOR EMP_REC IN EMP_CUR (10) 
   LOOP
   EXIT WHEN EMP_CUR%NOTFOUND ;
   DBMS_OUTPUT.PUT_LINE ( EMP_REC.EMPNO||'   '||EMP_REC.ENAME||'   '
   ||EMP_REC.SAL||'   '||EMP_REC.DEPTNO ) ;
   END LOOP ;
   
 DBMS_OUTPUT.PUT_LINE ( '============================') ;
   
  FOR EMP_REC IN EMP_CUR (20) 
   LOOP
   EXIT WHEN EMP_CUR%NOTFOUND ;
   DBMS_OUTPUT.PUT_LINE ( EMP_REC.EMPNO||'   '||EMP_REC.ENAME||'   '
   ||EMP_REC.SAL||'   '||EMP_REC.DEPTNO ) ;
   END LOOP ;
END;


--예제 1
--화면에서 학생의 이름을 입력받아 그 학생과 같은 지역에 사는 학생이름과 학과 전화번호를 프린트하세요
--PARAMETER CURSOR로 수정
DECLARE
CURSOR C1 ( PNAME STUDENT.NAME%TYPE ) IS
  SELECT S.NAME  , D.DNAME AAA, S.TEL
  FROM STUDENT S, DEPARTMENT D
  WHERE SYBSTR ( TEL, 0, INSTR(TEL, ')')) = ( SELECT SBUSTR(TEL, 0, INSTR(TEL, ')'))
  FROM STUDENT
  WHERE NAME = PNAME ) AND S.DEPTNO1 = D.DEPTNO ;
  
  BEGIN
   DBMS_OUTPUT.PUT_LINE ( '=============================') ;
   DBMS_OUTPUT.PUT_LINE (' 이름 학과   전화번호') ;
   FOR EMP_REC IN C1('이윤나') LOP
   EXIT WHEN C1%NOTFOUND;
   DBMS_OUTPUT.PUT_LINE (EMP_REC.NAME||'   '||EMP_REC.AAA||'  '||EMP_REC.TEL ) ;
   END LOOP ;
   DBMS_OUTPUT.PUT_LINE('=================')
   DBMS_OUTPUT.PUT_LINE('이름 학과   전화번호') ;
   
FRO EMP_REC IN C1(이사랑')
...
.
.

--
CREATE TABLE F
(NUM NUMBER,
 NAME VARCHAR2(10));
 
 INSERT INTO F VALUES (5,'FIVE');
 INSERT INTO F VALUES (6,'SIX');
 INSERT INTO F VALUES (7, 'SEVEN');
 INSERT INTO F VALUES (8, 'EIGHT');
 INSERT INTO F VALUES (9, 'NINE');
 
 COMMIT;
-- > 테이블 생성
 SELECT * FROM F;
 
 DECLARE
    V_NUM F.NUM%TYPE;
    V_NAME F.NAME%TYPE;
CURSOR C_F IS
    SELECT NUM, NAME FROM F WHERE LENGTH(NAME) = 5 FOR UPDATE;
 BEGIN
   OPEN C_F;
 LOOP
   FETCH C_F INTO V_NUM, V_NAME;
   EXIT WHEN C_F%NOTFOUND;
   UPDATE F SET NUM = V_NUM  * V_NUM WHERE CURRENT OF C_F;
 END LOOP;
 CLOSE C_F;
END;

SELECT * FROM F;

--부서코드를 입력 받아 해당 부서에 속한 사원들을 삭제 후 삭제된 사원건수를 출력하세요.
--(묵시적 커서를 사용하세요)

DECLARE
V_DEPTNO NUMBER := &DNO;
BEGIN
DELETE EMP WHERE DEPTNO = V_DEPTNO;
DBM_OUTPUT.PUT_LINE( ' 삭제된 건수는 ' ||SQL%ROWCOUNT||'입니다');
ROLLBACK;

END;

--부서코드를 입력받아 그 부서에 속한 사원들의 이름, 급여를 출력하세요.
--(여러 건의 데이터를 작업해야 하므로 명시적 커서와 BASIC LOOP 문을 사용하세요.)
DECLARE
        VENAME VARCHAR2(20) ;
        VSAL NUMBER(7) ;
     CURSOR EMP_CUR
        IS
          SELECT ENAME, SAL FROM EMP WHERE DEPTNO = &P_DNO;
  BEGIN
      OPEN EMP_CUR;
      LOOP
  FETCH EMP_CUR INTO VENAME, VSAL ;
    EXIT WHEN EMP_CUR%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(VENAME||'   '||VSAL);
     END LOOP;
       CLOSE EMP_CUR ;
      END;
      
  SET SERVEROUTPUT ON
  
  
--EMP TABLE 에서 부서코드(DEPTNO)가
--10이면 급여를 10%, 20이면 20% 30이면 급여를 30%를 인상하여 EMP를 업데이트하세요
DECLARE
     VENAME VARCHAR2(20) ;
     VSAL NUMBER(7) ;
     VDEPTNO NUMBER(7) ;
     VTEMP NUMBER(7) := 0;
  CURSOR EMP_CUR IS
            SELECT ENAME, SAL, DEPTNO
            FROM EMP FOR UPDATE;
 BEGIN
       OPEN EMP_CUR;
       LOOP
    FETCH EMP_CUR INTO VENAME, VSAL, VDEPTNO ; 
     EXIT WHEN EMP_CUR%NOTFOUND;
      IF ( VDEPTNO = 10 )   THEN VTEMP := 10 ;
      ELSEIF ( VDEPTNO = 20 ) THEN VTEMP := 20;
      ELSIF ( VDEPTNO = 30 ) THEN VTEMP := 30 ;
      END IF ;
      DBMS_OUTPUT.PUT_LINE ( VENAME || '   ' || VSAL || '  ' || VDEPTNO || '->' || VTEMP || '% '
      || (VSAL + (VSAL * (VTEMP/100) ) ) ) ;
      UPDATE EMP SET SAL = VSAL + (VSAL + (VSAL * (VTEMP / 100 ) ) WHERE CURRENT OF EMP_CUR;
    END LOOP;
       CLOSE EMP_CUR ;
      END ;
      
SELECT * FROM EMP;
ROLLBACK;
  
   