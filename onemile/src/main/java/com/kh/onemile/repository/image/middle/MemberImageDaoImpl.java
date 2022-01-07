package com.kh.onemile.repository.image.middle;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;

import lombok.extern.slf4j.Slf4j;

//회원 프로필 이미지 
@Slf4j
@Qualifier("meiDAO")
@Repository
public class MemberImageDaoImpl implements MiddleImageDAO{

	@Autowired
	private SqlSession sqlSession;
	
	//등록
	@Override
	public void reg(MiddleImgTableDTO middleImgTableDTO) {
		log.debug("멤버이미지다오 들어옴      middleImgTableDTO      "+ middleImgTableDTO.toString());
		sqlSession.insert("mei.reg",middleImgTableDTO);
	}
	
	@Override
	public void delete(int memberNo) {
		sqlSession.delete("mei.delete", memberNo);
	}

}