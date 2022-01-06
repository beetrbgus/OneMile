package com.kh.onemile.repository.image.middle;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;

//회원 프로필 이미지 
@Qualifier("meiDAO")
@Repository
public class MemberImageDaoImpl implements MiddleImageDAO{

	@Autowired
	private SqlSession sqlSession;
	
	//등록
	@Override
	public void reg(MiddleImgTableDTO middleImgTableDTO) {
		sqlSession.insert("mei.reg",middleImgTableDTO);
	}
	
	@Override
	public void delete(int memberNo) {
		sqlSession.delete("mei.delete", memberNo);
	}

}