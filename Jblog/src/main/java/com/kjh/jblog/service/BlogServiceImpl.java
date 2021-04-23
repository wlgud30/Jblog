package com.kjh.jblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjh.jblog.repository.BlogDao;
import com.kjh.jblog.vo.BlogVo;

@Service
public class BlogServiceImpl implements BlogService {

	@Autowired
	BlogDao blogDaoImpl;
	
	@Override
	public BlogVo selectBlog(String id) {
		BlogVo vo = blogDaoImpl.selectBlog(id);
		return vo;
	}

	@Override
	public boolean createBlog(BlogVo vo) {
		int result = blogDaoImpl.blogInsert(vo);
		
		return result==1;
	}

	@Override
	public boolean modifyBlog(BlogVo vo) {
		int result = blogDaoImpl.blogUpdate(vo);
		return result==1;
	}

}
