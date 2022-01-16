package com.kh.onemile.entity.noti;

import lombok.Data;

@Data
public class NotiDTO {
	private int notiNo; //알림 번호
	private int receiver; //받는 사람 번호
	private int sender;  // 보낸 사람 번호
	private String type; //알림 분류
	private String msg ; //알림 메세지
	private String notiTime; //알림 시각.
	private String read; //읽음 유무
}
