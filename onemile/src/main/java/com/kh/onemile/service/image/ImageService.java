package com.kh.onemile.service.image;

import java.io.IOException;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.vo.ImageDownloadVO;

public interface ImageService {
	final String path="D:/upload"; 
	int regImage(MultipartFile attach, String savePath) throws IllegalStateException, IOException;
	void deleteImage(int imageNo,String save);
	List<ImageDTO> listByBoardNo(int boardNo);
	ImageDTO getImage(int imageNo);
	
	int save(ImageDTO imageDTO);
	ImageDownloadVO download(int imageNo, String folder) throws IOException;

}