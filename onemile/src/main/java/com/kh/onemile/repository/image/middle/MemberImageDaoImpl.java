package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.image.middle.MemberProfileMidDTO;
import com.kh.onemile.vo.MemberJoinVO;
@Repository
public class MemberImageDaoImpl implements MemberImageDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void reg(MemberProfileMidDTO memberProfileMidDto) {
		for(int imgIdx : memberProfileMidDto.getImgNoList()) {
			memberProfileMidDto.setImgNo(imgIdx);
			
			sqlSession.insert("mei.regMei", memberProfileMidDto);
		}
	}
}
