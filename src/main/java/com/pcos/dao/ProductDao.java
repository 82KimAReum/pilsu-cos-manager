package com.pcos.dao;

import java.util.List;
import java.util.Map;

import com.pcos.vo.ProductVO;

public interface ProductDao {
	int selectCountAll(String title);
	List<ProductVO>selectAll(Map map);//전부 검색
	
	ProductVO selectOne(String productcode);
	String beforeInsert(Map map);//brandcode , categorycode//ProductVO productvo
	void insert(ProductVO faqvo);//삽입
	void update(ProductVO faqvo);//수정
	void delete(String productcode);//삭제
}
