-- CHAPTER 07. DML ( DATA MANIPULATION LANGUAGE) --

-- DML �̶� ?
-- ������ ���۾�� ���̺� �����͸� ��ȸ, �߰�, ����, ���� �� �� ����ϴ� ���Ǿ��̴�.
--> ���̺��� ���ϴ� �����͸� �Է�, ����, �����Ѵ�.

-- DML ���� - ���ξ���
-- SELECT : ������ ��ȸ
-- INSERT : ������ �߰�
-- UPDATE : ������ ����
-- DELETE : ������ ����

-- �����
--1)
-- INSERT INTO ���̺� �� (�÷�..)
-- VALUES (��...)
--> INSERT�� �Է��� �÷��� VALUES�� �Է��� ���� ������ �ڷ����� �¾ƾ� �Ѵ� !!!!

--2)
-- INSERT INTO ���̺�� 
-- VALUES (�� ...)
--> INSERT �� �÷� ����Ʈ ������ VALUES�� �Է��� ���� ���̺� �÷� ���� ������ �ڷ����� �¾ƾ��Ѵ� !!

-- 1.���� ������ �ֱ�

INSERT INTO SMHRD_JOIN(ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD01', '12345', '���ؿ�', SYSDATE, 29, '010-3568-3904', 'rtcho3904@naver.com');

SELECT * FROM SMHRD_JOIN;

-- 2.ģ���� ������ �ֱ�(��ȭ��ȣ�� �̸��� ������ NULL������ �Է�) -- ��������� NULL�� �ִ´�
INSERT INTO SMHRD_JOIN(ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD02', '11111', '���Գ�', SYSDATE, 38, NULL, '');

-- 3.ģ���� ������ �ֱ� (��ȭ��ȣ�� �̸��� ������ NULL������ �Է�) -- �Ͻ������� NULL���� �ִ´�
INSERT INTO SMHRD_JOIN(ID, PW, NAME, JOIN_DATE, AGE)
VALUES('SMHRD03', '22222', '�ڼ���', SYSDATE, 25);






-- ���̺� ������ ���� ����Ʈ 

-- 1. �÷�����Ʈ�� �Է� ���� ������ �ٸ� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL ����: ORA-00913: too many values 
--> �÷� ����Ʈ�� ������ �Է� �� ������ ��ġ�ؾ� �Ѵ�!

-- 2. �ĺ��ڿ� NULL�� �Է��� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."ID")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� (�ĺ��ڴ� NOT NULL + UNIQUE �ߺ��Ұ�)

-- 3. NOT NULL�� �÷��� NULL�� ���� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."NAME")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� ( NOT NULL ���� )

-- 4. �ڷ����� ���� �ʰ� �Է� ���� ���� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, '29��', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> �÷��� ���� �ڷ����� �°� �ۼ��� �Ǿ� �Ѵ�. (AGE�� ������ �ڷ���)

-- 5. �ĺ��� �÷��� �ߺ� ���� ���� ���� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> ���� �� ���¿��� �ѹ��� ������ �Ǹ� �ĺ��ڰ� ���� �ߺ��� �Ǽ� ������ ��

-- �÷�����Ʈ�� ���� �ʰ� INSERT �ϴ� ���
INSERT INTO SMHRD_JOIN
VALUES ('SMHRD5', '55555', '�̸���', SYSDATE, 23, '010-1111-1111', 'ABCDE@NAVER.COM');

SELECT * FROM SMHRD_JOIN;

-- UPDATE : ���̺��� �����͸� �����ϰ� ������ ���

-- �����
-- UPDATE ���̺� ��
-- SET ������ �÷� = ������, ...
-- WHERE �����ʹ� ������ ��� ���� �����ϱ� ���� ����;
--> WHERE �������� ������ ��� ���̺� �� ����� ��� �÷��� �����Ͱ� ������ �ȴ�.

SELECT * FROM SMHRD_JOIN;

UPDATE SMHRD_JOIN
SET AGE=39
WHERE NAME = '���Գ�';

-- �̸��� ������ ���� ģ���� ä���� �־����
UPDATE SMHRD_JOIN
SET EMAIL = 'KANG@NAVER.COM', TEL = '010-5555-5555'
WHERE NAME = '���Գ�';
-- ������ PK�� ã�Ƽ� ���ִ� ���� ���� �ùٸ� ����̴� !!!

ROLLBACK; -- ������ �����ϴ� ��ɾ�

-- DELETE : �����͸� ������ �� ����ϴ� ��ɾ�
-- �����
-- DELETE FROM ���̺� ��
-- WHERE ������ ��� ���� �����ϱ� ���� ���� ��;
--> **WHERE �������� ������ ��� ���̺��� ��� �����Ͱ� ������ �ȴ�!!

-- 30�� ������ ȸ������ ������ ����
DELETE FROM SMHRD_JOIN
WHERE AGE <= 30;


