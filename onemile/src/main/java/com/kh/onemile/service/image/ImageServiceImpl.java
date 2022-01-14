package com.kh.onemile.service.image;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.repository.image.ImageDao;
import com.kh.onemile.util.SaveFile;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.ImageDownloadVO;
import com.kh.onemile.vo.ImageVO;
import com.kh.onemile.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ImageServiceImpl implements ImageService {
	@Autowired
	private Sequence seq;
	@Autowired
	private ImageDao imageDao;
	@Autowired
	private SaveFile saveFile;

	private final String path = "D:/upload";

	@Override
	public List<Integer> regImage(List<MultipartFile> attach, String savePath)
			throws IllegalStateException, IOException {
		log.debug("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ들어옴 ");
		List<Integer> imageNoList = new ArrayList<Integer>();
		log.debug(" List<MultipartFile>   " + attach.toString());
		for (MultipartFile multipartFile : attach) {
			if (!multipartFile.isEmpty()&&multipartFile.getSize()!=0) {
				int imageNo = seq.nextSequence("image_seq");
				log.debug("imageNo    " + imageNo);
				String saveName = String.valueOf(imageNo);

				ImageDTO imageDto = new ImageDTO();

				// 이미지 테이블
				imageDto.setImageNo(imageNo);
				imageDto.setUploadName(multipartFile.getOriginalFilename());// 회원이 올린 이름.
				imageDto.setFileSize(multipartFile.getSize());
				imageDto.setSaveName(saveName);
				imageDto.setFileType(multipartFile.getContentType());

				log.debug("imageNo    " + imageNo);
				log.debug("setUploadName    " + multipartFile.getOriginalFilename());
				log.debug("setFileSize    " + multipartFile.getSize());
				log.debug("setFileType    " + multipartFile.getContentType());

				// 실제 D드라이브에 저장되는 메서드
				String realPath = path + "/" + savePath;
				saveFile.saveImg(realPath, multipartFile, saveName);
				// DB에 파일 정보 넣는 메서드
				imageDao.regImage(imageDto);
				imageNoList.add(imageNo);
			}
		}
		log.debug("imageNoList        " + imageNoList);
		return imageNoList;
	}

	@Override
	public ImageDownloadVO download(int imageNo, String folder) throws IOException {
		String savePath = path + "/" + folder;
		ImageDownloadVO imageDownloadVO = new ImageDownloadVO();
		ImageDTO imageDTO = imageDao.get(imageNo);
		byte[] data = saveFile.downImg(savePath, imageNo);

		imageDownloadVO.setImageDTO(imageDTO);
		imageDownloadVO.setData(data);

		return imageDownloadVO;
	}

	@Override
	public void deleteImage(int imageNo, String save) {
		// 경로 찾기
		String savePath = path + save;
		ImageDTO imageDto = imageDao.get(imageNo);
		String savedFileName = String.valueOf(imageDto.getImageNo());
		// DB에서 파일 정보를 지움.
		imageDao.deleteImage(imageNo);
		// 파일을 지우고
		saveFile.deleteImg(savePath, savedFileName);
	}

	@Override
	public List<ImageDTO> listByBoardNo(int boardNo) {
		List<ImageDTO> list = imageDao.listByBoardNo(boardNo);
		return list;
	}
	
	@Override
	public List<ImageDTO> listByMenu(String middleName) {
		List<ImageDTO> list = imageDao.listByMenu(middleName);
		return list;
	}

	@Override
	public ImageDTO getImage(int imageNo) {
		return imageDao.get(imageNo);
	}

}