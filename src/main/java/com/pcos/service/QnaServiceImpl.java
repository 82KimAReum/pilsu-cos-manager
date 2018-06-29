package com.pcos.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcos.dao.QnaDao;
import com.pcos.vo.FaqVO;
import com.pcos.vo.QnaVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
@Autowired
private QnaDao qnaDao;
	@Override
	public int selectCountAll(String email) {
		return this.qnaDao.selectCountAll(email);
	}

	@Override
	public List<FaqVO> selectAll(Map map) {
		return this.qnaDao.selectAll(map);
	}

	@Override
	public QnaVO selectOne(String qnano) {
		return this.qnaDao.selectOne(qnano);
	}

	@Override
	public void insert(QnaVO qnavo) {
		this.qnaDao.insert(qnavo);
	}

	@Override
	public void update(QnaVO qnavo) {
		this.qnaDao.update(qnavo);
	}

	@Override
	public void delete(String qnano) {
		this.qnaDao.delete( qnano);
	}

	@Override
	public List<FaqVO> selectEmail(Map<String, Object> map) {
		return this.qnaDao.selectEmail(map);
	}

	@Override
	public int selectCountEmail(String email) {
		return this.qnaDao.selectCountEmail(email);
	}

}
