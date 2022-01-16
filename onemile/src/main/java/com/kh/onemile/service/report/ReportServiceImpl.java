package com.kh.onemile.service.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onemile.repository.report.ReportDao;
import com.kh.onemile.vo.report.ReportRegVO;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDao reportDao;
	
	@Override
	public void reg(ReportRegVO reportVO) {
		reportDao.reg(reportVO);
	}

	@Override
	public void delete(int rlNo) {
		reportDao.delete(rlNo);
	}

	@Override
	public void adminDelete(int rlNo) {
		reportDao.adminDelete(rlNo);
	}
	
}
