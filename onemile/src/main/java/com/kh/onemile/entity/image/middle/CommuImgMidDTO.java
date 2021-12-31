package com.kh.onemile.entity.image.middle;

import java.util.List;

import lombok.Data;

// 커뮤니티 이미지 테이블 DTO
@Data
public class CommuImgMidDTO {
	private int cmiNo;
	private List<Integer> imgNoList;
	private int commuNo;
	private int imgNo;
}
