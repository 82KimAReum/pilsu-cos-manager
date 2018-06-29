package com.pcos.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcos.vo.MemberVO;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectCountAll(String email) {
		return this.sqlSession.selectOne("Member.selectCount", email);
	}

	@Override
	public List<MemberVO> selectAll(Map map) {
		return this.sqlSession.selectList("Member.selectAll", map);
	}

	@Override
	public MemberVO selectOne(String email) {
		return this.sqlSession.selectOne("Member.selectOne", email);
	}

	@Override
	public void insert(MemberVO membervo) {
		this.sqlSession.insert("Member.insert", membervo);
	}

	@Override
	public void update(String email) {
		this.sqlSession.update("Member.update", email);
	}

	@Override
	public void delete(String email) {
		this.sqlSession.delete("Member.delete", email);
	}

	@Override
	public void updateActive(String email) {
		this.sqlSession.update("Member.updateActive", email);
		
	}
	

	

}
