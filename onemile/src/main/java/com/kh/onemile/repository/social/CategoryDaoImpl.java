package com.kh.onemile.repository.social;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.vo.MemberJoinVO;
import com.kh.onemile.vo.social.category.CategoryVO;
import com.kh.onemile.vo.social.category.MiddleCategoryVO;

@Repository
public class CategoryDaoImpl implements CategoryDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//소모임 대분류 목록
	@Override
	public List<SocialBigCategoryDTO> getBiglist() {
		return sqlSession.selectList("category.getbigAll");
	}
	
	//소모임 등록시 소분류 가져오기
	@Override
	public List<MiddleCategoryVO> getMiddlelist(String bigValue) {
		return sqlSession.selectList("category.getmiddleByBigValue",bigValue);
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
	// 전체 대분류와 소분류 가져오기
	@Override
	public List<CategoryVO> getCategoryList() {
		return sqlSession.selectList("category.getAll");
	}

	@Override
	public List<MiddleCategoryVO> getMiddlelistByBigType(String categorySuper) {
		return sqlSession.selectList("category.getmiddleByBigType",categorySuper);
		 
	}
}