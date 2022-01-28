package com.kh.onemile.vo.cobuy;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.kh.onemile.entity.image.ImageDTO;
import com.kh.onemile.vo.reply.ReplyVO;

import lombok.Builder.Default;
import lombok.Builder;
import lombok.Data;

@Data
public class CobuyListVO {
	// 목록에서 보여질 것 : 
	// 이미지  제목 , 글쓴닉네임,  마감일 , 조회수
	// 가격 
	private int cobuyNo  = 1;
	private int memberNo;
	private String nick;
	private String title;
	private String pName;
	private int price;
	private int stock;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date deadLine;
	private int imgNo;
	
	private String deadLineDay;
}
