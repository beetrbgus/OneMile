package com.kh.onemile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onemile.service.report.ReportService;
import com.kh.onemile.vo.report.ReportVO;

@RequestMapping("/report")
@Controller
public class ReportController {
	@Autowired
	private ReportService reportService;
	
	//신고하면 블랙리스트 테이블에 경고차수 +1 
	@PostMapping("/commu")
	public void commuReport(ReportVO reportVO) {
		reportService.reg(reportVO);
	}
	@PostMapping("/cobuy")
	public void cobuyReport(int rlNo) {
		reportService.delete(rlNo);
	}
	@PostMapping("/social")
	public void socialReport(int rlNo) {
		reportService.adminDelete(rlNo);
	}
	@PostMapping("/reg")
	public void regReport(int rlNo) {
		reportService.adminDelete(rlNo);
	}
}