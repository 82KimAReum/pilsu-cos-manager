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
import com.pcos.service.SalesService;
import com.pcos.vo.FaqVO;
import com.pcos.vo.ProductVO;
import com.pcos.vo.SalesVO;
import com.pcos.vo.pageVO;

@Controller
public class SalesController {
	@Autowired
	private SalesService salesService;
	
	@RequestMapping(value = "/sales", method = RequestMethod.GET)
	public String sales(Model model) {//매출관리
		return "redirect:sales/1";
	}
	
	@RequestMapping(value = "/sales/{page}", method = RequestMethod.GET)
	public String faqIndex(Model model,
							@PathVariable int page
							,@RequestParam(value="data",required=false) String data
							,@RequestParam(value="sd",required=false)String sd
							,@RequestParam(value="ed",required=false)String ed
							) {
		if(data==null||data.length()==0||data.equals("")) {
			data=null;
		}if(sd==null|| sd.length()==0 ||sd.equals("")) {
			sd=null;
		}if(ed==null|| ed.length()==0 ||ed.equals("")) {
			ed=null;
		}
		
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("rowStart", (page-1)*10+1);//db에서 찾기 시작할 rownum
		map.put("rowEnd", (page-1)*10+1+9);
		map.put("searchData",data);//productcode
		map.put("startDate", sd);
		map.put("endDate", ed);
		
		
		
		List<SalesVO>list =this.salesService.selectAll(map);//테이블에 뿌릴 데이터 10개
		
		Map allProfit=this.salesService.selectCount(map);//총 판매량,총 판매액
		int count =(Integer) allProfit.get("count");
		pageVO pagevo =new pageVO(count, page, data);
		List<ProductVO>product=this.salesService.selectcode();//select box에 들어갈  제품 정보들
		
		model.addAttribute("code","success");
		model.addAttribute("data",list);
		model.addAttribute("page",pagevo);
		model.addAttribute("product", product);
		model.addAttribute("profit", allProfit);
		return "sales.jsp";
	}
	
	
		
}
