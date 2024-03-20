-- CHAPTER 06. DDL --

-- DDL 이란 ?
--> 데이터 정의어로 테이블 같은 저장소 객체를 만들거나 수정합니다.

--[DDL 명령어 종류]
-- CREATE   : 테이블 같은 객체를 생성하는 명령어
-- ALTER    : 테이블 같은 객체를 변경하는 명령어
-- RENAME   : 테이블의 이름을 변경하는 명령어
-- TRUNCATE : 테이블의 데이터를 삭제하는 명령어
-- DROP     : 테이블 같은 객체를 삭제하는 명령어

-- [ 테이블 생성시 자주 사용하는 자료형 ]
-- VARCHAR2(N) : 가변형 문자형, N 크기만큼 입력 받음
-- NUMBER(P,S) : 숫자형 자료형, 숫자형 값을 P자리 만큼 입력받고, S자리 만큼 소수를 입력받음
--> SQL에서는 실수와 정수 모두 표현이 가능.
--> ()를 생략하게 되면 최대값인 38크기가 들어간다.
-- DATE : 현재 날짜 값을 입력 받음

-- 수강생정보 테이블을 확인해서 TEST_수강생정보 테이블을 만들어보자
-- 테이블명 선택 후 SHIFT + F4 테이블에 대한 정보를 확인 가능

CREATE TABLE TEST_수강생정보(
    학생ID VARCHAR2(9) PRIMARY KEY,
    학생이름 VARCHAR2(50) NOT NULL,
    소속반 VARCHAR2(5)
);

SELECT * FROM TEST_수강생정보;

-- 성적표테이블을 확인해서 TEST_성적표 테이블을 생성해보자
-- 제약조건은 쓰지마세요 ! 컬럼명 + 자료형 입력을 해주세요 !

CREATE TABLE TEST_성적표(
    학생ID VARCHAR2(9),
    과목 VARCHAR2(30),
    성적 NUMBER
);

SELECT * FROM TEST_성적표;

CREATE TABLE SMHRD_LOGIN(
    ID VARCHAR2(20),
    PW VARCHAR2(20),
    EMAIL VARCHAR2(20),
    NAME VARCHAR2(20)
);

SELECT * FROM SMHRD_LOGIN;

-- 제약 조건이란 ?
--> 테이블에 입력 가능한 데이터를 조건으로 제약하는 것
--> 테이블에 정확성을 유지하기 위한 목적으로 사용됨
--> 제약 조건 지정 방식에 따라서 데이터의 수정이나 삭제 여부에 영향을 받음

-- [ 제약조건의 종류 ]
-- PRIMARY KEY (PK) : 기본키, NOT NULL + UNIQUE = NULL불가 + 중복불가
-- UNIQUE KEY (UK) : 고유키, NULL값 입력 가능하지만 중복은 불가능하다.
-- NOT NULL : NULL값이 불가능, 꼭 입력되어야 하는 데이터이다 할때 설정함
-- CHECK : T OR F로 평가할 수 있는 논리식을 지정, 지정한 데이터만 입력 가능
-- FOREIGN KEY (FK) : 외래키, 테이블을 연결하는 키

-- 무결성 제약조건 종류
-- 개체 무결성 : 기본 키 제약이라고 하며, 하나의 테이블에 중복된 행이 존재하지 않도록 규정
-- 참조 무결성 : 행을 입력, 수정, 삭제할 때 연관되는 다른 테이블과의 데이터가 정확하게 유지 되도록 규정
--             참조 관계에 있는 두 테이블의 데이터가 항상 일관된 값을 가져야 하는 것


-- [ 이미 생성된 테이블에 제약 조건을 지정하기 ]
-- 사용방법
-- ALTER TABLE 테이블 명 ADD CONSTRAINT 제약조건명 제약조건(컬럼);

SELECT * FROM SMHRD_LOGIN;

-- 테이블에 PK 제약조건 지정
ALTER TABLE SMHRD_LOGIN ADD CONSTRAINT ID_PK PRIMARY KEY(ID);

-- 테이블에 UK 제약조건 지정
ALTER TABLE SMHRD_LOGIN ADD CONSTRAINT EMAIL_UK UNIQUE(EMAIL);

-- 테이블에 CHECK 제약 조건 지정하기
-- 비밀번호를 3자리 이상만 출력이 될 수 있도록 조건을 지정
ALTER TABLE SMHRD_LOGIN ADD CONSTRAINT PW_CHECK CHECK(LENGTH(PW) > 3 );

-- [ 이미 생성된 테이블에 FK 제약조건을 지정하기 ]
-- 사용방법
-- ALTER TABLE 테이블 명 ADD CONSTRAINT 제약조건 및 제약조건(컬럼)
-- REFERENCES 참조테이블(참조컬럼명) ;

-- 테이블에 FK 제약조건 지정
ALTER TABLE TEST_성적표 ADD CONSTRAINT 학생ID_FK FOREIGN KEY(학생ID)
REFERENCES TEST_수강생정보(학생ID);

-- 제약조건 변경하기
-- 사용방법
-- ALTER TABLE 테이블 명 MODIFY 컬럼명 바꿀 제약조건;

ALTER TABLE SMHRD_LOGIN MODIFY NAME NOT NULL;

-- 제약조건 삭제하기
-- 사용방법
-- ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건 이름;
ALTER TABLE SMHRD_LOGIN DROP CONSTRAINT PW_CHECK;

CREATE TABLE TB_TEST1(
    PK테스트 NUMBER PRIMARY KEY,
    UK테스트 NUMBER UNIQUE,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER CHECK(LENGTH(CK테스트) > 5)
);

CREATE TABLE TB_TEST2(
    PK테스트 NUMBER,
    UK테스트 NUMBER,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER,
    FK테스트 NUMBER,
    -- 제약조건을 추가
    -- CONSTRAINT 제약조건명 제약조건(컬럼)
    CONSTRAINT PK테스트_PK PRIMARY KEY(PK테스트),
    CONSTRAINT UK테스트_UK UNIQUE(UK테스트),
    CONSTRAINT CK테스트_CK CHECK(CK테스트 > 0),
    CONSTRAINT FK테스트_FK FOREIGN KEY(FK테스트) REFERENCES TB_TSET1(PK테스트)
);

-- 테이블의 컬럼 추가하기 -- ADD
-- 사용방법
-- ALTER TABLE 테이블명 ADD 컬럼명 자료형(크기);
ALTER TABLE SMHRD_LOGIN ADD ADDRESS VARCHAR(10);

SELECT * FROM SMHRD_LOGIN;

-- 컬럼 이름 변경하기 - RENAME
-- 사용방법
-- ALTER TABLE 테이블 명 RENAME COLUMN 기존컬럼 명 TO 바꿀 컬럼 명;
ALTER TABLE SMHRD_LOGIN RENAME COLUMN ADDRESS TO ADDR;

-- 컬럼의 자료형을 변경하기 - MODIFY
-- 사용방법
-- ALTER TABLE 테이블 명 MODIFY 컬럼명 바꿀 제약조건(길이);
ALTER TABLE SMHRD_LOGIN MODIFY ADDR VARCHAR2(30);

-- 특정 컬럼 삭제 -- DROP
-- 사용방법
-- ALTER TABLE 테이블 명 DROP COLUMN 컬럼명;
ALTER TABLE SMHRD_LOGIN DROP COLUMN ADDR;

-- 테이블 삭제
-- 사용방법
-- DROP TABLE 테이블 명;

-- TEST_수강생정보 테이블을 삭제를 해보겠습니다.
DROP TABLE TEST_수강생정보;
-- ORA-02449: unique/primary keys in table referenced by foreign keys
--> 성적표 테이블의 학생ID가 참조되고 있어서 삭제가 불가능

-- 테이블의 제약조건도 같이 삭제하는 방법
-- DROP TABLE 테이블 명 CASCADE CONSTRAINT;

DROP TABLE TEST_수강생정보 CASCADE CONSTRAINT;
--> 제약 조건 지정 방식에 따라 기존 데이터의 수정이나 삭제 여부에 영향을 받는다 !!

SELECT * FROM TEST_수강생정보;

-- TRUNCATE : 테이블의 데이터를 영구 삭제
-- 사용방법
-- TRUNCATE TABLE 테이블 명;

-- 테이블 복사 하기
CREATE TABLE DROP_성적표 AS SELECT * FROM 성적표;
--> 성적표 테이블과 동일한 데이터를 가지는 테이블을 복사하는 쿼리문
--> 제약조건은 복사 되지 않는다 !!

SELECT * FROM DROP_성적표;

-- DELETE
DELETE FROM DROP_성적표;

ROLLBACK; -- 이전 상태로 되돌리는 명령어
--> 복구가 가능하다 !!

--TRUNCATE 로 삭제를 하면 영구 삭제가 되버린다, 복구가 안된다 !!
TRUNCATE TABLE DROP_성적표;

ROLLBACK;

-- 테이블을 영구 삭제
DROP TABLE DROP_성적표;

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