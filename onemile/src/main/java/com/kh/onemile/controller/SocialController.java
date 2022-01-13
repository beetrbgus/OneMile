package com.kh.onemile.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onemile.entity.member.membership.AdDTO;
import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.service.category.CategoryService;
import com.kh.onemile.service.member.MemberService;
import com.kh.onemile.service.social.SocialService;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialListVO;
import com.kh.onemile.vo.social.SocialRegVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/social")                       																									 
@Controller
public class SocialController {
	@Autowired
	private SocialService socialService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private MemberService memberService;
	@GetMapping("/reg")
	public String getReg(Model model,HttpSession session) {
		int memberNo = (int) session.getAttribute("logNo");
		AdDTO adDTO = memberService.membership(memberNo);
		
		List<SocialDTO> socialDTO = socialService.getCount(memberNo);
		
		log.debug("혜택"+adDTO.getSMaxCnt());
		model.addAttribute("AD",adDTO.getSMaxCnt());
		
		log.debug("갯수"+adDTO.getSRegCnt());
		log.debug("생성한 소셜링"+socialDTO.size());
		if(adDTO.getSRegCnt() > socialDTO.size())
		{
			// 지도에 위치 정보 등록
			// 이미지 등록.
			// 소셜 내용 등록.
			// 등록할 마일즈 등록 null 허용.
			List<SocialBigCategoryDTO> result = categoryService.list();
			log.debug("result       : "+result.toString()); 
			model.addAttribute("bigCategory",result);
			return "social/reg2";
		}
		else {
			return "redirect:social/list";	
		}
		
	}
	@PostMapping("/reg")
	public String postReg(@ModelAttribute SocialRegVO socialRegVO,HttpSession session) throws IllegalStateException, IOException{
		log.debug("SocialRegVO  "+socialRegVO.toString());
		
		int memNo = Integer.parseInt(String.valueOf(session.getAttribute("logNo")));
		
		socialRegVO.setMemberNo(memNo);
		socialService.reg(socialRegVO);
		return "social/detail";
	}

	@GetMapping("/list/{category}")
	public String getList(@PathVariable(required = false) String category, Model model) {
		
		
		if(category == null) category = "";
		List<SocialListVO> result = socialService.getList(category);
		log.debug("result       : "+result.toString()); 
		model.addAttribute("list",result);
		return "social/list";
	}
	@GetMapping("/detail/{socialNo}")
	public String getDetail(@PathVariable int socialNo, Model model) {
		
		List<SocialDetailVO> result = socialService.getDetail(socialNo);
		log.debug("result       : "+result.toString()); 
		model.addAttribute("list",result);
		return "social/list";
	}
}
