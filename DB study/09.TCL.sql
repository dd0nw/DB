-- CHAPTER 09. TCL : 트랜잭션 제어어 --

-- 트랜잭션이란 ?
-- 데이터베이스의 상태를 변화시키기 위해서 수행하는 최소 수행 단위
-- 즉, 업무를 처리하기 위한 최소 수행단위.

-- 트랜잭션의 4가지 특성 - ACID
-- 원자성(Atomicity) : ALL or Nothing, 모두 실행되거나 전혀 실행이 되지 않거나
-- 일관성(Consistency) : 언제나 일관성 있는 상태를 유지 하는것
-- 고립성(Isolation) : 트랜잭션 실행시 다른 트랜잭션이 영향을 받지 않는 것
-- 지속성(Durability) : 성공적으로 수행된 트랜잭션은 영원히 반영 되는 것

-- TCL의 명령어
-- COMMIT : DB에 영구적으로 저장, 마지막 COMMIT 시점 이후의 트랜잭션 결과를 저장
-- ROLLBACK : 트랜잭션을 취소, 되돌리는 명령어, 마지막 COMMIT 시점까지만 복구가 가능
-- SAVEPOINT : 하나의 트랜잭션을 작게 분할하여 저장하는 기능을 수행하는 명령어

-- 테이블 복사
CREATE TABLE TCL_수강생정보 AS SELECT * FROM 수강생정보;

SELECT * FROM TCL_수강생정보;

-- TCL_수강생정보 테이블에 나의 정보를 넣기('SMHRD10', '이름', 'D')
INSERT INTO TCL_수강생정보 (학생ID, 학생이름, 소속반)
VALUES ('SMHRD10', '임동원', 'D');

ROLLBACK;

COMMIT; -- 영구 저장이 되서 ROLLBACK을 해도 되돌려지지 않는다 !!

-- 세션이란?
-- 데이터 베이스 접속을 시작으로 여러 데이터베이스에서 관련된 작업을 수행한 후
-- 접속을 종료하기까지의 전체기간을 의미
--> 즉, 세션이 여러개라는 말은 오라클 데이터베이스에 접속하여 사용중인 연결이 여러개 있다 라는 뜻

-- 세션 A : sql developer
-- 세션 B : run sql command Line

SELECT * FROM TCL_수강생정보;

DELETE FROM TCL_수강생정보
WHERE 학생이름='조준용';

COMMIT;

-- A세션에서 DELETE를 하고 COMMIT을 하지 않은 상태로
-- B세션에서 조회를 하게 되면 변환 값이 적용이 안된다
-- 왜냐면 A세션에서는 COMMIT(영구저장)을 안했기 때문이다
-- 그래서 다른 세션에서는 보이지 않는다 --> 읽기 일관성을 보장한다 라고 한다

-- LOCK
UPDATE TCL_수강생정보
  SET 학생이름 = 'NAME_CJH'
  WHERE 학생ID = 'SMHRD10';

















