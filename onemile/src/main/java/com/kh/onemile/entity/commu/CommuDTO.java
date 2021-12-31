package com.kh.onemile.entity.commu;

import java.util.Date;

import lombok.Data;

//커뮤니티 (게시판) DTO
@Data
public class CommuDTO {
	private int commuNo;
	private int memberNo;
	private int mapNo;
	
	private String middleName;
	private String title;
	private String content;
	private Date regDate;
	private int hit;
	private String viewYN;
}
