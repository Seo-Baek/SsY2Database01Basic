-- sql developer������ �ּ�
-- ����Ŭ���� DB�� ���̺� ���� �ֿ� �ڷ���(data type) - ���� 99p.
-- 1. NUMBER(i,j) : ��ü �ڸ� ���� i, j�� �Ҽ��� �ڸ� ��, 
--                  ������ i - j �ڸ����� ������ ����.
--                  ��) number(7,2) : ��ü�ڸ����� 7�ڸ� ������ 5�ڸ�,�Ҽ��δ� 2�ڸ�.
--                  
-- 2. VARCHAR(n)  : ���ڿ��� ����Ǵ� �ڷ��� - ���� �� ������ �ʴ� �ڷ���.
-- 3. VARCHAR2(n) : ���ڿ��� ����Ǵ� �ڷ���
--                  - �ڸ� ���� n������ m��ŭ�̸� ���� n - m��ŭ�� �޸𸮿� �������� �ʰ� �������.
--                  - �����ڷ���
-- 4. CHAR(n)     : ���ڿ��� ����Ǵ� �ڷ��� - �����ڷ���  (���ڿ� �ڷ����� ��ȣ ���� n�� �ڸ���)
-- 
-- 5. DATE        : ��¥�� ����Ǵ� �ڷ��� - �ý����� ���� ��¥ �� �ð��� ����.
--
-- ���Ἲ(Integrity) : �����ͺ��̽��� ���� �� ������ ���� �װ��� ǥ���ϴ� 
--                    ���Ǽ����� ���� ���� ��ġ�ϴ� ��Ȯ���� �ǹ�.
--
-- ���Ἲ ���� ���� =>  �����ͺ��̽��� ����� �������� ��Ȯ���� �����ϱ� ���� 
--                    ��Ȯ���� ���� �����Ͱ� �����ͺ��̽� ���� ����Ǵ� ���� �����ϱ� ���� ����.
--
-- �������� ���� 
--  1. unique ��������        : �ߺ��� �Ǹ� �� ��.
--  2. not null ��������      : ������ ������� ����.
--  3. primary key ��������   : unique + not null ���� ����.
--  
--  �л� ���̺��� ����� ����.
--  �̸�, �й�, �а�, �г�, ����, ����ó, �ּ�, �����(������) ��� << �Ӽ�(Column)
--
-- ���� ) CREATE TABLE ���̺�_�̸�(
--           �÷��� �ۼ� (�� �ٿ� �� �÷���, �̸�, �й�, �а� ����...)
--
--           �÷�_�̸� �ڷ���(ũ��) (��������),
--           �÷�_�̸� �ڷ���(ũ��) (��������)
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
 

-- ���̺� �÷� �߰�
-- ����) ALTER TABLE ���̺��̸� ADD(�÷��� ������Ÿ��(ũ��) ��������);
ALTER TABLE student ADD(steacher VARCHAR2(10));

-- ���̺� �÷� ����(�ڷ��� ����)
-- ����) ALTER TABLE ���̺��̸� MODIFY(�÷��� ������Ÿ��(ũ��));
ALTER TABLE student MODIFY(steacher NUMBER(10));

-- ���̺��� �÷� ����
-- ����) ALTER TABLE ���̺��̸� DROP COLUMN �÷���
ALTER TABLE student DROP COLUMN steacher;

-- ���̺��� �÷� �̸��� �����ϱ�
-- ����) ALTER TABLE ���̺��̸� RENAME COLUMN �����÷��� TO ��ü���÷���
ALTER TABLE student RENAME COLUMN sname TO irum;
-- ����Ŭ������ name�� Ű����� ���̴� ��찡 ���� ��Ī���� ������

-- ���̺��� �����ϰ� ���� ���
-- ����) DROP TABLE ���̺��̸� PURGE;
-- PURGE : ���̺��� ������ �� ���� ������ ����
DROP TABLE student PURGE;

-- ���� ����Ŭ DB�� �ִ� ��� ���̺��� �����ּ���.
SELECT * FROM TAB;

-- student ���̺��� �� ������ ȭ�鿡 �����ּ���
DESC student;

-- student ���̺� �����͸� �߰��� ����.
-- ����1) 
--   INSERT INTO ���̺��̸� 
--            VALUES('�̸�������'(���ڿ��� Ȭ����ǥ), �й�������, ~,sysdate (�÷� ������� �߰�));
-- ����2) 
--   INSERT INTO ���̺��̸�(�̸��÷���, �й��÷���, �а��÷���) 
--            VALUES('�̸�������'(���ڿ��� Ȭ����ǥ), �й�������, ~,'����ó������');
--     ���̺��̸�()�� NOT NULL �÷����� ������ �ȴ�.

INSERT INTO student VALUES('ȫ�浿', '20200001','�����а�', 3, 27, '010-111-1234', '����� ������',sysdate);

INSERT INTO student(sname, shakbun, smajor, sphone) 
             VALUES('�̼���', '20200002','�ؾ��а�','010-222-1234');
             
INSERT INTO student VALUES('������', '20200003', '�ð������ΰ�', 1, 20, '010-333-1234', null, sysdate);
INSERT INTO student VALUES('�迬��', '20200004', 'ü���а�', 1, 20, '010-444-1234', '����� ����', sysdate);
INSERT INTO student VALUES('������', '20200003', '�����а�', null, null, '010-555-1234', '����� ���Ǳ�', sysdate);
-- values�� �ΰ��� �ִ� ���� ���� �ʴ�.

-- �����͸� ��ȸ�ϴ� ��ɹ�
-- ����) select �÷���1, �÷���2,...... from ���̺��

-- student ���̺��� �й�, �̸�, ����ó�� ȭ�鿡 �����ּ���.
SELECT shakbun, sname, sphone FROM student;

-- student ���̺��� ��� �÷��� ȭ�鿡 �����ּ���.
SELECT * FROM student;

-- emp ���̺��� ��� �÷��� ȭ�鿡 �����ּ���.
SELECT * FROM emp;

-- emp ���̺��� empno, ename, job, deptno�� ȭ�鿡 �����ּ���.
SELECT empno, ename, job, deptno FROM emp;

-- emp ���̺��� �̸�, �Ի���, �޿��� ȭ�鿡 �����ּ���.
SELECT ename, hiredate, sal FROM emp;

-- emp ���̺��� ���, �̸�, ���ʽ��� ȭ�鿡 �����ּ���.
SELECT empno, ename, comm FROM emp;

SELECT ename from emp;