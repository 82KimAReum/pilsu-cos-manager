package com.pcos.dao;

import java.util.List;
import java.util.Map;

import com.pcos.vo.ProductVO;
import com.pcos.vo.SalesVO;

public interface SalesDao {
	List<SalesVO>selectAll(Map map);
	Map selectCount (Map map);
	List<ProductVO>selectcode();
}
