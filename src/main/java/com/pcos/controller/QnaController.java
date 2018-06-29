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
import com.pcos.dao.QnaDao;
import com.pcos.service.QnaService;
import com.pcos.vo.FaqVO;
import com.pcos.vo.QnaVO;
import com.pcos.vo.pageVO;


@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value = "/ask", method = RequestMethod.GET)
	public String ask(Model model) {//1:1
		return "redirect:ask/1";
	}
	@RequestMapping(value = "/ask/{page}", method = RequestMethod.GET)
	public String askIndex(Model model,@PathVariable int page, @RequestParam(value="data",required=false)String data) {//1:1
		
		if(data==null) {
			data="";
		}
		System.out.println(data);
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("rowStart", (page-1)*10+1);//db에서 찾기 시작할 rownum
		map.put("rowEnd", (page-1)*10+1+9);
		map.put("searchData",data);
		
		List<FaqVO>list =this.qnaService.selectAll(map);//테이블에 뿌릴 데이터 10개
		int count = this.qnaService.selectCountAll(data);
		
		System.out.println(count);
		pageVO pagevo =new pageVO(count, page, data);
		
		
		model.addAttribute("code","success");
		model.addAttribute("data",list);
		model.addAttribute("page",pagevo);
		
		
		return "ask.jsp";
	}
	
	//faq/detail/77
		@RequestMapping(value = "/ask/detail/{qnano}", method = RequestMethod.GET)
		public String qnaDetail(Model model,@PathVariable String qnano) {//FAQ select One
			QnaVO qnavo =this.qnaService.selectOne(qnano);
			//System.out.println(qnavo);
			model.addAttribute("code","success");
			model.addAttribute("data",qnavo);
			
			return "askDetail.jsp";
		}
		//faq/detail/77
		@RequestMapping(value = "/ask/detail/{qnavo}", method = RequestMethod.PUT)
		public String qnaDetailUpdate(Model model,@RequestBody QnaVO qnavo) {//
			String contents=qnavo.getReContents();
			contents=contents.replaceAll("\r\n", "<br/>");
			contents=contents.replaceAll("\n", "<br/>");
			contents=contents.replaceAll("&lt;", "<");
			contents=contents.replaceAll("&gt;", ">");
			contents=contents.replaceAll("'", "&apos;");
			contents=contents.replaceAll("\"","&quot;");
			qnavo.setReContents(contents);
			
			
			this.qnaService.update(qnavo);
			return "askDetail.jsp";
		}
		@RequestMapping(value = "/ask/{page}", method = RequestMethod.DELETE)
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
				
				this.qnaService.delete(idx);
			}
			return "redirect:/biz/ask/"+page;
		}
		
}
