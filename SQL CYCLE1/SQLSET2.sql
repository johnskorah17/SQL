create database STUDENT;
CREATE TABLE STUDENT
(
SID INT,
SNAME VARCHAR(25),
DOB DATE,
Physics INT,
Chemistry INT,
Maths INT
);
DESCRIBE STUDENT;
INSERT INTO STUDENT(SID,SNAME,DOB,Physics,Chemistry,Maths) VALUES
(1,'ANNU','1997-01-24',90,85,80),
(2,'ALEN','1998-06-08',50,70,86),
(3,'JOHNS','1997-02-14',29,45,20),
(4,'RONY','1998-05-21',70,88,89),
(5,'ANGEL','2001-01-09',90,88,66);
SELECT * FROM STUDENT;
SELECT SID,SNAME AS YOUNGEST_STUDENT,DOB as DATE_OF_BIRTH FROM STUDENT WHERE DOB=(SELECT MAX(DOB) FROM STUDENT);
SELECT * FROM STUDENT WHERE Maths >=40 AND (Physics >=40 OR Chemistry >=40);
ALTER TABLE STUDENT ADD TOTAL INT;
ALTER TABLE STUDENT ADD AVERAGE FLOAT;
DESCRIBE STUDENT;
SELECT SNAME FROM STUDENT WHERE Maths=(SELECT MAX(Maths) FROM STUDENT);
SELECT SNAME FROM STUDENT WHERE Chemistry=(SELECT MIN(Chemistry) FROM STUDENT);
UPDATE STUDENT SET Total=Physics+Chemistry+Maths;
SELECT * FROM STUDENT;
UPDATE STUDENT SET AVERAGE=TOTAL/3;
SELECT * FROM STUDENT;
SELECT * FROM STUDENT ORDER BY TOTAL DESC;
ALTER TABLE STUDENT RENAME COLUMN AVERAGE TO AVG_MARK;
SELECT * FROM STUDENT;
SELECT AVG(AVG_MARK) AS OVERALL_AVERAGE FROM STUDENT;
SELECT *FROM STUDENT WHERE AVG_MARK > (SELECT AVG(AVG_MARK) FROM STUDENT);
SELECT COUNT(SNAME) FROM STUDENT WHERE AVG_MARK > (SELECT AVG(AVG_MARK) FROM STUDENT);

