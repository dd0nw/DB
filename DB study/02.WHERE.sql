-- CHAPTER 02. WHERE --

-- [ WHERE �� �⺻ ��� ��� ]

-- 3. SELECT   ��ȸ�� �÷��� 1.....
-- 1. FROM     ���̺� ��
-- 2. WHERE    ��ȸ�� ���� �����ϱ� ���� ���ǽ�

-- �ǽ�1) �������̺��� ����ID�� 105�� ������ FIRST_NAME�� LAST_NAME�� ���
SELECT FIRST_NAME, LAST_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 105;
    
-- �ǽ�2) �μ����̺��� �Ŵ������̵� 100�� �μ��̸��� �μ����̵� ���
SELECT MANAGER_ID, DEPARTMENT_NAME, DEPARTMENT_ID
    FROM DEPARTMENTS
    WHERE MANAGER_ID=100;
    
-- �ǽ�3) �������̺��� �޿��� 9000�� ������ ����ID, FIRST_NAME, �޿� ������ ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
    FROM EMPLOYEES
    WHERE SALARY = 9000;
    
-- ��� ������ < +, -, *, / >
-- ������ �޿������� ����ϴµ� ��������� 4���� �̿��ؼ� ���

-- �񱳿����� [ >(�ʰ�), >=(�̻�), <(�̸�), <=(����) ]

-- �������̺��� �޿��� 5000 ������ ������ FIRST_NAME�� SALARY ������ ���

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY <= 5000;

-- �������̺��� ������ 50000 ������ ������ �̸��� ������ ���

SELECT FIRST_NAME, SALARY*12 AS ����
FROM EMPLOYEES
WHERE SALARY*12 <= 50000;

-- � �� ������
-- = : ����
-- !=, <>, ^= : ���� �ʴ�.
-- NOT A = B : ���� �ʴ�.


-- ���� ���̺��� �������̵� IT_PROG�� �ƴ� ������ �̸��� ���� ���̵� ���
SELECT JOB_ID
FROM EMPLOYEES;


SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID != 'IT_PROG';

SELECT *
FROM EMPLOYEES
WHERE EMAIL='SKING';

SELECT *
FROM EMPLOYEES
WHERE EMAIL != 'SKING';

-- �� ������
-- AND(�׸���) : ������ ��� �����ϴ� ��� TRUE ���� ��ȯ
-- OR(Ȥ��) : �ϳ��� �����̶� �����ϴ� ��� TRUE ���� ��ȯ

-- �������̺��� �μ����̵� 90�̰� �޿��� 5000�̻��� ������ ���̵�� ������ �̸��� �޿��� ���

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12
FROM EMPLOYEES
WHERE DEPARTMENT_ID=90 AND SALARY*12>=5000;

-- �ǽ�) �������̺��� �μ����̵� 100�̰ų� �Ի����� 06��06��02�� ���Ŀ� �Ի���
--       ������ �̸��� �μ����̵�� �Ի���(HIRE_DATE)�� ���

SELECT FIRST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=100 OR HIRE_DATE > '06/06/02';

-- �ǽ�3) �μ�ID�� 100�̰ų� 90�� �����߿���
--        ����ID�� 101�� ������ ����ID, FIRST_NAME, ������ ��� ��) ������ ANNSAL�� ��Ī ����

SELECT DEPARTMENT_ID,EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS ANNSAL
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 100 OR DEPARTMENT_ID =90)
AND EMPLOYEE_ID=101;

-- NULL ���� ������
-- IS NULL : ������ ���� NULL�� ���� ��ȸ
-- IS NOT NULL : ������ ���� NULL�� �ƴ� ���� ��ȸ

-- �������̺��� ������ �̸��� ���ʽ��� ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, COMMISSION_PCT
FROM EMPLOYEES;

-- �������̺��� ���ʽ��� �ִ� ������ ���(FIRST_NAME, COMMISION)
SELECT FIRST_NAME, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL ;

SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- SQL ������
-- > SQL���� ����� �� �ִ� ������
-- > IN, NOT IN, BETWEEN, LIKE

-- IN: Ư�� Į���� ���Ե� �����͸� ������ ��ȸ�� �� Ȱ��
-- =(�񱳿�����) + OR(��������)
-- IN�� NULL���� �����ϴ� Ư¡�� �������ִ�.

-- ���� ���̺��� �μ� ���̵� 30�̰ų� 50�̰ų� 90�� ������ ��� ������ ���

FROM *
SELECT EMPLOYEES
WHERE DEPARTMENT_ID=30
    OR DEPARTMENT_ID=50
    OR DEPARTMENT_ID=90
    OR DEPARTMENT_ID=10;
    
SELECT *
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IN (30,50,90);
    
-- �ǽ�) �������̺��� �Ŵ��� ���̵� 100, 102, 103, NULL�� ������
-- �̸��� �Ŵ��� ���̵� ���(IN�����ڸ� �̿��ؼ�)

SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN (100, 102, 103, NULL);

-- NOT IN
-- IN �ڿ� ���ǿ� �ش����� �ʴ� �����͸� ���
-- (!=) + (AND)

-- �������̺��� �Ŵ������̵� 100, 120, 121�� �ƴ� �������� �̸��� �Ŵ��� ���̵� ���

SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID !=100
 AND MANAGER_ID != 120
 AND MANAGER_ID != 121;

SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID NOT IN (100, 120, 121);

--�ǽ�1) �������̺��� �Ŵ��� ���̵� 145, 147, 148, 149�� �ƴ� ������
-- �̸��� �Ŵ��� ���̵� ���

SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID NOT IN (145, 146, 147, 148, 149);

-- �ǽ�2) �������̺��� �������̵� AD_VP �̰ų� ST_MAN�� ������ �̸��� �������̵� ���

SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN ('AD_VP', 'ST_MAN');

-- BETWEEN A AND B
--> ���� ���� ���� �����͸� ��ȸ�� �� ���

-- BETWEEN �ּڰ� AND �ִ�
--> Ư�� �� ���� �ּ�, �ְ� ������ �����ؼ� �ش� ���� ���� �����͸� ��ȸ�ϴ� ��

-- �������̺��� �޿��� 10000�̻��̰� 20000�̸��� �������� ��� ������ ���

SELECT *
FROM EMPLOYEES
WHERE SALARY >= 10000 AND SALARY <=20000;

SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 20000;

-- �������̺��� 2005�⿡ �Ի��� ������ �̸��� �Ի����� ���
-- 05/01/01 ~ 05/12/31

SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31';

-- LIKE ������
-- �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ�� �� ���
-- ���ϵ� ī�带 �̿��ؼ� ��Ī ������ ����
-- ���ϵ�ī�� ����
-- 1. % : ���̿� ������� ��� ���� �����͸� �ǹ�
-- 2. _ : � ���̵� ��� ���� �Ѱ��� ���� �����͸� �ǹ�

SELECT *
FROM EMPLOYEES;
--����1) �������̺��� 650���� �����ϴ� �ڵ��� ��ȣ ã��
SELECT FIRST_NAME, PHONE_NUMBER
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '650%';

--����2) �������̺��� �̸��� S�� �����ϰ� n���� ������ ã��
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%n';

--����3) �������̺��� �̸��� it���� ������ �� 4������ ����ã��
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__it';

--����4) �������̺��� �̸��� �ι�° ���ڰ� e�� ����ã��
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_e%';

--����5) �������̺��� 01���� �Ի��� ����ã��
SELECT HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '%/01/%';
    