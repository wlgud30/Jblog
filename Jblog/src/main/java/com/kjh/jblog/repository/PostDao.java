package com.kjh.jblog.repository;

import java.util.List;

import com.kjh.jblog.vo.PostVo;

public interface PostDao {

	public List<PostVo> postList(Long cateNo);
	public PostVo selectPost(Long postNo);
	public int createPost(PostVo vo);
	public PostVo selectCount(Long cateNo,Long userNo);
	
}
