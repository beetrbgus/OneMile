package com.kh.onemile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.entity.social.SocialCategoryDTO;
import com.kh.onemile.repository.social.BigCategoryDao;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private BigCategoryDao bigCategoryDao;
	
	@Override
	public List<SocialBigCategoryDTO> category() {
		return bigCategoryDao.category();
	}

	@Override
	public List<SocialCategoryDTO> listBySuper(String categorySuper) {
		return bigCategoryDao.listBySuper(categorySuper);
	}
	
}
