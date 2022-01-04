package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.onemile.entity.image.middle.MemberProfileMidDTO;

@Repository
public class MemberImageDaoImpl implements MemberImageDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void reg(MemberProfileMidDTO memberProfileMidDto) {
		for(int imgIdx : memberProfileMidDto.getImgNoList()) {
			memberProfileMidDto.setImageNo(imgIdx);
			
			sqlSession.insert("mei.regMei", memberProfileMidDto);
		}
	}
}