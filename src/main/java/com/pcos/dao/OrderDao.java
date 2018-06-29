package com.pcos.dao;

import java.util.List;
import java.util.Map;

import com.pcos.vo.OrderVO;
import com.pcos.vo.P_orderVO;

public interface OrderDao {
	List<P_orderVO> selectAll(Map map) ;
	List<P_orderVO> selectOne(Map map);//�� ������� �ֹ� ����Ʈ
	List<OrderVO> selectProduct(String orderno);
	P_orderVO selectOrderno(String orderno);
	int selectCount (String orderno);
	void update(String orderno);
	int selectOneCount(String email);
}
