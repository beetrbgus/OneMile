package com.kh.onemile.service.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.repository.social.CategoryDao;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.MemberJoinVO;
import com.kh.onemile.vo.social.category.CategoryVO;
import com.kh.onemile.vo.social.category.MiddleCategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService{
	private final String SEQID = "ic_seq";
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private Sequence seq;
	
	//소모임 대분류 목록
	@Override  
	public List<SocialBigCategoryDTO> getBiglist(){
		return categoryDao.getBiglist();
	}
	
	//소모임 대분류로 소분류 가져오기
	@Override
	public List<MiddleCategoryVO> getMiddlelist(String categorySuper){
		return categoryDao.getMiddlelist(categorySuper);
	}
	@Override
	public List<CategoryVO> getCategoryList(){
		return categoryDao.getCategoryList();
	}
	//관심 카테고리 넣기
	@Override
	public void insert(MemberJoinVO memberJoinVO, int memNo) {
		int icNo = seq.nextSequence(SEQID);
		memberJoinVO.setIcNo(icNo);
		categoryDao.insert(memberJoinVO, memNo);
		
	}
}