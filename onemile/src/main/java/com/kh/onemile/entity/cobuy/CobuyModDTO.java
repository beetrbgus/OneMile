package com.kh.onemile.entity.cobuy;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class CobuyModDTO {
	private int cobuyNo ;
	private String title;
	private String middleName;
	private int price;
	private int stock;
	private String pName;
	private String descript;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date deadLine;
	
	private int memberNo;
	//지도 부분
	private int mapNo;
	private double lat;
	private double lng;
	private String detailAddress;
}
