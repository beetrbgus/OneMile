package com.kh.onemile.vo.kakaopay;

import lombok.Data;

@Data
public class ConfirmVO {
	private int memberNo;
	private int productNo;//상품 번호
	private String partner_user_id;
	private String productName; // 상품이름 
	private String type; //결제 타입
	private int price; //가격
	private int totalAmount; //결제금액
	private int quantity; //수량
}
