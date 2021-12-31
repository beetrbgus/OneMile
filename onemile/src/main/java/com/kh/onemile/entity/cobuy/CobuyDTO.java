package com.kh.onemile.entity.cobuy;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CobuyDTO {
	// 공동구매 정보 : 
	// 제목 , 닉네임 ,  댓글 수(보류) , 작성시간 , 만료시간
	// 상품이름 , 가격 ,  상품 설명
	private int cobuyNo ;
	private int memberNo;
	private String largeName;
	private String title;
	private int price ;
	private int hit ;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date regDate;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date deadLine;
	private String descript;
	private String pName;
	private List<MultipartFile> attach;
	private int imageNo;
	private List<Integer> imageList; //가져올 때 이미지 번호들
}
