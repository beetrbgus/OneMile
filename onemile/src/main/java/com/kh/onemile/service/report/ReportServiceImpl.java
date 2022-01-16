package com.kh.onemile.service.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.onemile.repository.report.ReportDao;
import com.kh.onemile.vo.report.ReportRegVO;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired @Qualifier("commu")
	private ReportDao commuDao;
	@Autowired @Qualifier("social")
	private ReportDao socialDao;
	@Autowired @Qualifier("member")
	private ReportDao memberDao;
	
	@Override
	public void reg(ReportRegVO reportVO) {
		String type= reportVO.getReportType();
		if(type.equals("commu")) {
			commuDao.reg(reportVO);
		}else if(type.equals("social")){
			socialDao.reg(reportVO);
		}else {
			memberDao.reg(reportVO);
		}
	}

	@Override
	public void delete(ReportRegVO reportVO) {
		String type= reportVO.getReportType();
		if(type.equals("commu")) {
			commuDao.delete(reportVO.getRlNo());
		}else if(type.equals("social")){
			socialDao.delete(reportVO.getRlNo());
		}else {
			memberDao.delete(reportVO.getRlNo());
		}
	}

	@Override
	public void adminDelete(ReportRegVO reportVO ) {
		String type= reportVO.getReportType();
		if(type.equals("commu")) {
			commuDao.adminDelete(reportVO.getRlNo());
		}else if(type.equals("social")){
			socialDao.adminDelete(reportVO.getRlNo());
		}else {
			memberDao.adminDelete(reportVO.getRlNo());
		}
	}
	
}
