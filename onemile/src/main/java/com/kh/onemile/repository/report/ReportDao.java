package com.kh.onemile.repository.report;

import com.kh.onemile.vo.report.ReportRegVO;
import com.kh.onemile.vo.report.middle.MiddleRLVO;

public interface ReportDao {

	void reg(MiddleRLVO middleRLVO);
	void delete(int rlNo);
	void adminDelete(int rlNo);

}
