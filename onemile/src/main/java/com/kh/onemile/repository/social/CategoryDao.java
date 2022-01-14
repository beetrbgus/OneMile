package com.kh.onemile.repository.social;

import java.util.List;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.vo.MemberJoinVO;
import com.kh.onemile.vo.social.category.CategoryVO;
import com.kh.onemile.vo.social.category.MiddleCategoryVO;

public interface CategoryDao {
	
	//소모임 대분류 목록
	List<SocialBigCategoryDTO> getBiglist();
	
	//소모임 대분류로 소분류 가져오기
	public List<MiddleCategoryVO> getMiddlelist(String categorySuper);
	
	//회원 관심 카테고리 
	void insert(MemberJoinVO memberJoinVO, int memNo);

	List<CategoryVO> getCategoryList();

}