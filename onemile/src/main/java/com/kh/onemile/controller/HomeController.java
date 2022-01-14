package com.kh.onemile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onemile.service.cobuy.CobuyService;
import com.kh.onemile.service.commu.CommuService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	private CommuService commuService;
	
	@Autowired
	private CobuyService cobuyService;
	
	//메인페이지
	@RequestMapping("")
	public String home(Model model) {
		model.addAttribute("commuDetailVOList", commuService.index());
		System.err.println(cobuyService.indexList());
		model.addAttribute("cobuyList", cobuyService.indexList());
		return "home";
	}
}