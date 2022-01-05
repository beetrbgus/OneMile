package com.kh.onemile.repository.social;

import java.util.List;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.entity.social.SocialCategoryDTO;
import com.kh.onemile.vo.MemberJoinVO;

public interface BigCategoryDao {
	
	//소모임 대분류 목록
	List<SocialBigCategoryDTO> list();
	
	//소모임 대분류로 소분류 가져오기
	List<SocialCategoryDTO> listBySuper(String categorySuper);
	
	//회원 관심 카테고리 
	void insert(MemberJoinVO memberJoinVO, int memNo);

}