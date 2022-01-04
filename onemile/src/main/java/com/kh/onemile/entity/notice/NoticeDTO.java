package com.kh.onemile.entity.notice;


import lombok.Data;

//공지 sql쿼리

//create table notice(
//nt_no NUMBER PRIMARY KEY,
//title varchar2(200),
//cont varchar2(1000)
//);


@Data
public class NoticeDTO {
	private int nt_no;
	private String title;
	private String cont;

}
