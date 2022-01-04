package com.kh.onemile.repository.image;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.onemile.entity.image.ImageDTO;

public interface ImageDao {
	void regImage(ImageDTO imageDto) throws IllegalStateException, IOException;
	boolean deleteImage(int imageNo);
	ImageDTO get(int imageNo);
	List<ImageDTO> listByBoardNo(int boardNo);
	
}
