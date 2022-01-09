package com.kh.onemile.controller;

import java.io.IOException;
import java.util.List;

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
import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.repository.membership.MembershipDao;
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
	private MembershipDao membershipDao;
	
	//회원가입
	@GetMapping("/join")
	public String getJoin(Model model) {
		//소모임 대분류
		model.addAttribute("category",memberService.getfavorite());
		return "member/join";
	}
	//가입 후 회원 승인 테이블로 감.
	@PostMapping("/join")
	public String postJoin(@ModelAttribute MemberJoinVO memberJoinVO) throws IllegalStateException, IOException {
		memberService.join(memberJoinVO);
		
		//회원 승인 테이블 전송.
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
			System.err.println("findDTo======================"+findDTO);

			//정보가 있으면 세션저장
			if(findDTO != null) {
			session.setAttribute("logNo", findDTO.getMemberNo());
			session.setAttribute("logId", findDTO.getEmail());
			session.setAttribute("grade", findDTO.getGrade());
			session.setAttribute("nick", findDTO.getNick());
			
			System.out.println("찾아라~~~~~~~~~~~~~~~~~~~~"+findDTO.getEmail());
			
			if(saveId != null) {//쿠키 생성
				Cookie c = new Cookie("saveId", findDTO.getEmail());
				c.setMaxAge(4 * 7 * 24 * 60 * 60);
				response.addCookie(c);
			}else {//쿠키 삭제
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
		//로그아웃 시 세션 삭제
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
			return "redirect:quit_success";
		}else{
			return "redirect:quit?error";
		}
	}
	@RequestMapping("/quit_success")
	public String quitSuccess() {
		return "member/quit_success";
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
	public String emailCheck(@ModelAttribute CertiDTO certiDTO,HttpSession session) {
		boolean success = memberService.emailCheck(certiDTO);
		if(success) {
			return "member/edit_pw";
		}
		else {
			return "redirect:/";
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
			return "redirect:/";
		}else {
			return "redirect:edit_pw?error";
		}
	}
	
	//마이페이지
	@RequestMapping("/mypage")
	public String mypage(HttpSession session,Model model) {
		int memberNo =(int) session.getAttribute("logNo");
		
		//회원정보 불러오기
		MemberDTO memberDTO = memberService.profile(memberNo);
		//회원이미지 불러오기
//		MemberProfileMidDTO memberProfileMidDTO = imageService.getImage(imageNo);
		model.addAttribute("memberDTO",memberDTO);
//		model.addAttribute("memberProfileMidDTO",memberProfileMidDTO);
		return "member/mypage";
	}
	
	//회원정보 수정
	@GetMapping("/edit")
	public String edit(HttpSession session, Model model) {
		int memberNo = (int)session.getAttribute("logNo");
		MemberDTO memberDTO = memberService.profile(memberNo);
		model.addAttribute("memberDTO",memberDTO);
		return "member/edit";
	}
	@PostMapping("/edit")
	public String edit(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		int memberNo = (int)session.getAttribute("logNo");
		memberDTO.setMemberNo(memberNo);
		System.out.println("멤버변경 찾기"+memberDTO);
		boolean result = memberService.changeInformation(memberDTO);
		if(result) {
			return "redirect:edit_success";
		}
		else {
			return "redirect:edit?error";
		}
	}
	
	
	
}