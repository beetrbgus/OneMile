package com.kh.onemile.entity.image.middle;

import java.util.List;

import lombok.Data;
// 소셜링 이미지 중간 테이블
@Data
public class SocialImgMidDTO {
	private int SmiNo;
	private List<Integer> imgNoList;
	private int socialNo;
	private int imgNo;
}
