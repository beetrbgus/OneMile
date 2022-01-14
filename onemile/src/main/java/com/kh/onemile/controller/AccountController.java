package com.kh.onemile.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onemile.service.member.MemberService;
import com.kh.onemile.service.social.SocialService;
import com.kh.onemile.vo.MemberVO;
import com.kh.onemile.vo.social.SocialListVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/account")
@Controller
public class AccountController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private SocialService socialService;
	
	// 마이페이지
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
	int memberNo = (int)session.getAttribute("logNo");
		// 회원정보 불러오기(이미지 포함)
		MemberVO memberVO = memberService.imageProfile(memberNo);
		log.debug("내정보 = MemberVO" + memberVO);
		model.addAttribute("memberVO", memberVO);
		return "account/mypage";
		}
	
	// 피드
	@RequestMapping("/profile/{memberNo}")
	public String profile(@PathVariable int memberNo, 
			Model model) {
		MemberVO memberVO = memberService.imageProfile(memberNo);
		log.debug("호오오오오오오오잇");
		List<SocialListVO> socialListVO = socialService.getMemberByList(memberNo);
		log.debug("마이페이지 소셜링 리스트"+socialListVO);
		model.addAttribute("socialListVO", socialListVO);
		model.addAttribute("memberVO", memberVO);
		return "account/profile";
	}
	
	@GetMapping("test")
	public String test() {
		return "account/test";
	}
}