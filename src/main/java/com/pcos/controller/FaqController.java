package com.pcos.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pcos.service.FaqService;
import com.pcos.service.MemberService;
import com.pcos.vo.FaqVO;
import com.pcos.vo.MemberVO;
import com.pcos.vo.pageVO;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	
	/////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faqHome(Model model) {//FAQ
		return "redirect:faq/1";
	}
	
	@RequestMapping(value = "/faq/{page}", method = RequestMethod.GET)
	public String faqIndex(Model model,@PathVariable int page,@RequestParam(value="data",required=false) String data) {//FAQ select all
		if(data==null) {
			data="";
		}
		System.out.println(data);
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("rowStart", (page-1)*10+1);//db에서 찾기 시작할 rownum
		map.put("rowEnd", (page-1)*10+1+9);
		map.put("searchData",data);
		
		List<FaqVO>list =this.faqService.selectAll(map);//테이블에 뿌릴 데이터 10개
		int count = this.faqService.selectCountAll(data);
		
		System.out.println(count);
		pageVO pagevo =new pageVO(count, page, data);
		
		
		model.addAttribute("code","success");
		model.addAttribute("data",list);
		model.addAttribute("page",pagevo);
		return "faq.jsp";
	}
	
	
	@RequestMapping(value = "/faq/{page}", method = RequestMethod.DELETE)
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
			
			this.faqService.delete(Integer.parseInt(idx));
		}
		return "redirect:/biz/faq/"+page;
	}
	
	//faq/detail/77
	@RequestMapping(value = "/faq/detail/{seq}", method = RequestMethod.GET)
	public String faqDetail(Model model,@PathVariable int seq) {//FAQ select One
		FaqVO faqvo =this.faqService.selectOne(seq);
		
		model.addAttribute("code","success");
		model.addAttribute("data",faqvo);
		
		return "faqDetail.jsp";
	}
	//faq/detail/77
	@RequestMapping(value = "/faq/detail/{faqno}", method = RequestMethod.PUT)
	public String faqDetailUpdate(Model model,@RequestBody FaqVO faqvo) {//FAQ select One
		String contents=faqvo.getContents();
		contents=contents.replaceAll("\r\n", "<br/>");
		contents=contents.replaceAll("\n", "<br/>");
		contents=contents.replaceAll("&lt;", "<");
		contents=contents.replaceAll("&gt;", ">");
		contents=contents.replaceAll("'", "&apos;");
		contents=contents.replaceAll("\"","&quot;");
		faqvo.setContents(contents);
		
		String title=faqvo.getTitle();
		title=title.replaceAll("'","&apos;");
		title=title.replaceAll("\"", "&quot;");
		title=title.replaceAll("&lt;", "<");
		title=title.replaceAll("&gt;", ">");
		faqvo.setTitle(title);
		System.out.println(faqvo);
		
		this.faqService.update(faqvo);
		return "faqDetail.jsp";
	}
	
	@RequestMapping(value = "/faqWrite", method = RequestMethod.GET)
	public String faqWrite(Model model) {//FAQ 쓰기
		return "faqWrite.jsp";
	}
	
	@RequestMapping(value = "/faqWrite", method = RequestMethod.POST)
	public String faqWrite(Model model,@RequestBody FaqVO faqvo) {//insert
		
		String contents=faqvo.getContents();
		contents=contents.replaceAll("\r\n", "<br/>");
		contents=contents.replaceAll("\n", "<br/>");
		contents=contents.replaceAll("&lt;", "<");
		contents=contents.replaceAll("&gt;", ">");
		contents=contents.replaceAll("'", "&apos;");
		contents=contents.replaceAll("\"","&quot;");
		faqvo.setContents(contents);
		
		String title=faqvo.getTitle();
		title=title.replaceAll("'","&apos;");
		title=title.replaceAll("\"", "&quot;");
		title=title.replaceAll("&lt;", "<");
		title=title.replaceAll("&gt;", ">");
		faqvo.setTitle(title);
		System.out.println(faqvo);
		
		this.faqService.insert(faqvo);
		return "faqWrite.jsp";
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
		
	
}
