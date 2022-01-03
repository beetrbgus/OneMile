package com.kh.onemile.repository.social;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.entity.social.SocialCategoryDTO;
import com.kh.onemile.vo.MemberJoinVO;

@Repository
public class BigCategoryDaoImpl implements BigCategoryDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SocialBigCategoryDTO> category() {
		return sqlSession.selectList("category.list");
	}

	@Override
	public List<SocialCategoryDTO> listBySuper(String categorySuper) {
		return sqlSession.selectList("category.listBySuper",categorySuper);
	}

	@Override
	public void insert(MemberJoinVO memberJoinVO, int memNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("IcNo",memberJoinVO.getIcNo());
		param.put("smalltype", memberJoinVO.getSmalltype());
		param.put("memNo", memNo);
		sqlSession.insert("category.insert",param);
	}
}