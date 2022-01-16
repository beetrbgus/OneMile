package com.kh.onemile.service.report;

import com.kh.onemile.vo.report.ReportRegVO;

public interface RLService {
	public void reg(ReportRegVO reportVO);
	public void delete(int rlNo,String type);
	public void adminDelete(int rlNo , String type);
}
