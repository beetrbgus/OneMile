package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.image.middle.CommuImgMidDTO;
@Repository
public class CommuImageDaoImpl implements CommuImageDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reg(CommuImgMidDTO commuImgMidDto) {
		for(int imgIdx : commuImgMidDto.getImgNoList()) {
			commuImgMidDto.setImgNo(imgIdx);
			
			sqlSession.insert("cmi.regCmi", commuImgMidDto);
		}
	}
}

