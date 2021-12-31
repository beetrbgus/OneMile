package com.kh.onemile.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReplyVO {
	private int memberNo; //댓글 작성자
	private int replyReceiverNo; //댓글 받는 사람
	
	private String content; //댓글 내용
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date regDate ; //댓글 작성시간
	private String viewYN; //댓글 숨김여부
	
	private int mrNo; //마일즈 게시글 댓글 번호
	private int mbNo; //마일즈 게시글 번호
	
	private int crpNo; //커뮤 댓글 번호
	private int commuNo; //커뮤번호
	
	private String writerNick;//댓글 작성자 닉네임
	private String reciverNick;//댓글 받는 사람 닉네임
	
	private int replyNo;
}
