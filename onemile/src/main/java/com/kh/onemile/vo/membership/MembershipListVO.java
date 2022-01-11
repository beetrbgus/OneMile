package com.kh.onemile.vo.membership;

import lombok.Data;
//멤버십목록 + 혜택

@Data
public class MembershipListVO {
	private int mspNo; //멤버십 번호
	private String mspProduct; //상품명
	private int mspPrice; //상품 가격
	
	private int adNo; //멤버십 혜택번호
	private int sRegCnt;//소셜 생성갯수
	private int sMaxCnt;//소셜 최대인원
	private int nModTime;//닉네임 변경시간
}