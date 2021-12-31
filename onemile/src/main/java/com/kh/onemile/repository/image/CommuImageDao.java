package com.kh.onemile.repository.image;

import com.kh.onemile.entity.image.CommuImageDTO;

public interface CommuImageDao {
	void regCmi(CommuImageDTO commuImageDto);
	CommuImageDTO get(int imageNo);
	boolean deleteImage(int cmiNo);
}