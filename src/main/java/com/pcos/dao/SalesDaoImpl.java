package com.pcos.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcos.vo.ProductVO;
import com.pcos.vo.SalesVO;

@Repository("salesDao")
public class SalesDaoImpl implements SalesDao {
@Autowired
private SqlSession sqlsseion;

	@Override
	public List<SalesVO> selectAll(Map map) {
		return this.sqlsseion.selectList("Sales.selectAll", map);
	}

	@Override
	public Map selectCount(Map map) {
		List<Map<String,Object>>list=this.sqlsseion.selectList("Sales.selectCount",map);
		System.out.println(list);
		int count=Integer.parseInt(String.valueOf(list.get(0).get("COUNT(*)")));
		int profit=0;
		int amount=0;
		try {
			profit=Integer.parseInt(String.valueOf(list.get(0).get("SUM(PROFIT)")));
			amount=Integer.parseInt(String.valueOf(list.get(0).get("SUM(AMOUNT)")));
		}catch(Exception e) {}
		Map<String,Integer>all=new HashMap<String, Integer>();
		all.put("count", count);
		all.put("profit", profit);
		all.put("amount", amount);
		return all;
	}

	@Override
	public List<ProductVO> selectcode() {
		return this.sqlsseion.selectList("Sales.selectcode");
	}

}
