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



-- jblog 계정 생성: system 계정에서 수행
-- create user jblog identified by jblog;
-- grant resource, connect to jblog;

-- 테이블 삭제
drop table comments;
drop table post;
drop table category;
drop table blog;
drop table users;

-- 시퀀스 삭제
drop sequence seq_users_no;
drop sequence seq_category_no;
drop sequence seq_post_no;
drop sequence seq_comments_no;

-- 시퀀스 생성
CREATE SEQUENCE seq_users_no
INCREMENT BY 1
START WITH 1 
NOCACHE ;

CREATE SEQUENCE seq_category_no
INCREMENT BY 1
START WITH 1 
NOCACHE ;

CREATE SEQUENCE seq_post_no 
INCREMENT BY 1
START WITH 1 
NOCACHE ;


CREATE SEQUENCE seq_comments_no
INCREMENT BY 1
START WITH 1 
NOCACHE ;

-- 테이블 생성
CREATE TABLE users (
  userNo    NUMBER,
  id	    VARCHAR2(50) 	NOT NULL Unique,
  userName  VARCHAR2(100) 	NOT NULL,
  password  VARCHAR2(50) 	NOT NULL,
  joinDate  DATE 	        NOT NULL,
  PRIMARY KEY(userNo)
);

CREATE TABLE blog (
  userNo    NUMBER,
  blogTitle	VARCHAR2(200) 	NOT NULL,
  logoFile  VARCHAR2(200),
  PRIMARY KEY(userNo),
  CONSTRAINT c_blog_fk FOREIGN KEY (userNo)
  REFERENCES users(userNo)
);

CREATE TABLE category (
  cateNo        NUMBER,
  userNo        NUMBER,  
  cateName	    VARCHAR2(200) 	NOT NULL,
  description    VARCHAR2(500),
  regDate       DATE            NOT NULL,
 
  PRIMARY KEY(cateNo),
  CONSTRAINT c_category_fk FOREIGN KEY (userNo)
  REFERENCES blog(userNo)
);

CREATE TABLE post (
  postNo        NUMBER,
  cateNo        NUMBER,  
  postTitle	    VARCHAR2(300) 	NOT NULL,
  postContent   VARCHAR2(4000),
  regDate       DATE            NOT NULL,
  PRIMARY KEY(postNo),
  CONSTRAINT c_post_fk FOREIGN KEY (cateNo)
  REFERENCES category(cateNo)
);

CREATE TABLE comments (
  cmtNo         NUMBER,
  postNo            NUMBER,
  userNo    NUMBER,
  cmtContent	VARCHAR2(300) 	NOT NULL,
  regDate           DATE            NOT NULL,
  PRIMARY KEY(cmtNo),
  CONSTRAINT c_comment_fk FOREIGN KEY (postNo)
  REFERENCES post(postNo),
  CONSTRAINT c_comment_fk2 FOREIGN KEY (userNo)
  REFERENCES users(userNo)
);

INSERT INTO users(userNo,id,userName,password,joinDate) values(seq_users_no.nextval,'wlgud30','강지형','wlgud12',sysdate);
INSERT INTO category(cateNo,userNo,cateName,description,regDate) values(seq_category_no.nextval,33,'a','aa',sysdate);
INSERT INTO post(postNo,cateNo,postTitle,postContent,regDate) values(seq_post_no.nextval,3,'post2','post content2',sysdate);
INSERT INTO comments(cmtNo,postNo,userNo,cmtContent,regDate) values(seq_comments_no.nextval,1,34,'cmt222222',sysdate);
SELECT 
				cateNo,userNo,cateName,description,regDate
			FROM
				category
			WHERE
				userNo = 33
			ORDER BY
				regDate;

UPDATE
				blog
			SET
				blogTitle='강지형의 블로그 입니다.',logoFile=''
			WHERE
				userNo = 33;

delete from users;
delete from blog;
delete from category;

commit;

select * from users;
select * from blog;
select * from category;
select * from post;
select * from comments;

select c.cateNo,cateName,nvl(cnt,0) as cnt,description 
from category c left join (select count(*) cnt ,cateNo  from post where cateNo is not null group by cateNo) b
on c.cateNo = b.cateNo ;
select nvl(c.count,0) from (select count(*) count  from post where cateNo = 4 group by cateNo) c;
select count(*) count  from post where cateNo = 4 group by cateNo;
SELECT 
				c.cateNo,cateName,nvl(cnt,0) as cnt,description,c.regDate
			FROM 
				category c 
			LEFT JOIN 
				(
				SELECT
					count(*) cnt ,cateNo  
				FROM 
					post 
				WHERE 
					cateNo is not null 
				GROUP BY
					cateNo
				) b
			ON 
				c.cateNo = b.cateNo
            WHERE
                c.userNo = 33
			ORDER BY
				c.regDate;

select count(*) as cnt,cateNo from post group by cateNo;

SELECT B.userNo,blogTitle,logoFile,C.userNo,cateName
FROM
	blog b , category c
WHERE
    b.userNo = c.userNo
AND
    b.userNo = 33;

select * from user_sys_privs;

grant connect,resource to c##jblog;
SELECT seq_users_no.currval FROM dual ;
commit;

alter user c##jblog quota unlimited on blog;

SELECT * FROM POST;


    
SELECT
    *
FROM
    post
WHERE
    postNo = '1';
SELECT
				postTitle,regDate
			FROM
				post
			WHERE
				cateNo = 3;

SELECT 
				COUNT(*)
			FROM
				users
			WHERE
				id = 'wlgud30';


SELECT 
    *
FROM
    category a left join post b
on
    a.cateNo  = b.cateNO 
where
    userNo = 33;
    
SELECT 
    *
FROM
    category a
WHERE
    userNo = 33;
    
SELECT 
				cmtNo,postNo,cmt.userNo,cmtContent,regDate,userName
			FROM
				comments cmt, users u
			WHERE
                cmt.userNo = u.userNo
            AND
				postNo = 1;
                
SELECT 
    cateNo
FROM
    post
WHERE
    postNo = 1;

