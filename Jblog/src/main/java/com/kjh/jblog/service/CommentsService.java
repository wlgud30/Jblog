package com.kjh.jblog.service;

import java.util.List;

import com.kjh.jblog.vo.CommentsVo;

public interface CommentsService {

	public List<CommentsVo> cmtList(Long postNo); 
	public boolean cmtInsert(CommentsVo vo);
	public boolean cmtDelete(Long cmtNo);

}
