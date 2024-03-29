SHOW DATABASES;
USE APP;
CREATE TABLE USER (
    ID_USER INT PRIMARY KEY,
    NAME VARCHAR(255),
    EMAIL VARCHAR(255),
    PASSWORD_HASH VARCHAR(255),
    ID_ACCESS_LEVEL INT,
    TICKET INT
);

CREATE TABLE ACCESS_LEVELS (
    ID_ACCESS_LEVEL INT PRIMARY KEY,
    LEVEL_NAME VARCHAR(255)
);

CREATE TABLE PAGES (
    ID_PAGE INT PRIMARY KEY,
    PAGE_NAME VARCHAR(255),
    PAGE_URL VARCHAR(255),
    PARENT_ID INT 
);

CREATE TABLE PAGE_ACCESS (
    ACCESS_LEVEL_ID INT,
    PAGE_ID INT,
    PRIMARY KEY (ACCESS_LEVEL_ID, PAGE_ID),
    FOREIGN KEY (ACCESS_LEVEL_ID) REFERENCES ACCESS_LEVELS(ID_ACCESS_LEVEL),
    FOREIGN KEY (PAGE_ID) REFERENCES PAGES(ID_PAGE)
);
CREATE TABLE FAQ (
    ID_FAQ INT PRIMARY KEY,
    ID_CREATOR INT,
    ANSWER VARCHAR(255),
    FOREIGN KEY (ID_CREATOR) REFERENCES USER(ID_USER)
);

CREATE TABLE QUESTION (
    ID_QUESTION INT PRIMARY KEY,
    CONTENT VARCHAR(255),
    ID_FAQ INT,
    FOREIGN KEY (ID_FAQ) REFERENCES FAQ(ID_FAQ)
);



CREATE TABLE MEETINGS (
    ID_MEETING INT PRIMARY KEY,
    ID_ORGANIZER INT,
    DATE DATE,
    HOUR TIME,
    ADDRESS VARCHAR(255),
    MEETING_DESCRIPTION VARCHAR(255),
    FOREIGN KEY (ID_ORGANIZER) REFERENCES USER(ID_USER)
);

CREATE TABLE USER_MEETINGS (
    ID_USER INT,
    ID_MEETING INT,
    PRIMARY KEY (ID_USER, ID_MEETING),
    FOREIGN KEY (ID_USER) REFERENCES USER(ID_USER),
    FOREIGN KEY (ID_MEETING) REFERENCES MEETINGS(ID_MEETING)
);

CREATE TABLE SENSOR (
    ID_SENSOR INT PRIMARY KEY,
    OWNER_ID INT,
    FOREIGN KEY (OWNER_ID) REFERENCES USER(ID_USER)
);

CREATE TABLE PLAY_LIST (
    ID_PLAY_LIST INT PRIMARY KEY,
    NAME VARCHAR(255),
    ID_CREATOR INT,
    FOREIGN KEY (ID_CREATOR) REFERENCES USER(ID_USER)
);

CREATE TABLE MUSIC_TRACKS (
    ID_TRACK INT PRIMARY KEY,
    TITLE VARCHAR(255),
    ARTIST VARCHAR(255),
    DURATION TIME
);

CREATE TABLE PLAY_LIST_TRACKS (
    ID_PLAY_LIST INT,
    ID_TRACK INT,
    PRIMARY KEY (ID_PLAY_LIST, ID_TRACK),
    FOREIGN KEY (ID_PLAY_LIST) REFERENCES PLAY_LIST(ID_PLAY_LIST),
    FOREIGN KEY (ID_TRACK) REFERENCES MUSIC_TRACKS(ID_TRACK)
);
