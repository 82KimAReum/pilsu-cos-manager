package com.pcos.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcos.vo.ProductVO;

@Repository("productDao")
public class ProductDaoImpl implements ProductDao {
@Autowired
private SqlSession sqlSession;
	@Override
	public int selectCountAll(String title) {
		return this.sqlSession.selectOne("Product.productSelectCount", title);
	}

	@Override
	public List<ProductVO> selectAll(Map map) {
		return this.sqlSession.selectList( "Product.productSelectAll", map);
	}

	@Override
	public ProductVO selectOne(String productcode) {
		return this.sqlSession.selectOne("Product.productSelectOne", productcode);
	}

	@Override
	public void insert(ProductVO faqvo) {
		this.sqlSession.insert("Product.productInsert", faqvo);
	}

	@Override
	public void update(ProductVO faqvo) {
		this.sqlSession.update("Product.productUpdate", faqvo);
	}

	@Override
	public void delete(String productcode) {
		this.sqlSession.delete("Product.productDelete", productcode);
	}

	@Override
	public String beforeInsert(Map map) {
		return this.sqlSession.selectOne("Product.beforeInsert", map);
	}

}
