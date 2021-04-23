package com.kjh.jblog.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kjh.jblog.vo.BlogVo;

@Repository
public class BlogDaoImpl implements BlogDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public BlogVo selectBlog(String id) {
		BlogVo vo = sqlSession.selectOne("blog.selectBlog", id);
		return vo;
	}

	@Override
	public int blogInsert(BlogVo vo) {
		int result = sqlSession.insert("blog.insert", vo);
		return result;
	}

	@Override
	public int blogUpdate(BlogVo vo) {
		int result = sqlSession.update("blog.update", vo);
		return result;
	}

}
