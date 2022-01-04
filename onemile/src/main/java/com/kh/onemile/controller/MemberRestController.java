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
	
	//닉네임 중복체크
	@GetMapping("/nickcheck")
	public String nickCheck(@RequestParam String nick) {
		MemberDTO memberDTO = memberDao.get2(nick);
		if(memberDTO == null) {//없으면 닉네임 사용가능 -> YESICAN 리턴
			return "YESICAN";
		}
		else {//있으면 사용 불가 -> NONONO리턴
			return "NONONO"; 
		}
	}	
	
	//전화번호 중복체크
	@GetMapping("/phonecheck")
	public String phoneCheck(@RequestParam String phone) {
		MemberDTO memberDTO = memberDao.get3(phone);
		if(memberDTO == null) {//없으면 닉네임 사용가능 -> YESICAN 리턴
			return "YESICAN";
		}
		else {//있으면 사용 불가 -> NONONO리턴
			return "NONONO"; 
		}
	}
	
}