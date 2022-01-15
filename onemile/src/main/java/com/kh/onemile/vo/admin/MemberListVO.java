package com.kh.onemile.vo.admin;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class MemberListVO {

	private int memberNo;
	private String email;
	private String nick;
	private String phone;
	private String gender;
	@DateTimeFormat(pattern="YYYY-MM-DD")
	private Date birth;
	public String getBirth() {
		Format f = new SimpleDateFormat("yyyy-MM-dd");
		return f.format(this.birth);
	}
	private String grade;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date joinDate;
	public String getJoinDate() {
		Format f = new SimpleDateFormat("yyyy-MM-dd");
		return f.format(this.joinDate);
	}
	private String intro;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date nickModi;
	public String getNickModi() {
		Format f = new SimpleDateFormat("yyyy-MM-dd");
		return f.format(this.nickModi);
	}
}
