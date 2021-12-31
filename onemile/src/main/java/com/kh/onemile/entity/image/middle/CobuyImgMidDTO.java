package com.kh.onemile.entity.image.middle;

import java.util.List;
import lombok.Data;

// 공구 이미지 중간 테이블
@Data
public class CobuyImgMidDTO {
	private int cbiNo;
	private List<Integer> imgNoList;
	private int imgNo;
	private int cobuyNo;
}
