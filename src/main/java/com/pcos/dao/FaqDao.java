package com.pcos.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.pcos.vo.FaqVO;
import com.pcos.vo.MemberVO;


public interface FaqDao {
	int selectCountAll(String title);
	List<FaqVO>selectAll(Map map);//���� �˻�
	List<FaqVO>selectSearch(String title);//�˻�
	FaqVO selectOne(int seq);
	void insert(FaqVO faqvo);//����
	void update(FaqVO faqvo);//����
	void delete(int seq);//����
}
