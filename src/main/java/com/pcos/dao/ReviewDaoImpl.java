package com.pcos.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcos.vo.ReviewVO;
@Repository("reviewDao")
public class ReviewDaoImpl implements ReviewDao {
@Autowired
private SqlSession sqlSession;
	@Override
	public List<ReviewVO> selectAll(Map map) {
		return this.sqlSession.selectList("Review.selectAll", map);
	}

	@Override
	public ReviewVO selectOne(String gradeno) {
		return this.sqlSession.selectOne("Review.selectOne", gradeno);
	}

	@Override
	public int selectCount(Map map) {
		return this.sqlSession.selectOne("Review.selectCount", map);
	}

	@Override
	public void delete(String gradeno) {
		this.sqlSession.delete("Review.delete",gradeno);
	}

	@Override
	public List<ReviewVO> selectEmail(Map<String, Object> map) {
		return this.sqlSession.selectList("Review.selectEmail", map);
	}

	@Override
	public int selectCountEmail(Map<String, Object> map) {
		return this.sqlSession.selectOne("Review.selectCountEmail", map);
	}

}
