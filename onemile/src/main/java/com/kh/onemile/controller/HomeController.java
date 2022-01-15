package com.kh.onemile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onemile.service.cobuy.CobuyService;
import com.kh.onemile.service.commu.CommuService;
import com.kh.onemile.service.social.SocialService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	private CommuService commuService;
	
	@Autowired
	private CobuyService cobuyService;
	
	@Autowired
	private SocialService socialService;
	
	//메인페이지
	@RequestMapping("")
	public String home(Model model) {
		model.addAttribute("commuDetailVOList", commuService.index());
		model.addAttribute("cobuyList", cobuyService.indexList());
		model.addAttribute("socialIndexVOList", socialService.indexList());
		System.err.println(socialService.indexList());
		return "home";
	}
}