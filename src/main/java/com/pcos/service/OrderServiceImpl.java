package com.pcos.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcos.dao.OrderDao;
import com.pcos.vo.OrderVO;
import com.pcos.vo.P_orderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
@Autowired
private OrderDao orderDao;
	@Override
	public List<P_orderVO> selectAll(Map map) {
		return this.orderDao.selectAll(map);
	}

	@Override
	public List<OrderVO> selectProduct(String orderno) {
		return this.orderDao.selectProduct(orderno);
	}

	@Override
	public P_orderVO selectOrderno(String orderno) {
		return this.orderDao.selectOrderno(orderno);
	}

	@Override
	public int selectCount(String orderno) {
		return this.orderDao.selectCount(orderno);
	}

	@Override
	public void update(String orderno) {
		this.orderDao.update(orderno);
	}

	@Override
	public List<P_orderVO> selectOne(Map map) {
		return this.orderDao.selectOne(map);
	}

	@Override
	public int selectOneCount(String email) {
		return this.orderDao.selectOneCount(email);
	}

}
