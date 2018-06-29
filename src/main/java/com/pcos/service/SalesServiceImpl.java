package com.pcos.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcos.dao.SalesDao;
import com.pcos.vo.ProductVO;
import com.pcos.vo.SalesVO;

@Service("salesService")
public class SalesServiceImpl implements SalesService{
@Autowired
private SalesDao salesDao;
	@Override
	public List<SalesVO> selectAll(Map map) {
		return this.salesDao.selectAll(map);
	}

	@Override
	public Map selectCount(Map map) {
		return this.salesDao.selectCount(map);
	}

	@Override
	public List<ProductVO> selectcode() {
		return this.salesDao.selectcode();
	}

}
