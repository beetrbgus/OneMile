package com.kh.onemile.repository.image.middle;

import java.io.IOException;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.entity.image.middle.MemberProfileMidDTO;

public interface MemberImageDao {
	//회원 이미지 테이블에 등록
	void reg(MemberProfileMidDTO memberProfileMidDto);
	
	//회원이미지 불러오기
	MemberProfileMidDTO get(int memberNo);
	
	//이미지번호(imageNo)로 프로필 이미지 파일정보를 구한다.
	ImageDTO getImage(int imageNo);
	
	//이미지번호(imageNo)로 실제 파일 정보를 불러온다
	byte[] load(int imageNo) throws IOException;

}