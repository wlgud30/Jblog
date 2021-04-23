package com.kjh.jblog.repository;

import com.kjh.jblog.vo.UserVo;

public interface UsersDao {

	public UserVo login(String id,String pw);	//로그인
	public int idCheck(String id);				//id중복체크
	public int insert(UserVo vo);
	public Long selectUserNo(String id);
	public String selectId(Long userNo);
	
}
