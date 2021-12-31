package com.kh.onemile.repository.image.middle;

import com.kh.onemile.entity.image.middle.SocialImageDTO;

public interface SocialImageDao {
	void regCmi(SocialImageDTO socialImageDto);
	SocialImageDTO get(int imageNo);
	boolean deleteImage(int cmiNo);
}