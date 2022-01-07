package com.kh.onemile.service.image;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.image.middle.MiddleImgTableDTO;
import com.kh.onemile.repository.image.middle.MiddleImageDAO;

@Service
public class MiddleImageServiceImpl implements MiddleImageService {


	@Autowired @Qualifier("meiDAO")
	private MiddleImageDAO memberImageDao; //회원 프로필
	@Autowired @Qualifier("miDAO")
	private MiddleImageDAO milesImageDao; // 마일즈
	@Autowired @Qualifier("smiDAO")
	private MiddleImageDAO socialImageDaO; // 소셜
	
	@Override
	public void regMiddleImg(MiddleImgTableDTO middleImgTableDTO) {
		
	}
}
