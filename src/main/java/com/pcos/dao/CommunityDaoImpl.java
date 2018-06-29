package com.pcos.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcos.vo.CommunityVO;
@Repository("communityDao")
public class CommunityDaoImpl implements CommunityDao {
@Autowired
private SqlSession sqlSession;
	@Override
	public List<CommunityVO> selectAll(Map map) {
		return this.sqlSession.selectList("Community.selectAll", map);
	}

	@Override
	public int selectCount(String searchData) {
		return this.sqlSession.selectOne("Community.selectCount", searchData);
	}

	@Override
	public CommunityVO selectOne(String boardno) {
		return this.sqlSession.selectOne("Community.selectOne", boardno);
	}

	@Override
	public void delete(String boardno) {
		this.sqlSession.delete("Community.delete", boardno);
	}

	@Override
	public List<CommunityVO> selectEmail(Map<String, Object> map) {
		return this.sqlSession.selectList("Community.selectEmail", map);
	}

	@Override
	public int selectCountEmail(String email) {
		return this.sqlSession.selectOne("Community.selectCountEmail", email);
	}

}
