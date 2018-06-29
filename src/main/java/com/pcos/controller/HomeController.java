package com.pcos.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pcos.vo.AdminVO;
import com.pcos.vo.LoginVO;

@Controller
public class HomeController {

	@RequestMapping({"/home","/"})
	public String index(Model model,HttpSession session) {
		if(null!=session.getAttribute("login")) {
			return "logout.jsp";
		}
		return "index.jsp";
	}
	/*@RequestMapping(value="/login")
	public String login(Model model) {
		return "login.jsp";
	}
	@RequestMapping(value="/logout")
	public String logout(Model model) {
		return "logout.jsp";
	}*/
	@RequestMapping(value="/home/logout" ,method=RequestMethod.POST)
	public String logout(LoginVO dao,HttpSession session,Model model)throws Exception{
		if(session.getAttribute("login")!= null) {
			session.removeAttribute("login");
		}
		return "redirect:/home";
	}
	
	@RequestMapping(value="/home/login" ,method=RequestMethod.POST)
	public String login(LoginVO dao,HttpSession session,Model model)throws Exception{
		AdminVO adminvo=new AdminVO();
		System.out.println(dao.toString());
		boolean idTure= dao.getUid().equals(adminvo.getUid());
		boolean pwdTure=dao.getUpw().equals(adminvo.getUpw());
		
		if(!idTure || !pwdTure) {
			System.out.println("로그인 실패");
			return  "index.jsp";
		}
		model.addAttribute("adminvo",adminvo );
		System.out.println("로그인 성공");
		return "loginPost.jsp";
	}
}
