package com.kh.onemile.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String mypage(HttpSession session, Model model, @RequestParam(required = false, defaultValue = "0") int checkNo) {
	int memberNo = (int)session.getAttribute("logNo");
		log.debug("체크No"+checkNo);
		MemberVO memberVO = memberService.imageProfile(memberNo);
		
		List<SocialListVO> socialListVO = socialService.getMemberByList(memberNo,checkNo);
		log.debug("마이페이지 내정보[MemberVO] :"+memberVO);
		model.addAttribute("socialListVO", socialListVO);
		log.debug("마이페이지 내 소셜링[socialListVO] : "+socialListVO);
		model.addAttribute("memberVO", memberVO);
		return "account/mypage";
		}
	
	//타인 피드
	@RequestMapping("/profile/{memberNo}")
	public String profile(@PathVariable int memberNo, 
			Model model) {
		MemberVO memberVO = memberService.imageProfile(memberNo);
		log.debug("마이페이지 내정보[MemberVO] :"+memberVO);
		List<SocialListVO> socialListVO = socialService.getMemberByList(memberNo);
		log.debug("마이페이지 소셜링 리스트"+socialListVO);
		model.addAttribute("socialListVO", socialListVO);
		model.addAttribute("memberVO", memberVO);
		return "account/profile";
	}
	
}