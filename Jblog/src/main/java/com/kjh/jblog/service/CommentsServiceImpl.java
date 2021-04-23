package com.kjh.jblog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjh.jblog.repository.CommentsDao;
import com.kjh.jblog.vo.CommentsVo;

@Service
public class CommentsServiceImpl implements CommentsService {
	
	@Autowired
	CommentsDao cmtDao;

	@Override
	public List<CommentsVo> cmtList(Long postNo) {
		List<CommentsVo> list = cmtDao.cmtList(postNo);
		return list;
	}

	@Override
	public boolean cmtInsert(CommentsVo vo) {
		int result = cmtDao.cmtInsert(vo);
		return result==1;
	}

	@Override
	public boolean cmtDelete(Long cmtNo) {
		int result = cmtDao.cmtDelete(cmtNo);
		return result==1;
	}

}
