package com.kjh.jblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjh.jblog.repository.UsersDao;
import com.kjh.jblog.vo.UserVo;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	UsersDao usersDao;
	
	
	
	@Override
	public UserVo login(String id, String pw) {
		UserVo vo = usersDao.login(id, pw);
		return vo;
	}

	@Override
	public boolean idCheck(String id) {
		int result = usersDao.idCheck(id);
		return result==0;		//true 사용가능 false 사용불가능
	}

	@Override
	public boolean userInsert(UserVo vo) {
		int result = usersDao.insert(vo);
		
		return result==1;
	}

	
	@Override 
	public Long selectUserNo(String id) { 
		Long userNo = usersDao.selectUserNo(id); 
		return userNo;
	}

	@Override
	public String selectId(Long userNo) {
		String id = usersDao.selectId(userNo);
		return id;
	}
	 

}
