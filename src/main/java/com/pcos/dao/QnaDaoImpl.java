package com.pcos.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcos.vo.FaqVO;
import com.pcos.vo.QnaVO;


@Repository("qnaDao")
public class QnaDaoImpl implements QnaDao {
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public int selectCountAll(String email) {
		return this.sqlsession.selectOne("Qna.qnaSelectCount", email);
				
	}

	@Override
	public List<FaqVO> selectAll(Map map) {
		return this.sqlsession.selectList("Qna.qnaSelectAll", map);
	}

	@Override
	public QnaVO selectOne(String qnano) {
		return this.sqlsession.selectOne("Qna.qnaSelectOne", qnano);
	}

	@Override
	public void insert(QnaVO qnavo) {
		this.sqlsession.insert("Qna.qnaInsert", qnavo);
		
	}

	@Override
	public void update(QnaVO qnavo) {
		this.sqlsession.update("Qna.qnaUpdate", qnavo);
	}

	@Override
	public void delete(String qnano) {
		this.sqlsession.delete("Qna.qnaDelete",qnano);
	}

	@Override
	public List<FaqVO> selectEmail(Map<String, Object> map) {
		return this.sqlsession.selectList("Qna.selectEmail", map);
	}

	@Override
	public int selectCountEmail(String email) {
		return this.sqlsession.selectOne("Qna.selectCountEmail", email);
	}

}
