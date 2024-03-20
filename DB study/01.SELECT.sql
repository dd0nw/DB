--CHAPTER 01. SELECT --

-- 주석 기호

-- 글자 크기 키우기 : 도구 > 환경설정 > 코드편집기 > 글꼴
-- 주석 색깔 바꾸기 : 도구 > 환경설정 > 코드편집기 > PL/SQL 주석

-- 주석 형태(2) : /**/ --> 여러줄을 한번에 주석처리할 때 사용함
/*
1. SQL 문장은 대소문자를 구분하지 않는다!
2. 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3. SQL 문장 끝에는 반드시 세미콜론( ; )을 찍어줘야한다 !!! ;
4. SQL 실행 단축키 : CTRL + ENTER, F9
*/

DESC EMPLOYEES;
-- DESC(DECRIBE) : SQL에서 사용되는 테이블의 구조를 확인할때 사용하는 명령어


SELECT FIRST_NAME, LAST_NAME
    FROM EMPLOYEES;
    
    
-- [ SELECT 절 기본 사용방법 ]
--2. SELECT     조회할 컬러명 1, ....
--1. FROM       조회할 테이블 명 

-- 전체 데이터를 조회하는 방법
-- * ( 아스타리스크) -> 전체를 의미

-- 직원 테이블의 전체 정보를 출력
SELECT *
    FROM EMPLOYEES;
    
-- 실습 1) 부서테이블의 전체 정보를 출력

DESC DEPARTMENTS;

SELECT *
    FROM DEPARTMENTS;

-- 실습 2) 직원테이블에서 직원ID, FIRST_NAME, EMAIL 정보를 출력
SELECT MANAGER_ID, FIRST_NAME, EMAIL
    FROM EMPLOYEES;
    
    
-- 실습 3) 부서테이블에서 부서ID, 부서명, LOCATION_ID를 출력
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
    FROM DEPARTMENTS;
    
-- 실습 4) 직원테이블에서 EMAIL, 직원ID, JOB_ID, LAST_NAME을 순서대로 출력
SELECT EMAIL, MANAGER_ID, JOB_ID, LAST_NAME
    FROM EMPLOYEES;
    
-- 실습 5) 직원테이블에서 직원들의 부서 ID를 출력
SELECT DEPARTMENT_ID
    FROM EMPLOYEES;
    
-- DISTINCT : 데이터 중복을 제거


-- 중복 제거 사용방법
-- SELECT DISTINCT 조회하고 싶은 컬럼명 1, .......
-- FROM     테이블;

-- 직원들의 부서ID를 중복 제거하여 출력
SELECT DISTINCT DEPARTMENT_ID
    FROM EMPLOYEES;
    
-- 실습) 직원테이블에서 JOB_ID와 부서ID를 중복을 제거하여 출력
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
    FROM EMPLOYEES;
    
-- DISTINCT 중복제거는 뒤에 2개 이상이 있으면
-- 한쪽 컬럼에 중복이 있어도 다른 쪽 컬럼 값이 다르면 '다르게' 취급한다.

-- 실습 1) 직원테이블에서 입사일을 출력 후 행의 개수를 확인 *주석으로 행의 갯수를 입력

-- 실습 2) 직원테이블에서 입사일을 출력 단 중복을 제거해서 출력 * 주석으로 행의 갯수를 입력

SELECT HIRE_DATE
    FROM EMPLOYEES; -- 107개

SELECT DISTINCT HIRE_DATE
    FROM EMPLOYEES; -- 98개
    
-- TIP!!!
--> 컬럼에 숫자연산이 가능하다(+, -, *, /) !!

SELECT FIRST_NAME, SALARY
    FROM EMPLOYEES;
    
-- 문제)직원테이블에서 직원의 이름과 급여, 연봉을 출력해보자

SELECT FIRST_NAME, 
       SALARY,
       SALARY*12 AS "연봉"
    FROM EMPLOYEES;

-- 별칭 사용하기
-- Alias라고 하며 한눈에 보기 좋게 설정하는 것을 말함
-- AS 키워드를 사용해서 별칭을 지정합니다.

-- 별칭 사용 방법
-- 1. SELECT 컬럼명 별칭
-- 2. SELECT 컬럼명 "별칭"
-- 3. SELECT 컬럼명 AS 별칭
-- 4. SELECT 컬럼명 AS "별칭"

-- 실습) 연산을 이용해서 직원테이블에서 입사일, 입사일 다음날을 출력
-- 단, 입사일은 별칭을 입사일로, 입사일 다음날은 "입사일다음날" 별칭을 사용해서 출력

SELECT HIRE_DATE 입사일, HIRE_DATE+1 입사일다음날
    FROM EMPLOYEES;
    
SELECT HIRE_DATE "입사일", HIRE_DATE+1 "입사일다음날"
    FROM EMPLOYEES;
    
SELECT HIRE_DATE AS 입사일, HIRE_DATE+1 AS 입사일다음날
    FROM EMPLOYEES;
    
SELECT HIRE_DATE AS"입사일", HIRE_DATE+1 AS "입사일다음날"
    FROM EMPLOYEES;
    
-- ORDER BY 절이란?
-- 특정컬럼을 기준으로 정렬된 상태로 출력하고자 할때 사용한다.
-- SQL 실행 순서에서 가장 마지막에 실행된다.
-- 별도로 정렬 방식을 지정하지 않으면 기본적으로 오름차순이 적용된다.

--ASC(ASCENDING) : 오름차순 정렬(1, 2, 3, 4, 5 ...)
--DESC(DESCENDING) : 내림차순 정렬(10, 9, 8, 7 ...)

-- 직원테이블에서 모든 직원의 정보를 출력
-- 급여를 오름차순 정렬

SELECT *
    FROM EMPLOYEES
ORDER BY SALARY;

-- 실습) 최근에 입사한 날짜를 기준으로 직원의 이름과 입사날짜를 출력
SELECT FIRST_NAME, HIRE_DATE
    FROM EMPLOYEES
    ORDER BY HIRE_DATE DESC;
    
-- 직원테이블에서 직원ID, 부서ID, 이름, 급여 순으로 출력
-- 단, 부서ID는 오름차순으로, 급여는 내림차순으로 정렬해서 출력

SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
    FROM EMPLOYEES
    ORDER BY DEPARTMENT_ID ASC, SALARY DESC;
-- 같은 부서에서 근무하고 있는 직원들끼리 급여가 높은 직원과 낮은 직원 순서대로 출력
-- 먼저 부서ID를 오름차순으로 정렬한 후에 급여를 내림차순으로 정렬한 것

-- NULL 값이란?
-- NULL 값이란 데이터의 값이 완전히 비어 있는 상태를 의미
-- 값이 존재하지 않거나 정해지지 않은 것을 의미합니다.
-- 숫자 0과 문자열 ' '은 NULL 값이 아닙니다.
-- *** NULL과 연산을 하면 결과 값은 무조건 NULL 값이 나온다 !!

-- 실습) 직원테이블에서 직원ID, 보너스, 보너스두배의 정보를 출력
-- 단, 보너스 두배의 정보는 UP_BONUS로 별칭을 사용해서 출력

SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT*2 AS "UP_BONUS"
    FROM EMPLOYEES;
    
-- 문제1에서 UP_BONUS의 결과 값이 왜 이렇게 나왔는지 설명할 수 있으면 !!
