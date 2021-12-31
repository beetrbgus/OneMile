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

@Service
@Qualifier("socialImage")
public class SocialImageService implements ImageService{

	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private SocialImageDao socialImageDao;
	
	@Autowired
	private Sequence seq;

	@Override
	public void regImage(ImageVO imageVo) throws IllegalStateException, IOException {
		for(MultipartFile multipartFile : imageVo.getAttach()) {
			if(!multipartFile.isEmpty()) {
				ImageDTO imageDto = new ImageDTO();
				
				int imageNo = seq.nextSequence("image_seq");
				
				imageDto.setImageNo(imageNo);
				imageDto.setUploadName(multipartFile.getOriginalFilename());
				imageDto.setFileSize(multipartFile.getSize());
				imageDto.setFileType(multipartFile.getContentType());
				
				imageDao.regImage(imageDto, multipartFile);
				
				SocialImageDTO socialImageDto = new SocialImageDTO();
				
				int smiNo = seq.nextSequence("smi_seq");
				socialImageDto.setSmiNo(smiNo);
				socialImageDto.setImageNo(imageNo);
				socialImageDto.setSocialNo(imageVo.getSocialNo());
			}
		}
	}

	@Override
	public void deleteImage(int imageNo) {
		imageDao.deleteImage(imageNo);
		socialImageDao.deleteImage(imageNo);
	}

	@Override
	public ImageVO loadImage(int imageNo) throws IOException {
		SocialImageDTO siDto = new SocialImageDTO();
		siDto = socialImageDao.get(imageNo);
		
		//이미지 불러오기
		ImageVO imageVo = new ImageVO();
		imageVo.setLoad(imageDao.load(siDto.getImageNo()));
		
		return imageVo;
	}

	@Override
	public List<ImageDTO> listByBoardNo(int boardNo) {
		List<ImageDTO> list = imageDao.listByBoardNo(boardNo);
		return list;
	}
}
