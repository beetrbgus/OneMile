package com.kh.onemile.repository.image;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.onemile.entity.image.ImageDTO;

@Repository
public class ImageDaoImpl implements ImageDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void regImage(ImageDTO imageDto){
		
		sqlSession.insert("image.reg", imageDto);
	}

	@Override
	public boolean deleteImage(int imageNo) {
		int count = sqlSession.delete("image.delete", imageNo);
		return count > 0;
	}

	@Override
	public ImageDTO get(int imageNo) {
		return sqlSession.selectOne("image.get", imageNo);
	}

	@Override
	public List<ImageDTO> listByBoardNo(int boardNo) {
		List<ImageDTO> list = sqlSession.selectList("image.listByBoardNo", boardNo);
		return list;
	}
}