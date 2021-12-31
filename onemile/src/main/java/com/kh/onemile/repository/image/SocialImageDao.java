package com.kh.onemile.repository.image;

import com.kh.onemile.entity.image.SocialImageDTO;

public interface SocialImageDao {
	void regCmi(SocialImageDTO socialImageDto);
	SocialImageDTO get(int imageNo);
	boolean deleteImage(int cmiNo);
}