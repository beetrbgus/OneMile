package com.kh.onemile.entity.product;

import java.util.Date;

import lombok.Data;

//멤버십구매 DTO
@Data
public class MembershipBuyDTO {
	private int msbNo;
	private int memberNo;
	private int mspNo;
	
	private String sid;
	private String itemName;
	private int totalAmount;
	private Date buyTime;
	private Date buyEndtime;
	private String partnerUserId;
	private String status;
	private String hiddenYN;
}