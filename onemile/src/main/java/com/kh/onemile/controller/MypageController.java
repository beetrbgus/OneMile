package com.kh.onemile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.vo.MilesVO;



// ......................................
// 
// 인터셉터로 로그인 검사 and 회원대기 상태에대해 공부

@RequestMapping("/mypage")
@Controller
public class MypageController {
	
	//가입 승인 대기중인 회원
	//가입 승인 거절된 회원
	//세션에서 가져와서 다른 페이지로 연결시켜줘야하는데 하는법?
	//프로필 이미지 띄우는방법도 해결해야함
	
	
	//마이페이지 메인 연결
	
	@GetMapping("/mypage")
	private String mypage() {
	return "mypage/main";
	}

	@PostMapping	("/mypage")
	public String mypage(@ModelAttribute MemberDTO memberDTO) {
	return "??";
	}
	
	//내정보수정 1 > 프로필 수정
	@GetMapping("/mypage/edit/profile")
	private String profileEdit() {
	return "mypage";
	}

	@PostMapping	("/mypage/edit")
	public String profileEdit(@ModelAttribute MemberDTO memberDTO) {
	return "??";
	}
	
	//내정보수정 2 > 중요정보 수정 (프로필 수정 페이지에서 비밀번호를 입력해야 넘어가게 작업해야함)
	
//	if () {		
//		return "";
//	} else {
//		return "";
//	}
//}
	//if를 이용해서 페이지 넘어가는곳을 다르게 변경?
	@GetMapping("/mypage/edit/personalinfo")
	private String personalInfoEdit() {
	return "mypage";
	}

	@PostMapping	("/mypage/edit/personalinfo")
	public String personalInfoEdit(@ModelAttribute MemberDTO memberDTO) {
	return "??";
	}
	

	

	// 마이페이지 > 참여모임 
	// 마이페이지 > 결제 내역 (근우님 작업하신거 참고하고 작성하기)
	// 마이페이지 > 좋아요
	// 마이페이지 > 모임평가
	// 마이페이지 >가입 승인 대기회원 페이지
	// 마이페이지 >가입 승인 거절회원 페이지
	// 마이페이지에 알람도 추가해야할까?
	
	
}
