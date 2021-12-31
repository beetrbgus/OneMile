package com.kh.onemile.entity.admin;

import lombok.Data;

// 멤버십 혜택
@Data
public class AdminSettingDTO {
	private int adNo;
	private int mspNo;
	private int jRegCnt;
	private int jMaxCnt;
	private int milCnt;
	private int milJoinMax;
	private int sRegCnt;
	private int sMaxCnt;
	private int nModTime;
}
