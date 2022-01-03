package com.kh.onemile.entity.member;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

//회원 DTO
@Data
public class MemberDTO {
	private int memberNo;
	private String email;
	private String pw;
	private String nick;
	private String phone;
	private String gender;
	@DateTimeFormat(pattern="YYYY-MM-DD")
	private Date birth;
	private String grade;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date joinDate;
	private String mbti;
	private String intro;
	private String corona;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date nickModi;
	private String exitYN;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date exitDate;
}
