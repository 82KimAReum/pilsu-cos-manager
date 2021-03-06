package com.pcos.service;

import java.util.List;
import java.util.Map;

import com.pcos.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO>selectAll(Map map);
	ReviewVO selectOne(String gradeno);
	int selectCount(Map map);
	void delete(String gradeno);
	List<ReviewVO> selectEmail(Map<String, Object> map);
	int selectCountEmail(Map<String, Object> map);
}
