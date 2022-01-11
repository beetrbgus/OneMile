package com.kh.onemile.repository.social;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialListVO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class SocialDaoImpl implements SocialDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void reg(SocialDTO socialDto) {
		log.debug("SocialDTO     "+socialDto.toString());
		sqlSession.insert("social.reg", socialDto);
	}

	@Override
	public List<SocialListVO> list() {
		return sqlSession.selectList("social.list");
	}

	@Override
	public boolean changeSocial(SocialDTO socialDto) {
		
		return false;
	}

	@Override
	public SocialDTO detail(int socialNo) {
		return sqlSession.selectOne("social.get", socialNo);
	}

	@Override
	public List<SocialListVO> getList(String category) {
		return sqlSession.selectList("social.categoryList",category);
	}

	@Override
	public List<SocialDetailVO> getDetail(int socialNo) {
		return sqlSession.selectOne("social.getDetail", socialNo);
	}
}
