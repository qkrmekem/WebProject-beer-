-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- t_from Table Create SQL
CREATE TABLE t_from
(
    from_seq       NUMBER(12, 0)    NOT NULL, 
    from_source    VARCHAR2(20)     NOT NULL, 
     PRIMARY KEY (from_seq)
)
/

CREATE SEQUENCE t_from_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_from_AI_TRG
BEFORE INSERT ON t_from 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_from_SEQ.NEXTVAL
    INTO :NEW.from_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_from_AI_TRG; /

--DROP SEQUENCE t_from_SEQ; /

COMMENT ON TABLE t_from IS '맥주 원산지'
/

COMMENT ON COLUMN t_from.from_seq IS '원산지 순번'
/

COMMENT ON COLUMN t_from.from_source IS '원산지 명'
/


-- t_aroma Table Create SQL
CREATE TABLE t_aroma
(
    aroma_seq      NUMBER(12, 0)    NOT NULL, 
    aroman_name    VARCHAR2(20)     NOT NULL, 
     PRIMARY KEY (aroma_seq)
)
/

CREATE SEQUENCE t_aroma_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_aroma_AI_TRG
BEFORE INSERT ON t_aroma 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_aroma_SEQ.NEXTVAL
    INTO :NEW.aroma_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_aroma_AI_TRG; /

--DROP SEQUENCE t_aroma_SEQ; /

COMMENT ON TABLE t_aroma IS '맥주 향'
/

COMMENT ON COLUMN t_aroma.aroma_seq IS '향 순번'
/

COMMENT ON COLUMN t_aroma.aroman_name IS '향 이름'
/


-- t_country Table Create SQL
CREATE TABLE t_country
(
    country_cd      VARCHAR2(20)    NOT NULL, 
    country_name    VARCHAR2(60)    NOT NULL, 
     PRIMARY KEY (country_cd)
)
/

COMMENT ON TABLE t_country IS '국가'
/

COMMENT ON COLUMN t_country.country_cd IS '국가 코드'
/

COMMENT ON COLUMN t_country.country_name IS '국가 명'
/


-- t_taste Table Create SQL
CREATE TABLE t_taste
(
    taste_seq     NUMBER(12, 0)    NOT NULL, 
    taste_name    VARCHAR2(20)     NOT NULL, 
     PRIMARY KEY (taste_seq)
)
/

CREATE SEQUENCE t_taste_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_taste_AI_TRG
BEFORE INSERT ON t_taste 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_taste_SEQ.NEXTVAL
    INTO :NEW.taste_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_taste_AI_TRG; /

--DROP SEQUENCE t_taste_SEQ; /

COMMENT ON TABLE t_taste IS '맛'
/

COMMENT ON COLUMN t_taste.taste_seq IS '맛 순번'
/

COMMENT ON COLUMN t_taste.taste_name IS '맛 이름'
/


-- t_member Table Create SQL
CREATE TABLE t_member
(
    m_id           VARCHAR2(20)    NOT NULL, 
    m_pw           VARCHAR2(20)    NOT NULL, 
    m_name         VARCHAR2(20)    NOT NULL, 
    m_birthdate    DATE            NOT NULL, 
    m_gender       CHAR(1)         NOT NULL, 
    m_email        VARCHAR2(60)    NOT NULL, 
    m_joindate     DATE            DEFAULT SYSDATE NOT NULL, 
    type           CHAR(1)         NOT NULL, 
     PRIMARY KEY (m_id)
)
/

COMMENT ON TABLE t_member IS '회원 관리'
/

COMMENT ON COLUMN t_member.m_id IS '회원 아이디'
/

COMMENT ON COLUMN t_member.m_pw IS '회원 비밀번호'
/

COMMENT ON COLUMN t_member.m_name IS '회원 성명'
/

COMMENT ON COLUMN t_member.m_birthdate IS '회원 생년월일'
/

COMMENT ON COLUMN t_member.m_gender IS '회원 성별'
/

COMMENT ON COLUMN t_member.m_email IS '회원 이메일'
/

COMMENT ON COLUMN t_member.m_joindate IS '회원 가입일자'
/

COMMENT ON COLUMN t_member.type IS '회원 유형'
/

CREATE UNIQUE INDEX UQ_t_member_1
    ON t_member(m_email)
/


-- t_beer Table Create SQL
CREATE TABLE t_beer
(
    beer_seq      NUMBER(12, 0)    NOT NULL, 
    beer_name     VARCHAR2(30)     NOT NULL, 
    beer_score    NUMBER(12, 1)    NOT NULL, 
    beer_ml       NUMBER(12, 0)    NOT NULL, 
    beer_abv      NUMBER(12, 1)    NOT NULL, 
    from_seq      NUMBER(12, 0)    NOT NULL, 
    aroma_seq     NUMBER(12, 0)    NOT NULL, 
    country_cd    VARCHAR2(20)     NOT NULL, 
    taste_seq     NUMBER(12, 0)    NOT NULL, 
     PRIMARY KEY (beer_seq)
)
/

CREATE SEQUENCE t_beer_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_beer_AI_TRG
BEFORE INSERT ON t_beer 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_beer_SEQ.NEXTVAL
    INTO :NEW.beer_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_beer_AI_TRG; /

--DROP SEQUENCE t_beer_SEQ; /

COMMENT ON TABLE t_beer IS '맥주'
/

COMMENT ON COLUMN t_beer.beer_seq IS '맥주 순번'
/

COMMENT ON COLUMN t_beer.beer_name IS '맥주 이름'
/

COMMENT ON COLUMN t_beer.beer_score IS '맥주 별점'
/

COMMENT ON COLUMN t_beer.beer_ml IS '맥주 용량'
/

COMMENT ON COLUMN t_beer.beer_abv IS '맥주 알콜도수'
/

COMMENT ON COLUMN t_beer.from_seq IS '맥주 원산지순번'
/

COMMENT ON COLUMN t_beer.aroma_seq IS '맥주 향순번'
/

COMMENT ON COLUMN t_beer.country_cd IS '국가 코드'
/

COMMENT ON COLUMN t_beer.taste_seq IS '맥주 맛순번'
/

ALTER TABLE t_beer
    ADD CONSTRAINT FK_t_beer_country_cd_t_country FOREIGN KEY (country_cd)
        REFERENCES t_country (country_cd)
/

ALTER TABLE t_beer
    ADD CONSTRAINT FK_t_beer_taste_seq_t_taste_ta FOREIGN KEY (taste_seq)
        REFERENCES t_taste (taste_seq)  
/

ALTER TABLE t_beer
    ADD CONSTRAINT FK_t_beer_aroma_seq_t_aroma_ar FOREIGN KEY (aroma_seq)
        REFERENCES t_aroma (aroma_seq)  
/

ALTER TABLE t_beer
    ADD CONSTRAINT FK_t_beer_from_seq_t_from_from FOREIGN KEY (from_seq)
        REFERENCES t_from (from_seq)  
/


-- t_board Table Create SQL
CREATE TABLE t_board
(
    b_seq        NUMBER(12, 0)     NOT NULL, 
    b_title      VARCHAR2(300)     NOT NULL, 
    b_content    VARCHAR2(4000)    NOT NULL, 
    b_date       DATE              NOT NULL, 
    b_file       VARCHAR2(300)     NOT NULL, 
    m_id         VARCHAR2(20)      NOT NULL, 
    b_cnt        NUMBER(12, 0)     NOT NULL, 
     PRIMARY KEY (b_seq)
)
/

CREATE SEQUENCE t_board_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER t_board_AI_TRG
BEFORE INSERT ON t_board 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT t_board_SEQ.NEXTVAL
    INTO :NEW.b_seq
    FROM DUAL;
END;
/

--DROP TRIGGER t_board_AI_TRG; /

--DROP SEQUENCE t_board_SEQ; /

COMMENT ON TABLE t_board IS '게시판'
/

COMMENT ON COLUMN t_board.b_seq IS '글 순번'
/

COMMENT ON COLUMN t_board.b_title IS '글 제목'
/

COMMENT ON COLUMN t_board.b_content IS '글 내용'
/

COMMENT ON COLUMN t_board.b_date IS '글 작성일자'
/

COMMENT ON COLUMN t_board.b_file IS '글 첨부파일'
/

COMMENT ON COLUMN t_board.m_id IS '글 작성자'
/

COMMENT ON COLUMN t_board.b_cnt IS '글 조회수'
/

ALTER TABLE t_board
    ADD CONSTRAINT FK_t_board_m_id_t_member_m_id FOREIGN KEY (m_id)
        REFERENCES t_member (m_id)  
/


-- t_member_favs Table Create SQL
CREATE TABLE t_member_favs
(
    m_id          VARCHAR2(20)     NOT NULL, 
    taste_seq     NUMBER(12, 0)    NOT NULL, 
    aroma_seq     NUMBER(12, 0)    NOT NULL, 
    from_seq      NUMBER(12, 0)    NOT NULL, 
    country_cd    VARCHAR2(20)     NOT NULL, 
    beer_seq      NUMBER(12, 0)    NULL   
)
/

COMMENT ON TABLE t_member_favs IS '회원 취향'
/

COMMENT ON COLUMN t_member_favs.m_id IS '회원 아이디'
/

COMMENT ON COLUMN t_member_favs.taste_seq IS '맛 순번'
/

COMMENT ON COLUMN t_member_favs.aroma_seq IS '향 순번'
/

COMMENT ON COLUMN t_member_favs.from_seq IS '맥주 원산지순번'
/

COMMENT ON COLUMN t_member_favs.country_cd IS '국가 코드'
/

COMMENT ON COLUMN t_member_favs.beer_seq IS '추천 맥주 코드'
/

ALTER TABLE t_member_favs
    ADD CONSTRAINT FK_t_member_favs_m_id_t_member FOREIGN KEY (m_id)
        REFERENCES t_member (m_id)  
/

ALTER TABLE t_member_favs
    ADD CONSTRAINT FK_t_member_favs_taste_seq_t_t FOREIGN KEY (taste_seq)
        REFERENCES t_taste (taste_seq)  
/

ALTER TABLE t_member_favs
    ADD CONSTRAINT FK_t_member_favs_aroma_seq_t_a FOREIGN KEY (aroma_seq)
        REFERENCES t_aroma (aroma_seq)  
/

ALTER TABLE t_member_favs
    ADD CONSTRAINT FK_t_member_favs_from_seq_t_fr FOREIGN KEY (from_seq)
        REFERENCES t_from (from_seq)  
/

ALTER TABLE t_member_favs
    ADD CONSTRAINT FK_t_member_favs_country_cd_t_ FOREIGN KEY (country_cd)
        REFERENCES t_country (country_cd)  
/

ALTER TABLE t_member_favs
    ADD CONSTRAINT FK_t_member_favs_beer_seq_t_be FOREIGN KEY (beer_seq)
        REFERENCES t_beer (beer_seq)  
/


