package com.kh.onemile.service.image;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.entity.image.middle.MemberProfileMidDTO;
import com.kh.onemile.repository.image.ImageDao;
import com.kh.onemile.util.SaveFile;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.ImageDownloadVO;

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
	public int regImage(MultipartFile attach, String savePath) throws IllegalStateException, IOException {

		int imageNo = seq.nextSequence("image_seq");
		String saveName = String.valueOf(imageNo);

		if (!attach.isEmpty()) {
			ImageDTO imageDto = new ImageDTO();

			// 이미지 테이블
			imageDto.setImageNo(imageNo);
			imageDto.setUploadName(attach.getOriginalFilename());// 회원이 올린 이름.
			imageDto.setFileSize(attach.getSize());
			imageDto.setSaveName(saveName);
			imageDto.setFileType(attach.getContentType());

			// 실제 D드라이브에 저장되는 메서드
			String realPath = path + "/" + savePath;
			saveFile.saveImg(realPath, attach, saveName);
			// DB에 파일 정보 넣는 메서드
			imageDao.regImage(imageDto);
		}

		return imageNo;
	}

	@Override
	public ImageDownloadVO download(int imageNo, String folder) throws IOException {
		
		ImageDownloadVO imageDownloadVO = new ImageDownloadVO(); 
		ImageDTO imageDTO = imageDao.get(imageNo);
		byte[] data = saveFile.downImg(path, imageNo);
		
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
		// 파일을 지우고
		saveFile.deleteImg(savePath, savedFileName);
		// DB에서 파일 정보를 지움.
		imageDao.deleteImage(imageNo);
	}

	@Override
	public List<ImageDTO> listByBoardNo(int boardNo) {
		List<ImageDTO> list = imageDao.listByBoardNo(boardNo);
		return list;
	}

	@Override
	public ImageDTO getImage(int imageNo) {
		return imageDao.get(imageNo);
	}

	@Override
	public int save(ImageDTO imageDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

}