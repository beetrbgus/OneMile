package com.kh.onemile.vo.cobuy;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.vo.reply.ReplyVO;

import lombok.Data;

@Data
public class CobuyDetailVO {
	// 공동구매 정보 : 
	// 제목 , 닉네임 ,  댓글 수(보류) , 작성시간 , 만료시간
	// 상품이름 , 가격 ,  상품 설명
	private int cobuyNo ;
	private String title;
	private String middleName;
	private int price ;
	private int hit ;
	@DateTimeFormat(pattern="yyyy-MM-dd HH24:mm:ss")
	private Date regDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date deadLine;
	private String deadLinestr;
	private String descript;
	private String pName;
	
	
	// 회원 정보 부분.
	private int memberNo;
	private String email;
	private String nick;
	private String phone;
	private int memberImageNo;
	
	private int imageNo;
	private List<ImageDTO> imageList; //가져올 때 이미지 번호들
	private List<ReplyVO> replyList;
	private int customerCnt;
	private int stock;
	//지도 부분
	private int mapNo;
	private double lat;
	private double lng;
	private String detailAddress;
	//상품 이미지 
	private List<MultipartFile> attach;
}
