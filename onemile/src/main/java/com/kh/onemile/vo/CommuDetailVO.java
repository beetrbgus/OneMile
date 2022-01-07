package com.kh.onemile.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class CommuDetailVO {
	
	//기본 게시판
	private int commuNo;
	private String middleName;
	private String title;
	private String content;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date regDate;
	private int hit;
	private String viewYN;
	
	private String lagname;
	private String nick;
	private double lat;
	private double lon;
	private String detailaddress;
	
	private int cmiNo;
	private List<Integer> imgNoList;
	private int memberNo;
	private int imageNo;
}
