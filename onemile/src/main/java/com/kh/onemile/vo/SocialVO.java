package com.kh.onemile.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class SocialVO {

	//시퀀스
	private int socialNo;
	//외래키
	private int memberNo;
	private int mapNo;
	private int adNo;
	
	//기본 소셜링
	private String name;
	private String type;
	private String smalltype;
	private String context;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date startDate;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date endDate;
	
	//지도
	private double lat;
	private double lon;
	private String detailaddress;
	
	//이미지
	private List<MultipartFile> attach;
	
	//소셜링 이미지
	private int smiNo;
	private int iamgeNo;
}
