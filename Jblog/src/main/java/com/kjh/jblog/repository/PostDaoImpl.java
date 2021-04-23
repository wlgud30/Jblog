package com.kjh.jblog.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kjh.jblog.vo.PostVo;

@Repository
public class PostDaoImpl implements PostDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PostVo> postList(Long cateNo) {
		List<PostVo> list = sqlSession.selectList("post.postList", cateNo);
		return list;
	}

	@Override
	public int createPost(PostVo vo) {
		int result = sqlSession.insert("post.insert", vo);
		return result;
	}

	@Override
	public PostVo selectPost(Long postNo) {
		PostVo vo = sqlSession.selectOne("post.postOne", postNo);
		return vo;
	}

	@Override
	public PostVo selectCount(Long cateNo,Long userNo) {
		Map<String,Long> map = new HashMap<>();
		map.put("cateNo",cateNo);
		map.put("userNo", userNo);
		PostVo vo = sqlSession.selectOne("post.selectCount", map);
		return vo;
	}

}
