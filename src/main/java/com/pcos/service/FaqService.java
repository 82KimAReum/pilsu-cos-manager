package com.pcos.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.pcos.vo.FaqVO;


public interface FaqService {
	int selectCountAll(String title);
	List<FaqVO>selectAll(Map map);//���� �˻�
	List<FaqVO>selectSearch(String title);//�˻�
	FaqVO selectOne(int seq);
	void insert(FaqVO faqvo);//����
	void update(FaqVO faqvo);//����
	void delete(int seq);//����

}
