package com.kh.onemile.service.image;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.onemile.entity.image.ImageDTO;

public interface ImageService {
	final String path="D:/upload"; 
	List<Integer> regImage(List<MultipartFile> attach, String save) throws IllegalStateException, IOException;
	void deleteImage(int imageNo,String save);
	List<ImageDTO> listByBoardNo(int boardNo);
}
