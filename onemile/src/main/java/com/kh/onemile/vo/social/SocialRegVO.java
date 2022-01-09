package com.kh.onemile.vo.social;

import java.util.Date;
import java.util.List;

import javax.mail.Multipart;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SocialRegVO {
	private int socialNo;
	private int memberNo;
	
	private String smallType;
	private String title;
	private String context;
	private String startDate;
	private String endDate;
	private int minpeople;
	private int maxpeople;
	//지도 테이블
	private int mapNo;
	private double lat;
	private double lng;
	private String location;
	//이미지 테이블
	private List<MultipartFile> attach;
	
}
