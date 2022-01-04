package com.kh.onemile.entity.member.certi;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

//이메일인증 DTO
@Data
public class CertiDTO {
	private int certiNo;
	private int memberNo;
	
	private String email;
	private String serial;
	private Date sendDate;
}
