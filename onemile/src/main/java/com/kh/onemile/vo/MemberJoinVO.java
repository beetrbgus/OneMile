package com.kh.onemile.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//회원정보 + 프로필 이미지
@Data
public class MemberJoinVO {
	private int memberNo;
	private String email;
	private String pw;
	private String nick;
	private String phone;
	private String gender;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	private String grade;
	@DateTimeFormat(pattern="yyyy-MM-dd HH24:mm:ss")
	private Date joinDate;
	private String mbti;
	private String intro;
	private String corona;
	@DateTimeFormat(pattern="yyyy-MM-dd HH24:mm:ss")
	private Date nickModi;
	private String exitYN;
	@DateTimeFormat(pattern="yyyy-MM-dd HH24:mm:ss")
	private Date exitDate;
	private List<MultipartFile> attach;
	
	//소모임 소분류
	private String smalltype;
	private int IcNo;
	
	private int imageNo;
	private List<Integer> imageList; //가져올 때 이미지 번호들
	
	
}