package com.kh.onemile.vo.report.middle;

import lombok.Data;

@Data
public class MiddleRLVO {
	private String type; //보류
	private int primarykey; //시퀀스 번호
	private int connTableNo; //신고 당한 것 번호
	private int rlNo;
}
