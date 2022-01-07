package com.kh.onemile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.service.category.CategoryService;
import com.kh.onemile.service.social.SocialService;
import com.kh.onemile.vo.social.like.SocialLikeCategoryVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/social")
@Controller
public class SocialController {
	@Autowired
	private SocialService socialService;
	@Autowired
	private CategoryService categoryService;
	@GetMapping("/reg")
	public String getReg(Model model) {
		// 지도에 위치 정보 등록
		// 이미지 등록.
		// 소셜 내용 등록.
		// 등록할 마일즈 등록 null 허용.
		List<SocialBigCategoryDTO> result = categoryService.list();
		log.debug("result       : "+result.toString()); 
		model.addAttribute("bigCategory",result);
		return "social/reg2";
	}
	@PostMapping("/reg")
	public String postReg(Model model) {
		return "social/detail";
	}
}
