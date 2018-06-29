package com.pcos.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcos.vo.OrderVO;
import com.pcos.vo.P_orderVO;

@Repository("orderDao")
public class OrderDaoImpl implements OrderDao {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<P_orderVO> selectAll(Map map) {
		return this.sqlsession.selectList("Order.selectAll", map);
	}

	@Override
	public List<OrderVO> selectProduct(String orderno) {
		return this.sqlsession.selectList("Order.selectProduct", orderno);
	}

	@Override
	public P_orderVO selectOrderno(String orderno) {
		return this.sqlsession.selectOne("Order.selectOrderno", orderno);
	}

	@Override
	public int selectCount(String orderno) {
		return this.sqlsession.selectOne("Order.selectCount", orderno);
	}

	@Override
	public void update(String orderno) {
		this.sqlsession.update("Order.update", orderno);
	}

	@Override
	public List<P_orderVO> selectOne(Map map) {
		return this.sqlsession.selectList("Order.selectOne", map);
	}

	@Override
	public int selectOneCount(String email) {
		return this.sqlsession.selectOne("Order.selectOneCount",email);
	}

}
