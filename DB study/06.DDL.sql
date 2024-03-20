-- CHAPTER 06. DDL --

-- DDL �̶� ?
--> ������ ���Ǿ�� ���̺� ���� ����� ��ü�� ����ų� �����մϴ�.

--[DDL ��ɾ� ����]
-- CREATE   : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- ALTER    : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- RENAME   : ���̺��� �̸��� �����ϴ� ��ɾ�
-- TRUNCATE : ���̺��� �����͸� �����ϴ� ��ɾ�
-- DROP     : ���̺� ���� ��ü�� �����ϴ� ��ɾ�

-- [ ���̺� ������ ���� ����ϴ� �ڷ��� ]
-- VARCHAR2(N) : ������ ������, N ũ�⸸ŭ �Է� ����
-- NUMBER(P,S) : ������ �ڷ���, ������ ���� P�ڸ� ��ŭ �Է¹ް�, S�ڸ� ��ŭ �Ҽ��� �Է¹���
--> SQL������ �Ǽ��� ���� ��� ǥ���� ����.
--> ()�� �����ϰ� �Ǹ� �ִ밪�� 38ũ�Ⱑ ����.
-- DATE : ���� ��¥ ���� �Է� ����

-- ���������� ���̺��� Ȯ���ؼ� TEST_���������� ���̺��� ������
-- ���̺�� ���� �� SHIFT + F4 ���̺� ���� ������ Ȯ�� ����

CREATE TABLE TEST_����������(
    �л�ID VARCHAR2(9) PRIMARY KEY,
    �л��̸� VARCHAR2(50) NOT NULL,
    �Ҽӹ� VARCHAR2(5)
);

SELECT * FROM TEST_����������;

-- ����ǥ���̺��� Ȯ���ؼ� TEST_����ǥ ���̺��� �����غ���
-- ���������� ���������� ! �÷��� + �ڷ��� �Է��� ���ּ��� !

CREATE TABLE TEST_����ǥ(
    �л�ID VARCHAR2(9),
    ���� VARCHAR2(30),
    ���� NUMBER
);

SELECT * FROM TEST_����ǥ;

CREATE TABLE SMHRD_LOGIN(
    ID VARCHAR2(20),
    PW VARCHAR2(20),
    EMAIL VARCHAR2(20),
    NAME VARCHAR2(20)
);

SELECT * FROM SMHRD_LOGIN;

-- ���� �����̶� ?
--> ���̺� �Է� ������ �����͸� �������� �����ϴ� ��
--> ���̺� ��Ȯ���� �����ϱ� ���� �������� ����
--> ���� ���� ���� ��Ŀ� ���� �������� �����̳� ���� ���ο� ������ ����

-- [ ���������� ���� ]
-- PRIMARY KEY (PK) : �⺻Ű, NOT NULL + UNIQUE = NULL�Ұ� + �ߺ��Ұ�
-- UNIQUE KEY (UK) : ����Ű, NULL�� �Է� ���������� �ߺ��� �Ұ����ϴ�.
-- NOT NULL : NULL���� �Ұ���, �� �ԷµǾ�� �ϴ� �������̴� �Ҷ� ������
-- CHECK : T OR F�� ���� �� �ִ� ������ ����, ������ �����͸� �Է� ����
-- FOREIGN KEY (FK) : �ܷ�Ű, ���̺��� �����ϴ� Ű

-- ���Ἲ �������� ����
-- ��ü ���Ἲ : �⺻ Ű �����̶�� �ϸ�, �ϳ��� ���̺� �ߺ��� ���� �������� �ʵ��� ����
-- ���� ���Ἲ : ���� �Է�, ����, ������ �� �����Ǵ� �ٸ� ���̺���� �����Ͱ� ��Ȯ�ϰ� ���� �ǵ��� ����
--             ���� ���迡 �ִ� �� ���̺��� �����Ͱ� �׻� �ϰ��� ���� ������ �ϴ� ��


-- [ �̹� ������ ���̺� ���� ������ �����ϱ� ]
-- �����
-- ALTER TABLE ���̺� �� ADD CONSTRAINT �������Ǹ� ��������(�÷�);

SELECT * FROM SMHRD_LOGIN;

-- ���̺� PK �������� ����
ALTER TABLE SMHRD_LOGIN ADD CONSTRAINT ID_PK PRIMARY KEY(ID);

-- ���̺� UK �������� ����
ALTER TABLE SMHRD_LOGIN ADD CONSTRAINT EMAIL_UK UNIQUE(EMAIL);

-- ���̺� CHECK ���� ���� �����ϱ�
-- ��й�ȣ�� 3�ڸ� �̻� ����� �� �� �ֵ��� ������ ����
ALTER TABLE SMHRD_LOGIN ADD CONSTRAINT PW_CHECK CHECK(LENGTH(PW) > 3 );

-- [ �̹� ������ ���̺� FK ���������� �����ϱ� ]
-- �����
-- ALTER TABLE ���̺� �� ADD CONSTRAINT �������� �� ��������(�÷�)
-- REFERENCES �������̺�(�����÷���) ;

-- ���̺� FK �������� ����
ALTER TABLE TEST_����ǥ ADD CONSTRAINT �л�ID_FK FOREIGN KEY(�л�ID)
REFERENCES TEST_����������(�л�ID);

-- �������� �����ϱ�
-- �����
-- ALTER TABLE ���̺� �� MODIFY �÷��� �ٲ� ��������;

ALTER TABLE SMHRD_LOGIN MODIFY NAME NOT NULL;

-- �������� �����ϱ�
-- �����
-- ALTER TABLE ���̺�� DROP CONSTRAINT �������� �̸�;
ALTER TABLE SMHRD_LOGIN DROP CONSTRAINT PW_CHECK;

CREATE TABLE TB_TEST1(
    PK�׽�Ʈ NUMBER PRIMARY KEY,
    UK�׽�Ʈ NUMBER UNIQUE,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER CHECK(LENGTH(CK�׽�Ʈ) > 5)
);

CREATE TABLE TB_TEST2(
    PK�׽�Ʈ NUMBER,
    UK�׽�Ʈ NUMBER,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER,
    FK�׽�Ʈ NUMBER,
    -- ���������� �߰�
    -- CONSTRAINT �������Ǹ� ��������(�÷�)
    CONSTRAINT PK�׽�Ʈ_PK PRIMARY KEY(PK�׽�Ʈ),
    CONSTRAINT UK�׽�Ʈ_UK UNIQUE(UK�׽�Ʈ),
    CONSTRAINT CK�׽�Ʈ_CK CHECK(CK�׽�Ʈ > 0),
    CONSTRAINT FK�׽�Ʈ_FK FOREIGN KEY(FK�׽�Ʈ) REFERENCES TB_TSET1(PK�׽�Ʈ)
);

-- ���̺��� �÷� �߰��ϱ� -- ADD
-- �����
-- ALTER TABLE ���̺�� ADD �÷��� �ڷ���(ũ��);
ALTER TABLE SMHRD_LOGIN ADD ADDRESS VARCHAR(10);

SELECT * FROM SMHRD_LOGIN;

-- �÷� �̸� �����ϱ� - RENAME
-- �����
-- ALTER TABLE ���̺� �� RENAME COLUMN �����÷� �� TO �ٲ� �÷� ��;
ALTER TABLE SMHRD_LOGIN RENAME COLUMN ADDRESS TO ADDR;

-- �÷��� �ڷ����� �����ϱ� - MODIFY
-- �����
-- ALTER TABLE ���̺� �� MODIFY �÷��� �ٲ� ��������(����);
ALTER TABLE SMHRD_LOGIN MODIFY ADDR VARCHAR2(30);

-- Ư�� �÷� ���� -- DROP
-- �����
-- ALTER TABLE ���̺� �� DROP COLUMN �÷���;
ALTER TABLE SMHRD_LOGIN DROP COLUMN ADDR;

-- ���̺� ����
-- �����
-- DROP TABLE ���̺� ��;

-- TEST_���������� ���̺��� ������ �غ��ڽ��ϴ�.
DROP TABLE TEST_����������;
-- ORA-02449: unique/primary keys in table referenced by foreign keys
--> ����ǥ ���̺��� �л�ID�� �����ǰ� �־ ������ �Ұ���

-- ���̺��� �������ǵ� ���� �����ϴ� ���
-- DROP TABLE ���̺� �� CASCADE CONSTRAINT;

DROP TABLE TEST_���������� CASCADE CONSTRAINT;
--> ���� ���� ���� ��Ŀ� ���� ���� �������� �����̳� ���� ���ο� ������ �޴´� !!

SELECT * FROM TEST_����������;

-- TRUNCATE : ���̺��� �����͸� ���� ����
-- �����
-- TRUNCATE TABLE ���̺� ��;

-- ���̺� ���� �ϱ�
CREATE TABLE DROP_����ǥ AS SELECT * FROM ����ǥ;
--> ����ǥ ���̺�� ������ �����͸� ������ ���̺��� �����ϴ� ������
--> ���������� ���� ���� �ʴ´� !!

SELECT * FROM DROP_����ǥ;

-- DELETE
DELETE FROM DROP_����ǥ;

ROLLBACK; -- ���� ���·� �ǵ����� ��ɾ�
--> ������ �����ϴ� !!

--TRUNCATE �� ������ �ϸ� ���� ������ �ǹ�����, ������ �ȵȴ� !!
TRUNCATE TABLE DROP_����ǥ;

ROLLBACK;

-- ���̺��� ���� ����
DROP TABLE DROP_����ǥ;

CREATE TABLE SMHRD_JOIN(
    ID VARCHAR2(20) PRIMARY KEY,
    PW VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(10) NOT NULL,
    JOIN_DATE DATE,
    AGE NUMBER(3),
    TEL VARCHAR2(20),
    EMAIL VARCHAR2(50) UNIQUE
);

SELECT * FROM SMHRD_JOIN;