SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS adopt;
DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS buydetail;
DROP TABLE IF EXISTS buylist;
DROP TABLE IF EXISTS fundinglist;
DROP TABLE IF EXISTS fundreply;
DROP TABLE IF EXISTS funding;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS vworklist;
DROP TABLE IF EXISTS vwork;
DROP TABLE IF EXISTS sheltermember;
DROP TABLE IF EXISTS shelter;




/* Create Tables */

CREATE TABLE adopt
(
	member_id varchar(10) NOT NULL,
	shelter_no int NOT NULL,
	adopt_date date,
	dog_no varchar(30)
);


CREATE TABLE board
(
	board_no int NOT NULL,
	member_id varchar(10) NOT NULL,
	subject varchar(20),
	content varchar(100),
	-- 0 : 입양후기
	-- 1 : 공지사항
	-- 2 : Q&A
	type int COMMENT '0 : 입양후기
1 : 공지사항
2 : Q&A',
	grp int,
	grplevel int,
	grpstep int,
	regdate datetime,
	readcnt int,
	file1 varchar(50),
	PRIMARY KEY (board_no)
);


CREATE TABLE buydetail
(
	seq int NOT NULL,
	buy_no int NOT NULL,
	item_no int NOT NULL,
	PRIMARY KEY (seq, buy_no)
);


CREATE TABLE buylist
(
	buy_no int NOT NULL,
	member_id varchar(10) NOT NULL,
	buy_date date,
	PRIMARY KEY (buy_no)
);


CREATE TABLE funding
(
	fundno int NOT NULL,
	shelter_id varchar(10) NOT NULL,
	funding_subject varchar(20),
	sheltername varchar(20),
	count int,
	start_date date,
	end_date date,
	PRIMARY KEY (fundno)
);


CREATE TABLE fundinglist
(
	fund_no int NOT NULL,
	fund_id varchar(20),
	fund_date date,
	fund_cost int
);


CREATE TABLE fundreply
(
	fund_replyno int NOT NULL,
	fundno int NOT NULL,
	fundreply_id varchar(20),
	fund_comment varchar(50),
	fund_regdate datetime,
	PRIMARY KEY (fund_replyno)
);


CREATE TABLE item
(
	item_no int NOT NULL,
	item_name varchar(20),
	item_price int,
	item_content varchar(100),
	item_picture varchar(30),
	PRIMARY KEY (item_no)
);


CREATE TABLE member
(
	member_id varchar(10) NOT NULL,
	member_pass varchar(20),
	member_email varchar(30),
	member_tel varchar(10),
	member_postcode int,
	member_address varchar(30),
	member_daddress varchar(20),
	member_birthday date,
	del_tf boolean,
	PRIMARY KEY (member_id)
);


CREATE TABLE reply
(
	board_replyno int NOT NULL,
	board_no int NOT NULL,
	member_id varchar(10) NOT NULL,
	board_comment varchar(50),
	board_regdate datetime,
	PRIMARY KEY (board_replyno)
);


CREATE TABLE shelter
(
	shelter_no int NOT NULL,
	shelter_name varchar(20),
	shelter_address varchar(30),
	shelter_tel varchar(10),
	PRIMARY KEY (shelter_no)
);


CREATE TABLE sheltermember
(
	shelter_id varchar(10) NOT NULL,
	shelter_no int NOT NULL,
	shelter_pass varchar(20),
	shelter_email varchar(30),
	shelter_tel varchar(10),
	file1 varchar(30),
	PRIMARY KEY (shelter_id)
);


CREATE TABLE vwork
(
	vwork_no int NOT NULL,
	shelter_id varchar(10) NOT NULL,
	vwork_date date,
	shelter_name varchar(20),
	vwork_member int,
	vwork_content varchar(50),
	PRIMARY KEY (vwork_no)
);


CREATE TABLE vworklist
(
	vwork_no int NOT NULL,
	vwork_id varchar(20),
	vwork_date date,
	vwork_tel varchar(10)
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (board_no)
	REFERENCES board (board_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE buydetail
	ADD FOREIGN KEY (buy_no)
	REFERENCES buylist (buy_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE fundinglist
	ADD FOREIGN KEY (fund_no)
	REFERENCES funding (fundno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE fundreply
	ADD FOREIGN KEY (fundno)
	REFERENCES funding (fundno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE buydetail
	ADD FOREIGN KEY (item_no)
	REFERENCES item (item_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE adopt
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE buylist
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE adopt
	ADD FOREIGN KEY (shelter_no)
	REFERENCES shelter (shelter_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sheltermember
	ADD FOREIGN KEY (shelter_no)
	REFERENCES shelter (shelter_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE funding
	ADD FOREIGN KEY (shelter_id)
	REFERENCES sheltermember (shelter_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE vwork
	ADD FOREIGN KEY (shelter_id)
	REFERENCES sheltermember (shelter_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE vworklist
	ADD FOREIGN KEY (vwork_no)
	REFERENCES vwork (vwork_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



