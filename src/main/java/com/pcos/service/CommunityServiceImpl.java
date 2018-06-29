package com.pcos.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcos.dao.CommunityDao;
import com.pcos.vo.CommunityVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
@Autowired
private CommunityDao communityDao;
	@Override
	public List<CommunityVO> selectAll(Map map) {
		return this.communityDao.selectAll(map);
	}

	@Override
	public int selectCount(String searchData) {
		return this.communityDao.selectCount(searchData);
	}

	@Override
	public CommunityVO selectOne(String boardno) {
		return this.communityDao.selectOne(boardno);
	}

	@Override
	public void delete(String boardno) {
		this.communityDao.delete(boardno);
	}

	@Override
	public List<CommunityVO> selectEmail(Map<String, Object> map) {
		return this.communityDao.selectEmail(map);
	}

	@Override
	public int selectCountEmail(String email) {
		return this.communityDao.selectCountEmail(email);
	}

}
