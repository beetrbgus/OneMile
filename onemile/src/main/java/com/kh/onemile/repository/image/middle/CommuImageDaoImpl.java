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
	public void regCmi(CommuImgMidDTO commuImageDto) {
		sqlSession.insert("cmi.regCmi", commuImageDto);
	}

	@Override
	public CommuImgMidDTO get(int imageNo) {
		return sqlSession.selectOne("cmi.get", imageNo);
	}

	@Override
	public boolean deleteImage(int cmiNo) {
		int count = sqlSession.delete("cmi.deleteImage", cmiNo);
		return count > 0;
	}
}

