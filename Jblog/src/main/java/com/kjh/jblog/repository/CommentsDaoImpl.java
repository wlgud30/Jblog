package com.kjh.jblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kjh.jblog.vo.CommentsVo;

@Repository
public class CommentsDaoImpl implements CommentsDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<CommentsVo> cmtList(Long postNo) {
		List<CommentsVo> list = sqlSession.selectList("cmt.cmtList", postNo);
		return list;
	}

	@Override
	public int cmtInsert(CommentsVo vo) {
		int result = sqlSession.insert("cmt.insert", vo);
		return result;
	}

	@Override
	public int cmtDelete(Long cmtNo) {
		int result = sqlSession.delete("cmt.delete", cmtNo);
		return result;
	}

}
