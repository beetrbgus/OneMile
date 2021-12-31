package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.image.middle.SocialImgMidDTO;
@Repository
public class SocialImageDaoImpl implements SocialImageDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reg(SocialImgMidDTO socialImgMidDto) {
		for(int imgIdx : socialImgMidDto.getImgNoList()) {
			socialImgMidDto.setImgNo(imgIdx);
			
			sqlSession.insert("smi.regSmi",socialImgMidDto);
		}
	}
}

