package com.kh.onemile.service.report;

import com.kh.onemile.vo.report.middle.MiddleRLVO;

public interface MiddleRLService {
	public void reg(MiddleRLVO middleRLVO);
	public void delete(int rlNo,String type);
	public void adminDelete(int rlNo,String type);
}
