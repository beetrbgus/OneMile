package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.image.middle.SocialImageDTO;
@Repository
public class SocialImageDaoImpl implements SocialImageDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void regCmi(SocialImageDTO socailImageDto) {
		sqlSession.insert("smi.regIamge", socailImageDto);
	}

	@Override
	public SocialImageDTO get(int imageNo) {
		return sqlSession.selectOne("smi.get", imageNo);
	}

	@Override
	public boolean deleteImage(int smiNo) {
		int count = sqlSession.delete("smi.deleteImage", smiNo);
		return count > 0;
	}
}

