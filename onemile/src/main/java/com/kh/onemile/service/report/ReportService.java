package com.kh.onemile.service.report;

import com.kh.onemile.vo.report.ReportVO;

public interface ReportService {
	public void reg(ReportVO reportVO);
	public void delete(int rlNo);
	public void adminDelete(int rlNo);
}
