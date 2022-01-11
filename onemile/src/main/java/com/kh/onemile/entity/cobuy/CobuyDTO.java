package com.kh.onemile.entity.cobuy;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CobuyDTO {
	private int cobuyNo;
	private int memberNo;
	private String title;
	private int price;
	private int hit; 
	@DateTimeFormat(pattern="yyyy-MM-dd HH24:mm:ss")
	private Date regDate;
	@DateTimeFormat(pattern="yyyy-MM-dd HH24:mm:ss")
	private Date deadLine;
	private String descript;
	private String pname;
	private String hiddenYN;
	private int stock;
	private String middleName;
	private int mapNo;
}
