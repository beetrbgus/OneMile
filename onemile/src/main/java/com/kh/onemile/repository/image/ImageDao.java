package com.kh.onemile.repository.image;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.vo.MemberVO;

public interface ImageDao {
	void regImage(ImageDTO imageDto) throws IllegalStateException, IOException;
	boolean deleteImage(int imageNo);
	ImageDTO get(int imageNo);
	List<ImageDTO> listByBoardNo(int boardNo);
	List<ImageDTO> listByMenu(String middleName);
	ImageDTO get2(int memberNo);

}