package com.kh.onemile.entity.notice;


import java.util.Date;

import lombok.Data;

//공지 sql쿼리
//
//create table notice(
//nt_no number primary key,
//title varchar2(200) not null,
//cont varchar2(1000) not null,
//nt_writer varchar2(30) not null,
//postdate date default sysdate not null
//);

@Data
public class NoticeDTO {
	private int nt_no;
	private String title;
	private String cont;
	private String nt_writer;
	private Date postDate;

}