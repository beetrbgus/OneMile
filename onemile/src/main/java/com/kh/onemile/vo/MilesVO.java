package com.kh.onemile.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MilesVO {
	//외래키
	private int milesNo;
	private String smallName;//소분류
	private int memberNo;//호스트
	private int adNo;//세팅번호
	
	//기본설정
	private String name;
	private String context;
	private String area;
	private Date regDate;
	private String viewYN;
	
	//이미지
	//private List<MultipartFile> attach;
	//private int imageNo;
	//private int miNo;
}