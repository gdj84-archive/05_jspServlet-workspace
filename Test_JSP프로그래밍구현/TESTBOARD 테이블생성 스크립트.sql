DROP TABLE TESTBOARD;

CREATE TABLE TESTBOARD
(
    BOARD_NO NUMBER PRIMARY KEY,
    CATEGORY VARCHAR2(20),
    BOARD_TITLE VARCHAR2(100) NOT NULL,
    BOARD_CONTENT VARCHAR2(500) NOT NULL,
    FILE_ORIGINNAME VARCHAR2(200),
    FILE_URL VARCHAR2(1000),
    COUNT NUMBER DEFAULT 0 NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN TESTBOARD.BOARD_NO IS '게시글번호';
COMMENT ON COLUMN TESTBOARD.CATEGORY IS '카테고리명';
COMMENT ON COLUMN TESTBOARD.BOARD_TITLE IS '게시글제목';
COMMENT ON COLUMN TESTBOARD.BOARD_CONTENT IS '게시글내용';
COMMENT ON COLUMN TESTBOARD.FILE_ORIGINNAME IS '첨부파일원본명';
COMMENT ON COLUMN TESTBOARD.FILE_URL IS '첨부파일경로';
COMMENT ON COLUMN TESTBOARD.COUNT IS '조회수';
COMMENT ON COLUMN TESTBOARD.CREATE_DATE IS '게시글작성일';
COMMENT ON COLUMN TESTBOARD.STATUS IS '상태';

DROP SEQUENCE SEQ_TBNO;
CREATE SEQUENCE SEQ_TBNO NOCACHE;