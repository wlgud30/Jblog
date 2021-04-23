package com.kjh.jblog.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kjh.jblog.vo.UserVo;


public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private static Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.debug("AuthInterceptor");
		//세션 확인(로그인 체크)
		HttpSession session = request.getSession();
		UserVo authUser = null;
		
		//세션 객체 얻어오기
		if(session != null) {
			authUser = (UserVo) session.getAttribute("authUser");
		}
		
		if(authUser == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}
		
		return true;
	}

	
}
