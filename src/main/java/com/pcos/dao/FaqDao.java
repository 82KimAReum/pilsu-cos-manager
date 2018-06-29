package com.pcos.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.pcos.vo.FaqVO;
import com.pcos.vo.MemberVO;


public interface FaqDao {
	int selectCountAll(String title);
	List<FaqVO>selectAll(Map map);//전부 검색
	List<FaqVO>selectSearch(String title);//검색
	FaqVO selectOne(int seq);
	void insert(FaqVO faqvo);//삽입
	void update(FaqVO faqvo);//수정
	void delete(int seq);//삭제
}
