create database cycle2;
create table sailor
(
sid int,
snmae varchar(25),
rating int,
age int
);
describe sailor;
insert into sailor(sid,snmae,rating,age) values
(22, 'Dustin', 7, 45),
(29, 'Brutas', 1, 33),
(31, 'Lubber', 8, 55),
(32, 'Andy', 8, 25),
(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),
(71, 'Zorba', 10, 16),
(74, 'Horatio', 9, 35),
(85, 'Art', 3, 26),
(95, 'Bob', 3, 64);
select * from sailor;
CREATE TABLE BOATS
( 
Bid int,
bname VARCHAR(10), 
color VARCHAR(7)
);
describe boats;
insert into boats(Bid,bname,color) values
(101, 'Interlake', 'Blue'),
(102, 'Interlake', 'Red'),
(103, 'Clipper', 'Green'),
(104, 'Marine', 'Red' );
select * from boats;
CREATE TABLE RESERVES
(
sid int,
bid int,
day DATE
);
describe reserves;
INSERT INTO RESERVES VALUES
(22,101,'98-10-10'),
(22,102,'98-10-10'),
(22,103,'98-8-10'),
(22,104,'98-7-10'),
(31,102,'98-10-11'),
(31,103,'98-6-11'),
(31,104,'98-12-11'),
(64,101,'98-5-9'),
(64,102,'98-8-9'),
(74,103,'98-8-9');
select * from reserves;
SELECT snmae, age FROM sailor;
SELECT * FROM SAILOR,RESERVES WHERE sailor.sid = reserves.sid AND bid = 101;
SELECT snmae FROM SAILOR WHERE rating > 7;
SELECT snmae FROM SAILOR,RESERVES,BOATS WHERE boats.bid = 103 AND boats.bid = reserves.bid AND sailor.sid = reserves.sid;
SELECT DISTINCT snmae FROM SAILOR,RESERVES,BOATS WHERE color = 'Red'AND boats.bid = reserves.bid AND sailor.sid = reserves.sid;
SELECT DISTINCT snmae FROM SAILOR,RESERVES,BOATS WHERE ( color = 'Red'OR color = 'Green')AND boats.bid = reserves.bid AND sailor.sid = reserves.sid;
SELECT DISTINCT snmae FROM SAILOR,RESERVES,BOATS WHERE color = 'Red'AND boats.Bid = reserves.bid AND sailor.sid = reserves.sid and exists (SELECT DISTINCT snmae FROM SAILOR, RESERVES, BOATS WHERE color = 'Green'AND boats.Bid = reserves.bid AND sailor.sid = reserves.sid);
SELECT DISTINCT snmae FROM SAILOR,RESERVES WHERE reserves.sid = sailor.sid;
SELECT snmae,reserves.sid FROM RESERVES,SAILOR WHERE sailor.sid = reserves.sid GROUP BY DAY,reserves.sid,snmae HAVING COUNT(DAY)>1 ;
SELECT snmae,age FROM SAILOR WHERE age =(SELECT MIN(age) FROM sailor);
SELECT snmae FROM SAILOR WHERE rating >(SELECT MAX(rating) FROM SAILOR WHERE snmae ='Horatio');
SELECT snmae FROM(SELECT snmae,reserves.sid,COUNT(bid) AS id FROM RESERVES,SAILOR WHERE reserves.sid = sailor.sid GROUP BY reserves.SID,snmae) a WHERE id =(SELECT COUNT(bid) FROM BOATS);
SELECT COUNT(c.snmae) FROM (SELECT DISTINCT snmae FROM Sailor)c;
SELECT AVG(age) FROM SAILOR;
SELECT rating,AVG(age) FROM SAILOR GROUP BY rating;
SELECT a.rating,b.mean FROM(SELECT COUNT(snmae) AS num,rating FROM SAILOR GROUP BY rating HAVING COUNT(snmae)>1) a, (SELECT rating,AVG(age) AS mean FROM SAILOR GROUP BY rating ) b WHERE a.rating = b.rating;