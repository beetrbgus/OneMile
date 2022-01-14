package com.kh.onemile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onemile.service.commu.CommuService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	private CommuService commuService;
	
	//메인페이지
	@RequestMapping("")
	public String home(Model model) {
		log.debug("============================tttt");
		log.debug("{}", commuService.index());
		log.debug("============================");
		model.addAttribute("commuDetailVOList", commuService.index());
		return "home";
	}
}