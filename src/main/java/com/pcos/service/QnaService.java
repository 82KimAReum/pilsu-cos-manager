package com.pcos.service;

import java.util.List;
import java.util.Map;

import com.pcos.vo.FaqVO;
import com.pcos.vo.QnaVO;

public interface QnaService {
	int selectCountAll(String email);// email
	List<FaqVO>selectAll(Map map);//���� �˻�
	
	QnaVO selectOne(String qnano);
	void insert(QnaVO qnavo);//����
	void update(QnaVO qnavo);//����
	void delete(String qnano);//����
	List<FaqVO> selectEmail(Map<String, Object> map);
	int selectCountEmail(String email);
}