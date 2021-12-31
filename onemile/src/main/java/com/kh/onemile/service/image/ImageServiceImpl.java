package com.kh.onemile.service.image;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.repository.image.ImageDao;
import com.kh.onemile.util.SaveFile;
import com.kh.onemile.util.Sequence;

public class ImageServiceImpl implements ImageService {
	@Autowired
	private Sequence seq;
	@Autowired
	private ImageDao imageDao;
	@Autowired
	private SaveFile saveFile;

	@Override
	public List<Integer> regImage(List<MultipartFile> attach, String save) throws IllegalStateException, IOException {
		String savePath = path + save;
		List<Integer> imgNoList = new ArrayList<Integer>();
		
		
		for (MultipartFile multipartFile : attach) {
			if (!multipartFile.isEmpty()) {
				ImageDTO imageDto = new ImageDTO();

				int imageNo = seq.nextSequence("image_seq");
				String saveName = String.valueOf(imageNo);
				// 연결테이블 
				imageDto.setImageNo(imageNo);
				imageDto.setUploadName(multipartFile.getOriginalFilename());// 회원이 올린 이름.
				imageDto.setFileSize(multipartFile.getSize());
				imageDto.setSaveName(saveName);
				imageDto.setFileType(multipartFile.getContentType());

				// 실제 D드라이브에 저장되는 메서드
				saveFile.saveImg(savePath, multipartFile, saveName);
				// DB에 파일 정보 넣는 메서드
				imageDao.regImage(imageDto);
				// DB에 저장 될 때마다 리스트에 이미지 번호가 추가 됨.
				imgNoList.add(imageNo);
			}
		}
		return imgNoList;
	}

	@Override
	public void deleteImage(int imageNo, String save) {
		// 경로 찾기
		String savePath = path + save;
		ImageDTO imageDto = imageDao.get(imageNo);
		String savedFileName = String.valueOf(imageDto.getImageNo());
		// 파일을 지우고
		saveFile.deleteImg(savePath, savedFileName);
		// DB에서 파일 정보를 지움.
		imageDao.deleteImage(imageNo);
	}

}
