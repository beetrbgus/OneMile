package com.kh.onemile.vo.cobuy;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
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
	private double lat;
	private double lng;
	private String detailAddress;
}
