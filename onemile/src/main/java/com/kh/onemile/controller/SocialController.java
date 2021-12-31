package com.kh.onemile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onemile.service.social.SocialService;

@RequestMapping("/social")
@RestController
public class SocialController {
	@Autowired
	private SocialService socialService;
//	@Autowired
//	private MemberShipService memberShipService;
	@GetMapping("/reg")
	public String reg() {
		// 지도에 위치 정보 등록
		// 이미지 등록.
		// 소셜 내용 등록.
		// 등록할 마일즈 등록 null 허용.
		
		ModelAndView model = new ModelAndView();
		
		return "reg";
	}
	@PostMapping("/reg")
	public String reg(Model model) {
		return "detail";
	}
}
