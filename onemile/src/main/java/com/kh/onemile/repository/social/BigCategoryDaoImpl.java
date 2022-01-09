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
import com.kh.onemile.vo.social.like.SocialLikeCategoryVO;

@Repository
public class BigCategoryDaoImpl implements BigCategoryDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//소모임 대분류 목록
	@Override
	public List<SocialBigCategoryDTO> list() {
		return sqlSession.selectList("category.list");
	}
	
	//소모임 대분류로 소분류 가져오기
	@Override
	public List<SocialCategoryDTO> listBySuper(String categorySuper) {
		return sqlSession.selectList("category.listBySuper",categorySuper);
	}
	
	//회원 관심 카테고리 
	@Override
	public void insert(MemberJoinVO memberJoinVO, int memNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("IcNo",memberJoinVO.getIcNo());
		param.put("smalltype", memberJoinVO.getSmalltype());
		param.put("memNo", memNo);
		sqlSession.insert("category.insert",param);
	}

	@Override
	public List<SocialLikeCategoryVO> getLikeCategory() {
		return sqlSession.selectList("smc.getLarge");
	}
}