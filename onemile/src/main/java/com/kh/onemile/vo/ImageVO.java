package com.kh.onemile.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class ImageVO {

	//이미지 DTO
	private int imageNo;
	private String uploadName;
	private String saveName;
	private long fileSize;
	private String fileType;
	
	//멀티파일
	private List<MultipartFile> attach;
			
	//커뮤니티 이미지
	private int cmiNo;
	private int commuNo;
	
	//마일즈 이미지
	private int miNo;
	private int milesNo;
	private String thumbnail;
	
	//소셜링 이미지
	private int smiNo;
	private int socialNo;
	
	//회원 이미지 추가 예정
	private int meiNo;
	private int memberNo;
	private String imageDivision;
	
	//파일 정보
	private byte[] load;
}
