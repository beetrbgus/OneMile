package com.kh.onemile.vo.report;

import lombok.Data;

@Data
public class ReportRegVO {
	private int rlNo;
	private int reporterNo;
	private String type; //신고 분류
	private String reportReason;
	private int connTableNo; //신고당한것 번호
}
