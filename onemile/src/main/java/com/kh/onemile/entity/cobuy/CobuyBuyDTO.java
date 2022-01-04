package com.kh.onemile.entity.cobuy;

import lombok.Data;

@Data
public class CobuyBuyDTO {
	private int cobuyNo ;
	private int memberNo; //구매자
	private int quantity; //수량
}
