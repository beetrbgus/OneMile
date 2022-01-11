package com.kh.onemile.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class MemberInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean isLogin = request.getSession().getAttribute("logNo") != null;
		if(isLogin) {
			return true;
		}
		else {
			response.sendRedirect(request.getContextPath()+"/member/login");//로그인 페이지
			return false;
		}
	}
}
