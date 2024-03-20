-- CHAPTER 04. GROUP BY / HAVING �� --

-- �����Լ��� ����
-- ������ �Լ� : �Էµ� �ϳ��� ��� ����� �ϳ��� ������ �Լ�
-- ������ �Լ� : ���� ���� �Է¹޾� �ϳ��� ��� ������ ����� �Ǵ� �Լ�
--> ������ �Լ��� '�����Լ�'��� �θ��ϴ�.

-- ������ �Լ�(�����Լ�)�� Ư¡
-- 1.�����Լ��� NULL���� �����ϴ� Ư���� ������ �ִ�.
-- 2.�����Լ��� �׷�ȭ(GROUP BY)�� �Ǿ��ִ� ���¿����� ����� �����ϴ� !!!

-- ���� �Լ��� ����
-- COUNT : ������ �������� ������ ��ȯ
-- SUM : ������ �������� ���� ��ȯ
-- MAX : ������ ������ �� �ִ� �� ��ȯ
-- MIN : ������ ������ �� �ּ� �� ��ȯ
-- AVG : ������ ������ �� ��� �� ��ȯ

-- COUNT(������)

-- �������̺��� ����ID�� ���� ������ ��ȸ( �� ������ )
SELECT * FROM EMPLOYEES;

SELECT --EMPLOYEE_ID, --107 ���� ��
      COUNT(EMPLOYEE_ID) -- 1�� ��
 FROM EMPLOYEES;
--> ����ϰ��� �ϴ� ���� ������ ���� �ʾƼ� ������ ����.

SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
GROUP BY();
-- �������̺��� �ϳ��� �׷����� ���� �ɷ� �ν��� �ϴ°̴ϴ�. �׷��� �����Լ��� ������ �Ǵ°ſ��� !!

-- �μ����̺��� �μ�ID�� ���� ������ ���

SELECT COUNT(DEPARTMENT_ID)
FROM DEPARTMENTS;

SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;

-- COUNT �Լ��� *(�ƽ��͸���ũ)�� ����� �� �ֽ��ϴ�.
-- �ٸ� �����Լ��� ����� ���ؿ� !!

SELECT COUNT(*)
    FROM EMPLOYEES;
    --> �ƽ��͸���ũ�� ����ϸ� NULL������ �����ؼ� ����� ���ش�.
    
-- ����1) �������̺��� �޿��� �� �հ踦 ���(SUM �Լ�)
SELECT SUM(SALARY)
FROM EMPLOYEES;

-- ����2) �������̺��� �������� �ִ� �޿��� �ּ� �޿��� ��� (MAX/MIN �Լ�)

SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES;

-- ����3) �������̺��� �μ�ID�� 100�� ������ ��� �޿��� ��� (AVG �Լ�)
--        * ������� �Ҽ��� 1�� �ڸ����� �ݿø�

SELECT ROUND(AVG(SALARY),1) AS ��ձ޿�
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

SELECT * FROM ����������;
SELECT * FROM ����ǥ;

SELECT COUNT(�л�ID) AS �ݺ��ο���
FROM ����������
GROUP BY �Ҽӹ�;

-- GROUP BY : Ư�� Į���� �������� �׷�ȭ(����)

-- [ GROUP BY ����� ]

-- 4. SELECT   ��ȸ�� �÷���1...
-- 1. FROM     ���̺� ��
-- 2. WHERE    ���ϴ� ���� �����ϱ� ���� ���ǽ�
-- 3. GROUP BY Ư�� �÷��� �������� �׷�ȭ

-- ���������� ���̺��� �Ҽӹ� ��(GROUP BY) �л��� �ο����� ��ȸ.
SELECT * FROM ����������;

SELECT �Ҽӹ�, COUNT(�Ҽӹ�)
    FROM ����������
GROUP BY �Ҽӹ�;

SELECT * FROM ����ǥ;

-- ����1) ����ǥ ���̺��� ����(GROUP BY)�� �ְ� ������ ���� ������ ���

SELECT ����, MAX(����), MIN(����)
    FROM ����ǥ
    GROUP BY ����;
    
-- ����2) ����ǥ ���̺��� �л���(GROUP BY)�� ��� ���� ���
--      ��, �Ҽ��� 1�ڸ������� ���

SELECT �л�ID, TRUNC(AVG(����), 1)
    FROM ����ǥ
    GROUP BY �л�ID;
    
-- ����3) ����ǥ���̺��� �л����� JAVA�� DATABASE������ ������ ���� ���

SELECT * FROM ����ǥ;

SELECT �л�ID, SUM(����)
FROM ����ǥ
WHERE ���� IN ('JAVA', 'DATABASE')
GROUP BY �л�ID
ORDER BY �л�ID ASC;

-- SQL �������
-- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY

-- HAVING �� : GROUP BY ���� ���� �Ҷ��� ����� �����ϴ�.
--> ���谡 �Ϸ��� ����� ������ ���� ���͸��ϴ� �����̴�.
--> ������ ���� ����� ����� �ȴٴ� �������� WHERE���� ���������,
-- HAVING���� �׷�ȭ�� ��󿡼��� ����� �����ϴٴ� ������ �ٸ��� !!

-- ����ǥ ���̺��� �л��� ��� ������ ���ϵ�,
-- ��� ������ 75 ������ �л��鸸 ���

SELECT �л�ID, ROUND(AVG(����),1)
FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����)<=75;

-- ����1) ���������� ���̺��� �ݺ� �ο����� 3�� �̻��� �ݸ� ���
SELECT �Ҽӹ�, COUNT(�Ҽӹ�)
FROM ����������
GROUP BY �Ҽӹ�
HAVING COUNT(�Ҽӹ�) >=3;


-- ����2) �������̺��� �μ��� �ְ� ������ 100,000 �̻��� �μ��� ���

SELECT DEPARTMENT_ID, MAX(SALARY * 12) AS �ְ���
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY * 12) >= 100000;

-- ����3) ����ǥ���̺��� �л��� ��� ������ ����ϵ�,
-- NULL�� �ƴ� ���� ��� ��, ������ �Ҽ��� 1�� �ڸ������� ���

SELECT �л�ID, ROUND(AVG(����),1)
FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) IS NOT NULL
ORDER BY �л�ID ASC;