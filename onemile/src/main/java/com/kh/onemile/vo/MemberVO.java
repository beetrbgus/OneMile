package com.kh.onemile.vo;

import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import com.kh.onemile.entity.image.ImageDTO;
import lombok.Data;

//회원 DTO
@Data
public class MemberVO {
	
	private int memberNo;
	private String email;
	private String pw;
	private String nick;
	private String phone;
	private String gender;
	@DateTimeFormat(pattern="YYYY-MM-DD")
	private Date birth;
	private String birthstr;
	private String grade;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date joinDate;
	private String mbti;
	private String intro;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date nickModi;
	private String hiddenYN;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date exitDate;
	
	private String joinday;
	
	private int imageNo;
	private List<ImageDTO> imageList; //가져올 때 이미지 번호들
	
	
}