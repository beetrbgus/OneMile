package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.onemile.entity.image.middle.MilesImgMidDTO;

@Repository
public class MilesImageDaoImpl implements MilesImageDao{

	@Autowired
	private SqlSession sqlSession;
	
	//마일지 이미지
	@Override
	public void reg(MilesImgMidDTO milesImgMidDto) {
		for(int imgIdx : milesImgMidDto.getImgNoList()) {
			milesImgMidDto.setImageNo(imgIdx); //이미지 번호를 한개씩 풀어줌

			sqlSession.insert("mi.reg", milesImgMidDto);
		}
	}
}