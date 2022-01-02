package com.kh.onemile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.entity.social.SocialCategoryDTO;
import com.kh.onemile.repository.social.BigCategoryDao;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.MemberJoinVO;

@Service
public class CategoryServiceImpl implements CategoryService{
	private final String SEQID = "ic_seq";
	@Autowired
	private BigCategoryDao bigCategoryDao;
	@Autowired
	private Sequence seq;
	
	@Override
	public List<SocialBigCategoryDTO> category() {
		return bigCategoryDao.category();
	}

	@Override
	public List<SocialCategoryDTO> listBySuper(String categorySuper) {
		return bigCategoryDao.listBySuper(categorySuper);
	}
	
	//관심 카테고리 넣기
	@Override
	public void insert(MemberJoinVO memberJoinVO, int memNo) {
		int icNo = seq.nextSequence(SEQID);
		memberJoinVO.setIcNo(icNo);
		bigCategoryDao.insert(memberJoinVO, memNo);
		
	}
}