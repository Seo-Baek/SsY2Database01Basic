-- sql developer에서의 주석
-- 오라클에서 DB의 테이블에 들어가는 주요 자료형(data type) - 교재 99p.
-- 1. NUMBER(i,j) : 전체 자리 수는 i, j은 소숫점 자리 수, 
--                  나머지 i - j 자리수는 정수가 저장.
--                  예) number(7,2) : 전체자리수는 7자리 정수는 5자리,소수부는 2자리.
--                  
-- 2. VARCHAR(n)  : 문자열이 저장되는 자료형 - 현재 잘 사용되지 않는 자료형.
-- 3. VARCHAR2(n) : 문자열이 저장되는 자료형
--                  - 자리 수가 n이하인 m만큼이면 뒤의 n - m만큼은 메모리에 상주하지 않고 사라진다.
--                  - 가변자료형
-- 4. CHAR(n)     : 문자열이 저장되는 자료형 - 고정자료형  (문자열 자료형들 괄호 안의 n은 자리수)
-- 
-- 5. DATE        : 날짜가 저장되는 자료형 - 시스템의 현재 날짜 및 시간이 저장.
--
-- 무결성(Integrity) : 데이터베이스에 저장 된 데이터 값과 그것이 표현하는 
--                    현실세계의 실제 값이 일치하는 정확성을 의미.
--
-- 무결성 제약 조건 =>  데이터베이스에 저장된 데이터의 정확성을 보장하기 위해 
--                    정확하지 않은 데이터가 데이터베이스 내에 저장되는 것을 방지하기 위한 조건.
--
-- 제약조건 종류 
--  1. unique 제약조건        : 중복이 되면 안 됨.
--  2. not null 제약조건      : 공백을 허용하지 않음.
--  3. primary key 제약조건   : unique + not null 제약 조건.
--  
--  학생 테이블을 만들어 보자.
--  이름, 학번, 학과, 학년, 나이, 연락처, 주소, 등록일(입학일) 등등 << 속성(Column)
--
-- 형식 ) CREATE TABLE 테이블_이름(
--           컬럼들 작성 (한 줄에 한 컬럼씩, 이름, 학번, 학과 등등등...)
--
--           컬럼_이름 자료형(크기) (제약조건),
--           컬럼_이름 자료형(크기) (제약조건)
--        );

CREATE TABLE student(
 sname VARCHAR2(10) NOT NULL,
 shakbun NUMBER(8) PRIMARY KEY,
 smajor VARCHAR2(20) NOT NULL,
 syear NUMBER(1),
 sage NUMBER(3),
 sphone VARCHAR2(20) NOT NULL,
 saddress VARCHAR2(200),
 sdate DATE
 );
 

-- 테이블에 컬럼 추가
-- 형식) ALTER TABLE 테이블이름 ADD(컬럼명 데이터타입(크기) 제약조건);
ALTER TABLE student ADD(steacher VARCHAR2(10));

-- 테이블에 컬럼 수정(자료형 수정)
-- 형식) ALTER TABLE 테이블이름 MODIFY(컬럼명 데이터타입(크기));
ALTER TABLE student MODIFY(steacher NUMBER(10));

-- 테이블에서 컬럼 삭제
-- 형식) ALTER TABLE 테이블이름 DROP COLUMN 컬럼명
ALTER TABLE student DROP COLUMN steacher;

-- 테이블의 컬럼 이름을 변경하기
-- 형식) ALTER TABLE 테이블이름 RENAME COLUMN 원래컬럼명 TO 교체할컬럼명
ALTER TABLE student RENAME COLUMN sname TO irum;
-- 오라클에서는 name이 키워드로 쓰이는 경우가 많아 명칭으로 부적합

-- 테이블을 삭제하고 싶은 경우
-- 형식) DROP TABLE 테이블이름 PURGE;
-- PURGE : 테이블을 삭제할 때 남는 찌꺼기까지 제거
DROP TABLE student PURGE;

-- 현재 오라클 DB에 있는 모든 테이블을 보여주세요.
SELECT * FROM TAB;

-- student 테이블의 상세 내역을 화면에 보여주세요
DESC student;

-- student 테이블에 데이터를 추가해 보자.
-- 형식1) 
--   INSERT INTO 테이블이름 
--            VALUES('이름데이터'(문자열은 홑따옴표), 학번데이터, ~,sysdate (컬럼 구성대로 추가));
-- 형식2) 
--   INSERT INTO 테이블이름(이름컬럼명, 학번컬럼명, 학과컬럼명) 
--            VALUES('이름데이터'(문자열은 홑따옴표), 학번데이터, ~,'연락처데이터');
--     테이블이름()은 NOT NULL 컬럼들을 넣으면 된다.

INSERT INTO student VALUES('홍길동', '20200001','경제학과', 3, 27, '010-111-1234', '서울시 마포구',sysdate);

INSERT INTO student(sname, shakbun, smajor, sphone) 
             VALUES('이순신', '20200002','해양학과','010-222-1234');
             
INSERT INTO student VALUES('유관순', '20200003', '시각디자인과', 1, 20, '010-333-1234', null, sysdate);
INSERT INTO student VALUES('김연아', '20200004', '체육학과', 1, 20, '010-444-1234', '서울시 은평구', sysdate);
INSERT INTO student VALUES('강감찬', '20200003', '무역학과', null, null, '010-555-1234', '서울시 관악구', sysdate);
-- values에 널값을 넣는 것은 좋지 않다.

-- 데이터를 조회하는 명령문
-- 형식) select 컬럼명1, 컬럼명2,...... from 테이블명

-- student 테이블의 학번, 이름, 연락처를 화면에 보여주세요.
SELECT shakbun, sname, sphone FROM student;

-- student 테이블의 모든 컬럼을 화면에 보여주세요.
SELECT * FROM student;

-- emp 테이블의 모든 컬럼을 화면에 보여주세요.
SELECT * FROM emp;

-- emp 테이블의 empno, ename, job, deptno을 화면에 보여주세요.
SELECT empno, ename, job, deptno FROM emp;

-- emp 테이블의 이름, 입사일, 급여를 화면에 보여주세요.
SELECT ename, hiredate, sal FROM emp;

-- emp 테이블의 사번, 이름, 보너스를 화면에 보여주세요.
SELECT empno, ename, comm FROM emp;

SELECT ename from emp;