package com.kh.onemile.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String grade = (String)request.getSession().getAttribute("grade");
		boolean isAdmin = grade.equals("관리자");
		if(isAdmin) {
			return true;
		}
		else {
			response.sendError(401);//권한 없음 에러 처리
			return false;
		}
	}
}
