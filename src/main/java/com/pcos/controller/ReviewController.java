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
import com.pcos.service.ReviewService;
import com.pcos.vo.FaqVO;
import com.pcos.vo.ReviewVO;
import com.pcos.vo.pageVO;
@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(Model model) {//상품리뷰
		return "redirect:review/1";
	}
	@RequestMapping(value = "/review/{page}", method = RequestMethod.GET)
	public String faqIndex(Model model,@PathVariable int page,@RequestParam(value="data",required=false) String data) {//FAQ select all
		if(data==null) {
			data="";
		}
		System.out.println(data);
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("rowStart", (page-1)*10+1);//db에서 찾기 시작할 rownum
		map.put("rowEnd", (page-1)*10+1+9);
		map.put("searchData",data);
		
		List<ReviewVO>list =this.reviewService.selectAll(map);//테이블에 뿌릴 데이터 10개
		int count = this.reviewService.selectCount(map);
		
		pageVO pagevo =new pageVO(count, page, data);
		
		
		model.addAttribute("code","success");
		model.addAttribute("data",list);
		model.addAttribute("page",pagevo);
		return "review.jsp";
	}
	
	
	@RequestMapping(value = "/review/{page}", method = RequestMethod.DELETE)
	public String faqDelete(@RequestBody String data, Model model,@PathVariable String page) {//FAQ삭제
		//System.out.println(data);
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
			
			this.reviewService.delete(idx);//gradeno
		}
		return "redirect:/biz/review/"+page;
	}
	
	//faq/detail/77
	@RequestMapping(value = "/review/detail/{gradeno}", method = RequestMethod.GET)
	public String faqDetail(Model model,@PathVariable String gradeno) {//
		ReviewVO reviewvo =this.reviewService.selectOne(gradeno);
		
		model.addAttribute("code","success");
		model.addAttribute("data",reviewvo);
		
		return "reviewDetail.jsp";
	}
	
		
}
