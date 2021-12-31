package com.kh.onemile.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class CommuVO {
	
	//외래키
	private int memberNo;
	private int imageNo;
	private int mapNo;
	
	//기본 게시판
	private String middleName;
	private String title;
	private String content;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date regDate;
	
	//지도
	private double lat;
	private double lon;
	private String detailaddress;
	
	//이미지
	private List<MultipartFile> attach;
	
	
	//커뮤니티 이미지
	private int cmiNo;
	private int commuNo;
}
