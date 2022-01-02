package com.kh.onemile.entity.member.membership;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AdDTO {
	private int adNo;
	private int mspNo;
	private int jRegCnt;
	private int jMaxCnt;
	private int milCnt;
	private int milJoinMax;
	private int sRegCnt;
	private int sMaxCnt;
	@DateTimeFormat(pattern="YYYY-MM-DD HH24:mm:ss")
	private Date nModTime;
}
