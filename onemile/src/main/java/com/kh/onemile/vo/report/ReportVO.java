package com.kh.onemile.vo.report;

import lombok.Data;

@Data
public class ReportVO {
	private int rlNo;
	private int memberNo;
	private String reportType;
	private String reportReason;
	private int reportNo; //신고한 것 번호.
}
