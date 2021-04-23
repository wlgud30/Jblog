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