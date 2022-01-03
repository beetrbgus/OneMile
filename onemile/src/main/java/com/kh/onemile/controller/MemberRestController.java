package com.kh.onemile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.repository.member.MemberDao;

@RequestMapping("/member")
@RestController
public class MemberRestController {
	
	@Autowired
	private MemberDao memberDao;
	
	//이메일 중복체크
	@GetMapping("/emailcheck")
	public String emailCheck(@RequestParam String email) {
		MemberDTO memberDTO = memberDao.get(email);
		if(memberDTO == null) {//없으면 이메일 사용가능 -> YESICAN 리턴
			return "YESICAN";
		}
		else {//있으면 사용 불가 -> NONONO리턴
			return "NONONO"; 
		}
	}
}