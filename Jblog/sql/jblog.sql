CREATE TABLE users(
    userNo NUMBER ,
    id varchar2(50) NOT NULL,
    userName varchar2(100) NOT NULL,
    password varchar2(50) NOT NULL,
    joinDate date NOT NULL,
    PRIMARY KEY(userNo)
);

CREATE TABLE blog(
    userNo NUMBER,
    blogTitle varchar2(200) NOT NULL,
    logoFile varchar2(200),
    PRIMARY KEY(userNo),FOREIGN KEY(userNo) REFERENCES users
);

CREATE TABLE category(
    cateNo number,
    userNo number,
    cateName varchar2(200) NOT NULL,
    description varchar2(500),
    regDate date NOT NULL,
    PRIMARY KEY (cateNo),FOREIGN KEY(userNo) REFERENCES blog
);

CREATE TABLE post(
    postNo number,
    cateNo number,
    postTitle varchar2(300) NOT NULL,
    postContent varchar2(4000) NOT NULL,
    regDate date NOT NULL,
    PRIMARY KEY (postNo),FOREIGN KEY(cateNo) REFERENCES category
);

CREATE TABLE comments(
    cmtNo number,
    postNo number,
    userNo number,
    cmtContent varchar2(1000) NOT NULL,
    regDate date NOT NULL,
    PRIMARY KEY (cmtNo), 
    FOREIGN KEY(postNo) REFERENCES post,
    FOREIGN KEY(userNo) REFERENCES users
);

CREATE SEQUENCE seq_users_pk
    START WITH 1
increment by 1
nocache;

CREATE SEQUENCE seq_blog_pk
    START WITH 1
increment by 1
nocache;

CREATE SEQUENCE seq_category_pk
    START WITH 1
increment by 1
nocache;

CREATE SEQUENCE seq_post_pk
    START WITH 1
increment by 1
nocache;

CREATE SEQUENCE seq_comments_pk
    START WITH 1
increment by 1
nocache;

commit;

select * from tab;

