package com.pcos.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcos.dao.ProductDao;
import com.pcos.vo.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
@Autowired
private ProductDao productDao;
	@Override
	public int selectCountAll(String title) {
		return this.productDao.selectCountAll(title);
	}

	@Override
	public List<ProductVO> selectAll(Map map) {
		return this.productDao.selectAll(map);
	}

	@Override
	public ProductVO selectOne(String productcode) {
		return this.productDao.selectOne(productcode);
	}
	
///////////////
	@Override
	public String beforeInsert(Map map) {
		return this.productDao.beforeInsert(map);
	}
	@Override
	public void insert(ProductVO faqvo) {
		this.productDao.insert(faqvo);
	}
///////////////
	@Override
	public void update(ProductVO faqvo) {
		this.productDao.update(faqvo);
	}

	@Override
	public void delete(String productcode) {
		this.productDao.delete(productcode);
	}

	

}
