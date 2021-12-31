package com.kh.onemile.service.image;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.entity.image.SocialImageDTO;
import com.kh.onemile.repository.image.ImageDao;
import com.kh.onemile.repository.image.SocialImageDao;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.ImageVO;


public class SocialImageService implements ImageService{

	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private SocialImageDao socialImageDao;
	
	@Autowired
	private Sequence seq;

	@Override
	public List<Integer> regImage(List<MultipartFile> attach, String save) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteImage(int imageNo, String save) {
		// TODO Auto-generated method stub
		
	}

	
}
