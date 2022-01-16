package com.kh.onemile.repository.report;

import com.kh.onemile.vo.report.ReportRegVO;

public interface RLDao {
	public void reg(ReportRegVO reportVO);
	public void delete(int rlNo);
	public void adminDelete(int rlNo);

	
}
