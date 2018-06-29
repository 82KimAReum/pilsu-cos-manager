package com.pcos.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pcos.service.CommunityService;
import com.pcos.service.MemberService;
import com.pcos.service.OrderService;
import com.pcos.service.QnaService;
import com.pcos.service.ReviewService;
import com.pcos.vo.CommunityVO;
import com.pcos.vo.FaqVO;
import com.pcos.vo.MemberVO;
import com.pcos.vo.P_orderVO;
import com.pcos.vo.ReviewVO;
import com.pcos.vo.pageVO;
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private CommunityService communityService;
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String Home(Model model) {//FAQ
		return "redirect:member/1";
	}
	
	@RequestMapping(value = "/member/{page}", method = RequestMethod.GET)
	public String Index(Model model,@PathVariable int page,@RequestParam(value="data",required=false) String data) {//FAQ select all
		if(data==null) {
			data="";
		}
		System.out.println(data);
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("rowStart", (page-1)*10+1);//db에서 찾기 시작할 rownum
		map.put("rowEnd", (page-1)*10+1+9);
		map.put("searchData",data);
		
		List<MemberVO>list =this.memberService.selectAll(map);//테이블에 뿌릴 데이터 10개
		int count = this.memberService.selectCountAll(data);//email
		
		System.out.println(count);
		pageVO pagevo =new pageVO(count, page, data);
		
		
		model.addAttribute("code","success");
		model.addAttribute("data",list);
		model.addAttribute("page",pagevo);
		return "member.jsp";
	}
	
	
	@RequestMapping(value = "/member/{page}", method = RequestMethod.DELETE)
	public String Delete(@RequestBody String data, Model model,@PathVariable String page) {//FAQ삭제
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = new HashMap<String, Object>();

		// convert JSON string to Map
		try {
			map = mapper.readValue(data, new TypeReference<Map<String, String>>(){});
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String[] list= ((String)map.get("array")).split(",");
		
		for (String idx: list) {
			
			//this.memberService.delete(idx);
			this.memberService.update(idx);
		}
		return "redirect:/biz/member/"+page;
	}
	
	//faq/detail/77
	@RequestMapping(value = "/member/detail/{email}", method = RequestMethod.GET)
	public String Detail(Model model,@PathVariable String email,HttpServletRequest request) {//FAQ select One
		
		String uri=request.getRequestURI();
		email=uri.split("/")[4];//email에 .이 들어가 못읽으므로 자체 url로 찾음
		MemberVO membervo =this.memberService.selectOne(email);
		System.out.println(email);
		model.addAttribute("code","success");
		model.addAttribute("data",membervo);
		System.out.println(membervo);
		return "memberDetail.jsp";
	}
	@RequestMapping(value = "/member/detail/{email}/order/{page}", method = RequestMethod.GET)
	public String Detailorder(Model model,@PathVariable String email,HttpServletRequest request,@PathVariable int page) {//FAQ select One
		
		String uri=request.getRequestURI();
		email=uri.split("/")[4];//email에 .이 들어가 못읽으므로 자체 url로 찾음
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("rowStart", (page-1)*10+1);//db에서 찾기 시작할 rownum
		map.put("rowEnd", (page-1)*10+1+9);
		map.put("searchData",email);
		
		List<P_orderVO>list =this.orderService.selectOne(map);//테이블에 뿌릴 데이터 10개
		int count = this.orderService.selectOneCount(email);
		
		System.out.println(count);
		pageVO pagevo =new pageVO(count, page, email);
		//System.out.println(pagevo);
		
		model.addAttribute("code","success");
		model.addAttribute("data",list);
		model.addAttribute("page",pagevo);
		model.addAttribute("email", email);
		return "memberDetail_order.jsp";
	}
	@RequestMapping(value = "/member/detail/{email}/review/{page}", method = RequestMethod.GET)
	public String detailReview(Model model,@PathVariable int page,@PathVariable String email,HttpServletRequest request) {
		String uri=request.getRequestURI();
		email=uri.split("/")[4];//email에 .이 들어가 못읽으므로 자체 url로 찾음
		
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("rowStart", (page-1)*10+1);//db에서 찾기 시작할 rownum
		map.put("rowEnd", (page-1)*10+1+9);
		map.put("searchData",email);
		
		List<ReviewVO>list =this.reviewService.selectEmail(map);//테이블에 뿌릴 데이터 10개
		int count = this.reviewService.selectCountEmail(map);
		
		pageVO pagevo =new pageVO(count, page, email);
		
		
		model.addAttribute("code","success");
		model.addAttribute("data",list);
		model.addAttribute("page",pagevo);
		model.addAttribute("email", email);
		return "memberDetail_review.jsp";
	}
	@RequestMapping(value = "/member/detail/{email}/board/{page}", method = RequestMethod.GET)
	public String detailCommunity(Model model,@PathVariable int page,@PathVariable String email,HttpServletRequest request) {//FAQ select all
		String uri=request.getRequestURI();
		email=uri.split("/")[4];//email에 .이 들어가 못읽으므로 자체 url로 찾음
		
		
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("rowStart", (page-1)*10+1);//db에서 찾기 시작할 rownum
		map.put("rowEnd", (page-1)*10+1+9);
		map.put("searchData",email);
		
		List<CommunityVO>list =this.communityService.selectEmail(map);//테이블에 뿌릴 데이터 10개
		int count = this.communityService.selectCountEmail(email);
		
		pageVO pagevo =new pageVO(count, page, email);
		
		
		model.addAttribute("code","success");
		model.addAttribute("data",list);
		model.addAttribute("page",pagevo);
		model.addAttribute("email", email);
		return "memberDetail_board.jsp";
	}
	@RequestMapping(value = "/member/detail/{email}/qna/{page}", method = RequestMethod.GET)
	public String askIndex(Model model,@PathVariable int page,@PathVariable String email,HttpServletRequest request) {//1:1
		String uri=request.getRequestURI();
		email=uri.split("/")[4];//email에 .이 들어가 못읽으므로 자체 url로 찾음
		
		
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("rowStart", (page-1)*10+1);//db에서 찾기 시작할 rownum
		map.put("rowEnd", (page-1)*10+1+9);
		map.put("searchData",email);
		
		List<FaqVO>list =this.qnaService.selectEmail(map);//테이블에 뿌릴 데이터 10개
		int count = this.qnaService.selectCountEmail(email);
		
		System.out.println(count);
		pageVO pagevo =new pageVO(count, page, email);
		
		
		model.addAttribute("code","success");
		model.addAttribute("data",list);
		model.addAttribute("page",pagevo);
		model.addAttribute("email", email);	
		return "memberDetail_qna.jsp";
	}
	
	
	
	
	//faq/detail/77
	@RequestMapping(value = "/member/detail/{email}", method = RequestMethod.PUT)
	public String DetailUpdate(Model model,HttpServletRequest request) {//FAQ select One
		String email=request.getRequestURI();
		email=email.split("/")[4];
		
		System.out.println("data:   "+email);
		this.memberService.updateActive(email);
		return "memberDetail.jsp";
	}
	
	
}
