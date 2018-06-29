package com.pcos.interceptor;

import java.lang.reflect.Method;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;





public class SampleInterceptor extends HandlerInterceptorAdapter{
	public void postHandle(HttpServletRequest request, HttpServletResponse response,Object handler, ModelAndView modelAndView)throws Exception{
		System.out.println("post handle..........");
		HttpSession session= request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object adminvo= modelMap.get("adminvo");
		if(adminvo!= null) {
			session.setAttribute("login", adminvo);
			response.sendRedirect("/biz/order");
			System.out.println("adminvo는 널이아니다");
		}
		System.out.println("postHandle");
		
	}
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler)throws Exception{
		System.out.println("pre handle................");
		HttpSession session = request.getSession();
		if(session.getAttribute("login")!= null) {
			session.removeAttribute("login");
		}
		return true;
	}
}
