package com.pcos.service;

import java.util.List;
import java.util.Map;

import com.pcos.vo.MemberVO;

public interface MemberService {
	int selectCountAll(String email);
	List<MemberVO>selectAll(Map map);//���� �˻�
	MemberVO selectOne(String email);
	void insert(MemberVO membervo);//����
	void update(String email);//����
	void delete(String email);//����
	void updateActive(String email);
}
