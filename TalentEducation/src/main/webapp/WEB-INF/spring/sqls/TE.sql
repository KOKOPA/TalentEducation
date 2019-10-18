DROP SEQUENCE MEMBER_SEQ;
DROP TABLE MEMBER;

CREATE SEQUENCE MEMBER_SEQ;
CREATE TABLE MEMBER(
	MEMBER_SEQ NUMBER PRIMARY KEY,
	ID VARCHAR2(200) UNIQUE NOT NULL,
	PW VARCHAR2(200) NOT NULL,
	ENABLE NUMBER  NOT NULL,
	AUTHORITY VARCHAR2(200)	NOT NULL,
	NICKNAME VARCHAR2(200) NOT NULL,
	EMAIL VARCHAR2(200) NOT NULL,
	CATEGORYS VARCHAR2(500),
	PROFILE_IMG VARCHAR2(200),
	END_DATE DATE

);

--------------------------------------------------------------------------

DROP TABLE CATEGORY;

CREATE TABLE CATEGORY(
	CATEGORY_CODE VARCHAR2(20),
	CATEGORY_NAME VARCHAR2(20) NOT NULL,
	
	CONSTRAINT CATEGORY_CODE_TE_PK PRIMARY KEY(CATEGORY_CODE)
);

INSERT INTO CATEGORY
VALUES('0000', '테스트');

--------------------------------------------------------------------------

DROP SEQUENCE BOARD_LECTURE_SEQ;
DROP TABLE BOARD_LECTURE;

CREATE SEQUENCE BOARD_LECTURE_SEQ;
CREATE TABLE BOARD_LECTURE(
	BOARD_LECTURE_SEQ NUMBER,
	BOARD_LECTURE_TITLE VARCHAR2(100) NOT NULL,
	CATEGORY_CODE VARCHAR2(20) NOT NULL,
	TUTER_ID VARCHAR2(20) NOT NULL,
	TUTEES VARCHAR2(1000),
	BOARD_LECTURE_ENABLE VARCHAR2(2),
	BOARD_LECTURE_CONTENT VARCHAR2(2000) NOT NULL,
	BOARD_LECTURE_REGDATE DATE NOT NULL,
	BOARD_LECTURE_TAG VARCHAR2(50) NOT NULL,
	BOARD_LECTURE_IMAGE VARCHAR2(100) NOT NULL,
	BOARD_LECTURE_STAR_TOTAL NUMBER,
	BOARD_LECTURE_STAR_COUNT NUMBER,
	
	CONSTRAINT BOARD_LECTURE_SEQ_TE_PK PRIMARY KEY(BOARD_LECTURE_SEQ),
	CONSTRAINT CATEGORY_CODE_TE_FK FOREIGN KEY(CATEGORY_CODE) REFERENCES CATEGORY(CATEGORY_CODE),
	CONSTRAINT TUTER_ID_TE_FK FOREIGN KEY(TUTER_ID) REFERENCES MEMBER(ID)
);

INSERT INTO BOARD_LECTURE
VALUES(BOARD_LECTURE_SEQ.NEXTVAL, 'title', '0000', 'user', '', '-', 'content', SYSDATE, 'tag', 'image', 0, 0);
INSERT INTO BOARD_LECTURE
VALUES(BOARD_LECTURE_SEQ.NEXTVAL, 'title2', '0000', 'user', '', 'Y', 'content', SYSDATE, 'tag', 'image', 0, 0);

--------------------------------------------------------------------------

DROP SEQUENCE BOARD_VOD_SEQ;
DROP TABLE BOARD_VOD;

CREATE SEQUENCE BOARD_VOD_SEQ;
CREATE TABLE BOARD_VOD(
	BOARD_VOD_SEQ NUMBER,
	BOARD_LECTURE_SEQ NUMBER NOT NULL,
	BOARD_VOD_CONTENT VARCHAR2(2000) NOT NULL,
	BOARD_VOD_REGDATE DATE NOT NULL,
	BOARD_VOD_IMAGE VARCHAR2(100) NOT NULL,
	BOARD_VOD_STAR_TOTAL NUMBER,
	BOARD_VOD_STAR_COUNT NUMBER,
	
	CONSTRAINT BOARD_VOD_SEQ_CATEGORY_PK PRIMARY KEY(BOARD_VOD_SEQ),
	CONSTRAINT BOARD_LECTURE_SEQ_CATEGORY_FK FOREIGN KEY(BOARD_LECTURE_SEQ) REFERENCES BOARD_LECTURE(BOARD_LECTURE_SEQ)
);

--------------------------------------------------------------------------

DROP SEQUENCE REVIEW_SEQ;
DROP TABLE REVIEW;

CREATE SEQUENCE REVIEW_SEQ;
CREATE TABLE REVIEW(
	REVIEW_SEQ NUMBER,
	BOARD_LECTURE_SEQ NUMBER NOT NULL,
	ID VARCHAR2(20) NOT NULL,
	REVIEW_CONTENT VARCHAR2(500) NOT NULL,
	REVIEW_REGDATE DATE NOT NULL,
	
	CONSTRAINT REVIEW_SEQ_REVIEW_PK PRIMARY KEY(REVIEW_SEQ),
	CONSTRAINT BOARD_LECTURE_SEQ_REVIEW_FK FOREIGN KEY(BOARD_LECTURE_SEQ) REFERENCES BOARD_LECTURE(BOARD_LECTURE_SEQ),
	CONSTRAINT ID_REVIEW_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID)
);

--------------------------------------------------------------------------

DROP SEQUENCE CALENDAR_SEQ;
DROP TABLE CALENDAR;

CREATE SEQUENCE CALENDAR_SEQ;
CREATE TABLE CALENDAR(
	CALENDAR_SEQ NUMBER,
	ID VARCHAR2(20) NOT NULL,
	CALENDAR_TITLE VARCHAR2(20) NOT NULL,
	CALENDAR_CATEGORY VARCHAR2(20),
	CALENDAR_COLOR VARCHAR2(40),
	CALENDAR_START VARCHAR2(30) NOT NULL,
	CALENDAR_END VARCHAR2(30),
	CALENDAR_DESCRIPTION VARCHAR2(200),
	
	CONSTRAINT CALENDAR_SEQ_CALENDAR_PK PRIMARY KEY(CALENDAR_SEQ),
	CONSTRAINT ID_CALENDAR_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID)
);

INSERT INTO CALENDAR VALUES(CALENDAR_SEQ.NEXTVAL, 'ID', 'TITLE1', '디자인', '#D25565', '2019-10-14', NULL ,'DESCRIPTION1');
INSERT INTO CALENDAR VALUES(CALENDAR_SEQ.NEXTVAL, 'ID', 'TITLE2', '실무역량', '#74c0fc', '2019-10-10', '2019-10-13' ,'DESCRIPTION2');
INSERT INTO CALENDAR VALUES(CALENDAR_SEQ.NEXTVAL, 'ID', 'TITLE3', '뷰티', '#ffa94d', '2019-10-16', '2019-10-16' ,'DESCRIPTION3');


--------------------------------------------------------------------------

DROP SEQUENCE ROOM_LECTURE_SEQ;
DROP TABLE ROOM_LECTURE;

CREATE SEQUENCE ROOM_LECTURE_SEQ;
CREATE TABLE ROOM_LECTURE(
	ROOM_LECTURE_SEQ NUMBER,
	TUTOR VARCHAR2(20) NOT NULL,
	TUTEES VARCHAR2(500) NOT NULL,
	
	CONSTRAINT ROOM_LECTURE_SEQ_ROOM_PK PRIMARY KEY(ROOM_LECTURE_SEQ),
	CONSTRAINT TUTOR_ROOM_LECTURE_FK FOREIGN KEY(TUTOR) REFERENCES MEMBER(ID)
);

--------------------------------------------------------------------------

DROP TABLE PAYMENT;

CREATE TABLE PAYMENT(
	ORDER_ID VARCHAR2(100),
	ID VARCHAR2(20) NOT NULL,
	ITEM_NAME VARCHAR2(50) NOT NULL,
	AMOUNT NUMBER NOT NULL,
	PAYMENT_DATE DATE NOT NULL,
	
	CONSTRAINT ORDER_ID_PAYMENT_PK PRIMARY KEY(ORDER_ID),
	CONSTRAINT ID_PAYMENT_FK FOREIGN KEY(ID) REFERENCES MEMBER(ID)
);

--------------------------------------------------------------------------

DROP SEQUENCE MAP_SEQ;
DROP TABLE MAP;

CREATE SEQUENCE MAP_SEQ;
CREATE TABLE MAP(
	MAP_SEQ NUMBER,
	X_POINT VARCHAR2(50) NOT NULL,
	Y_POINT VARCHAR2(50) NOT NULL,
	
	CONSTRAINT MAP_SEQ_MAP_PK PRIMARY KEY(MAP_SEQ)
);










