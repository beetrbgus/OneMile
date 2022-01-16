package com.kh.onemile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onemile.service.report.RLService;
import com.kh.onemile.service.report.MiddleRLService;
import com.kh.onemile.vo.report.ReportRegVO;

@RequestMapping("/report")
@Controller
public class ReportController {
	@Autowired
	private RLService rlService;
	
	//신고하면 블랙리스트 테이블에 경고차수 +1 
	@PostMapping("/reg")
	public void regReport(ReportRegVO reportVO) {
		rlService.reg(reportVO);
	}
}
