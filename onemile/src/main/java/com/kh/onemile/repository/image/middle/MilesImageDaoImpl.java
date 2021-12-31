package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.image.middle.MilesImageDTO;

@Repository
public class MilesImageDaoImpl implements MilesImageDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void regMi(MilesImageDTO milesImageDto) {
		milesImageDto.setThumbnail("1");//일단 넣기
		sqlSession.insert("mi.regMi", milesImageDto);
	}

	@Override
	public boolean deleteImage(int miNo) {
		int count = sqlSession.delete("mi.deleteImage", miNo);
		return count > 0;
	}

	@Override
	public MilesImageDTO get(int imageNo) {
		return sqlSession.selectOne("mi.get", imageNo);
	}
}
