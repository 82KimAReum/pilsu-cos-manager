package com.pcos.dao;

import java.util.List;
import java.util.Map;

import com.pcos.vo.CommunityVO;

public interface CommunityDao {
	List<CommunityVO>selectAll(Map map);
	int selectCount(String searchData);
	CommunityVO selectOne(String boardno);
	void delete (String boardno);
	List<CommunityVO> selectEmail(Map<String, Object> map);
	int selectCountEmail(String email);
}
