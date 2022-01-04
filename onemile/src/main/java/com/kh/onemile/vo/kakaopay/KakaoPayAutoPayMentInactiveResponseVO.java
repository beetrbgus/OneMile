package com.kh.onemile.vo.kakaopay;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayAutoPayMentInactiveResponseVO {
	private String cid;
	private String sid;
	private String status;
	private Date created_at;
	private Date last_approved_at;
	private Date inactivated_at;
}
