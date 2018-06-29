package com.pcos.dao;

import java.util.List;
import java.util.Map;

import com.pcos.vo.ProductVO;

public interface ProductDao {
	int selectCountAll(String title);
	List<ProductVO>selectAll(Map map);//���� �˻�
	
	ProductVO selectOne(String productcode);
	String beforeInsert(Map map);//brandcode , categorycode//ProductVO productvo
	void insert(ProductVO faqvo);//����
	void update(ProductVO faqvo);//����
	void delete(String productcode);//����
}
