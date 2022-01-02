package com.kh.onemile.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.entity.member.certi.CertiDTO;
import com.kh.onemile.service.admin.AdminService;
import com.kh.onemile.service.email.EmailService;
import com.kh.onemile.service.member.MemberService;
import com.kh.onemile.vo.MemberJoinVO;

@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/join")
	public String getJoin() {
		return "member/join";
	}
	//회원가입. 가입 후 회원 승인 테이블로 감.
	@PostMapping("/join")
	public String postJoin(@ModelAttribute MemberJoinVO memberJoinVO) {
		int memNo = memberService.join(memberJoinVO);
		//회원 승인 테이블 전송.
		adminService.regApproveMember(memNo);
		return "redirect:join_success";
	}
	@RequestMapping("/join_success")
	public String joinSuccess() {
		return "member/join_success";
	}

	//로그인
	@GetMapping("/login")
	private String login() {
		return "member/login";
	}
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDTO memberDTO, @RequestParam(required = false) String saveId,
			HttpServletResponse response, HttpSession session) {
			
			MemberDTO findDTO = memberService.login(memberDTO);
	
			if(findDTO != null) {
			session.setAttribute("logId", findDTO.getEmail());
			session.setAttribute("nick", findDTO.getNick());
			session.setAttribute("grade", findDTO.getGrade());
			session.setAttribute("logNo", findDTO.getMemberNo());
			
			
			if(saveId != null) {//생성
				Cookie c = new Cookie("saveId", findDTO.getEmail());
				c.setMaxAge(4 * 7 * 24 * 60 * 60);//4주
				response.addCookie(c);
			}else {//삭제
				Cookie c = new Cookie("saveId", findDTO.getEmail());
				c.setMaxAge(0);
				response.addCookie(c);
			}
			return "redirect:/";
		} else {
			return "redirect:login?error";
		}
	}

	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("logId");
		session.removeAttribute("nick");
		session.removeAttribute("grade");
		session.removeAttribute("logNo");
		return "redirect:/";
	}
	
	//회원탈퇴
	@GetMapping("/quit")
	public String quit() {
		return "member/quit";
	}
	@PostMapping("/quit")
	public String quit(HttpSession session, @RequestParam String pw) {
		String email = (String)session.getAttribute("logId");
		boolean result = memberService.quit(email,pw);
		if(result) {
			session.removeAttribute("logId");
			session.removeAttribute("logNo");
			session.removeAttribute("nick");
			session.removeAttribute("grade");
			return "redirect:/";
		}else{
			return "redirect:quit?error";
		}
	}
	
	//아이디찾기
	@GetMapping("/find_id")
	private String findId() {
		return "member/find_id";
	}
	@PostMapping("/find_id")
	public String findId(@ModelAttribute MemberDTO memberDTO, Model model) {
		MemberDTO findId = memberService.findId(memberDTO);
		if (findId != null) {
			model.addAttribute("email", findId.getEmail());
			return "member/find_id_success";
		} else {
			return "redirect:find_id?error";
		}
	}
	
	//비밀번호찾기(이메일 전송)
	@GetMapping("/find_pw")
	public String cert() {
		return "member/find_pw";
	}
	@PostMapping("/find_pw")
	public String cert(@RequestParam String email, Model model) {
		emailService.sendCertificationNumber(email);
		model.addAttribute("email", email);
		return "member/emailCheck";
	}

	//비밀번호찾기(이메일 체크)
	@PostMapping("/emailCheck")
	public String emailCheck(@ModelAttribute CertiDTO certiDTO) {
		boolean success = memberService.emailCheck(certiDTO);
		if(success) {
			return "member/edit_pw";//(임시)성공하면 비밀번호 변경페이지로?
		}
		else {
			return "redirect:/";//(임시)실패시 메인페이지로 이동
		}
	}
	
	//비밀번호 변경
	@GetMapping("/edit_pw")
	public String editPw() {
		return "member/edit_pw";
	}
	@PostMapping("/edit_pw")
	public String editPw(
			@RequestParam String nowPw,
			@RequestParam String changePw,
			HttpSession session) {
		String email = (String) session.getAttribute("logId");
		boolean result = memberService.changePw(email, nowPw, changePw);
		if(result) {
			return "redirect:/";//마이페이지만들면 마이페이지로 보낼 예정
		}else {
			return "redirect:edit_pw?error";
		}
	}
}