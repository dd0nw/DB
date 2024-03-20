-- CHAPTER 02. WHERE --

-- [ WHERE 절 기본 사용 방법 ]

-- 3. SELECT   조회할 컬럼명 1.....
-- 1. FROM     테이블 명
-- 2. WHERE    조회할 행을 선별하기 위한 조건식

-- 실습1) 직원테이블에서 직원ID가 105인 직원의 FIRST_NAME과 LAST_NAME을 출력
SELECT FIRST_NAME, LAST_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 105;
    
-- 실습2) 부서테이블에서 매니저아이디가 100인 부서이름과 부서아이디를 출력
SELECT MANAGER_ID, DEPARTMENT_NAME, DEPARTMENT_ID
    FROM DEPARTMENTS
    WHERE MANAGER_ID=100;
    
-- 실습3) 직원테이블에서 급여가 9000인 직원의 직원ID, FIRST_NAME, 급여 정보를 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
    FROM EMPLOYEES
    WHERE SALARY = 9000;
    
-- 산술 연산자 < +, -, *, / >
-- 직원의 급여정보를 출력하는데 산술연산자 4개를 이용해서 출력

-- 비교연산자 [ >(초과), >=(이상), <(미만), <=(이하) ]

-- 직원테이블에서 급여가 5000 이하인 직원의 FIRST_NAME과 SALARY 정보를 출력

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY <= 5000;

-- 직원테이블에서 연봉이 50000 이하인 직원의 이름과 연봉을 출력

SELECT FIRST_NAME, SALARY*12 AS 연봉
FROM EMPLOYEES
WHERE SALARY*12 <= 50000;

-- 등가 비교 연산자
-- = : 같다
-- !=, <>, ^= : 같지 않다.
-- NOT A = B : 같지 않다.


-- 직원 테이블에서 직업아이디가 IT_PROG가 아닌 직원의 이름과 직업 아이디를 출력
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

-- 논리 연산자
-- AND(그리고) : 조건을 모두 만족하는 경우 TRUE 값이 반환
-- OR(혹은) : 하나의 조건이라도 만족하는 경우 TRUE 값이 반환

-- 직원테이블에서 부서아이디가 90이고 급여가 5000이상인 직원의 아이디와 직원의 이름과 급여를 출력

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12
FROM EMPLOYEES
WHERE DEPARTMENT_ID=90 AND SALARY*12>=5000;

-- 실습) 직원테이블에서 부서아이디가 100이거나 입사일이 06년06월02일 이후에 입사한
--       직원의 이름과 부서아이디와 입사일(HIRE_DATE)을 출력

SELECT FIRST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID=100 OR HIRE_DATE > '06/06/02';

-- 실습3) 부서ID가 100이거나 90인 직원중에서
--        직원ID가 101인 직원의 직원ID, FIRST_NAME, 연봉을 출력 단) 연봉은 ANNSAL로 별칭 지정

SELECT DEPARTMENT_ID,EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS ANNSAL
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 100 OR DEPARTMENT_ID =90)
AND EMPLOYEE_ID=101;

-- NULL 관련 연산자
-- IS NULL : 데이터 값이 NULL인 값을 조회
-- IS NOT NULL : 데이터 값이 NULL이 아닌 값을 조회

-- 직원테이블에서 직원의 이름과 보너스를 출력
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, COMMISSION_PCT
FROM EMPLOYEES;

-- 직원테이블에서 보너스가 있는 직원만 출력(FIRST_NAME, COMMISION)
SELECT FIRST_NAME, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL ;

SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- SQL 연산자
-- > SQL에서 사용할 수 있는 연산자
-- > IN, NOT IN, BETWEEN, LIKE

-- IN: 특정 칼럼에 포함된 데이터를 여러개 조회할 때 활용
-- =(비교연산자) + OR(논리연산자)
-- IN은 NULL값을 생략하는 특징을 가지고있다.

-- 직원 테이블에서 부서 아이디가 30이거나 50이거나 90인 직원의 모든 정보를 출력

FROM *
SELECT EMPLOYEES
WHERE DEPARTMENT_ID=30
    OR DEPARTMENT_ID=50
    OR DEPARTMENT_ID=90
    OR DEPARTMENT_ID=10;
    
SELECT *
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IN (30,50,90);
    
-- 실습) 직원테이블에서 매니저 아이디가 100, 102, 103, NULL인 직원의
-- 이름과 매니저 아이디를 출력(IN연산자를 이용해서)

SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN (100, 102, 103, NULL);

-- NOT IN
-- IN 뒤에 조건에 해당하지 않는 데이터를 출력
-- (!=) + (AND)

-- 직원테이블에서 매니저아이디가 100, 120, 121이 아닌 직원들의 이름과 매니저 아이디를 출력

SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID !=100
 AND MANAGER_ID != 120
 AND MANAGER_ID != 121;

SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID NOT IN (100, 120, 121);

--실습1) 직원테이블에서 매니저 아이디가 145, 147, 148, 149가 아닌 직원의
-- 이름과 매니저 아이디를 출력

SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID NOT IN (145, 146, 147, 148, 149);

-- 실습2) 직원테이블에서 직업아이디가 AD_VP 이거나 ST_MAN인 직원의 이름과 직업아이디를 출력

SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN ('AD_VP', 'ST_MAN');

-- BETWEEN A AND B
--> 일정 범위 내의 데이터를 조회할 때 사용

-- BETWEEN 최솟값 AND 최댓값
--> 특정 열 값의 최소, 최고 범위를 지정해서 해당 범위 내의 데이터만 조회하는 것

-- 직원테이블에서 급여가 10000이상이고 20000미만인 직원들의 모든 정보를 출력

SELECT *
FROM EMPLOYEES
WHERE SALARY >= 10000 AND SALARY <=20000;

SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 20000;

-- 직원테이블에서 2005년에 입사한 직원의 이름과 입사일을 출력
-- 05/01/01 ~ 05/12/31

SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31';

-- LIKE 연산자
-- 일부 문자열이 포함된 데이터를 조회할 때 사용
-- 와일드 카드를 이용해서 매칭 연산을 진행
-- 와일드카드 종류
-- 1. % : 길이와 상관없이 모든 문자 데이터를 의미
-- 2. _ : 어떤 값이든 상관 없이 한개의 문자 데이터를 의미

SELECT *
FROM EMPLOYEES;
--문제1) 직원테이블에서 650으로 시작하는 핸드폰 번호 찾기
SELECT FIRST_NAME, PHONE_NUMBER
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '650%';

--문제2) 직원테이블에서 이름이 S로 시작하고 n으로 끝나는 찾기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%n';

--문제3) 직원테이블에서 이름이 it으로 끝나고 총 4글자인 직원찾기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__it';

--문제4) 직원테이블에서 이름이 두번째 글자가 e인 직원찾기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_e%';

--문제5) 직원테이블에서 01월에 입사한 직원찾기
SELECT HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '%/01/%';
    