package com.pcos.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcos.dao.ReviewDao;
import com.pcos.vo.ReviewVO;
@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
@Autowired
private ReviewDao reviewDao;
	@Override
	public List<ReviewVO> selectAll(Map map) {
		return this.reviewDao.selectAll(map);
	}

	@Override
	public ReviewVO selectOne(String gradeno) {
		return this.reviewDao.selectOne(gradeno);
	}

	@Override
	public int selectCount(Map map) {
		return this.reviewDao.selectCount(map);
	}

	@Override
	public void delete(String gradeno) {
		this.reviewDao.delete(gradeno);
	}

	@Override
	public List<ReviewVO> selectEmail(Map<String, Object> map) {
		return this.reviewDao.selectEmail(map);
	}

	@Override
	public int selectCountEmail(Map<String, Object> map) {
		return this.reviewDao.selectCountEmail(map);
	}

}
