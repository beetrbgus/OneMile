package com.kh.onemile.repository.social;

import java.util.List;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.entity.social.SocialCategoryDTO;
import com.kh.onemile.vo.MemberJoinVO;

public interface BigCategoryDao {

	 List<SocialBigCategoryDTO> category();

	List<SocialCategoryDTO> listBySuper(String categorySuper);

	void insert(MemberJoinVO memberJoinVO, int memNo);

	

	


}
