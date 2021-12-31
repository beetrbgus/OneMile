package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.image.middle.MilesImgMidDTO;

@Repository
public class MilesImageDaoImpl implements MilesImageDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reg(MilesImgMidDTO milesImgeMidDto) {
		for(int imgIdx : milesImgeMidDto.getImgNoList()) {
			milesImgeMidDto.setImageNo(imgIdx);
			
			sqlSession.insert("mi.regMi", milesImgeMidDto);
		}
	}
}