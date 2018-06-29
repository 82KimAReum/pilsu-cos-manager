package com.pcos.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcos.dao.MemberDao;
import com.pcos.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;

	@Override
	public int selectCountAll(String email) {
		return this.memberDao.selectCountAll(email);
	}

	@Override
	public List<MemberVO> selectAll(Map map) {
		return this.memberDao.selectAll(map);
	}

	@Override
	public MemberVO selectOne(String email) {
		return this.memberDao.selectOne(email);
	}

	@Override
	public void insert(MemberVO membervo) {
		this.memberDao.insert(membervo);
	}

	@Override
	public void update(String email) {
		this.memberDao.update(email);
	}

	@Override
	public void delete(String email) {
		this.memberDao.delete(email);
	}

	@Override
	public void updateActive(String email) {
		this.memberDao.updateActive(email);
		
	}
	
	

}
