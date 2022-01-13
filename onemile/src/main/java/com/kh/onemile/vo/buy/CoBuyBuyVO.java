package com.kh.onemile.vo.buy;

import java.util.Date;

import lombok.Data;

@Data
public class CoBuyBuyVO {
	private int buyNo;
	private int memberNo;
	private int productNo;
	private String tid;
	private String itemName; //물건이름
	private int totalAmount; //거래금액
	private Date buyTime; //거래시각
	private String status; //결제 상태
	private int quantity;
}
