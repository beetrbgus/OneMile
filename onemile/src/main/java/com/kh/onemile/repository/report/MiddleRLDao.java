package com.kh.onemile.repository.report;

import com.kh.onemile.vo.report.middle.MiddleRLVO;

public interface MiddleRLDao {

	void reg(MiddleRLVO middleRLVO);
	void delete(int rlNo);
	void adminDelete(int rlNo);

}
