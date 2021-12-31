package com.kh.onemile.entity.image.middle;

import java.util.List;

import lombok.Data;
// 마일즈 이미지 중간 테이블
@Data
public class MilesImgMidDTO {
	private int miNo;
	private List<Integer> imgNoList;
	private int milesNo;
	private int imgNo;
}
