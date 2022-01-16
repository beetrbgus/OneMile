package com.kh.onemile.service.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.onemile.repository.report.ReportDao;
import com.kh.onemile.vo.report.middle.MiddleRLVO;

@Service
public class MiddleRLServiceImpl implements  MiddleRLService{

	@Autowired @Qualifier("commu")
	private ReportDao commuDao;
	@Autowired @Qualifier("social")
	private ReportDao socialDao;
	@Autowired @Qualifier("member")
	private ReportDao memberDao;
	
	@Override
	public void reg(MiddleRLVO middleRLVO) {
		String type= middleRLVO.getType();
		if(type.equals("commu")) {
			commuDao.reg(middleRLVO);
		}else if(type.equals("social")){
			socialDao.reg(middleRLVO);
		}else {
			memberDao.reg(middleRLVO);
		}
	}

	@Override
	public void delete(int rlNo,String type) {
		
		if(type.equals("commu")) {
			commuDao.delete(rlNo);
		}else if(type.equals("social")){
			socialDao.delete(rlNo);
		}else {
			memberDao.delete(rlNo);
		}
	}

	@Override
	public void adminDelete(int rlNo,String type) {
		if(type.equals("commu")) {
			commuDao.adminDelete(rlNo);
		}else if(type.equals("social")){
			socialDao.adminDelete(rlNo);
		}else {
			memberDao.adminDelete(rlNo);
		}
	}

}
