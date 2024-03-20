-- CHAPTER 09. TCL : Ʈ����� ����� --

-- Ʈ������̶� ?
-- �����ͺ��̽��� ���¸� ��ȭ��Ű�� ���ؼ� �����ϴ� �ּ� ���� ����
-- ��, ������ ó���ϱ� ���� �ּ� �������.

-- Ʈ������� 4���� Ư�� - ACID
-- ���ڼ�(Atomicity) : ALL or Nothing, ��� ����ǰų� ���� ������ ���� �ʰų�
-- �ϰ���(Consistency) : ������ �ϰ��� �ִ� ���¸� ���� �ϴ°�
-- ������(Isolation) : Ʈ����� ����� �ٸ� Ʈ������� ������ ���� �ʴ� ��
-- ���Ӽ�(Durability) : ���������� ����� Ʈ������� ������ �ݿ� �Ǵ� ��

-- TCL�� ���ɾ�
-- COMMIT : DB�� ���������� ����, ������ COMMIT ���� ������ Ʈ����� ����� ����
-- ROLLBACK : Ʈ������� ���, �ǵ����� ���ɾ�, ������ COMMIT ���������� ������ ����
-- SAVEPOINT : �ϳ��� Ʈ������� �۰� �����Ͽ� �����ϴ� ����� �����ϴ� ���ɾ�

-- ���̺� ����
CREATE TABLE TCL_���������� AS SELECT * FROM ����������;

SELECT * FROM TCL_����������;

-- TCL_���������� ���̺��� ���� ������ �ֱ�('SMHRD10', '�̸�', 'D')
INSERT INTO TCL_���������� (�л�ID, �л��̸�, �Ҽӹ�)
VALUES ('SMHRD10', '�ӵ���', 'D');

ROLLBACK;

COMMIT; -- ���� ������ �Ǽ� ROLLBACK�� �ص� �ǵ������� �ʴ´� !!

-- �����̶�?
-- ������ ���̽� ������ �������� ���� �����ͺ��̽����� ���õ� �۾��� ������ ��
-- ������ �����ϱ������ ��ü�Ⱓ�� �ǹ�
--> ��, ������ ��������� ���� ����Ŭ �����ͺ��̽��� �����Ͽ� ������� ������ ������ �ִ� ��� ��

-- ���� A : sql developer
-- ���� B : run sql command Line

SELECT * FROM TCL_����������;

DELETE FROM TCL_����������
WHERE �л��̸�='���ؿ�';

COMMIT;

-- A���ǿ��� DELETE�� �ϰ� COMMIT�� ���� ���� ���·�
-- B���ǿ��� ��ȸ�� �ϰ� �Ǹ� ��ȯ ���� ������ �ȵȴ�
-- �ֳĸ� A���ǿ����� COMMIT(��������)�� ���߱� �����̴�
-- �׷��� �ٸ� ���ǿ����� ������ �ʴ´� --> �б� �ϰ����� �����Ѵ� ��� �Ѵ�

-- LOCK
UPDATE TCL_����������
  SET �л��̸� = 'NAME_CJH'
  WHERE �л�ID = 'SMHRD10';
















