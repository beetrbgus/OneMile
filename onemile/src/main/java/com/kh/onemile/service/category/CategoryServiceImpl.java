package com.kh.onemile.service.category;

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
	
	//소모임 대분류 목록
	@Override
	public List<SocialBigCategoryDTO> list() {
		return bigCategoryDao.list();
	}
	
	//소모임 대분류로 소분류 가져오기
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