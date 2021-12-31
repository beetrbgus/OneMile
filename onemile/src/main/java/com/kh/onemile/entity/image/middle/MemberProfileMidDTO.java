package com.kh.onemile.entity.image.middle;

import java.util.List;

import lombok.Data;
// 회원 이미지 중간 테이블
@Data
public class MemberProfileMidDTO {
	private int meiNo;
	private List<Integer> imgNoList;
	private int memberNo;
	private int imgNo;
}
