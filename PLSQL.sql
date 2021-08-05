SET SERVEROUTPUT ON;
-->�̰� ���� ���ϰ� �Ʒ� �۾��� �ϸ�, ����Ʈ�� �ȵȴ�. = 100�� ���� �ʴ´�.
-->�Ʒ� �� �Ҷ�, �������� ������ ���� ���� ������ �� �巡�� �ؼ� �����ؾ� ������ �ȳ���.
DECLARE
    VI_NUM NUMBER;
-->�����
BEGIN
    VI_NUM := 100;
    DBMS_OUTPUT.PUT_LINE(VI_NUM);
-->�����    

END;

DECLARE
   A INTEGER := 2**2*3**2;
-- >����� 2�� ���� ���ϱ� 3�� ����.**�� �켱������ ����
BEGIN
   DBMS_OUTPUT.PUT_LINE('A='||TO_CHAR(A));
   DBMS_OUTPUT.PUT_LINE('A='||A);
END;

--����Ŭ������ + �� ������ �ȵ�. ||�� ��Ĺ�� ����.

--1.������ �� 3���� ����ϴ� �͸� ����� ������.
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
-->����� ���۵�
VNO NUMBER(4);
VNAME VARCHAR2(10);

BEGIN
-->����� ���۵�
SELECT EMPNO, ENAME INTO VNO, VNAME
FROM EMP
WHERE EMPNO = 7900;

DBMS_OUTPUT.PUT_LINE(VNO||'  '||VNAME);
END;
-->����� �����

--��� ��1:
--PROFESSOR ���̺��� ������ȣ�� 1001���� ������ ������ȣ�� �޿��� ��ȸ�� ��
--������ �����ؼ� ȭ�鿡 ����ϼ���
DECLARE
    V_PROFNO PROFESSOR.PROFNO%TYPE;
    V_PAY PROFESSOR.PAY%TYPE;
  BEGIN
    SELECT PROFNO, PAY INTO V_PROFNO, V_PAY
    FROM PROFESSOR WHERE PROFNO = 1001;
DBMS_OUTPUT.PUT_LINE(V_PROFNO|| ' �� ������ �޿���'||V_PAY||'�Դϴ�');

END;

--��� �� 2:
--EMP2 ���̺��� ����Ͽ� �����ȣ�� �Է� �޾Ƽ� ����� ����� �̸�, ������
--����ϼ��� (EMP2.EMPNO%TYPE) 20000102 �輳�� 22-MAR-83
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

--��� �� 3:
--������ȣ�� �Է� ���� �� PROFESSOR ���̺��� ��ȸ�Ͽ� �ش米���� ������ȣ�� �����̸�, �μ���ȣ, �Ի����� ����ϼ���
DECLARE
    V_PROFNO PROFESSOR.PROFNO%TYPE;
    V_NAME PROFESSOR.NAME%TYPE;
    V_DEPTNO PROFESSOR.DEPTNO%TYPE;   
    V_HIREDATE PROFESSOR.HIREDATE%TYPE;   

BEGIN
   SELECT PROFNO, NAME, DEPTNO, HIREDATE
   INTO V_PROFNO, V_NAME, V_DEPTNO, V_HIREDATE
   FROM PROFESSOR
   WHERE PROFNO = '&������ȣ';
-->�Է¹޴°� ���� �϶��� '' �Ƚᵵ ��

   DBMS_OUTPUT.PUT_LINE(V_PROFNO||'  '||V_NAME||'  '||V_DEPTNO||'  '||V_HIREDATE);   

END;
   
--   2) PL/SQL �������� DML ���� ����ϱ�
--(1) INSERT ���� �����ϱ� �� 1:
CREATE TABLE PL_TEST
      (NO NUMBER,
      NAME VARCHAR2(10));

CREATE SEQUENCE PL_SEQ;

--PL/SQL���� INSERT�� �����մϴ�.
BEGIN
  INSERT INTO PL_TEST
  VALUES(PL_SEQ.NEXTVAL, 'AAA');
END;
      
SELECT * FROM PL_TEST;

----INSERT ���� �����ϱ� ��2:
--CREATE TABLE PL_TEST2
--(NO NUMBER,
--NAME VARCHAR2(10),
--ADDR VARCHAR2(10) );
--> �ǽ��� ���̺� �����ϱ�

--����ڷκ��� ��ȣ(NO), �̸�(NAME), �ּ�(ADDR)���� �Է¹��� �� PL_TEST2 ���̺� �Է��ϴ�
--PL/SQL������ �ۼ��ϼ���
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

--PL/SQL���� UPDATE�� �����մϴ�.
BEGIN 
   UPDATE PL_TEST2
   SET NAME = 'BBB'
   WHERE NO = 1 ;
-- > WHERE�� ������ �ִ� �� = �ٲٷ��� ���簪 �� �Է��ؾ� �Ѵ�. =���� �� �Է��ϸ� ����.  
END;

SELECT * FROM PL_TEST2;

--PL/SQL���� MERGE �۾��� �����մϴ�.
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

--�ĺ��� ����ǥ�� ��� ���
DECLARE
"PI" NUMBER := 3.14;
"TABLE" NUMBER :=20;
"SELECT NO" NUMBER := 999;
BEGIN

DBMS_OUTPUT.PUT_LINE("PI" || '       '||"TABLE" || '  ' || "SELECT NO");

END;

--9.��ø�� PL/SQL ��� �ۼ��ϱ�
--11�� ���� V_SECOND ���� ������ ������ �߻���. ������ ������ �߿���.
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
  
  
-- CONSTANT : �����Ұ� ���� ������
DECLARE
  V_EMPNO CONSTANT NUMBER(1) :=3;
BEGIN
  V_EMPNO :=5;
  DBMS_OUTPUT.PUT_LINE('V_EMPNO :' || V_EMPNO);
END;
-->���� �� CONSTANT�� ����� �ϸ� ������ �ȳ���.
DECLARE
  V_EMPNO NUMBER(1) :=3;
BEGIN
  V_EMPNO :=5;
  DBMS_OUTPUT.PUT_LINE('V_EMPNO :' || V_EMPNO);
END;

--DEFAULT �⺻�� ���� ���� ������
DECLARE
  V_CODE NUMBER(2) NOT NULL DEFAULT 10;
BEGIN
  V_CODE :=20;
  DBMS_OUTPUT.PUT_LINE('V_CODE :' || V_CODE);
END;

--2)REFERENCE ����%
--(2) ROWTYPE ������ Ȱ���Ͽ� ������ ����ϱ�
���� �� 1������ ����ߴ� ������ ROWTYPE ������ ����Ͽ� ����ϼ���.
DECLARE
  V_ROW EMP%ROWTYPE;
  
BEGIN
  SELECT * INTO V_ROW
  FROM EMP
  WHERE EMPNO=7900;
  
  DBMS_OUTPUT.PUT_LINE(V_ROW.EMPNO ||' '|| V_ROW.ENAME ||' '||V_ROW.SAL);
END;

--(3) ROWTYPE ������ Ȱ���� �������� �Է�
--�ǽ��� ���̺� �����ϱ�
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

--ROWTYPE ������ Ȱ���� ������ �Է�
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

--(4)ROWTYPE ������ Ȱ���� �������� ����
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
--> AAA���� ���� DDD �� ����

SELECT * FROM ROW_TEST2;

--����1.
--%TYPE ������ ����Ͽ� EMP, DEPT ���̺��� �����Ͽ� EMPNO=7900�� ����� ������
--4���� ������ ���� �� EMPNO, ENAME, DEPTNO, DNAME�� �Ʒ��� ���� �������� ����ϼ���
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

--����2. ����ڷκ��� �ΰ��� ���ڸ� �Է� �޾Ƽ� ���� ���ϼ���.
--ù��? ��:12, �ι�° ��:13, ���� :25�Դϴ�.

DECLARE
    V_NO1 NUMBER := &NO1 ;
    V_NO2 NUMBER := &NO2 ;
    V_SUM NUMBER ;
  BEGIN
    V_SUM := V_NO1 + V_NO2 ;
   DBMS_OUTPUT.PUT_LINE('ù��° ��: ' || V_NO1 || ', �ι�° �� : ' || V_NO2 || ', ���� : ' || V_SUM || '�Դϴ�.');

END;

--2) ���պ���
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
    DBMS_OUTPUT.PUT_LINE ( '�����ȣ     �����       ����');
    DBMS_OUTPUT.PUT_LINE (V_RECL.EMP_NO||'    '||
                                         V_RECL.EMP_NAME||'    '||
                                         V_RECL.JOB) ;
END;



--RECORD TYPE ���� ��� ��1:
--RECORD TYPE ������ Ȱ���Ͽ� �μ���ȣ�� 30���� �μ��� �μ���ȣ�� �μ����
--�������� RECORD TYPE ������ ������ �� ����ϼ���. �� RECORD TYPE ������ 
--Ÿ���� DEPT_RECORD_TYPE�� �ϰڽ��ϴ�.
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
    DBMS_OUTPUT.PUT_LINE ( '�μ���ȣ     �μ���       ��ġ');
    DBMS_OUTPUT.PUT_LINE (V_DEPT.DEPTNO||'    '||
                                         V_DEPT.DNAME||'    '||
                                         V_DEPT.LOC) ;
END;

SELECT * FROM DEPT;

--RECORD TYPE ���� ��� ��2:
--EMP2 ���̺��� ����Ͽ� ����ڷκ��� �����ȣ�� �Է� ���� �� �Ʒ��� ���� �����ȣ.
--����̸�, ����, ����, ����ó, �޿��� ����ϼ���.
--�� ������ ���� ����� ������ ������� ǥ���ؼ� ����ϼ���.

SELECT * FROM EMP2;

DECLARE 
TYPE DEPT_RECORD_TYPE IS RECORD
--DEPT_RECORD_TYPE�� �׳� �̸��̶� �ٸ� �ŷ� �ٲ㵵 ��.
  (V_EMPNO EMP2.EMPNO%TYPE,
   V_NAME EMP2.NAME%TYPE,
   V_BIRTH EMP2.BIRTHDAY%TYPE,
   V_TEL EMP2.TEL%TYPE,
   V_PAY EMP2.PAY%TYPE,
   V_POSITION EMP2.POSITION%TYPE) ;
   
   V_DEPT DEPT_RECORD_TYPE;
   
   BEGIN
    SELECT EMPNO, NAME, BIRTHDAY, TEL, PAY, NVL(POSITION, '���')
    INTO V_DEPT.V_EMPNO, V_DEPT.V_NAME, V_DEPT.V_BIRTH,
    V_DEPT.V_TEL, V_DEPT.V_PAY, V_DEPT.V_POSITION
    FROM EMP2
    WHERE EMPNO = '&EMPNO' ;
    DBMS_OUTPUT.PUT_LINE (' �����ȣ : ' ||V_DEPT.V_EMPNO);
    DBMS_OUTPUT.PUT_LINE (' ����� : ' ||V_DEPT.V_NAME);
    DBMS_OUTPUT.PUT_LINE (' ���� : ' ||V_DEPT.V_POSITION);
    DBMS_OUTPUT.PUT_LINE (' ���� : ' ||V_DEPT.V_BIRTH);
    DBMS_OUTPUT.PUT_LINE (' ����ó : ' ||V_DEPT.V_TEL);
    DBMS_OUTPUT.PUT_LINE (' �޿� : ' ||V_DEPT.V_PAY);
                                         
END;

--RECORD TYPE ���� ��� �� 3:
--EMP2 ���̺��� ����Ͽ� ����ڷκ��� �����ȣ�� �Է� ���� �� �Ʒ��� ���� �����ȣ, ����̸�.
--�μ���(DEPT2.DNAME), ����, ����, ����ó, �޿��� ����ϼ���.
--�� ������ ���� ����� ������ ������� ǥ���ؼ� ����ϼ���
DECLARE 
TYPE DEPT_RECORD_TYPE IS RECORD
--DEPT_RECORD_TYPE�� �׳� �̸��̶� �ٸ� �ŷ� �ٲ㵵 ��.
  (V_EMPNO EMP2.EMPNO%TYPE,
   V_NAME EMP2.NAME%TYPE,
   V_BIRTH EMP2.BIRTHDAY%TYPE,
   V_TEL EMP2.TEL%TYPE,
   V_PAY EMP2.PAY%TYPE,
   V_POSITION EMP2.POSITION%TYPE,
   V_DNAME DEPT2.DNAME%TYPE   ) ;
   
   V_DEPT DEPT_RECORD_TYPE;
   
   BEGIN
    SELECT EMPNO, NAME, BIRTHDAY, TEL, PAY, NVL(POSITION, '���'), DNAME
    INTO V_DEPT
    FROM EMP2, DEPT2
    WHERE EMPNO = '&EMPNO' AND DEPTNO = DCODE;
    DBMS_OUTPUT.PUT_LINE (' �����ȣ : ' ||V_DEPT.V_EMPNO);
    DBMS_OUTPUT.PUT_LINE (' �μ��� : ' ||V_DEPT.V_DNAME);
    DBMS_OUTPUT.PUT_LINE (' ����� : ' ||V_DEPT.V_NAME);
    DBMS_OUTPUT.PUT_LINE (' ���� : ' ||V_DEPT.V_POSITION);
    DBMS_OUTPUT.PUT_LINE (' ���� : ' ||V_DEPT.V_BIRTH);
    DBMS_OUTPUT.PUT_LINE (' ����ó : ' ||V_DEPT.V_TEL);
    DBMS_OUTPUT.PUT_LINE (' �޿� : ' ||V_DEPT.V_PAY);
                                         
END;


--10����
PL/SQL ���� ��� ��1:
SET SERVEROUTPUT ON
--> ���ٰ� ���� �ױ� ?���� ���� 1ȸ ���
--TABLE TYPE ���� ��� ��1:
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
 
-- 3.�� PL/SQL����
--�Ʒ��� ��  ���� ������� ��. �� 3��
VAR V_BIND NUMBER;
-->���⼭�� �̰� ����Ʈ, �ܺο��� ����� �� �ִ�?�� �ǹ�
BEGIN
SELECT (PAY*12) + NVL(BONUS, 0) INTO :V_BIND
FROM PROFESSOR
WHERE PROFNO = 1001;
END;
--> ���ο��� �����ϸ� INTO :V_BIND ���⼭ : �ȵ��µ� �ܺο��� ���𿡼� bind ������ : ���Ŵ�.
--> �̰� ����Ʈ

PRINT V_BIND;

--
SET AUTOPRINT ON;
-->off�� �ϸ� ����Ʈ�� �ȵǰ� on�ϸ� �Ǵ°�? 
-->SET AUTOPRINT ON �� �ϸ� ������ PRINT V_BIND;�̰� �ƽᵵ ����Ʈ�� �ȴٴ� ���� �ƴϸ� 
--VAR V_BIND NUMBER; �̰� �Ⱦ��� �ȵȴٴ� ���� �ƴϸ� �Ѵ�����
BEGIN
SELECT (PAY*12) +NVL(BONUS,0) INTO :VI_BIND
FROM PROFESSOR
WHERE PROFNO = 1001;
END;


--PL/SQL ���
--> ���ǹ��� �ݺ������� ���� �� ����.
���ǹ� : IF, CASE
�ݺ� : BASIC LOOP, WHILE(�ݺ�Ƚ���� �� �� ���� ���), FOR(�ݺ� Ƚ���� ������ ���)

--���� 1���� ��:
--EMP ���̺��� EMPNO, ENAME, DEPTNO, DNAME�� ����ϼ���
--�� DNAME�� ���� �Ʒ��� �����ϴ�.
--DEPTNO �� 10�̸� 'ACCOUNT',
--DEPTNO �� 20�̸� '',
--DEPTNO �� 30�̸� '',
--DEPTNO �� 40�̸� ''

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
   --> IF���� ���۵˴ϴ�.
      VDNAME := 'ACCOUNT'
   END IF ;
   -->IF ���� ������ �ݵ�� END IF�� ���ľ� �Ѵ�.
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
   
--  ���� 3 ���� ���� ������ �Ҹ� �ȳ���.
   
-- ���� 3. IF~THEN~ELSE~END IF ( ������ 2���� ��� ���(
--IF (����) THEN
--���๮��;
--ELSE
--���� ����;
--END IF;
--
--�� : EMP ���̺��� �����ȣ�� 7900���� ����� EMPNO, ENAME, COMM�� ����ϵ�
--�ش����� COMM�� 0���� ũ�� COMM�� �ݾ��� ����ϰ�, 0���� ������ '����� ���ʽ��� �����ϴ�'���
--������ ����߽��ϴ�.

DECLARE
    VEMPNO EMP.EMONP%TYPE ;
    VENAME EMP.ENAME%TYPE ;
    VCOMM EMP.COMM%TYPE := NULL ;

BEGIN
    SELECT EMPNO, ENAME, COMM INTO VEMPNO, VENAME, VCOMM

FROM EMP 
WHERE EMPNO = 7900 ;

 IF VCOMM > 0 THEN
   DBMS_OUTPUT.PUT_LINE (VENAME||' ����� ���ʽ��� '||VCOMM||' �Դϴ�.');
 ELSE
  DBMS_OUTPUT.PUT_LINE(VENAME||'����� ���ʽ��� �����ϴ�.');
 END IF;
END;


--2. CASE�� CASE ��
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
--> ���� �Է¹޴� ��
--EMPNO = 7900 �Է�
V_DNAME := CASE V_DEPTNO
                   WHEN 10 THEN 'ACCOUNT'
                   WHEN 20 THEN 'RESEARCH'
                   WHEN 30 THEN 'SALES'
                   WHEN 40 THEN 'OPERATION'
                   END ;
 DBMS_OUTPUT.PUT_LINE ( V_EMPNO||'               '||V_ENAME||'           '||V_DEPTNO||'    '||V_DNAME) ;
 END ;


--<IF�� ��������>
--1. ����� �Է¹޾� ���(EMP)���̺��� �� �ش� ����� �̸��� ����(SAL), ������ ����ϼ���.
--��, ������ �����׼��� ���� 5000���� �̻��̸� 5%,
--4000�������� 4999���������� 4%,
--3000�������� 3999���������� 3%.
--2000�������� 2999���������� 2%,
--�������� 1%�� ���� ����ϼ���)
--������ �������� �̹Ƿ� IF - THEN -ELSIF - ELSE - END IF ������ ����ϼ���.
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
    
--CASE�� ��� ��2:
--EMP���̺��� ����Ͽ� ����ڷκ��� �����ȣ�� �Է� �޾� �ش� ����� EMPNO, ENAME, SAL, DEPTNO �λ� ��
--����(UP_SAL)�� ����ϼ���.
--�� �μ���ȣ�� 10�� �μ��� ���� ������ 10% �λ��ϰ�
--�μ���ȣ 20��, 30�� �μ��� 20% �λ��ϰ�,
--�μ���ȣ 30�� ���� Ŭ ��� 30%�� �λ��ϼ���.
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
                  
      DBMS_OUTPUT.PUT_LINE ( '�����ȣ'||'   '||'�̸�'||'   '||'�޿�'||'   '||'�μ���ȣ'||'  '||'�λ��ı޿�');
      DBMS_OUTPUT.PUT_LINE(V_EMPNO||'   '||V_ENAME||'  '|V_SAL||'  '||V_DEPTNO||'     '||V_UP_SAL);
END ;

--BASIC LOOP�� ��� ��1:
--LOOP ���� ����Ͽ� ȭ�鿡 0���� 5������ ���ڸ� �Ʒ��� ���� ����ϼ���
DECLARE
NUM NUMBER := 0;
BEGIN
    LOOP
    DBMS_OUTPUT.PUT_LINE(NUM);
    NUM :=NUM +1 ;
    EXIT WHEN NUM > 5;
    END LOOP;
    END;
    
--WHILE �ݺ��� ��� ��1:
--WHILE �ݺ����� ����Ͽ� �Ʒ��� ��� ���ÿ� ���� ����ϼ���.
DECLARE
NUM NUMBER :=0 ;
BEGIN 
   WHILE NUM < 6
   LOOP
   DBMS_OUTPUT.PUT_LINE(NUM) ;
   NUM :=NUM + 1;
   END LOOP;
   
END;

--BASIC LOOP ���� WHILE �ݺ��� ���� ����
--BASIC LOOP ���� WHILE ���� ����Ͽ� �Ʒ��� ���ó�� �������� ���� �ۼ��ϼ���.
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


--FOR �ݺ��� ��1:
--0-5���� ���ڸ� ȭ�鿡 ����ϼ���
BEGIN
FOR I IN 0..5
--I�� DELCARE�� ��� �ȴٴ°� ����Ʈ
LOOP
DBMS_OUTPUT.PUT_LINE(I) ;
END LOOP;
END ;
/

--FOR �ݺ��� ��2:
--0-5������ ���ڸ� �������� ����ϼ���.
BEGIN
FOR I IN REVERSE 0..5
LOOP
  DBMS_OUTPUT.PUT_LINE(I) ;
  END LOOP ;
END;
/

--�����ȣ�� �Է� �޾� ����̸��� ���ڼ� ��ŭ ȭ�鿡 *�� ��� ������ �ۼ��ϼ���.
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

--CONTINUE ��(11G���� �߰��� ����Դϴ�.)
DECLARE
TOTAL NUMBER :=0 ;
BEGIN 
FOR I IN 1..10
LOOP
TOTAL := TOTAL +1;
--> 1�߰�
DBMS_OUTPUT.PUT_LINE('TOTAL:'||TOTAL);
CONTINUE WHEN I>5 ;
TOTAL := TOTAL + I ;
DBMS_OUTPUT.PUT_LINE('OUT TOTAL'||TOTAL);
END LOOP;
END;|


--PL/SQL Ŀ��
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
--> Ŀ�� ����
DBMS_OUTPUT.PUT_LINE('��ȣ  �̸�  �޿�');

LOOP
FETCH C1 INTO VEMPNO, VENAME, VSAL ;
--> Ŀ���� �ִ� �����͸� FETCH�ؼ� ������ �Ҵ�
EXIT WHEN C1%NOTFOUND ;

DBMS_OUTPUT.PUT_LINE(VEMPNO||'  '||VENAME||'  '||VSAL);
END LOOP;
CLOSE C1;
END;

--���� 1
--ȭ�鿡�� �л��� �̸��� �Է� �޾� �� �л��� ���� ������ ��� �л��̸��� �а� ��ȭ��ȣ�� ����Ʈ�ϼ���.
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
--> Ŀ�� ����
DBMS_OUTPUT.PUT_LINE('�̸�  �а�  ��ȭ��ȣ');

LOOP

DBMS_OUTPUT.PUT_LINE(V_NAME||'  '||V_DNAME||'  '||V_TEL);
END LOOP;
CLOSE C1;
END;

BEGIN
FROM STUDENT S, DEPARTMENT D
--�Ʒ��� ��
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
  DBMS_OUTPUT.PUT_LINE('�̸�  �а�  ��ȭ��ȣ');
  LOOP
  FETCH C1 INTO VROW ;
  EXIT WHEN C1%NOTFOUND ;
  DBMS_OUTPUT.PUT_LINE(VROW.VNAME||'   '||VROW.VDNAME||'   '||VROW.VTEL) ;
  END LOOP ;
  CLOSE C1 ;
  END ;
  
--CURSOR FOR LOOP ��1:
--EMP���̺��� EMPNO, ENAME ���� �����ͼ� Ŀ���� ���� �� ����ϼ���.
--> FOR���� ����ؼ� �ϸ��� OPEN�� CLOSE�� ���� ���� �ʾƵ� �ȴٴ°� ����Ʈ. ���帹�� ����ϴ� ���
SELECT * FROM EMP;
DECLARE
CURSOR EMP_CUR IS
-->Ŀ���� ����
SELECT EMPNO, ENAME
FROM EMP;

BEGIN
 FOR EMP_REC IN EMP_CUR
-- Ŀ���� �����͸� ������ EMP_REC ���� ����
  LOOP
   DBMS_OUTPUT.PUT_LINE ( EMP_REC.EMPNO||'    '||EMP_REC.ENAME );
  END LOOP;
END;

--CURSOR FOR LOOP �� 3:
�̹� ���� SUB QUERY�� ����Ͽ� �۾��� �ϴ� �� �Դϴ�.
�� ����� DECLARE �κп� Ŀ���� ������ �ʿ䰡 �����ϴ�.
��� Ŀ���� ���� �������� �κ��� IN �޺κп� �ٷ� ����ϴ� ����Դϴ�.
DECLARE
BEGIN 
FOR EMP_REC IN ( SELECT EMPNO, ENAME, SAL 
                           FROM EMP)
LOOP
 DBMS_OUTPUT.PUT_LINE(EMP_REC.EMPNO||'   '||EMP_REC.ENAME||'   '||EMP_REC.SAL);
 END LOOP;
END;

--TABLE TYPE ���� ��� ��2:
--FOR �ݺ����� ����Ͽ� ������ ���� ���� �����͸� �Է��ϴ� ����Դϴ�.
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
--���� ������ FOR������ ���� �Ѱ� �Ʒ�
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


--���� 1
--ȭ�鿡�� �л��� �̸��� �Է¹޾� �� �л��� ���� ������ ��� �л��̸��� �а� ��ȭ��ȣ�� ����Ʈ�ϼ���
--PARAMETER CURSOR�� ����
DECLARE
CURSOR C1 ( PNAME STUDENT.NAME%TYPE ) IS
  SELECT S.NAME  , D.DNAME AAA, S.TEL
  FROM STUDENT S, DEPARTMENT D
  WHERE SYBSTR ( TEL, 0, INSTR(TEL, ')')) = ( SELECT SBUSTR(TEL, 0, INSTR(TEL, ')'))
  FROM STUDENT
  WHERE NAME = PNAME ) AND S.DEPTNO1 = D.DEPTNO ;
  
  BEGIN
   DBMS_OUTPUT.PUT_LINE ( '=============================') ;
   DBMS_OUTPUT.PUT_LINE (' �̸� �а�   ��ȭ��ȣ') ;
   FOR EMP_REC IN C1('������') LOP
   EXIT WHEN C1%NOTFOUND;
   DBMS_OUTPUT.PUT_LINE (EMP_REC.NAME||'   '||EMP_REC.AAA||'  '||EMP_REC.TEL ) ;
   END LOOP ;
   DBMS_OUTPUT.PUT_LINE('=================')
   DBMS_OUTPUT.PUT_LINE('�̸� �а�   ��ȭ��ȣ') ;
   
FRO EMP_REC IN C1(�̻��')
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
-- > ���̺� ����
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

--�μ��ڵ带 �Է� �޾� �ش� �μ��� ���� ������� ���� �� ������ ����Ǽ��� ����ϼ���.
--(������ Ŀ���� ����ϼ���)

DECLARE
V_DEPTNO NUMBER := &DNO;
BEGIN
DELETE EMP WHERE DEPTNO = V_DEPTNO;
DBM_OUTPUT.PUT_LINE( ' ������ �Ǽ��� ' ||SQL%ROWCOUNT||'�Դϴ�');
ROLLBACK;

END;

--�μ��ڵ带 �Է¹޾� �� �μ��� ���� ������� �̸�, �޿��� ����ϼ���.
--(���� ���� �����͸� �۾��ؾ� �ϹǷ� ����� Ŀ���� BASIC LOOP ���� ����ϼ���.)
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
  
  
--EMP TABLE ���� �μ��ڵ�(DEPTNO)��
--10�̸� �޿��� 10%, 20�̸� 20% 30�̸� �޿��� 30%�� �λ��Ͽ� EMP�� ������Ʈ�ϼ���
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
  
   