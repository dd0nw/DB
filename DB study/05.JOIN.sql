-- CHAPTER 05. JOIN --

-- JOIN : 여러 테이블에서 필요한 데이터를 한번에 가져오는 기술

-- 비등가 조인 (Non EQUI JOIN)
--> 두 개의 테이블 간에 서로 정확하게 일치하지 않는 경우 활용하는 조인
--> 등가연산자(=)가 아닌 연산자들을 사용한 조인을 의미( >, >=, <, <=, BETWEEN)

-- 등가 조인( EQUI JOIN )
--> 두 개의 테이블 간에 서로 정확하게 일치하는 경우 활용하는 조인
--> 등가 연산자를 사용해서 조인을 의미( = )
--> 가장 많이 사용되는 조인의 형태

-- 등가조인의 사용방법

-- SELECT 테이블1.컬럼명, 테이블2.컬럼명 -> 어느테이블에 있는 컬럼명을 명시해서 출력해주겠다.(경로설정)
-- FROM 테이블1, 테이블2 -> 테이블1과 테이블2를 조인하겠다 !!
-- WHERE 테이블1.컬럼명 = 테이블2.컬럼명 -> JOIN 조건을 적어주는 것

-- 수강생정보 테이블과 성적표테이블에서 학생ID, 이름, 과목, 성적 순으로 출력
SELECT * FROM 수강생정보;
SELECT * FROM 성적표;
-- 1.조인할 대상 테이블의 정보를 확인
-- 2.FROM절에 조인할 테이블을 ,(컴마) 기준으로 작성(FROM)
-- 3.조인 조건이 되는 특정 컬럼을 확인, WHERE 조건절에 조인 조건을 작성(WHERE)
--> 조인 조건이 되는 특정 컬럼 : 조인할 테이블 간의 같은 결과값을 가지는 컬럼!!
-- 4.SELECT 절에 해당되는 컬럼을 .(경로) 를 설정하여 작성 (SELECT)

SELECT 수강생정보.학생ID, 수강생정보.학생이름, 성적표.과목, 성적표.성적
FROM 수강생정보, 성적표
WHERE 수강생정보.학생ID = 성적표.학생ID;

-- 직원ID와 FIRST_NAME,  DEPARTMENT_NAME(부서이름) 순으로 출력

-- 1. 조인할 대상 테이블의 정보를 확인
-- 2. FROM절에 조인할 테이블을 ,(컴마)를 기준으로 작성
-- 3. WHERE절에 조인 조건이 되는 특정 컬럼을 확인하여, 조인 조건을 작성
--> 조인 조건이 되는 특정 컬럼 : 조인할 테이블 간의 결과값(의미)을 가지는 컬럼
-- 4. SELECT절에 출력하고자 하는 컬럼을 작성

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

-- 별칭을 사용
-- 직원 테이블의 별칭을 E, 부서테이블의 별칭을 D

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 단독적으로 존재하는 컬럼.(경로)를 안적어 줘도 DB는 경로를 찾아 출력해준다.
-- 조인 조건 컬럼은 대부분 PK와 FK 관계로 이루어 진다. 하지만!! 다 그런것은 아니다 !!

-- 실습) 직원ID가 100인 직원의 FIRST_NAME과 부서이름을 출력
-- 직원테이블을 별칭을 E로 부서테이블의 별칭을 D로 작성

SELECT E.FIRST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
    AND E.EMPLOYEE_ID=100;
    

-- ANSI 조인 문법 : 미국표준협회에서 만든 모든 DBMS에서 사용가능한 문법이다.

-- INNER JOIN : 내부조인이라고 하며 조인 조건에서 동일한 값이 있는 행만 반환
--> INNER 는 생략이 가능하다.

-- INNER JOIN의 사용방법
-- 3. SELECT   조회할 컬럼명...
-- 1. FROM     테이블1 INNER JOIN 테이블2
--    ON(테이블1.컬럼명 = 테이블2.컬럼명) --> 조인조건 !!
-- 2. WHERE 일반 조건절 -> 그외 다른 일반 조건

-- 문제) 직원테이블의 직원ID와 부서ID
--      부서테이블에 있는 부서 이름을 출력(INNER JOIN)

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- CROSS JOIN : 조인 조건절을 적지 않고 테이블의 모든 데이터를 가지고 오는 방법
--> 조인 조건이 없는 경우 생길 수 있는 "모든 데이터의 조합"을 조회
--> 카티션 곱이라고 부른다.

-- [ CROSS JOIN 사용방법 ]
-- SELECT 조회할 컬럼명
-- FROM 테이블1 CROSS JOIN 테이블2;

--> ON 조인 조건절이 없으면 CROSS JOIN이다 !!

-- 문제) 직원테이블의 직원ID와 부서ID
--   부서테이블에 있는 부서 이름을 출력 (CROSS JOIN)

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D;

-- OUTER JOIN : 외부조인이라고 하며, 두개의 테이블 간의 교집합을 조회하고,
-- 한쪽 테이블에만 있는 데이터도 포함시켜서 조회하고 싶을때 사용하는 조인 문법
--> 한쪽 데이터의 NULL값도 출력하고 싶을때 사용한다 !!

-- LEFT OUTER JOIN : 왼쪽 테이블을 기준으로 NULL값도 포함하고 싶을때 사용
--> 오라클 문법 조인시 : 조인 조건절에 반대인 오른쪽 컬럼에 (+) 기호를 작성

-- RIGHT OUTER JOIN : 오른쪽 테이블을 기준으로 NULL값도 포함하여 출력
--> 오라클 문법 조인시 : 조인 조건절에 반대인 왼쪽 컬럼에 (+) 기호를 작성

-- FULL OUTER JOIN : 양쪽에 NULL값도 포함하여 출력
--> 오라클 문법에서는 지원을 하지 않음, UNION 연산자 출력하는 방법이 있다.

-- 문제) 각 부서의 매니저 직원들의 부서이름, 매니저 아이디, FIRST_NAME을 출력(INNER JOIN)

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);

 -- LEFT OUTER JOIN
 
 SELECT D.DEPARTMENT_NAME, D.DEPARTMENT_ID, E.FIRST_NAME
 FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
    
    
-- 오라클 문법
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+);

-- RIGHT JOIN
 SELECT D.DEPARTMENT_NAME, D.DEPARTMENT_ID, E.FIRST_NAME
 FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
    
-- 오라클 문법
SELECT D.DEPARTMENT_NAME, D.DEPARTMENT_ID, E.FIRST_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID(+) = E.EMPLOYEE_ID;

-- FULL OUTER JOIN (=FULL JOIN)
 SELECT D.DEPARTMENT_NAME, D.DEPARTMENT_ID, E.FIRST_NAME
 FROM DEPARTMENTS D FULL JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID);
 
 -- 문제 ) 부서테이블, 위치테이블 ,나라테이블을 조인하여(3개 테이블 조인)
 -- 부서의 이름과 도시와 나라 이름을 출력
 
 SELECT * FROM COUNTRIES;
 SELECT * FROM LOCATIONS;
 
 
 SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
 FROM DEPARTMENTS D JOIN LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID)
     JOIN COUNTRIES C ON (L.COUNTRY_ID = C.COUNTRY_ID);
     
-- 오라클 문법
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C
WHERE D.LOCATION_ID = L.LOCATION_ID
AND L.COUNTRY_ID = C.COUNTRY_ID;