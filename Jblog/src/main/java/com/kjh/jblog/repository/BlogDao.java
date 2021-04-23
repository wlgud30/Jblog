package com.kjh.jblog.repository;

import com.kjh.jblog.vo.BlogVo;

public interface BlogDao {
	
	public BlogVo selectBlog(String id);
	public int blogInsert(BlogVo vo);
	public int blogUpdate(BlogVo vo);

}
