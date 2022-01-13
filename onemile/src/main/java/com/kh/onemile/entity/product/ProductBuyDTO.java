package com.kh.onemile.entity.product;

import java.util.Date;

import lombok.Data;

//공동구매 상풍구매 DTO
@Data
public class ProductBuyDTO {
	private int pbNo;
	private int memberNo;
	private int productNo;
	
	private String tid;
	private String itemName;
	private int totalAmount;
	private Date buyTime;
	private String status;
	
	public boolean isCancelAvailable() {
		return status != null && status.equals("결제취소");
	}
}
