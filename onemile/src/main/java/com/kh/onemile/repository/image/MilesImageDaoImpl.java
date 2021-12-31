package com.kh.onemile.repository.image;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.onemile.entity.image.middle.MilesImgMidDTO;

@Repository
public class MilesImageDaoImpl implements MilesImageDao{

	@Autowired
	private SqlSession sqlSession;

//	@Override
//	public void regMi(MilesImageDTO milesImageDto) {
//		milesImageDto.setThumbnail("1");//일단 넣기
//		sqlSession.insert("mi.regMi", milesImageDto);
//	}
//
//	@Override
//	public boolean deleteImage(int miNo) {
//		int count = sqlSession.delete("mi.deleteImage", miNo);
//		return count > 0;
//	}
//
//	@Override
//	public MilesImageDTO get(int imageNo) {
//		return sqlSession.selectOne("mi.get", imageNo);
//	}
	
	//새로만든 이미지
	@Override
	public void reg(MilesImgMidDTO milesImgMidDto) {
		for(int imgIdx : milesImgMidDto.getImgNoList()) {
			milesImgMidDto.setImageNo(imgIdx); //이미지 번호를 한개씩 풀어주는거

			sqlSession.insert("mi.reg", milesImgMidDto);
		
		}
	}
}
