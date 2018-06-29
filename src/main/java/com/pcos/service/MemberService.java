package com.pcos.service;

import java.util.List;
import java.util.Map;

import com.pcos.vo.MemberVO;

public interface MemberService {
	int selectCountAll(String email);
	List<MemberVO>selectAll(Map map);//전부 검색
	MemberVO selectOne(String email);
	void insert(MemberVO membervo);//삽입
	void update(String email);//수정
	void delete(String email);//삭제
	void updateActive(String email);
}
