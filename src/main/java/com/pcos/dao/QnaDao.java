package com.pcos.dao;

import java.util.List;
import java.util.Map;

import com.pcos.vo.FaqVO;
import com.pcos.vo.QnaVO;

public interface QnaDao {
	int selectCountAll(String email);//title, email
	List<FaqVO>selectAll(Map map);//전부 검색
	
	QnaVO selectOne(String qnano);
	void insert(QnaVO qnavo);//삽입
	void update(QnaVO qnavo);//수정
	void delete(String qnano);//삭제
	List<FaqVO> selectEmail(Map<String, Object> map);
	int selectCountEmail(String email);
}
