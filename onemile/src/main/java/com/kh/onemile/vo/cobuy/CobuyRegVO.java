package com.kh.onemile.vo.cobuy;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CobuyRegVO {
	private int cobuyNo ;
	private int memberNo;
	private String title;
	private int price;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date deadLine;
	private String descript;
	private String pName;
	private int stock;
	private String middleName;
	
	//지도 부분
	private int mapNo;
	private float lat;
	private float lng;
	private String detailAddress;
	private List<MultipartFile> attach;
}
