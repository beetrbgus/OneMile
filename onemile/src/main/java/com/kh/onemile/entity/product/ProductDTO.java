package com.kh.onemile.entity.product;

import java.util.Date;

import lombok.Data;

//공구 상품 DTO
@Data
public class ProductDTO {
	private int productNo;
	private int memberNo;
	private int quantity;
	
	private int tpNo;
	private String name;
	private int price;
	private String description;
	private String deadline;
	private String buyTime;
	private int pbNo;
	private String tid;
	private String itemName;
	private int totalAmount;
	private String status;
	
	
}
