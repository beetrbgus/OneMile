package com.kh.onemile.repository.social;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.social.SocialDTO;

@Repository
public class SocialDaoImpl implements SocialDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void regSocial(SocialDTO socialDto) {
		sqlSession.insert("social.regSocial", socialDto);
	}

	@Override
	public List<SocialDTO> list() {
		return sqlSession.selectList("social.list");
	}

	@Override
	public boolean changeSocial(SocialDTO socialDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public SocialDTO detail(int socialNo) {
		return sqlSession.selectOne("social.get", socialNo);
	}
}
