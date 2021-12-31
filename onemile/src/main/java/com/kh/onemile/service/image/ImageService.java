package com.kh.onemile.service.image;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.vo.ImageVO;
import com.kh.onemile.vo.ReplyVO;

public interface ImageService {
	final String path="D:/upload"; 
	List<Integer> regImage(List<MultipartFile> attach, String save) throws IllegalStateException, IOException;
	void deleteImage(int imageNo,String save);
	List<ReplyVO> listByBoardNo(int boardNo);
}
