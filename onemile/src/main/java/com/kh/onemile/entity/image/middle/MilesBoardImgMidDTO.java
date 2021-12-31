package com.kh.onemile.entity.image.middle;

import java.util.List;

import lombok.Data;

// 마일즈 게시판 이미지 중간 테이블
@Data
public class MilesBoardImgMidDTO {
	private int mbiNo;
	private List<Integer> imgNo;
	private int mbNo;
}
