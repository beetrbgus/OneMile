package com.kh.onemile.service.image;

import org.springframework.stereotype.Service;

import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;

@Service
public interface MiddleImageService {
	void regMiddleImg(MiddleImgTableDTO middleImgTableDTO);
}
