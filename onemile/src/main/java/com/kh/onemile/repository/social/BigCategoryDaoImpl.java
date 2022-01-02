package com.kh.onemile.repository.social;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.entity.social.SocialCategoryDTO;

@Repository
public class BigCategoryDaoImpl implements BigCategoryDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SocialBigCategoryDTO> category() {
		return sqlSession.selectList("category.list");
	}

	@Override
	public List<SocialCategoryDTO> listBySuper(String categorySuper) {
		return sqlSession.selectList("category.listBySuper",categorySuper);
	}

}
