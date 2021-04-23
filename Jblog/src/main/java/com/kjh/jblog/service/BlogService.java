package com.kjh.jblog.service;

import com.kjh.jblog.vo.BlogVo;

public interface BlogService {

	public BlogVo selectBlog(String id);		//블로그 보기
	public boolean createBlog(BlogVo vo);			//블로그 추가
	public boolean modifyBlog(BlogVo vo);			//블로그 내용 수정
}
