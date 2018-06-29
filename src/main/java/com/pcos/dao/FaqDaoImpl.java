package com.pcos.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcos.vo.FaqVO;


@Repository("faqDao")
public class FaqDaoImpl implements FaqDao {
	@Autowired SqlSession sqlSession;
	
	
	@Override
	public List<FaqVO> selectAll(Map map) {
		return this.sqlSession.selectList("Faq.faqSelectAll",map);
		
	}

	@Override
	public List<FaqVO> selectSearch(String title) {
		return this.sqlSession.selectList("Faq.faqSelectSearch", title);
	}

	@Override
	public void insert(FaqVO faqvo) {
		this.sqlSession.insert("Faq.faqInsert", faqvo);
		
	}

	@Override
	public void update(FaqVO faqvo) {
		this.sqlSession.update("Faq.faqUpdate", faqvo);
		
	}

	@Override
	public void delete(int seq) {
		this.sqlSession.delete("Faq.faqDelete", seq);
	}

	@Override
	public FaqVO selectOne(int seq) {
		return this.sqlSession.selectOne("Faq.faqSelectOne", seq);
	}

	@Override
	public int selectCountAll(String title) {
		return this.sqlSession.selectOne("Faq.faqSelectCount",title);
	}

}
