package com.kh.onemile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	//메인페이지
	@RequestMapping("/")
	public String home() {
		return "home";
	}
}