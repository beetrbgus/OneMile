package com.kh.onemile.vo;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.kh.onemile.entity.image.ImageDTO;

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
	public String getRegDate() {
		Format f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return f.format(this.regDate);
	}
	private int hit;
	private String viewYN;
	
	private int mapNo;
	private String lagname;
	private String nick;
	private double lat;
	private double lng;
	private String detailAddress;
	
	private int cmiNo;
	private List<ImageDTO> imgNoList;
	private int memberNo;
	private int imageNo;
}
