package com.pcos.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle (HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("auth......................");
		HttpSession session = request.getSession();
		if(session.getAttribute("login")== null) {
			response.sendRedirect("/biz/home");
			return false;
		}
		return true;
	}
}
