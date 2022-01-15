package com.kh.onemile.vo.social;

import java.util.List;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.vo.social.participate.ParticipateVO;

import lombok.Data;

@Data
public class SocialDetailVO {
	//소셜링 테이블에서 보여줘야 할 내용들
	private int socialNo;
	private String title;
	private String type; //대분류
	private String smalltype; //소분류
	private String startDate;
	private String endDate;
	private String context;
	private String isJoined;
	private int minpeople;
	private int maxpeople;
	private List<ParticipateVO> participate;
	//회원 테이블에서 보여줘야 할 내용들
	private int memberNo;
	private String nick;
	private String regdate;
	private int hostImgNo;	
	private List<ImageDTO> imageInfo; // 소셜의 이미지 목록 
	//지도 테이블에서 보여줘야 할 내용들.
	private int mapNo;
	private float lat;
	private float lng;
	private String detailAddress;
	
}
