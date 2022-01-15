package com.kh.onemile.vo.social.participate;

import lombok.Data;

@Data
public class ParticipateVO {
	private int memberNo;
	private int profileImgNo;
	private int socialNo;
	private String nick;
	private String intro;

	private String isJoined;
}