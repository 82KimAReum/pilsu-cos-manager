package com.pcos.service;

import java.util.List;
import java.util.Map;

import com.pcos.vo.ProductVO;

public interface ProductService {
	int selectCountAll(String title);
	List<ProductVO>selectAll(Map map);//���� �˻�
	
	ProductVO selectOne(String productcode);
	String beforeInsert(Map map);//brandcode , categorycode
	void insert(ProductVO faqvo);//����
	void update(ProductVO faqvo);//����
	void delete(String productcode);//����
}
