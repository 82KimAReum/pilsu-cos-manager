
package com.pcos.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcos.dao.FaqDao;
import com.pcos.vo.FaqVO;


@Service("faqService")
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqDao faqDao;
	
	@Override
	public List<FaqVO> selectAll(Map map) {
		return this.faqDao.selectAll(map);
	}

	@Override
	public List<FaqVO> selectSearch(String title) {
		return this.faqDao.selectSearch(title);
	}

	@Override
	public void insert(FaqVO faqvo) {
		this.faqDao.insert(faqvo);
		
	}

	@Override
	public void update(FaqVO faqvo) {
		this.faqDao.update(faqvo);
		
	}

	@Override
	public void delete(int seq) {
		this.faqDao.delete(seq);
	}

	@Override
	public FaqVO selectOne(int seq) {
		return this.faqDao.selectOne(seq);
	}

	@Override
	public int selectCountAll(String title) {
		return this.faqDao.selectCountAll( title);
	}

}
