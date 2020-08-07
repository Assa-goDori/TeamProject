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
DROP TABLE IF EXISTS vworklist;
DROP TABLE IF EXISTS vwork;
DROP TABLE IF EXISTS wanted;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS shelter;




/* Create Tables */

CREATE TABLE adopt
(
	member_id varchar(20) NOT NULL,
	dog_no varchar(50) NOT NULL,
	shelter_no int NOT NULL,
	adopt_date date NOT NULL,
	-- 0:신청
	-- 1:거부
	-- 2:승인
	-- 3:완료
	adopt_etc int NOT NULL COMMENT '0:신청
1:거부
2:승인
3:완료',
	adopt_file varchar(50) NOT NULL,
	PRIMARY KEY (member_id, dog_no)
);


CREATE TABLE board
(
	board_no int NOT NULL,
	member_id varchar(20) NOT NULL,
	subject varchar(20) NOT NULL,
	content varchar(100) NOT NULL,
	-- 0 : 입양후기
	-- 1 : 공지사항
	-- 2 : Q&A
	type int NOT NULL COMMENT '0 : 입양후기
1 : 공지사항
2 : Q&A',
	grp int NOT NULL,
	grplevel int NOT NULL,
	grpstep int NOT NULL,
	regdate datetime NOT NULL,
	readcnt int NOT NULL,
	file1 varchar(50),
	PRIMARY KEY (board_no)
);


CREATE TABLE buydetail
(
	seq int NOT NULL,
	buy_no int NOT NULL,
	item_no int NOT NULL,
	item_each int NOT NULL,
	PRIMARY KEY (seq, buy_no)
);


CREATE TABLE buylist
(
	buy_no int NOT NULL,
	member_id varchar(20) NOT NULL,
	buy_date date NOT NULL,
	buy_state varchar(30) NOT NULL,
	buy_postcode int NOT NULL,
	buy_address varchar(30) NOT NULL,
	buy_daddress varchar(30) NOT NULL,
	PRIMARY KEY (buy_no)
);


CREATE TABLE funding
(
	fund_no int NOT NULL,
	member_id varchar(20) NOT NULL,
	funding_subject varchar(20) NOT NULL,
	sheltername varchar(20) NOT NULL,
	count int NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	fund_pic varchar(50),
	PRIMARY KEY (fund_no)
);


CREATE TABLE fundinglist
(
	fund_no int NOT NULL,
	fund_id varchar(20) NOT NULL,
	fund_date date NOT NULL,
	fund_cost int NOT NULL,
	PRIMARY KEY (fund_no, fund_id)
);


CREATE TABLE fundreply
(
	fund_replyno int NOT NULL,
	fund_no int NOT NULL,
	fundreply_id varchar(20) NOT NULL,
	fund_comment varchar(50) NOT NULL,
	fund_regdate datetime NOT NULL,
	PRIMARY KEY (fund_replyno)
);


CREATE TABLE item
(
	item_no int NOT NULL,
	item_name varchar(20) NOT NULL,
	item_price int NOT NULL,
	item_content varchar(100) NOT NULL,
	item_picture varchar(50) NOT NULL,
	item_code varchar(30) NOT NULL,
	-- 0 : 판매중
	-- 1 : 매진
	item_state int NOT NULL COMMENT '0 : 판매중
1 : 매진',
	PRIMARY KEY (item_no)
);


CREATE TABLE member
(
	member_id varchar(20) NOT NULL,
	-- 일반회원가입시 : 0000000
	shelter_no int NOT NULL COMMENT '일반회원가입시 : 0000000',
	member_pass varchar(20) NOT NULL,
	member_name varchar(20) NOT NULL,
	member_email varchar(30) NOT NULL,
	member_tel varchar(20) NOT NULL,
	member_postcode int,
	member_address varchar(30),
	member_daddress varchar(20),
	member_birthday date,
	del_tf boolean NOT NULL,
	file1 varchar(50),
	file2 varchar(50),
	-- 0 : 일반회원
	-- 1 : 보호소관리자
	-- 2 : 관리자
	member_type int NOT NULL COMMENT '0 : 일반회원
1 : 보호소관리자
2 : 관리자',
	PRIMARY KEY (member_id)
);


CREATE TABLE reply
(
	board_replyno int NOT NULL,
	board_no int NOT NULL,
	member_id varchar(20) NOT NULL,
	board_comment varchar(50) NOT NULL,
	board_regdate datetime NOT NULL,
	PRIMARY KEY (board_replyno)
);


CREATE TABLE shelter
(
	shelter_no int NOT NULL,
	shelter_name varchar(40) NOT NULL,
	shelter_address varchar(40),
	shelter_tel varchar(30),
	PRIMARY KEY (shelter_no)
);


CREATE TABLE vwork
(
	vwork_no int NOT NULL,
	shelter_no int NOT NULL,
	member_id varchar(20) NOT NULL,
	vwork_date date NOT NULL,
	vwork_member int NOT NULL,
	vwork_content varchar(200) NOT NULL,
	PRIMARY KEY (vwork_no)
);


CREATE TABLE vworklist
(
	vwork_no int NOT NULL,
	vwork_id varchar(20) NOT NULL,
	vwork_date date NOT NULL,
	vwork_tel varchar(20) NOT NULL,
	PRIMARY KEY (vwork_no, vwork_id)
);


CREATE TABLE wanted
(
	member_id varchar(20) NOT NULL,
	wanted_dog_no varchar(50) NOT NULL,
	wanted_dog_sex varchar(20) NOT NULL,
	wanted_dog_age varchar(20) NOT NULL,
	wanted_dog_pic varchar(50) NOT NULL,
	wanted_dog_etc varchar(50),
	PRIMARY KEY (member_id, wanted_dog_no)
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
	REFERENCES funding (fund_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE fundreply
	ADD FOREIGN KEY (fund_no)
	REFERENCES funding (fund_no)
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


ALTER TABLE funding
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


ALTER TABLE vwork
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE wanted
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


ALTER TABLE member
	ADD FOREIGN KEY (shelter_no)
	REFERENCES shelter (shelter_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE vwork
	ADD FOREIGN KEY (shelter_no)
	REFERENCES shelter (shelter_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE vworklist
	ADD FOREIGN KEY (vwork_no)
	REFERENCES vwork (vwork_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



