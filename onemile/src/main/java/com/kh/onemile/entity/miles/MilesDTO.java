package com.kh.onemile.entity.miles;

import java.util.Date;

import lombok.Data;

//마일즈  DTO
@Data
public class MilesDTO {
	private int milesNo;
	private String smallName;
	private int memberNo;
	
	private String name;
	private String context;
	private String area;
	private Date regDate;
	private String viewYN;
}
