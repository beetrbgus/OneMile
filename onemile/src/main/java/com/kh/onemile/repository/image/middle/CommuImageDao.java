package com.kh.onemile.repository.image.middle;

import com.kh.onemile.entity.image.middle.CommuImgMidDTO;

public interface CommuImageDao {
	void regCmi(CommuImgMidDTO commuImageDto);
	CommuImgMidDTO get(int imageNo);
	boolean deleteImage(int cmiNo);
}