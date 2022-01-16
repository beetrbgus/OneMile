package com.kh.onemile.repository.report;

import com.kh.onemile.vo.report.ReportRegVO;

public interface ReportDao {

	void reg(ReportRegVO reportVO);
	void delete(int rlNo);
	void adminDelete(int rlNo);

}
