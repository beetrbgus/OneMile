package com.kh.onemile.vo.social;

import lombok.Data;

@Data
public class SocialListVO {
	//이미지 , 소분류 , 제목 , 상세위치 , 올린사람 (프로필, 닉네임)
	private int imgNo;//소셜 이미지
	//소셜링 테이블에서 보여줘야 할 내용들
	private int socialNo;
	private String type;
	private String smalltype;
	private String title;
	private String startDate;
	private String endDate;
	//회원 테이블에서 보여줘야 할 내용들
	private int memberNo;
	private String nick;
	private int profileImgNo;
	//지도 테이블에서 보여줘야 할 내용들.
	private String detailAddress;
	
}
