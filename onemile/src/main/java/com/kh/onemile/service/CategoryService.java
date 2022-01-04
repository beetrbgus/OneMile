package com.kh.onemile.service;

import java.util.List;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.entity.social.SocialCategoryDTO;
import com.kh.onemile.vo.MemberJoinVO;

public interface CategoryService {
	List<SocialBigCategoryDTO> category();

	List<SocialCategoryDTO> listBySuper(String categorySuper);

	void insert(MemberJoinVO memberJoinVO, int memNo);

	
	

	
}
