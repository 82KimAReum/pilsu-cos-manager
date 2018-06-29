package com.pcos.controller;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.text.html.HTMLDocument.HTMLReader.CharacterAction;

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
import com.pcos.service.ProductService;
import com.pcos.vo.FaqVO;
import com.pcos.vo.ProductVO;
import com.pcos.vo.pageVO;

@Controller
public class ProductController {
@Autowired
private ProductService productService;


	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Model model) {//상품관리
		return "redirect:product/1";
	}
	@RequestMapping(value = "/product/{page}", method = RequestMethod.GET)
	public String Index(Model model,@PathVariable int page,@RequestParam(value="data",required=false) String data) {//FAQ select all
		if(data==null) {
			data="";
		}
		System.out.println(data);
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("rowStart", (page-1)*10+1);//db에서 찾기 시작할 rownum
		map.put("rowEnd", (page-1)*10+1+9);
		map.put("searchData",data);
		
		List<ProductVO>list =this.productService.selectAll(map);//테이블에 뿌릴 데이터 10개
		int count = this.productService.selectCountAll(data);
		
		//System.out.println(count);
		pageVO pagevo =new pageVO(count, page, data);
		
		
		model.addAttribute("code","success");
		model.addAttribute("data",list);
		model.addAttribute("page",pagevo);
		return "product.jsp";
	}
	
	
	@RequestMapping(value = "/product/{page}", method = RequestMethod.DELETE)
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
			
			this.productService.delete(idx);//상품코드
		}
		return "redirect:/biz/product/"+page;
	}
	
	//faq/detail/77
	@RequestMapping(value = "/product/detail/{code}", method = RequestMethod.GET)
	public String Detail(Model model,@PathVariable String code) {//product select One
		ProductVO productvo =this.productService.selectOne(code);
		
		model.addAttribute("code","success");
		model.addAttribute("data",productvo);
		
		return "productDetail.jsp";
	}
	//faq/detail/77
	@RequestMapping(value = "/product/detail/{code}", method = RequestMethod.PUT)
	public String DetailUpdate(Model model,@RequestBody ProductVO productvo) {//product update
		String productdesc=productvo.getProductdesc();
		productdesc=encoding(productdesc);
		productvo.setProductdesc(productdesc);
		
		String productname=productvo.getProductname();
		productname=encoding(productname);
		productvo.setProductname(productname);
		
		this.productService.update(productvo);
		return "productDetail.jsp";
	}
	public String encoding(String str) {
		String temp=str;
		temp=temp.replaceAll("\r\n", "<br/>");
		temp=temp.replaceAll("\n", "<br/>");
		temp=temp.replaceAll("&lt;", "<");
		temp=temp.replaceAll("&gt;", ">");
		temp=temp.replaceAll("'", "&apos;");
		temp=temp.replaceAll("\"","&quot;");
		return temp;
	}
	
	@RequestMapping(value = "/productWrite", method = RequestMethod.GET)
	public String Write(Model model) {//상품추가 페이지
		return "productWrite.jsp";
	}
	
	@RequestMapping(value = "/productWrite", method = RequestMethod.POST)
	public String Write(Model model,@RequestBody ProductVO productvo) {//insert
		//System.out.println("His");
		System.out.println("gender"+productvo.getGender());
		//productcode,productname,productdesc,price,capacity,image,categorycode,brandcode
		String brandcode=productvo.getBrandcode();
		System.out.println(brandcode);
		String categorycode=productvo.getCategorycode();
		System.out.println(categorycode);
		Map<String,String> map=new HashMap<String, String>();
		map.put("brandcode", brandcode);
		map.put("categorycode", categorycode);
		
		String seq= this.productService.beforeInsert(map);//이전 seq값
		System.out.println("seq:"+seq);
		int code=0;
		
		String prod="";
		String productcode="";
		if(productvo.getGender().equals("male")) {
			seq=seq.substring(10);
			System.out.println(seq);
			code= Integer.parseInt(seq)+1;
			productcode= "Mprod_"+brandcode+"_"+categorycode+"_"+String.format("%03d", code);
		}else {
			seq=seq.substring(9);
			code= Integer.parseInt(seq)+1;
			productcode= "prod_"+brandcode+"_"+categorycode+"_"+String.format("%04d", code);
		}
		
		System.out.println(productcode);
		productvo.setProductcode(productcode);
				
		String productname=productvo.getProductname();
		productname=encoding(productname);
		productvo.setProductname(productname);
		
		String productdesc=productvo.getProductdesc();
		productdesc=encoding(productdesc);
		productvo.setProductdesc(productdesc);
		
		
		this.productService.insert(productvo);
		return "productWrite.jsp";
	}
	
	
	
}
