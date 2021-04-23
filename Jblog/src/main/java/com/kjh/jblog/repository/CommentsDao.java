package com.kjh.jblog.repository;

import java.util.List;

import com.kjh.jblog.vo.CommentsVo;

public interface CommentsDao {
	
	public List<CommentsVo> cmtList(Long postNo); 
	public int cmtInsert(CommentsVo vo);
	public int cmtDelete(Long cmtNo);

}
