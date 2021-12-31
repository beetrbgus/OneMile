package com.kh.onemile.repository.image;

import com.kh.onemile.entity.image.MilesImageDTO;

public interface MilesImageDao {
	void regMi(MilesImageDTO milesImageDto);
	boolean deleteImage(int miNo);
	MilesImageDTO get(int imageNo);
}
