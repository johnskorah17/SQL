create database LOAN_ACCOUNTS;
CREATE TABLE LOAN_ACCOUNTS
(
ACCNO INT,
CUST_NAME  VARCHAR(15),
LOAN_AMOUNT DECIMAL(8,2),
INSTALLMENTS INT,
INT_RATE DECIMAL(4,2),
START_DATE DATE,
INTEREST DECIMAL(8,2)
);
ALTER TABLE LOAN_ACCOUNTS
ADD COLUMN CATEGORY VARCHAR(1);
INSERT INTO LOAN_ACCOUNTS(ACCNO,CUST_NAME,LOAN_AMOUNT,INSTALLMENTS,INT_RATE,START_DATE)VALUES
(1001,'R.K GUPTA',300000.00,36,12.00,'2009-07-19'),
(1002,'S.P SHARMA',500000.00,48,10.00,'2008-03-22'),
(1003,'K.P JAIN',300000.00,36,NULL,'2007-08-03'),
(1004,'M.P YADAV',800000.00,60,10.00,'2008-06-12'),
(1005,'S.P SINHA',200000.00,36,12.50,'2010-03-01'),
(1006,'P SHARMA',700000.00,60,12.50,'2008-05-06'),
(1007,'K.S DHALL',500000.00,48,NULL,'2008-05-03');
SELECT * FROM loan_accounts;
update loan_accounts set int_rate = 11.50 where int_rate is null;
update loan_accounts set int_rate = int_rate + 0.5 where loan_amount > 400000.00;
SELECT * FROM loan_accounts;
update loan_accounts set interest = (loan_amount * int_rate* installments)/(12*100) where interest is null; 
SELECT * FROM loan_accounts;
DELETE FROM loan_accounts WHERE start_date < '2008-01-01';
SELECT * FROM loan_accounts;
delete FROM loan_accounts where cust_name like 'K%';
SELECT * FROM loan_accounts where installments < 40;
SELECT accno,loan_amount, start_date from loan_accounts where start_date < '2009-04-01';
select int_rate ,start_date from loan_accounts where start_date > '2009-04-01';
SELECT accno,cust_name,loan_amount FROM loan_accounts WHERE cust_name LIKE '%Sharma';
select loan_amount from loan_accounts where cust_name like '%a';
select accno,cust_name,loan_amount from loan_accounts where cust_name like'%a%';
select accno,cust_name,loan_amount from loan_accounts where cust_name not like '%p%';
describe loan_accounts;
select * from loan_accounts order by loan_amount asc;
select * from loan_accounts order by start_date desc;
select * from loan_accounts order by loan_amount,start_date desc;
select accno,cust_name,loan_amount from loan_accounts where cust_name like 'k%';
select * from loan_accounts where int_rate is null;
select * from loan_accounts where int_rate is not null;
select distinct loan_amount from loan_accounts ;
SELECT * FROM loan_accounts where (start_date > '2008-12-31' and installments > 36); 
select cust_name,loan_amount from loan_accounts where (loan_amount < 500000.00 or int_rate > 12); 
select * from loan_accounts where start_date between '2009-01-01' and '2009-12-31';
select * from loan_accounts where loan_amount between 400000.00 and 500000.00;
select cust_name,installments, loan_amount from loan_accounts where installments in( 26,36,48);
update loan_accounts set int_rate =0.0 where int_rate is null;
select cust_name,loan_amount,int_rate from loan_accounts where int_rate = 0.0;
select cust_name,loan_amount,ifnull(int_rate,'No Interest') as int_rate from loan_accounts;
