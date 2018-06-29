package com.pcos.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.pcos.service.OrderService;
import com.pcos.vo.FaqVO;
import com.pcos.vo.OrderVO;
import com.pcos.vo.P_orderVO;
import com.pcos.vo.pageVO;
@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(Model model) {//주문
		return "redirect:order/1";
	}
	
	@RequestMapping(value = "/order/{page}", method = RequestMethod.GET)
	public String page(Model model,@PathVariable int page,@RequestParam(value="data",required=false) String data) {
		if(data==null) {
			data="";
		}
		System.out.println(data);
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("rowStart", (page-1)*10+1);//db에서 찾기 시작할 rownum
		map.put("rowEnd", (page-1)*10+1+9);
		map.put("searchData",data);
		
		List<P_orderVO>list =this.orderService.selectAll(map);//테이블에 뿌릴 데이터 10개
		int count = this.orderService.selectCount(data);
		
		System.out.println(count);
		pageVO pagevo =new pageVO(count, page, data);
		
		
		model.addAttribute("code","success");
		model.addAttribute("data",list);
		model.addAttribute("page",pagevo);
		return "order.jsp";
	}
	
	
	
	//faq/detail/77
	@RequestMapping(value = "/order/detail/{orderno}", method = RequestMethod.GET)
	public String Detail(Model model,@PathVariable String orderno) {//FAQ select One
		P_orderVO p_ordervo =this.orderService.selectOrderno(orderno);
		List<OrderVO> list =this.orderService.selectProduct(orderno);
		
		model.addAttribute("code","success");
		model.addAttribute("member",p_ordervo);
		model.addAttribute("data", list);
		
		return "orderDetail.jsp";
	}
	//faq/detail/77
	@RequestMapping(value = "/order/detail/{orderno}", method = RequestMethod.PUT)
	public String DetailUpdate(Model model,@PathVariable String orderno) {//FAQ select One
		
		this.orderService.update(orderno);
		return "orderDetail.jsp";
	}
	
	
	
	
		
	
}
