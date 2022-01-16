package com.kh.onemile.repository.report;

import com.kh.onemile.vo.report.ReportVO;

public interface ReportDao {

	void reg(ReportVO reportVO);
	void delete(int rlNo);
	void adminDelete(int rlNo);

}
