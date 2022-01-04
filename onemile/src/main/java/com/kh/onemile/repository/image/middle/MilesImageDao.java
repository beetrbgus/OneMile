package com.kh.onemile.repository.image.middle;

import com.kh.onemile.entity.image.middle.MilesImgMidDTO;

public interface MilesImageDao {
	
	//마일지 이미지
	void reg(MilesImgMidDTO milesImgMidDto);
}