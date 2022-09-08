-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

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

COMMENT ON TABLE t_from IS '���� ������'
/

COMMENT ON COLUMN t_from.from_seq IS '������ ����'
/

COMMENT ON COLUMN t_from.from_source IS '������ ��'
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

COMMENT ON TABLE t_aroma IS '���� ��'
/

COMMENT ON COLUMN t_aroma.aroma_seq IS '�� ����'
/

COMMENT ON COLUMN t_aroma.aroman_name IS '�� �̸�'
/


-- t_country Table Create SQL
CREATE TABLE t_country
(
    country_cd      VARCHAR2(20)    NOT NULL, 
    country_name    VARCHAR2(60)    NOT NULL, 
     PRIMARY KEY (country_cd)
)
/

COMMENT ON TABLE t_country IS '����'
/

COMMENT ON COLUMN t_country.country_cd IS '���� �ڵ�'
/

COMMENT ON COLUMN t_country.country_name IS '���� ��'
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

COMMENT ON TABLE t_taste IS '��'
/

COMMENT ON COLUMN t_taste.taste_seq IS '�� ����'
/

COMMENT ON COLUMN t_taste.taste_name IS '�� �̸�'
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

COMMENT ON TABLE t_member IS 'ȸ�� ����'
/

COMMENT ON COLUMN t_member.m_id IS 'ȸ�� ���̵�'
/

COMMENT ON COLUMN t_member.m_pw IS 'ȸ�� ��й�ȣ'
/

COMMENT ON COLUMN t_member.m_name IS 'ȸ�� ����'
/

COMMENT ON COLUMN t_member.m_birthdate IS 'ȸ�� �������'
/

COMMENT ON COLUMN t_member.m_gender IS 'ȸ�� ����'
/

COMMENT ON COLUMN t_member.m_email IS 'ȸ�� �̸���'
/

COMMENT ON COLUMN t_member.m_joindate IS 'ȸ�� ��������'
/

COMMENT ON COLUMN t_member.type IS 'ȸ�� ����'
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

COMMENT ON TABLE t_beer IS '����'
/

COMMENT ON COLUMN t_beer.beer_seq IS '���� ����'
/

COMMENT ON COLUMN t_beer.beer_name IS '���� �̸�'
/

COMMENT ON COLUMN t_beer.beer_score IS '���� ����'
/

COMMENT ON COLUMN t_beer.beer_ml IS '���� �뷮'
/

COMMENT ON COLUMN t_beer.beer_abv IS '���� ���ݵ���'
/

COMMENT ON COLUMN t_beer.from_seq IS '���� ����������'
/

COMMENT ON COLUMN t_beer.aroma_seq IS '���� �����'
/

COMMENT ON COLUMN t_beer.country_cd IS '���� �ڵ�'
/

COMMENT ON COLUMN t_beer.taste_seq IS '���� ������'
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

COMMENT ON TABLE t_board IS '�Խ���'
/

COMMENT ON COLUMN t_board.b_seq IS '�� ����'
/

COMMENT ON COLUMN t_board.b_title IS '�� ����'
/

COMMENT ON COLUMN t_board.b_content IS '�� ����'
/

COMMENT ON COLUMN t_board.b_date IS '�� �ۼ�����'
/

COMMENT ON COLUMN t_board.b_file IS '�� ÷������'
/

COMMENT ON COLUMN t_board.m_id IS '�� �ۼ���'
/

COMMENT ON COLUMN t_board.b_cnt IS '�� ��ȸ��'
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

COMMENT ON TABLE t_member_favs IS 'ȸ�� ����'
/

COMMENT ON COLUMN t_member_favs.m_id IS 'ȸ�� ���̵�'
/

COMMENT ON COLUMN t_member_favs.taste_seq IS '�� ����'
/

COMMENT ON COLUMN t_member_favs.aroma_seq IS '�� ����'
/

COMMENT ON COLUMN t_member_favs.from_seq IS '���� ����������'
/

COMMENT ON COLUMN t_member_favs.country_cd IS '���� �ڵ�'
/

COMMENT ON COLUMN t_member_favs.beer_seq IS '��õ ���� �ڵ�'
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


