package com.kh.onemile.vo.cobuy;

import java.util.Date;
import java.util.List;

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
	private int memberNo;
	private String nick;
	private String middleName;
	private String title;
	private int price ;
	private int hit ;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH24:mm:ss")
	private Date regDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date deadLine;
	private String descript;
	private String pName;
	private List<MultipartFile> attach;
	
	private int imageNo;
	private List<ImageDTO> imageList; //가져올 때 이미지 번호들
	private List<ReplyVO> replyList;
	//지도 부분
	private int mapNo;
	private double lat;
	private double lng;
	private String detailAddress;
}
