package com.kh.onemile.entity.image.middle;

import lombok.Data;

@Data
public class MiddleImgTableDTO {
	// 중간 테이블
	private int midPrimaryNo; // 중간 테이블 번호
	private int imgNo; //이미지 번호
	private int connTableNo; //연결된 테이블 기본키 번호
}
