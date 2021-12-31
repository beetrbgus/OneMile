package com.kh.onemile.service.image;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.entity.image.MilesImageDTO;
import com.kh.onemile.repository.image.ImageDao;
import com.kh.onemile.repository.image.MilesImageDao;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.ImageVO;

@Service
@Qualifier("milesImage")
public class MilesImageService implements ImageService{
	
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private MilesImageDao milesImageDao;
	
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
				
				MilesImageDTO milesImageDto = new MilesImageDTO();
				
				int miNo = seq.nextSequence("mi_seq");
				milesImageDto.setMiNo(miNo);
				milesImageDto.setImageNo(imageNo);
				milesImageDto.setMilesNo(imageVo.getMilesNo());
				milesImageDto.setThumbnail(imageVo.getThumbnail());
			}
		}
	}

	@Override
	public void deleteImage(int imageNo) {
		imageDao.deleteImage(imageNo);
		milesImageDao.deleteImage(imageNo);
	}
	
	@Override
	public ImageVO loadImage(int imageNo) throws IOException {
		MilesImageDTO miDto = new MilesImageDTO();
		miDto = milesImageDao.get(imageNo);
		
		//이미지 불러오기
		ImageVO imageVo = new ImageVO();
		imageVo.setLoad(imageDao.load(miDto.getImageNo()));
		
		return imageVo;
	}

	@Override
	public List<ImageDTO> listByBoardNo(int boardNo) {
		List<ImageDTO> list = imageDao.listByBoardNo(boardNo);
		return list;
	}
}