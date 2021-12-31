package com.kh.onemile.repository.image.middle;

import com.kh.onemile.entity.image.middle.MilesImageDTO;

public interface MilesImageDao {
	void regMi(MilesImageDTO milesImageDto);
	boolean deleteImage(int miNo);
	MilesImageDTO get(int imageNo);
}
