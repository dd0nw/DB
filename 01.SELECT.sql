--CHAPTER 01. SELECT --

-- �ּ� ��ȣ

-- ���� ũ�� Ű��� : ���� > ȯ�漳�� > �ڵ������� > �۲�
-- �ּ� ���� �ٲٱ� : ���� > ȯ�漳�� > �ڵ������� > PL/SQL �ּ�

-- �ּ� ����(2) : /**/ --> �������� �ѹ��� �ּ�ó���� �� �����
/*
1. SQL ������ ��ҹ��ڸ� �������� �ʴ´�!
2. ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
3. SQL ���� ������ �ݵ�� �����ݷ�( ; )�� �������Ѵ� !!! ;
4. SQL ���� ����Ű : CTRL + ENTER, F9
*/

DESC EMPLOYEES;
-- DESC(DECRIBE) : SQL���� ���Ǵ� ���̺��� ������ Ȯ���Ҷ� ����ϴ� ��ɾ�


SELECT FIRST_NAME, LAST_NAME
    FROM EMPLOYEES;
    
    
-- [ SELECT �� �⺻ ����� ]
--2. SELECT     ��ȸ�� �÷��� 1, ....
--1. FROM       ��ȸ�� ���̺� �� 

-- ��ü �����͸� ��ȸ�ϴ� ���
-- * ( �ƽ�Ÿ����ũ) -> ��ü�� �ǹ�

-- ���� ���̺��� ��ü ������ ���
SELECT *
    FROM EMPLOYEES;
    
-- �ǽ� 1) �μ����̺��� ��ü ������ ���

DESC DEPARTMENTS;

SELECT *
    FROM DEPARTMENTS;

-- �ǽ� 2) �������̺��� ����ID, FIRST_NAME, EMAIL ������ ���
SELECT MANAGER_ID, FIRST_NAME, EMAIL
    FROM EMPLOYEES;
    
    
-- �ǽ� 3) �μ����̺��� �μ�ID, �μ���, LOCATION_ID�� ���
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
    FROM DEPARTMENTS;
    
-- �ǽ� 4) �������̺��� EMAIL, ����ID, JOB_ID, LAST_NAME�� ������� ���
SELECT EMAIL, MANAGER_ID, JOB_ID, LAST_NAME
    FROM EMPLOYEES;
    
-- �ǽ� 5) �������̺��� �������� �μ� ID�� ���
SELECT DEPARTMENT_ID
    FROM EMPLOYEES;
    
-- DISTINCT : ������ �ߺ��� ����


-- �ߺ� ���� �����
-- SELECT DISTINCT ��ȸ�ϰ� ���� �÷��� 1, .......
-- FROM     ���̺�;

-- �������� �μ�ID�� �ߺ� �����Ͽ� ���
SELECT DISTINCT DEPARTMENT_ID
    FROM EMPLOYEES;
    
-- �ǽ�) �������̺��� JOB_ID�� �μ�ID�� �ߺ��� �����Ͽ� ���
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
    FROM EMPLOYEES;
    
-- DISTINCT �ߺ����Ŵ� �ڿ� 2�� �̻��� ������
-- ���� �÷��� �ߺ��� �־ �ٸ� �� �÷� ���� �ٸ��� '�ٸ���' ����Ѵ�.

-- �ǽ� 1) �������̺��� �Ի����� ��� �� ���� ������ Ȯ�� *�ּ����� ���� ������ �Է�

-- �ǽ� 2) �������̺��� �Ի����� ��� �� �ߺ��� �����ؼ� ��� * �ּ����� ���� ������ �Է�

SELECT HIRE_DATE
    FROM EMPLOYEES; -- 107��

SELECT DISTINCT HIRE_DATE
    FROM EMPLOYEES; -- 98��
    
-- TIP!!!
--> �÷��� ���ڿ����� �����ϴ�(+, -, *, /) !!

SELECT FIRST_NAME, SALARY
    FROM EMPLOYEES;
    
-- ����)�������̺��� ������ �̸��� �޿�, ������ ����غ���

SELECT FIRST_NAME, 
       SALARY,
       SALARY*12 AS "����"
    FROM EMPLOYEES;

-- ��Ī ����ϱ�
-- Alias��� �ϸ� �Ѵ��� ���� ���� �����ϴ� ���� ����
-- AS Ű���带 ����ؼ� ��Ī�� �����մϴ�.

-- ��Ī ��� ���
-- 1. SELECT �÷��� ��Ī
-- 2. SELECT �÷��� "��Ī"
-- 3. SELECT �÷��� AS ��Ī
-- 4. SELECT �÷��� AS "��Ī"

-- �ǽ�) ������ �̿��ؼ� �������̺��� �Ի���, �Ի��� �������� ���
-- ��, �Ի����� ��Ī�� �Ի��Ϸ�, �Ի��� �������� "�Ի��ϴ�����" ��Ī�� ����ؼ� ���

SELECT HIRE_DATE �Ի���, HIRE_DATE+1 �Ի��ϴ�����
    FROM EMPLOYEES;
    
SELECT HIRE_DATE "�Ի���", HIRE_DATE+1 "�Ի��ϴ�����"
    FROM EMPLOYEES;
    
SELECT HIRE_DATE AS �Ի���, HIRE_DATE+1 AS �Ի��ϴ�����
    FROM EMPLOYEES;
    
SELECT HIRE_DATE AS"�Ի���", HIRE_DATE+1 AS "�Ի��ϴ�����"
    FROM EMPLOYEES;
    
-- ORDER BY ���̶�?
-- Ư���÷��� �������� ���ĵ� ���·� ����ϰ��� �Ҷ� ����Ѵ�.
-- SQL ���� �������� ���� �������� ����ȴ�.
-- ������ ���� ����� �������� ������ �⺻������ ���������� ����ȴ�.

--ASC(ASCENDING) : �������� ����(1, 2, 3, 4, 5 ...)
--DESC(DESCENDING) : �������� ����(10, 9, 8, 7 ...)

-- �������̺��� ��� ������ ������ ���
-- �޿��� �������� ����

SELECT *
    FROM EMPLOYEES
ORDER BY SALARY;

-- �ǽ�) �ֱٿ� �Ի��� ��¥�� �������� ������ �̸��� �Ի糯¥�� ���
SELECT FIRST_NAME, HIRE_DATE
    FROM EMPLOYEES
    ORDER BY HIRE_DATE DESC;
    
-- �������̺��� ����ID, �μ�ID, �̸�, �޿� ������ ���
-- ��, �μ�ID�� ������������, �޿��� ������������ �����ؼ� ���

SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
    FROM EMPLOYEES
    ORDER BY DEPARTMENT_ID ASC, SALARY DESC;
-- ���� �μ����� �ٹ��ϰ� �ִ� �����鳢�� �޿��� ���� ������ ���� ���� ������� ���
-- ���� �μ�ID�� ������������ ������ �Ŀ� �޿��� ������������ ������ ��

-- NULL ���̶�?
-- NULL ���̶� �������� ���� ������ ��� �ִ� ���¸� �ǹ�
-- ���� �������� �ʰų� �������� ���� ���� �ǹ��մϴ�.
-- ���� 0�� ���ڿ� ' '�� NULL ���� �ƴմϴ�.
-- *** NULL�� ������ �ϸ� ��� ���� ������ NULL ���� ���´� !!

-- �ǽ�) �������̺��� ����ID, ���ʽ�, ���ʽ��ι��� ������ ���
-- ��, ���ʽ� �ι��� ������ UP_BONUS�� ��Ī�� ����ؼ� ���

SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT*2 AS "UP_BONUS"
    FROM EMPLOYEES;
    
-- ����1���� UP_BONUS�� ��� ���� �� �̷��� ���Դ��� ������ �� ������ !!
