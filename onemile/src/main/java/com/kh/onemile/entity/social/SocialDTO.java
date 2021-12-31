package com.kh.onemile.entity.social;

import java.util.Date;

import lombok.Data;

//소셜링  DTO
@Data
public class SocialDTO {
	private int socialNo; // 소셜 번호
	private int memberNo; //회원 번호
	private int mapNo; // 지도 번호
	private int adNo; // 최대 인원 번호
	private String bigType; // 소모임 대분류
	
	private String title; //소모임 이름
	private String smallType;
	private String type; //모임 분류( 정모 , 소모임)
	private String context; //모임 소개 내용
	private Date startDate; //시작시각
	private Date endDate; // 종료시각
	private String viewYN; //숨김여부
}
